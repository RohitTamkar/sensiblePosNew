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

import 'dart:convert';

import 'dart:typed_data';

import 'package:flutter/services.dart';

import 'index.dart'; // Imports other custom actions
import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_pos_printer_platform_image_3_sdt/flutter_pos_printer_platform_image_3_sdt.dart';
//import 'package:flutter_pos_printer_platform/flutter_pos_printer_platform.dart';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'dart:io';
import 'package:image/image.dart' as img;

Future printBillPreviewLabel(
  List<dynamic> selectedPrinter,
  bool status,
  String statusName,
  String paperSize,
  List<PurchaseSaleItemListStruct> productList,
) async {
  // Determine printer size (width in dots)

  // Determine printer size (width in dots)
  int widthInDots;
  switch (paperSize) {
    case "2 inch":
      widthInDots = 576; // 58mm printer (2 inch)
      break;
    case "3 inch":
      widthInDots = 832; // 80mm printer (3 inch)
      break;
    case "4 inch":
      widthInDots = 1248; // 112mm printer (4 inch)
      break;
    default:
      widthInDots = 576; // Default to 2 inch
  }

  // Calculate center position
  int centerPosition = (widthInDots ~/ 2);

  // Create TSPL commands with proper initialization
  List<String> tsplCommands = [];

  // 1. Printer initialization with proper delays
  tsplCommands.add('SIZE ${widthInDots ~/ 8} mm, 100 mm');
  tsplCommands.add('GAP 2 mm, 0 mm');
  tsplCommands.add('DIRECTION 1');
  tsplCommands.add('DENSITY 12');
  tsplCommands.add('CLS'); // Clear buffer

  // Add delay to allow printer to initialize
  tsplCommands.add('DELAY 500');

  // Add header information
  QuerySnapshot headerQuery = await FirebaseFirestore.instance
      .collection('OUTLET')
      .doc(FFAppState().outletIdRef?.id)
      .collection('HEADER')
      .get();

  int currentYPosition = 50;
  for (var doc in headerQuery.docs) {
    if (doc["title"] != null && doc["title"].isNotEmpty) {
      num xPosition = paperSize == "4 inch"
          ? centerPosition - (doc["title"].length * 6)
          : 100;
      tsplCommands
          .add('TEXT $xPosition,$currentYPosition,"3",0,1,1,"${doc["title"]}"');
      currentYPosition += 50;
    }
    // Add other header fields...
  }

  // Horizontal line
  tsplCommands.add('BAR 50,$currentYPosition,${widthInDots - 50},2');
  currentYPosition += 20;

  // Bill header with dynamic column spacing based on paper size
  String billHeader;
  if (paperSize == "4 inch") {
    billHeader = "S.N   ITEM_NAME               QTY      RATE     TOTAL";
  } else if (paperSize == "3 inch") {
    billHeader = "S.N  ITEM_NAME         QTY    RATE   TOTAL";
  } else {
    billHeader = "S.N ITEM_NAME  QTY RATE TOTAL";
  }

  int headerXPosition =
      paperSize == "4 inch" ? centerPosition - (billHeader.length * 4) : 100;
  tsplCommands
      .add('TEXT $headerXPosition,$currentYPosition,"1",0,1,1,"$billHeader"');
  currentYPosition += 30;

  // Another horizontal line
  tsplCommands.add('BAR 50,$currentYPosition,${widthInDots - 50},2');
  currentYPosition += 20;

  // Bill items with dynamic spacing
  String item1, item2;
  if (paperSize == "4 inch") {
    item1 = "1.   TEA                  1.00      10.00     10.00";
    item2 = "2.   COFFEE              2.00      15.00     30.00";
  } else if (paperSize == "3 inch") {
    item1 = "1.  TEA               1.00    10.00   10.00";
    item2 = "2.  COFFEE            2.00    15.00   30.00";
  } else {
    item1 = "1.  TEA       1.00 10.00 10.00";
    item2 = "2.  COFFEE    2.00 15.00 30.00";
  }

  int itemXPosition =
      paperSize == "4 inch" ? centerPosition - (item1.length * 4) : 100;
  tsplCommands.add('TEXT $itemXPosition,$currentYPosition,"1",0,1,1,"$item1"');
  currentYPosition += 30;
  tsplCommands.add('TEXT $itemXPosition,$currentYPosition,"1",0,1,1,"$item2"');
  currentYPosition += 40;

  // Horizontal line
  tsplCommands.add('BAR 50,$currentYPosition,${widthInDots - 50},2');
  currentYPosition += 20;

  // Grand Total - right aligned for all sizes
  String grandTotal = "GRAND TOTAL: 40.00";
  int totalXPosition = widthInDots - (grandTotal.length * 8) - 50;
  tsplCommands
      .add('TEXT $totalXPosition,$currentYPosition,"3",0,2,2,"$grandTotal"');
  currentYPosition += 50;

  // Payment mode - centered for 4-inch, left for others
  String paymentMode = "PAYMENT MODE: CASH";
  int paymentXPosition =
      paperSize == "4 inch" ? centerPosition - (paymentMode.length * 4) : 100;
  tsplCommands
      .add('TEXT $paymentXPosition,$currentYPosition,"1",0,1,1,"$paymentMode"');
  currentYPosition += 40;

  // Barcode - centered
  int barcodeX = centerPosition - 100;
  tsplCommands.add(
      'BARCODE $barcodeX,$currentYPosition,"128",100,1,0,2,2,"1234567890"');
  currentYPosition += 150;

  // Footer information
  QuerySnapshot footerQuery = await FirebaseFirestore.instance
      .collection('OUTLET')
      .doc(FFAppState().outletIdRef?.id)
      .collection('FOOTER')
      .get();

  for (var doc in footerQuery.docs) {
    if (doc["footerText1"] != null && doc["footerText1"].isNotEmpty) {
      num footerX = paperSize == "4 inch"
          ? centerPosition - (doc["footerText1"].length * 4)
          : 100;
      tsplCommands.add(
          'TEXT $footerX,$currentYPosition,"1",0,1,1,"${doc["footerText1"]}"');
      currentYPosition += 30;
    }
    // Add other footer fields similarly...
  }

  // Add print command
  tsplCommands.add('PRINT 1,1');

  // Convert commands to bytes
  List<int> bytes = [];
  for (String command in tsplCommands) {
    bytes.addAll(utf8.encode('$command\n'));
  }

  // Printer connection and sending (same as before)
  if (selectedPrinter == null || bytes.isEmpty) return;

  var printerManager = PrinterManager.instance;
  var printerInfo = selectedPrinter[0]!;

  try {
    // Connect to printer
    await printerManager.connect(
      type: printerInfo["typePrinter"],
      model: printerInfo["typePrinter"] == PrinterType.usb
          ? UsbPrinterInput(
              name: printerInfo["deviceName"],
              productId: printerInfo["productId"],
              vendorId: printerInfo["vendorId"])
          : BluetoothPrinterInput(
              name: printerInfo["deviceName"],
              address: printerInfo["address"],
              isBle: printerInfo["isBle"] ?? false,
            ),
    );

    // Send TSPL commands
    await printerManager.send(
      type: printerInfo["typePrinter"],
      bytes: bytes,
    );

    // Update printer status
    FFAppState().printerName = statusName;
    FFAppState().isPrinterConnected = status;
  } catch (e) {
    print('Error printing: $e');
    // Handle error
  } finally {
    // Disconnect if needed
    await printerManager.disconnect(type: PrinterType.usb);
  }
}
