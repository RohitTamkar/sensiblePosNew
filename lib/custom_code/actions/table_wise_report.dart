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

Future<List<dynamic>> tableWiseReport(List<InvoiceRecord> invoiceList) async {
  // Map to hold aggregated data per table
  final Map<String, Map<String, dynamic>> tableReport = {};

  for (var invoice in invoiceList) {
    // Skip deleted invoices if needed
    if (invoice.isDeleted == true) continue;

    final tableId = invoice.tableId ?? 'Unknown';

    if (!tableReport.containsKey(tableId)) {
      tableReport[tableId] = {
        'tableNo': tableId,
        'noOfOrders': 0,
        'totalSales': 0.0,
        'discount': 0.0,
        'netSales': 0.0,
      };
    }

    tableReport[tableId]!['noOfOrders'] += invoice.count ?? 0;
    tableReport[tableId]!['totalSales'] += invoice.billAmt ?? 0.0;
    tableReport[tableId]!['discount'] += invoice.discountAmt ?? 0.0;
    tableReport[tableId]!['netSales'] += invoice.finalBillAmt ?? 0.0;
  }

  // Return as a list
  return tableReport.values.toList();
}
