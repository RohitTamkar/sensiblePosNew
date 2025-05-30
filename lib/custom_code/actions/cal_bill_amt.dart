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

Future<double> calBillAmt(
  double disAmt,
  double delChargs,
) async {
  double billAmt;
  print(
      "----------------------------------------------------3C---------------------------------------------------------------");
  billAmt = FFAppState().billAmt;
  if (disAmt > 0) {
    billAmt -= disAmt;
    print(disAmt);
  }
  if (delChargs > 0) {
    // FFAppState().delCharges = delChargs * FFAppState().noOfItems;
    billAmt += delChargs * FFAppState().noOfItems;
    print(delChargs);
  }

  FFAppState().finalAmt = billAmt.roundToDouble();
  print("==================================================================");
  print(FFAppState().finalAmt);
  // FFAppState().subTotal = billAmt;
  FFAppState().update(() {});
  print(billAmt);
  return billAmt.roundToDouble();
}
