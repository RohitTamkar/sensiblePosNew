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

dynamic calculateGroceryAmtaction(
  String paymentMode,
  double totalAmount,
  double paidAmt,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  Map<String, double> paymentModes = {};
  double balanceAmt = 0;
  double returnAmt = 0;
  double advanceAmt = 0;
  //Add the payment mode and amount to the Map
  if (totalAmount > advanceAmt) {
    balanceAmt = totalAmount - advanceAmt;
  } else {
    advanceAmt = paidAmt;
    returnAmt = advanceAmt - totalAmount;
  }

  // Create the final JSON structure
  Map<String, dynamic> result = {
    'paymentMode': paymentModes,
    'paidAmt': paidAmt,
    'totalAmt': totalAmount,
    'advanceAmt': advanceAmt,
    'balanceAmt': balanceAmt,
    'returnAmt': returnAmt,
  };

  // Return the JSON as a string
  return jsonEncode(result);

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
