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

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_pos_printer_platform_image_3/flutter_pos_printer_platform_image_3.dart';
//import 'package:flutter_pos_printer_platform/flutter_pos_printer_platform.dart';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';

Future printBillCopy(dynamic data, List<dynamic> selectedPrinter, bool status,
    String statusName, String printerSize) async {
  // Add your function code here!
  int size = 32;
  String divider = "";
  if (printerSize == "3 inch") {
    divider = "-----------------------------------------------";

    size = 46;
  } else if (printerSize == "2 inch") {
    size = 32;
    divider = "--------------------------------";
  }
  final profile = await CapabilityProfile.load();
  final generator = size == 32
      ? Generator(PaperSize.mm58, profile)
      : Generator(PaperSize.mm80, profile);

  var printerManager = PrinterManager.instance;
  List<int>? pendingTask;
  BTStatus _currentStatus = BTStatus.none;
  USBStatus _currentUsbStatus = USBStatus.none;
  if (statusName == "BTStatus.connected") {
    _currentStatus = BTStatus.connected;
  }
  // _currentUsbStatus is only supports on Android
  if (statusName == "USBStatus.connected") {
    _currentUsbStatus = USBStatus.connected;
  }
  FFAppState().printerName = "";
  List<int> bytes = [];
  String billColumn3;
  dynamic obj;

  // changes according to size
  if (size == 46) {
    billColumn3 =
        "ITEM_NAME              QTY     RATE     TOTAL "; // 20, 8, 9, 9 (46)
    if (data.length > 0) {
      bytes += generator.text("TAX INVOICE",
          styles: PosStyles(
              height: PosTextSize.size2,
              width: PosTextSize.size2,
              align: PosAlign.center));
      bytes += generator.text("Duplicate Bill",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      bytes += generator.text(divider.toString(),
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      String printLine = '';
      String dateString = '';

      String temp = data["invoice"].toString();
      String srNo = temp.substring(8);
      String serialTemp = 'Serial no:' + srNo;

      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('dd-MM-yyyy');
      final String formatted = formatter.format(now);
      dateString = formatted.toString();
      printLine = serialTemp;
      for (int i = 1;
          i <= (size - (serialTemp.length + dateString.length));
          i++) {
        printLine += " ";
      }

      printLine += dateString;

      bytes += generator.text(printLine,
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false));
      printLine = '';
      final DateTime now1 = DateTime.now();
      final DateFormat formatter1 = DateFormat(' h:mm:ss');
      final String formatted1 = formatter1.format(now1);

      String dateTimeString = formatted1.toString();
      String billNo = 'BILL NO : ' + data["invoice"].toString();
      printLine = billNo;
      for (int i = 1;
          i <= (size - (billNo.length + dateTimeString.length));
          i++) {
        printLine += " ";
      }
      printLine += dateTimeString;

      bytes += generator.text(printLine,
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false));

      bytes += generator.text(divider.toString(),
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      bytes += generator.text(billColumn3,
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      bytes += generator.text(divider.toString(),
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      for (int i = 0; i < data["productList"].length; i++) {
        bytes += generator.row([
          PosColumn(
            text: data["productList"][i]["name"].toString(),
            width: 4,
            styles: PosStyles(
              //  fontType: PosFontType.fontA,

              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              //align: PosAlign.left
            ),
          ),
          PosColumn(
            text: '',
            width: 2,
            styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.right),
          ),
          PosColumn(
            text: data["productList"][i]["quantity"].toString(),
            width: 2,
            styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.right),
          ),
          PosColumn(
            text: data["productList"][i]["price"].toString(),
            width: 2,
            styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.right),
          ),
          PosColumn(
            text: data["productList"][i]["total"].toString(),
            width: 2,
            styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.right),
          )
        ]);
      }

      bytes += generator.text(divider.toString(),
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      int len = data["productList"].length;
      String itemsNo = "Items :" + len.toString();
      printLine = itemsNo;
      String subTotal = "Sub total:" + data["billAmt"].toString();
      for (int i = 1; i <= (size - (itemsNo.length + subTotal.length)); i++) {
        printLine += " ";
      }
      printLine += subTotal;
      bytes += generator.text(printLine,
          styles: PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              align: PosAlign.left));

      bytes += generator.text(divider.toString(),
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));
      if (data["roundOff"] != 0) {
        bytes += generator.row([
          PosColumn(
            text: "Round Off:",
            width: 6,
            styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.left),
          ),
          PosColumn(
            text: data["roundOff"].toString(),
            width: 6,
            styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.right),
          )
        ]);
      }
      if (data["taxAmt"] != 0) {
        bytes += generator.row([
          PosColumn(
            text: "Tax : ",
            width: 6,
            styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.left),
          ),
          PosColumn(
            text: data["taxAmt"].toString(),
            width: 6,
            styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.right),
          )
        ]);
      }
      if (data["delliveryChrg"] != 0) {
        bytes += generator.row([
          PosColumn(
            text: "Delivery Charges: ",
            width: 8,
            styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.left),
          ),
          PosColumn(
            text: data["delliveryChrg"].toString(),
            width: 4,
            styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.right),
          )
        ]);
      }
      int disPer =
          data["discountPer"] != null ? data["discountPer"].round() : 0;

      if (data["discountAmt"] != 0) {
        bytes += generator.row([
          PosColumn(
            text: "Discount (" + disPer.toString() + "%): ",
            width: 8,
            styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.left),
          ),
          PosColumn(
            text: data["discountAmt"].toString(),
            width: 4,
            styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.right),
          )
        ]);
      }
      bytes += generator.text(divider.toString(),
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      bytes += generator.text("NET :" + data["finalBillAmt"].toString(),
          styles: PosStyles(
              height: PosTextSize.size2,
              width: PosTextSize.size2,
              align: PosAlign.right));

      bytes += generator.text(divider.toString(),
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      bytes += generator.text("PAYMENT MODE :" + data["paymentMode"].toString(),
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      bytes += generator.text(divider.toString(),
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      bytes += generator.text("** THANK YOU ! VISIT AGAIN !! **",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));
    } else {
      bytes += generator.text('Test Print',
          styles: PosStyles(
              height: PosTextSize.size2,
              width: PosTextSize.size2,
              align: PosAlign.center));
    }
  } else if (size == 32) {
    billColumn3 = "ITEM_NAME    QTY  RATE  TOTAL   "; //(32)
    //

    if (data.length > 0) {
      bytes += generator.text("TAX INVOICE",
          styles: PosStyles(
              height: PosTextSize.size2,
              width: PosTextSize.size2,
              align: PosAlign.center));
      bytes += generator.text("Duplicate Bill",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      String printLine = '';
      String dateString = '';
      String temp = data["invoice"].toString();
      String srNo = temp.substring(8);
      String serialTemp = 'Serial no:' + srNo;

      //String serialTemp = 'Serial no:' +srNo;

      // final DateTime now = DateTime.now();
      //final DateFormat formatter = DateFormat('dd-MM-yyyy');
      //final String formatted = formatter.format(now);

      int ts = data["invoiceDate"];
      var dt = DateTime.fromMillisecondsSinceEpoch(ts);

      var date = DateFormat('MM/dd/yyyy').format(dt);
      print(date);
      dateString = date.toString();
      printLine = serialTemp;
      for (int i = 1;
          i <= (size - (serialTemp.length + dateString.length));
          i++) {
        printLine += " ";
      }

      printLine += dateString;

      bytes += generator.text(printLine,
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false));
      printLine = '';
      final DateTime now1 = DateTime.now();
      final DateFormat formatter1 = DateFormat(' h:mm:ss');
      final String formatted1 = formatter1.format(now1);

      String dateTimeString = formatted1.toString();
      String billNo = 'Bill No: ' + data["invoice"].toString();
      printLine = billNo;
      for (int i = 1;
          i <= (size - (billNo.length + dateTimeString.length));
          i++) {
        printLine += " ";
      }
      printLine += dateTimeString;

      bytes += generator.text(printLine,
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false));

      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      bytes += generator.text(billColumn3,
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      for (int i = 0; i < data["productList"].length; i++) {
        bytes += generator.row([
          PosColumn(
            text: data["productList"][i]["name"].toString(),
            width: 12,
            styles: PosStyles(
              //  fontType: PosFontType.fontA,

              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              //align: PosAlign.left
            ),
          )
        ]);
        bytes += generator.row([
          PosColumn(
            text: '',
            width: 3,
            styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.right),
          ),
          PosColumn(
            text: data["productList"][i]["quantity"].toString(),
            width: 3,
            styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.right),
          ),
          PosColumn(
            text: data["productList"][i]["price"].toString(),
            width: 3,
            styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.right),
          ),
          PosColumn(
            text: data["productList"][i]["total"].toString(),
            width: 3,
            styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.right),
          )
        ]);
      }

      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      int len = data["productList"].length;
      String itemsNo = "Items :" + len.toString();
      printLine = itemsNo;
      String subTotal = "Sub total:" + data["billAmt"].toString();
      for (int i = 1; i <= (size - (itemsNo.length + subTotal.length)); i++) {
        printLine += " ";
      }
      printLine += subTotal;
      bytes += generator.text(printLine,
          styles: PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              align: PosAlign.left));

      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      if (data["roundOff"] != 0) {
        bytes += generator.row([
          PosColumn(
            text: "Round Off:",
            width: 6,
            styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.left),
          ),
          PosColumn(
            text: data["roundOff"].toString(),
            width: 6,
            styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.right),
          )
        ]);
      }
      if (data["taxAmt"] != 0) {
        bytes += generator.row([
          PosColumn(
            text: "Tax : ",
            width: 6,
            styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.left),
          ),
          PosColumn(
            text: data["taxAmt"].toString(),
            width: 6,
            styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.right),
          )
        ]);
      }
      if (data["delliveryChrg"] != 0) {
        bytes += generator.row([
          PosColumn(
            text: "Delivery Charges: ",
            width: 8,
            styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.left),
          ),
          PosColumn(
            text: data["delliveryChrg"].toString(),
            width: 4,
            styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.right),
          )
        ]);
      }
      int disPer =
          data["discountPer"] != null ? data["discountPer"].round() : 0;

      if (data["discountAmt"] != 0) {
        bytes += generator.row([
          PosColumn(
            text: "Discount (" + disPer.toString() + "%): ",
            width: 8,
            styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.left),
          ),
          PosColumn(
            text: data["discountAmt"].toString(),
            width: 4,
            styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.right),
          )
        ]);
      }
      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));
      bytes += generator.text("NET :" + data["finalBillAmt"].toString(),
          styles: PosStyles(
              height: PosTextSize.size2,
              width: PosTextSize.size2,
              align: PosAlign.right));

      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      bytes += generator.text("PAYMENT MODE :" + data["paymentMode"].toString(),
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      bytes += generator.text("** THANK YOU ! VISIT AGAIN !! **",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));
    } else {
      bytes += generator.text('Test Print',
          styles: PosStyles(
              height: PosTextSize.size2,
              width: PosTextSize.size2,
              align: PosAlign.center));
    }
  }

  if (bytes.length > 0) {
    //_printEscPos(bytes, generator);

    if (selectedPrinter == null) return;
    var bluetoothPrinter = selectedPrinter[0]!;

    switch (bluetoothPrinter["typePrinter"]) {
      case PrinterType.usb:
        bytes += generator.feed(2);
        bytes += generator.cut();
        FFAppState().printerName = statusName;
        FFAppState().isPrinterConnected = status;
        await printerManager.connect(
            type: bluetoothPrinter["typePrinter"],
            model: UsbPrinterInput(
                name: bluetoothPrinter["deviceName"],
                productId: bluetoothPrinter["productId"],
                vendorId: bluetoothPrinter["vendorId"]));
        pendingTask = null;
        if (Platform.isAndroid) pendingTask = bytes;
        break;
      case PrinterType.bluetooth:
        bytes += generator.cut();
        FFAppState().printerName = statusName;
        FFAppState().isPrinterConnected = status;
        await printerManager.connect(
            type: bluetoothPrinter["typePrinter"],
            model: BluetoothPrinterInput(
              name: bluetoothPrinter["deviceName"],
              address: bluetoothPrinter["address"],
              isBle: bluetoothPrinter["isBle"] ?? false,
            ));
        pendingTask = null;
        if (Platform.isIOS || Platform.isAndroid) pendingTask = bytes;
        break;
      case PrinterType.network:
        bytes += generator.feed(2);
        bytes += generator.cut();
        await printerManager.connect(
            type: bluetoothPrinter["typePrinter"],
            model: TcpPrinterInput(ipAddress: bluetoothPrinter.address!));
        break;
      default:
    }
    if (bluetoothPrinter["typePrinter"] == PrinterType.bluetooth) {
      _currentStatus = BTStatus.connected;

      if (_currentStatus == BTStatus.connected) {
        FFAppState().printerName = "connected bt";
        printerManager.send(
            type: bluetoothPrinter["typePrinter"], bytes: bytes);
        pendingTask = null;
      }
    } else if (bluetoothPrinter["typePrinter"] == PrinterType.usb &&
        Platform.isAndroid) {
      // _currentUsbStatus is only supports on Android
      if (_currentUsbStatus == USBStatus.connected) {
        FFAppState().printerName = "connected usb";
        printerManager.send(
            type: bluetoothPrinter["typePrinter"], bytes: bytes);
        pendingTask = null;
      }
    } else {
      printerManager.send(type: bluetoothPrinter["typePrinter"], bytes: bytes);
    }
  }
}
