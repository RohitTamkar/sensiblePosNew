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

  if (FFAppState().groceryJson == null) {
    FFAppState().groceryJson = {
      'paymentMode': {"$paymentMode": 0.00},
      'paidAmt': '0',
      'totalAmt': '0',
      'advanceAmt': '0',
      'balanceAmt': '0',
      'returnAmt': '0',
    };
  }
  print(FFAppState().groceryJson['paymentMode']);
  // Get the existing paymentModes map
  Map<String, double> paymentModes = FFAppState().groceryJson['paymentMode'];

  // Calculate the total paid amount by summing previous payments and the current one
  double previousPaidAmt = paymentModes.values.fold(0, (sum, amt) => sum + amt);
  double newTotalPaidAmt = previousPaidAmt + paidAmt;

  double balanceAmt = 0;
  double returnAmt = 0;
  double advanceAmt = 0;

  // Update the payment mode and amount in the Map
  paymentModes[paymentMode] = (paymentModes[paymentMode] ?? 0) + paidAmt;

  // Calculate the balance, return, and advance amounts
  if (newTotalPaidAmt <= totalAmount) {
    balanceAmt = totalAmount - newTotalPaidAmt;
  } else {
    advanceAmt = newTotalPaidAmt;
    returnAmt = advanceAmt - totalAmount;
  }

  // Update groceryJson with the latest data
  FFAppState().groceryJson = {
    'paymentMode': paymentModes,
    'paidAmt': newTotalPaidAmt,
    'totalAmt': totalAmount,
    'advanceAmt': advanceAmt,
    'balanceAmt': balanceAmt,
    'returnAmt': returnAmt,
  };

  // Print the JSON structure
  print(FFAppState().groceryJson);
  return FFAppState().groceryJson;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
