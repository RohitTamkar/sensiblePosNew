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

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

Future<dynamic> updateShiftSummaryFordeletebill(
  dynamic newInvoice,
  String currentMode,
  String prevMode,
  dynamic shift1,
) async {
  dynamic invoice;
  double reducePaymentTotal = 0.0;

  if (FFAppState().updatedInvoiceJson == null ||
      FFAppState().updatedInvoiceJson == "") {
    reducePaymentTotal = newInvoice["finalBillAmt"]!.toDouble();
  } else {
    invoice = FFAppState().updatedInvoiceJson;
    reducePaymentTotal = invoice["finalBillAmt"]!.toDouble();
  }

  double addPaymentTotal = newInvoice["finalBillAmt"]!.toDouble();

  List<dynamic> shift = [];
  shift.add(shift1);

  for (int i = 0; i < shift.length; i++) {
    final paymentJsonData = jsonDecode(shift[i]["paymentJson"]);

    // Adjust payment methods based on the previous and current modes
    paymentJsonData["cash"] = paymentJsonData["cash"].toDouble() +
        (prevMode == "CASH"
            ? -reducePaymentTotal
            : currentMode == "CASH"
                ? addPaymentTotal
                : 0);

    paymentJsonData["credit"] = paymentJsonData["credit"].toDouble() +
        (prevMode == "CREDIT"
            ? -reducePaymentTotal
            : currentMode == "CREDIT"
                ? addPaymentTotal
                : 0);

    paymentJsonData["googlepay"] = paymentJsonData["googlepay"].toDouble() +
        (prevMode == "GOOGLEPAY"
            ? -reducePaymentTotal
            : currentMode == "GOOGLEPAY"
                ? addPaymentTotal
                : 0);

    paymentJsonData["other"] = paymentJsonData["other"].toDouble() +
        (prevMode == "OTHER"
            ? -reducePaymentTotal
            : currentMode == "OTHER"
                ? addPaymentTotal
                : 0);

    paymentJsonData["cheque"] = paymentJsonData["cheque"].toDouble() +
        (prevMode == "CHEQUE"
            ? -reducePaymentTotal
            : currentMode == "CHEQUE"
                ? addPaymentTotal
                : 0);

    paymentJsonData["phonepe"] = paymentJsonData["phonepe"].toDouble() +
        (prevMode == "PHONEPE"
            ? -reducePaymentTotal
            : currentMode == "PHONEPE"
                ? addPaymentTotal
                : 0);

    paymentJsonData["paytm"] = paymentJsonData["paytm"].toDouble() +
        (prevMode == "PAYTM"
            ? -reducePaymentTotal
            : currentMode == "PAYTM"
                ? addPaymentTotal
                : 0);

    paymentJsonData["card"] = paymentJsonData["card"].toDouble() +
        (prevMode == "CARD"
            ? -reducePaymentTotal
            : currentMode == "CARD"
                ? addPaymentTotal
                : 0);
    paymentJsonData["digital"] = paymentJsonData["digital"].toDouble() +
        (prevMode == "DIGITAL"
            ? -reducePaymentTotal
            : currentMode == "DIGITAL"
                ? addPaymentTotal
                : 0);

    // Update the paymentJson in the shift
    var paymentJsonDataString = jsonEncode(paymentJsonData).toString();
    shift[i]["paymentJson"] = paymentJsonDataString;
  }
  shift[0]["billCount"] = shift[0]["billCount"] - 1;
  shift[0]["tax"] = double.parse(
      (shift[0]["tax"] - newInvoice["taxAmt"]!.toDouble()).toStringAsFixed(2));
  if (prevMode == "CASH") {
    shift[0]["cashSale"] = shift[0]["cashSale"] - reducePaymentTotal;
  }
  // Adjust the total sale in the shift
  shift[0]["totalSale"] = shift[0]["totalSale"].toDouble() - reducePaymentTotal;

  // Reset the state
  FFAppState().curMode = "";
  FFAppState().prevMode = "";
  FFAppState().updatedInvoiceJson = "";

  return shift[0];
}
