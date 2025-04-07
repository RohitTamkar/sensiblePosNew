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

  // Parallelize the initial queries
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

  // Get invoices in the date range
  final invoicecustombills = await queryInvoiceRecordOnce(
    parent: outletRef,
    queryBuilder: (invoiceRecord) => invoiceRecord
        .where('invoiceDate', isGreaterThanOrEqualTo: drop1.invoiceDate)
        .where('invoiceDate', isLessThanOrEqualTo: drop2.invoiceDate)
        .where('isDeleted', isEqualTo: false),
  );

  // Confirm with user
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

  // Process invoices
  final batch = FirebaseFirestore.instance.batch();
  final kotInvoices =
      invoicecustombills.where((inv) => inv.source == 'KOT').toList();

  for (final invoice in kotInvoices) {
    // Prepare data
    final resultItemloopcustom = await actions.docToJson(invoice);
    FFAppState().selectedInvoiceJson = resultItemloopcustom!;
    FFAppState().prevMode = invoice.paymentMode;

    // Mark invoice as deleted
    batch.update(invoice.reference, {'isDeleted': true});

    // Update shift data
    final shiftListeditbillcustom = await actions.shiftExistseditbill(
      invoice.dayId,
      invoice.shiftId,
      outletRef!.id,
    );

    final returnList1editbillcustom =
        await actions.updateShiftSummaryFordeletebill(
      FFAppState().selectedInvoiceJson,
      FFAppState().curMode,
      FFAppState().prevMode,
      shiftListeditbillcustom!,
    );

    // Update shift record
    final shiftRef = functions.shiftRef(shiftListeditbillcustom, outletRef!.id);
    batch.update(shiftRef, {
      'totalSale': getJsonField(shiftListeditbillcustom, r'''$.totalSale'''),
      'subTotalBill':
          getJsonField(shiftListeditbillcustom, r'''$.subTotalSale'''),
      'paymentJson': getJsonField(shiftListeditbillcustom, r'''$.paymentJson''')
          .toString(),
      'cashSale': getJsonField(shiftListeditbillcustom, r'''$.cashSale'''),
      'billCount': getJsonField(shiftListeditbillcustom, r'''$.billCount'''),
      'tax': getJsonField(shiftListeditbillcustom, r'''$.tax'''),
    });
  }

  // Commit all changes in a single batch
  await batch.commit();

  // Get latest shift data
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

  // Show success message
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
