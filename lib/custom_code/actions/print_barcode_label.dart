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

import 'dart:convert';

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
import 'package:image/image.dart' as img;

Future printBarcodeLabel(
  List<dynamic> selectedPrinter,
  bool status,
  String statusName,
  String labelSize,
  List<dynamic> productList,
  String contact,
  String Branch,
) async {
  // Determine label dimensions based on paper size
  late double labelWidth;
  late double labelHeight;
  late int fontSizeLarge;
  late int fontSizeMedium;
  late int fontSizeSmall;
  late int barcodeHeight;
  late int topMargin;
  late int bottomMargin;
  late int sideMargin;
  // Prepare all labels' TSPL commands
  List<String> allLabelsCommands = [];
  if (labelSize == '35mm*25mm') {
    labelWidth = 35.0; // mm
    labelHeight = 25.0; // mm
    fontSizeLarge = 3; // Large font for name
    fontSizeMedium = 1; // Medium font for price & MRP
    fontSizeSmall = 0; // Small font for weight
    barcodeHeight = 15; // Adjusted barcode height
    topMargin = 5; // Reduced margin for better spacing
    bottomMargin = 5;
    sideMargin = 2;

    const int dpi = 203; // Standard thermal printer DPI
    const double dotsPerMm = dpi / 25.4; // ~8 dots/mm

    // Calculate dimensions in dots
    final int widthInDots = (labelWidth * dotsPerMm).round();
    final int heightInDots = (labelHeight * dotsPerMm).round();

    for (var product in productList) {
      // Print one label per quantity
      for (int i = 0; i < (product['quantity'] ?? 1); i++) {
        List<String> tsplCommands = [];

        // Label setup
        tsplCommands.add('SIZE ${labelWidth} mm, ${labelHeight} mm');
        tsplCommands.add('GAP 2.5 mm,0 mm\r\n');
        tsplCommands.add('DIRECTION 1'); // Print direction
        tsplCommands.add('DENSITY 12'); // Print density
        tsplCommands.add('CLS'); // Clear buffer
        tsplCommands.add('DELAY 100'); // Short delay

        // Calculate positions based on label size
        final int centerX = widthInDots ~/ 2;
        final int contentHeight = heightInDots - topMargin - bottomMargin;

        // Product Name (Top, Centered)
        String productName = product['name'] ?? "Product";
        if (productName.length > 10) {
          productName =
              productName.substring(0, 10) + '...'; // Truncate long names
        }
        int nameX = centerX - ((productName.length * 16) ~/ 2);
        tsplCommands.add('TEXT 20,20,"B.FNT",0,2,2,"${productName}"\r\n');

        tsplCommands.add(
            'TEXT 20,50,"3.EFT",0,1,1,"MRP: ${product['price']?.toStringAsFixed(2) ?? "0.00"}"\r\n');
        tsplCommands.add(
            'TEXT 20,70,"3.EFT",0,1,1,"PRICE: ${product['price']?.toStringAsFixed(2) ?? "0.00"}"\r\n');

        if (product['barcode']?.isNotEmpty ?? false) {
          tsplCommands.add(
              ' BARCODE 20,100,"128",60,1,0,2,2,"${product['barcode']}"\r\n');
        }

        // Print command for this label
        tsplCommands.add('PRINT 1,1');

        // Add this label's commands to the main list
        allLabelsCommands.addAll(tsplCommands);
      }
    }
  } else if (labelSize == '50mm*75mm') {
    labelWidth = 50.0;
    labelHeight = 75.0;
    fontSizeLarge = 9; // Adjusted font size for this label
    fontSizeMedium = 7;
    fontSizeSmall = 5;
    barcodeHeight = 50;
    topMargin = 10;
    bottomMargin = 10;
    sideMargin = 10;

    const int dpi = 203;
    const double dotsPerMm = dpi / 25.4;

    final int widthInDots = (labelWidth * dotsPerMm).round();
    final int heightInDots = (labelHeight * dotsPerMm).round();

    for (var product in productList) {
      for (int i = 0; i < (product['quantity'] ?? 1); i++) {
        List<String> tsplCommands = [];

        tsplCommands.add('SIZE ${labelWidth} mm, ${labelHeight} mm');
        tsplCommands.add('GAP 0.14,0');
        tsplCommands.add('DIRECTION 1');
        tsplCommands.add('DENSITY 12');
        tsplCommands.add('CLS');

        int y = 20;

        // Example shop or manufacturer info
        tsplCommands.add('TEXT 15,$y,"0",0,12,12,"${FFAppState().outletName}"');
        y += 40;

        // Item name
        String productName = product['name'] ?? "Item";
        if (productName.length > 18) {
          productName = productName.substring(0, 18) + '...';
        }
        tsplCommands.add('TEXT 15,$y,"0",0,0,12,"$productName"');
        y += 50;

        // Net weight
        if (product.containsKey('netWt')) {
          tsplCommands.add(
              'TEXT 15,$y,"0",0,0,$fontSizeLarge,"Net Weight : ${product['netWt']} ${product['unit']}"');
          y += 50;
        }

        // Batch number (if applicable)
        if (product.containsKey('batchNo')) {
          String batch = product['batchNo'];
          tsplCommands
              .add('TEXT 15,$y,"0",0,0,$fontSizeLarge,"Batch No : $batch"');
          y += 40;
        }

        // MRP
        tsplCommands.add(
            'TEXT 15,$y,"0",0,0,$fontSizeLarge,"Mrp : RS ${product['mrpPrice']?.toStringAsFixed(2) ?? "0.00"}"');
        y += 50;

        // Price
        tsplCommands.add(
            'TEXT 15,$y,"0",0,0,$fontSizeLarge,"Price : RS ${product['price']?.toStringAsFixed(2) ?? "0.00"}"');
        y += 50;

        //MFG
        if (product.containsKey('mfgDate')) {
          String mfgDate = product['mfgDate'];
          tsplCommands
              .add('TEXT 15,$y,"0",0,0,$fontSizeLarge,"Mfg Date : $mfgDate"');
          y += 40;
        }
        //EXP
        if (product.containsKey('expDate')) {
          String expDate = product['expDate'];
          tsplCommands.add(
              'TEXT 15,$y,"0",0,0,$fontSizeLarge,"Expiry Date : $expDate"');
          y += 40;
        }
        // Barcode
        if (product['barcode']?.isNotEmpty ?? false) {
          tsplCommands.add(
              'BARCODE 15,$y,"128",$barcodeHeight,1,0,2,3,"${product['barcode']}"');
          y += barcodeHeight + 20;
        }

        // Optional border bars
        //tsplCommands.add('BAR 0,420,800,2');
        // tsplCommands.add('BAR 0,480,800,2');

        tsplCommands.add('PRINT 1,1');

        allLabelsCommands.addAll(tsplCommands);
      }
    }
  }

  // Convert all commands to bytes
  List<int> bytes = [];
  for (String command in allLabelsCommands) {
    bytes.addAll(utf8.encode('$command\n'));
  }

  // Printer connection and sending
  var printerManager = PrinterManager.instance;
  var printerInfo = selectedPrinter[FFAppState().labelindex]!;

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

    // Send all TSPL commands
    await printerManager.send(
      type: printerInfo["typePrinter"],
      bytes: bytes,
    );
  } catch (e) {
    print('Error printing labels: $e');
    // Handle error appropriately
  } finally {
    // Disconnect if needed
    await printerManager.disconnect(type: PrinterType.usb);
  }
}
