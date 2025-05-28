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

import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';

Future<void> generatePdfStockSummary(List<dynamic> pageList) async {
  final pdf = pw.Document();
  final now = DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());

  pdf.addPage(
    pw.MultiPage(
      build: (context) => [
        pw.Center(
          child: pw.Text("Today's Stock Out Report",
              style:
                  pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
        ),
        pw.SizedBox(height: 10),
        pw.Table.fromTextArray(
          headers: [
            'Product',
            'Opn Qty',
            'Opn Amt',
            'Inw Qty',
            'Inw Amt',
            'Sale Qty',
            'Sale Amt',
            'Stk Out Qty',
            'Stk Out Amt',
            'Closing Qty',
            'Closing Amt',
          ],
          cellStyle: pw.TextStyle(fontSize: 8),
          headerStyle:
              pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold),
          data: pageList.map((item) {
            return [
              item['productName'] ?? '',
              item['openingQty'].toString(),
              item['openingQtyAmt'].toString(),
              item['inwardQty'].toString(),
              item['inwardQtyAmt'].toString(),
              item['outwardsaleQty'].toString(),
              item['outwardsaleAmt'].toString(),
              item['stockoutwardjson']?['qty'].toString() ?? '0',
              item['stockoutwardjson']?['amt'].toString() ?? '0.0',
              item['closingStock'].toString(),
              item['closingStockAmt'].toString(),
            ];
          }).toList(),
        ),
        pw.SizedBox(height: 20),
        pw.Text("Generated on: $now", style: pw.TextStyle(fontSize: 8)),
      ],
    ),
  );

  try {
    // Get the downloads directory (Windows)
    final downloadsDir =
        Directory('${Platform.environment['USERPROFILE']}\\Downloads');
    final file = File("${downloadsDir.path}/stock_out_report.pdf");

    await file.writeAsBytes(await pdf.save());
    print("PDF saved successfully at ${file.path}");
  } catch (e) {
    print("Failed to save PDF: $e");
  }
}
