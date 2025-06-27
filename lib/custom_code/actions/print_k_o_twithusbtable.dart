// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'dart:developer';
import 'dart:io';
//import 'package:flutter_pos_printer_platform/flutter_pos_printer_platform.dart';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter_pos_printer_platform_image_3/flutter_pos_printer_platform_image_3.dart';

Future printKOTwithusbtable(
  List<dynamic> data,
  List<dynamic> selectedPrinter,
  bool status,
  String statusName,
  TableKotRecord tableKotDetails,
  String printerSize,
  AppSettingsRecord appSetting,
  List<ServicePointOutletRecord> list,
) async {
  int size = printerSize == "3 inch" ? 46 : 32;

  final profile = await CapabilityProfile.load();
  final generator = size == 32
      ? Generator(PaperSize.mm58, profile)
      : Generator(PaperSize.mm80, profile);

  var printerManager = PrinterManager.instance;

  // Separate products into normal and cancelled
  List<dynamic> normalProducts = [];
  List<dynamic> cancelledProducts = [];

  for (var product in tableKotDetails.productList) {
    if (product.isDeletedItem == true && !product.printKot) {
      cancelledProducts.add(product);
    } else {
      normalProducts.add(product);
    }
  }

  // Group by service point for normal products
  Map<String, List<dynamic>> normalServicePointProducts = {};
  for (var product in normalProducts) {
    if (!product.printKot) {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('OUTLET')
          .doc(FFAppState().outletIdRef?.id)
          .collection('PRODUCT')
          .where('id', isEqualTo: product.id)
          .get();

      for (var doc in querySnapshot.docs) {
        var serviceOutletRefId = doc["serviceRefId"];
        normalServicePointProducts.putIfAbsent(serviceOutletRefId, () => []);
        normalServicePointProducts[serviceOutletRefId]?.add(product);
      }
    } else {
      print('KOT already printed!');
    }
  }

  // Group by service point for cancelled products (always print)
  Map<String, List<dynamic>> cancelledServicePointProducts = {};
  for (var product in cancelledProducts) {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('OUTLET')
        .doc(FFAppState().outletIdRef?.id)
        .collection('PRODUCT')
        .where('id', isEqualTo: product.id)
        .get();

    for (var doc in querySnapshot.docs) {
      var serviceOutletRefId = doc["serviceRefId"];
      cancelledServicePointProducts.putIfAbsent(serviceOutletRefId, () => []);
      cancelledServicePointProducts[serviceOutletRefId]?.add(product);
    }
  }

  // Loop for each service point
  for (var servicePoint in list) {
    // 1) Print NEW KOT if needed
    if (normalServicePointProducts.containsKey(servicePoint.id)) {
      List<dynamic> productsToPrint =
          normalServicePointProducts[servicePoint.id]!;
      await printKotForServicePoint(
        generator,
        printerManager,
        selectedPrinter,
        FFAppState().index,
        servicePoint,
        productsToPrint,
        tableKotDetails,
        printerSize,
        status,
        statusName,
        "NEW KOT",
      );
    }

    // 2) Print CANCELLED KOT if needed
    if (cancelledServicePointProducts.containsKey(servicePoint.id)) {
      List<dynamic> productsToPrint =
          cancelledServicePointProducts[servicePoint.id]!;
      await printKotForServicePoint(
        generator,
        printerManager,
        selectedPrinter,
        FFAppState().index,
        servicePoint,
        productsToPrint,
        tableKotDetails,
        printerSize,
        status,
        statusName,
        "CANCELLED KOT",
      );
    }
  }
}

// --------------------------------------------
// ✅ Helper for printing a single KOT type
// --------------------------------------------
Future<void> printKotForServicePoint(
  Generator generator,
  PrinterManager printerManager,
  List<dynamic> selectedPrinter,
  int index,
  ServicePointOutletRecord servicePoint,
  List<dynamic> productsToPrint,
  TableKotRecord tableKotDetails,
  String printerSize,
  bool status,
  String statusName,
  String kotType, // NEW KOT or CANCELLED KOT
) async {
  int size = printerSize == "3 inch" ? 46 : 32;
  List<int> bytes = [];

  String billColumn3 = size == 46
      ? "  ITEM NAME                              QTY  "
      : "ITEM NAME                   QTY";

  // Header
  bytes += generator.text("# $kotType #",
      styles: PosStyles(
          height: PosTextSize.size1,
          width: PosTextSize.size2,
          align: PosAlign.center));
  bytes += generator.text(servicePoint.name,
      styles: PosStyles(
          height: PosTextSize.size1,
          width: PosTextSize.size1,
          align: PosAlign.center));

  // Table No & DateTime
  final DateTime now = DateTime.now();
  final DateFormat dateFormatter = DateFormat('dd-MM-yyyy h:mm:ss');
  String dateTimeString = dateFormatter.format(now);
  String billNo = 'Table No: ${tableKotDetails.tableNo}';
  String printLine = billNo;
  for (int i = 1; i <= (size - (billNo.length + dateTimeString.length)); i++) {
    printLine += " ";
  }
  printLine += dateTimeString;
  bytes += generator.text(printLine);

  // Column headers
  bytes += generator.text("-----------------------------------------------");
  bytes += generator.text(billColumn3);
  bytes += generator.text("-----------------------------------------------");

  // Products
  for (var product in productsToPrint) {
    bytes += generatePrintBytes(generator, product);
  }

  // Cut
  bytes += generator.cut();

  // Send to printer
  var printer = selectedPrinter[index];
  await printerManager.connect(
    type: printer["typePrinter"],
    model: printer["typePrinter"] == PrinterType.usb
        ? UsbPrinterInput(
            name: printer["deviceName"],
            productId: printer["productId"],
            vendorId: printer["vendorId"])
        : printer["typePrinter"] == PrinterType.bluetooth
            ? BluetoothPrinterInput(
                name: printer["deviceName"],
                address: printer["address"],
                isBle: printer["isBle"] ?? false)
            : TcpPrinterInput(ipAddress: printer["address"]),
  );

  printerManager.send(type: printer["typePrinter"], bytes: bytes);
}

// --------------------------------------------
// ✅ Helper for formatting each product line
// --------------------------------------------
List<int> generatePrintBytes(Generator generator, dynamic product) {
  List<int> bytes = [];

  const int maxLineLength = 22;

  String productName = product.name.toString();
  List<String> nameLines = [];
  for (int i = 0; i < productName.length; i += maxLineLength) {
    int end = (i + maxLineLength < productName.length)
        ? i + maxLineLength
        : productName.length;
    nameLines.add(productName.substring(i, end));
  }

  for (int i = 0; i < nameLines.length; i++) {
    if (i == 0) {
      bytes += generator.row([
        PosColumn(
          text: nameLines[i],
          width: 5,
          styles: PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.left,
          ),
        ),
        PosColumn(
          text: product.kotRemark
                  .toString()
                  .replaceAll('[', '')
                  .replaceAll(']', '')
                  .replaceAll(',', '')
                  .trim() ??
              '',
          width: 4,
          styles: PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.left,
          ),
        ),
        PosColumn(
          text: product.quantity.toString(),
          width: 3,
          styles: PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center,
          ),
        ),
      ]);
    } else {
      bytes += generator.row([
        PosColumn(
          text: nameLines[i],
          width: 8,
          styles: PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.left,
          ),
        ),
        PosColumn(
          text: '',
          width: 4,
          styles: PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center,
          ),
        ),
      ]);
    }
  }

  return bytes;
}
