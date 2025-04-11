// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;

Future<void> editBillCustom(
  BuildContext context,
  String dropDownstartValue,
  String dropDownendValue,
) async {
  // Validate inputs early
  if (dropDownstartValue.isEmpty || dropDownendValue.isEmpty) {
    await showDialog(
      context: context,
      builder: (alertDialogContext) => AlertDialog(
        title: const Text('Select Start Bill & End Bill!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(alertDialogContext),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
    return;
  }

  final outletRef = FFAppState().outletIdRef;
  final (drop1, drop2) = await (
    queryInvoiceRecordOnce(
      parent: outletRef,
      queryBuilder: (invoiceRecord) =>
          invoiceRecord.where('id', isEqualTo: dropDownstartValue),
      singleRecord: true,
    ).then((s) => s.firstOrNull),
    queryInvoiceRecordOnce(
      parent: outletRef,
      queryBuilder: (invoiceRecord) =>
          invoiceRecord.where('id', isEqualTo: dropDownendValue),
      singleRecord: true,
    ).then((s) => s.firstOrNull),
  ).wait;

  if (drop1 == null || drop2 == null) return;

  final invoicecustombills = await queryInvoiceRecordOnce(
    parent: outletRef,
    queryBuilder: (invoiceRecord) => invoiceRecord
        .where('invoiceDate', isGreaterThanOrEqualTo: drop1.invoiceDate)
        .where('invoiceDate', isLessThanOrEqualTo: drop2.invoiceDate)
        .where('isDeleted', isEqualTo: false),
  );

  final confirmDialogResponse = await showDialog<bool>(
        context: context,
        builder: (alertDialogContext) => AlertDialog(
          title: Text('From ${drop1.invoice} To ${drop2.invoice}'),
          content: const Text('Are you sure to delete bills?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext, false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext, true),
              child: const Text('Confirm'),
            ),
          ],
        ),
      ) ??
      false;

  if (!confirmDialogResponse) return;

  // Group invoices by shift to avoid duplicate shift updates
  final kotInvoices =
      invoicecustombills.where((inv) => inv.source == 'KOT').toList();
  final shiftsToUpdate = <String, Map<String, dynamic>>{};

  final batch = FirebaseFirestore.instance.batch();

  // First pass: mark all invoices as deleted
  for (final invoice in kotInvoices) {
    batch.update(invoice.reference, {'isDeleted': true});
  }

  // Second pass: calculate shift updates
  for (final invoice in kotInvoices) {
    final resultItemloopcustom = await actions.docToJson(invoice);
    FFAppState().selectedInvoiceJson = resultItemloopcustom!;
    FFAppState().prevMode = invoice.paymentMode;

    final shiftKey = '${invoice.dayId}_${invoice.shiftId}';

    // Get current shift data if we haven't already
    if (!shiftsToUpdate.containsKey(shiftKey)) {
      final currentShiftData = await actions.shiftExistseditbill(
        invoice.dayId,
        invoice.shiftId,
        outletRef!.id,
      );

      if (currentShiftData != null) {
        shiftsToUpdate[shiftKey] = {
          'original': currentShiftData,
          'updated': currentShiftData,
          'shiftRef': functions.shiftRef(currentShiftData, outletRef!.id),
        };
      }
    }

    // Update the shift data with this invoice's impact
    if (shiftsToUpdate.containsKey(shiftKey)) {
      final shiftData = shiftsToUpdate[shiftKey]!;
      final updatedShiftData = await actions.updateShiftSummaryFordeletebill(
        FFAppState().selectedInvoiceJson,
        FFAppState().curMode,
        FFAppState().prevMode,
        shiftData['updated'],
      );

      shiftsToUpdate[shiftKey]!['updated'] = updatedShiftData;
    }
  }

  // Add all shift updates to the batch
  for (final shiftUpdate in shiftsToUpdate.values) {
    final updatedData = shiftUpdate['updated'];
    batch.update(shiftUpdate['shiftRef'], {
      'totalSale': getJsonField(updatedData, r'''$.totalSale'''),
      'paymentJson': getJsonField(updatedData, r'''$.paymentJson''').toString(),
      'cashSale': getJsonField(updatedData, r'''$.cashSale'''),
      'billCount': getJsonField(updatedData, r'''$.billCount'''),
      'tax': getJsonField(updatedData, r'''$.tax'''),
    });
  }

  await batch.commit();

  // Refresh shift data
  final omtcustom = await queryShiftRecordOnce(
    parent: outletRef,
    queryBuilder: (shiftRecord) =>
        shiftRecord.orderBy('dayId', descending: true),
    limit: 5,
  );

  final shiftdetailsnewonlineCustom =
      await actions.shiftDetailNewpark(omtcustom.toList());
  FFAppState().shiftdetails = shiftdetailsnewonlineCustom!;
  FFAppState().billcount =
      getJsonField(shiftdetailsnewonlineCustom, r'''$.billCount''');

  await showDialog(
    context: context,
    builder: (alertDialogContext) => AlertDialog(
      title: const Text('Invoice Deleted Successfully!'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(alertDialogContext),
          child: const Text('Ok'),
        ),
      ],
    ),
  );
}
