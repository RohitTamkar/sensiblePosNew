// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

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

Future printBillPreviewLabel(
  List<dynamic> selectedPrinter,
  bool status,
  String statusName,
  String paperSize,
  List<PurchaseSaleItemListStruct> productList,
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

  if (paperSize == '35mm*25mm') {
    labelWidth = 35.0; // mm
    labelHeight = 25.0; // mm
    fontSizeLarge = 3; // Large font for name
    fontSizeMedium = 1; // Medium font for price & MRP
    fontSizeSmall = 0; // Small font for weight
    barcodeHeight = 15; // Adjusted barcode height
    topMargin = 5; // Reduced margin for better spacing
    bottomMargin = 5;
    sideMargin = 2;
  } else {
    // Default to 75mm×50mm
    labelWidth = 75.0; // mm
    labelHeight = 50.0; // mm
    fontSizeLarge = 3;
    fontSizeMedium = 2;
    fontSizeSmall = 1;
    barcodeHeight = 40;
    topMargin = 20;
    bottomMargin = 20;
    sideMargin = 10;
  }

  const int dpi = 203; // Standard thermal printer DPI
  const double dotsPerMm = dpi / 25.4; // ~8 dots/mm

  // Calculate dimensions in dots
  final int widthInDots = (labelWidth * dotsPerMm).round();
  final int heightInDots = (labelHeight * dotsPerMm).round();

  // Prepare all labels' TSPL commands
  List<String> allLabelsCommands = [];

  for (var product in productList) {
    // Print one label per quantity
    for (int i = 0; i < (product.quantity ?? 1); i++) {
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
      String productName = product.name ?? "Product";
      if (productName.length > 10) {
        productName =
            productName.substring(0, 10) + '...'; // Truncate long names
      }
      int nameX = centerX - ((productName.length * 16) ~/ 2);
      tsplCommands.add('TEXT 20,20,"B.FNT",0,2,2,"${productName}"\r\n');

      tsplCommands.add(
          'TEXT 20,50,"3.EFT",0,1,1,"MRP: ${product.price?.toStringAsFixed(2) ?? "0.00"}"\r\n');
      tsplCommands.add(
          'TEXT 20,70,"3.EFT",0,1,1,"PRICE: ${product.price?.toStringAsFixed(2) ?? "0.00"}"\r\n');

      if (product.barcode?.isNotEmpty ?? false) {
        tsplCommands
            .add(' BARCODE 20,100,"128",60,1,0,2,2,"${product.barcode}"\r\n');
      }

      // Print command for this label
      tsplCommands.add('PRINT 1,1');

      // Add this label's commands to the main list
      allLabelsCommands.addAll(tsplCommands);
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
