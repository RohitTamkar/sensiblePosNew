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

import 'index.dart'; // Imports other custom actions

import 'dart:typed_data';

import 'package:flutter/services.dart';

import 'index.dart'; // Imports other custom actions
import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_pos_printer_platform_image_3/flutter_pos_printer_platform_image_3.dart';
//import 'package:flutter_pos_printer_platform/flutter_pos_printer_platform.dart';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as im;

Future printBillPreview(
  List<dynamic> selectedPrinter,
  bool status,
  String statusName,
  String printerSize,
) async {
  // Add your function code here!
  int size = 32;
  if (printerSize == "3 inch") {
    size = 46;
  } else if (printerSize == "2 inch") {
    size = 32;
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
  if (size == 32) {
    String bill_column = "S.N ITEM_NAME  QTY RATE TOTAL";
    String bill_column1 = "1.  TEA       1.00 00.00 00.00";
    String bill_column2 = "2.  COFFEE    2.00 00.00 00.00";

    QuerySnapshot querySnapshot;
    querySnapshot = await FirebaseFirestore.instance
        .collection('OUTLET')
        .doc(FFAppState().outletIdRef?.id)
        .collection('HEADER')
        .get();

    for (var doc in querySnapshot.docs) {
      print(doc);

      if (doc["recepitLogoUrl"] != null && doc["recepitLogoUrl"].isNotEmpty) {
        try {
          // First, fetch the image from the URL
          final response = await http.get(Uri.parse(doc["recepitLogoUrl"]));

          // Decode the image using a try-catch block
          final image = im.decodeImage(Uint8List.fromList(response.bodyBytes));

          if (image != null) {
            // Convert to monochrome and resize (printer typically has limited width)
            // Most thermal printers support around 384 pixels width for 80mm paper
            final imageRaster = im.copyResize(image, width: 300);

            // Convert to ESC/POS format
            bytes += generator.image(imageRaster);

            // Add some space after the logo
            // bytes += generator.feed(1);
          }
        } catch (e) {
          print('Error printing logo: $e');
          // Fallback text logo
          bytes += generator.text('LOGO',
              styles: PosStyles(
                  align: PosAlign.center,
                  height: PosTextSize.size2,
                  bold: true));
          //  bytes += generator.feed(1);
        }
      }
      if (doc["title"] != null && doc["title"].isNotEmpty) {
        bytes += generator.text(doc["title"],
            styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                align: PosAlign.left));
      }
      if (doc["address"] != null && doc["address"].isNotEmpty) {
        bytes += generator.text(doc["address"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.left));
      }
      if (doc["subtitleAddress"] != null && doc["subtitleAddress"].isNotEmpty) {
        bytes += generator.text(doc["subtitleAddress"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.left));
      }
      if (doc["gstNo"] != null && doc["gstNo"].isNotEmpty) {
        bytes += generator.text(doc["gstNo"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.left));
      }
      if (doc["contactNo"] != null && doc["contactNo"].isNotEmpty) {
        bytes += generator.text(doc["contactNo"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.left));
      }
      if (doc["email"] != null && doc["email"].isNotEmpty) {
        bytes += generator.text(doc["email"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.left));
      }
      if (doc["serialNo"] != null && doc["serialNo"].isNotEmpty) {
        bytes += generator.text(doc["serialNo"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.left));
      }
      if (doc["taxInvoice"] != null && doc["taxInvoice"].isNotEmpty) {
        bytes += generator.text(doc["taxInvoice"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.left));
      }
      if (doc["bankName"] != null && doc["bankName"].isNotEmpty) {
        bytes += generator.text(doc["bankName"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.left));
      }
      if (doc["bankBranch"] != null && doc["bankBranch"].isNotEmpty) {
        bytes += generator.text(doc["bankBranch"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.left));
      }

      if (doc["accountNumber"] != null && doc["accountNumber"].isNotEmpty) {
        bytes += generator.text(doc["accountNumber"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.left));
      }
      if (doc["ifscCode"] != null && doc["ifscCode"].isNotEmpty) {
        bytes += generator.text(doc["ifscCode"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.left));
      }
    }

    bytes += generator.text("--------------------------------",
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.left));

    String printLine = '';
    String dateString = '08-09-2022';
    String serialTemp = 'SERIAL NO : 101';
    printLine = serialTemp;
    for (int i = 1; i <= (32 - (serialTemp.length + dateString.length)); i++) {
      printLine += " ";
    }
    printLine += dateString;

    bytes += generator.text(printLine,
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.left));
    printLine = '';

    String dateTimeString = '03:35:50 pm';
    String billNo = 'BILL NO : 101';
    printLine = billNo;
    for (int i = 1; i <= (32 - (billNo.length + dateTimeString.length)); i++) {
      printLine += " ";
    }
    printLine += dateTimeString;

    bytes += generator.text(printLine,
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.left));

    bytes += generator.text("--------------------------------",
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.left));
    bytes += generator.text(bill_column,
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.left));
    bytes += generator.text("--------------------------------",
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.left));
    bytes += generator.text(bill_column1,
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.left));
    bytes += generator.text(bill_column2,
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.left));
    bytes += generator.text("--------------------------------",
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.left));
    bytes += generator.text("GRAND TOTAL : 00 ",
        styles: PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            align: PosAlign.left));
    bytes += generator.text("--------------------------------",
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.left));
    bytes += generator.text("PAYMENT MODE : CASH",
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.left));
    bytes += generator.text("--------------------------------",
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.left));
    final List<int> barData = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 4];
    // bytes += generator.barcode(Barcode.upcA(barData));
    //bytes += generator.qrcode('Rohit', align: PosAlign.center);
    /*  bytes += generator.text("** THANK YOU ! VISIT AGAIN !! **",
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center));*/

    QuerySnapshot querySnapshot2;
    querySnapshot2 = await FirebaseFirestore.instance
        .collection('OUTLET')
        .doc(FFAppState().outletIdRef?.id)
        .collection('FOOTER')
        .get();
    for (var doc in querySnapshot2.docs) {
      print(doc);
      if (doc["footerText1"] != null && doc["footerText1"].isNotEmpty) {
        bytes += generator.text(doc["footerText1"],
            styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                align: PosAlign.left));
      }
      if (doc["footerText2"] != null && doc["footerText2"].isNotEmpty) {
        bytes += generator.text(doc["footerText2"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.left));
      }
      if (doc["footerText3"] != null && doc["footerText3"].isNotEmpty) {
        bytes += generator.text(doc["footerText3"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.left));
      }
      if (doc["footerText4"] != null && doc["footerText4"].isNotEmpty) {
        bytes += generator.text(doc["footerText4"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.left));
      }
      if (doc["footerText5"] != null && doc["footerText5"].isNotEmpty) {
        bytes += generator.text(doc["footerText5"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.left));
      }
    }
  } else if (size == 46) {
    String bill_column = "S.N  ITEM_NAME         QTY    RATE   TOTAL";
    String bill_column1 = "1.  TEA               0.00    0.00   0.00";
    String bill_column2 = "2.  COFFEE            0.00    0.00   0.00";

    QuerySnapshot querySnapshot;
    querySnapshot = await FirebaseFirestore.instance
        .collection('OUTLET')
        .doc(FFAppState().outletIdRef?.id)
        .collection('HEADER')
        .get();
    for (var doc in querySnapshot.docs) {
      print(doc);
      if (doc["recepitLogoUrl"] != null && doc["recepitLogoUrl"].isNotEmpty) {
        try {
          // First, fetch the image from the URL
          final response = await http.get(Uri.parse(doc["recepitLogoUrl"]));

          // Decode the image using a try-catch block
          final image = im.decodeImage(Uint8List.fromList(response.bodyBytes));

          if (image != null) {
            // Convert to monochrome and resize (printer typically has limited width)
            // Most thermal printers support around 384 pixels width for 80mm paper
            final imageRaster = im.copyResize(image, width: 300);

            // Convert to ESC/POS format
            bytes += generator.image(imageRaster);

            // Add some space after the logo
            bytes += generator.feed(1);
          }
        } catch (e) {
          print('Error printing logo: $e');
          // Fallback text logo
          bytes += generator.text('LOGO',
              styles: PosStyles(
                  align: PosAlign.center,
                  height: PosTextSize.size2,
                  bold: true));
          bytes += generator.feed(1);
        }
      }
      if (doc["title"] != null && doc["title"].isNotEmpty) {
        bytes += generator.text(doc["title"],
            styles: PosStyles(
                height: PosTextSize.size2,
                width: PosTextSize.size1,
                align: PosAlign.center));
      }
      if (doc["address"] != null && doc["address"].isNotEmpty) {
        bytes += generator.text(doc["address"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.center));
      }
      if (doc["subtitleAddress"] != null && doc["subtitleAddress"].isNotEmpty) {
        bytes += generator.text(doc["subtitleAddress"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.center));
      }
      if (doc["gstNo"] != null && doc["gstNo"].isNotEmpty) {
        bytes += generator.text(doc["gstNo"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.center));
      }
      if (doc["contactNo"] != null && doc["contactNo"].isNotEmpty) {
        bytes += generator.text(doc["contactNo"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.center));
      }
      if (doc["email"] != null && doc["email"].isNotEmpty) {
        bytes += generator.text(doc["email"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.center));
      }
      if (doc["serialNo"] != null && doc["serialNo"].isNotEmpty) {
        bytes += generator.text(doc["serialNo"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.center));
      }
      if (doc["taxInvoice"] != null && doc["taxInvoice"].isNotEmpty) {
        bytes += generator.text(doc["taxInvoice"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.center));
      }
      if (doc["bankName"] != null && doc["bankName"].isNotEmpty) {
        bytes += generator.text(doc["bankName"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.center));
      }
      if (doc["bankBranch"] != null && doc["bankBranch"].isNotEmpty) {
        bytes += generator.text(doc["bankBranch"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.center));
      }

      if (doc["accountNumber"] != null && doc["accountNumber"].isNotEmpty) {
        bytes += generator.text(doc["accountNumber"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.center));
      }
      if (doc["ifscCode"] != null && doc["ifscCode"].isNotEmpty) {
        bytes += generator.text(doc["ifscCode"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.center));
      }
    }

    bytes += generator.text("----------------------------------------------",
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center));

    String printLine = '';
    /*   String dateString = '08-09-2022';
    String serialTemp = 'SERIAL NO : 101';
    printLine = serialTemp;
    for (int i = 1; i <= (46 - (serialTemp.length + dateString.length)); i++) {
      printLine += " ";
    }
    printLine += dateString;

    bytes += generator.text(printLine,
        styles: const PosStyles(
            height: PosTextSize.size1, width: PosTextSize.size1, bold: true));
    printLine = '';
*/
    String dateTimeString = '04-03-2025 03:35 PM';
    String billNo = 'BILL NO : 00000000';
    printLine = billNo;
    for (int i = 1; i <= (46 - (billNo.length + dateTimeString.length)); i++) {
      printLine += " ";
    }
    printLine += dateTimeString;

    bytes += generator.text(printLine,
        styles: const PosStyles(
            height: PosTextSize.size1, width: PosTextSize.size1, bold: true));

    bytes += generator.text("----------------------------------------------",
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center));
    bytes += generator.text(bill_column,
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center));
    bytes += generator.text("----------------------------------------------",
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center));
    bytes += generator.text(bill_column1,
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center));
    bytes += generator.text(bill_column2,
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center));
    bytes += generator.text("----------------------------------------------",
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center));
    bytes += generator.text("Grand TOTAL : 00 ",
        styles: PosStyles(
            height: PosTextSize.size2,
            width: PosTextSize.size2,
            align: PosAlign.right));
    bytes += generator.text("----------------------------------------------",
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center));
    bytes += generator.text("PAYMENT MODE : CASH",
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center));
    bytes += generator.text("----------------------------------------------",
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.right));
    final List<int> barData = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 4];
    bytes += generator.barcode(Barcode.upcA(barData));
    // bytes += generator.qrcode('Rohit', align: PosAlign.center);
    /*bytes += generator.text("** THANK YOU ! VISIT AGAIN !! **",
        styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center));*/

    QuerySnapshot querySnapshot2;
    querySnapshot2 = await FirebaseFirestore.instance
        .collection('OUTLET')
        .doc(FFAppState().outletIdRef?.id)
        .collection('FOOTER')
        .get();
    for (var doc in querySnapshot2.docs) {
      print(doc);
      if (doc["footerText1"] != null && doc["footerText1"].isNotEmpty) {
        bytes += generator.text(doc["footerText1"],
            styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                align: PosAlign.center));
      }
      if (doc["footerText2"] != null && doc["footerText2"].isNotEmpty) {
        bytes += generator.text(doc["footerText2"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.center));
      }
      if (doc["footerText3"] != null && doc["footerText3"].isNotEmpty) {
        bytes += generator.text(doc["footerText3"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.center));
      }
      if (doc["footerText4"] != null && doc["footerText4"].isNotEmpty) {
        bytes += generator.text(doc["footerText4"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.center));
      }
      if (doc["footerText5"] != null && doc["footerText5"].isNotEmpty) {
        bytes += generator.text(doc["footerText5"],
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.center));
      }
    }
  }

  if (bytes.length > 0) {
    //_printEscPos(bytes, generator);
    var bluetoothPrinter;
    if (selectedPrinter == null) return;
    print(FFAppState().navigate);
    if (FFAppState().navigate == 'KIOSK') {
      bluetoothPrinter = selectedPrinter[0]!;
    } else {
      bluetoothPrinter = selectedPrinter[FFAppState().index]!;
    }

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
