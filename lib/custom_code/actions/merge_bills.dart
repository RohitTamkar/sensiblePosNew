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

Future<List<InvoiceRecord>> mergeBills(List<InvoiceRecord> invoiceList) async {
  // Create a list to store the final merged invoices
  List<InvoiceRecord> mergedInvoices = [];

  // Track the count of KOT invoices for each shift
  Map<String, int> kotCountMap = {};

  for (var invoiceRec in invoiceList) {
    // Skip deleted invoices
    if (invoiceRec.isDeleted) {
      continue;
    }

    // If the invoice is a customer invoice, add it to the merged list as is
    if (invoiceRec.source == "customer") {
      mergedInvoices.add(invoiceRec);
    }
    // If the invoice is a KOT invoice, process it
    else if (invoiceRec.source == "KOT") {
      // Generate a key for the shift
      String shiftKey = invoiceRec.shiftId;

      // Initialize the count for this shift if it doesn't exist
      kotCountMap[shiftKey] ??= 0;

      // Increment the count for this shift
      kotCountMap[shiftKey] = kotCountMap[shiftKey]! + 1;

      // Extract date and shift ID from shiftId
      var shiftIdParts = invoiceRec.shiftId.split("-");
      var date =
          shiftIdParts[2] + shiftIdParts[1] + shiftIdParts[0]; // yyyymmdd
      var shiftId = shiftIdParts[3]; // shift number

      // Generate the new invoice number
      var newInvoiceNo =
          "${date}${shiftId}${kotCountMap[shiftKey]!.toString().padLeft(2, '0')}";

      // Update the invoice number
      invoiceRec.reference.update(createInvoiceRecordData(
        invoice: newInvoiceNo,
      ));
      //Add the updated KOT invoice to the merged list
      mergedInvoices.add(invoiceRec);
    }
  }

  return mergedInvoices;
}
