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

Future<double> applyCouponCode(
  double finalAmt,
  CouponsCodeRecord? couponCodeDoc,
) async {
  // Return 0 if the coupon is null or not active
  if (couponCodeDoc == null || couponCodeDoc.isActive != true) {
    return 0.0;
  }

  // Calculate percentage discount
  FFAppState().disPer = couponCodeDoc.percentageDiscount ?? 0;
  double discount = (finalAmt * (couponCodeDoc.percentageDiscount ?? 0) / 100);

  // Apply max discount cap if maxAmtDiscount > 0
  if ((couponCodeDoc.maxAmtDiscount ?? 0) > 0) {
    discount = discount > couponCodeDoc.maxAmtDiscount!
        ? couponCodeDoc.maxAmtDiscount!.toDouble()
        : discount;
  }

  return discount;
}
