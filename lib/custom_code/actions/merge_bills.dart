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

List<InvoiceRecord> mergeBills(List<InvoiceRecord> invoiceList) {
  // Create a list to store the final merged invoices
  List<InvoiceRecord> mergedInvoices = [];

  // Track the count of KOT invoices
  int kotCount = 0;

  // Track the counts used by customer invoices
  Set<int> customerCounts = {};

  // First pass: Process customer invoices to track their counts
  for (var invoiceRec in invoiceList) {
    if (invoiceRec.source.toLowerCase() == "customer" &&
        !invoiceRec.isDeleted) {
      // Extract the count from the customer invoice number (last 3 digits)
      int customerCount = int.parse(
          invoiceRec.invoice.substring(invoiceRec.invoice.length - 3));
      customerCounts.add(customerCount);
    }
  }

  // Second pass: Process KOT invoices
  for (var invoiceRec in invoiceList) {
    // Skip deleted invoices
    if (invoiceRec.isDeleted) {
      continue;
    }

    // If the invoice is a customer invoice, add it to the merged list as is
    if (invoiceRec.source.toLowerCase() == "customer") {
      mergedInvoices.add(invoiceRec);
    }
    // If the invoice is a KOT invoice, process it
    else if (invoiceRec.source.toLowerCase() == "kot") {
      // Increment the KOT count
      kotCount++;

      // If the count is already used by a customer invoice, skip it
      while (customerCounts.contains(kotCount)) {
        kotCount++;
      }

      // Generate the new invoice number with leading zeros
      var newInvoiceNo = "00${kotCount.toString().padLeft(1, '0')}";

      // Update the invoice number
      invoiceRec.reference.update(createInvoiceRecordData(
        invoice: newInvoiceNo,
        count: kotCount,
      ));

      // Add the updated KOT invoice to the merged list
      mergedInvoices.add(invoiceRec);
    }
  }

  return mergedInvoices;
}
