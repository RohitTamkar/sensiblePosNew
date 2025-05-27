// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

Future<double> calSubTotalForHoldListkiosk2(
  String billNo,
  List<dynamic> allBillList,
  String inclusiveorexclusive,
  bool qtywiseparcelcharge,
) async {
  double total = 0;
  double qty = 0;
  double tax = 0;
  double delCharges = 0;
  double parcelQty = 0;

  List<dynamic> itemList = [];
  if (allBillList.isNotEmpty) {
    for (int i = 0; i < allBillList.length; i++) {
      if (allBillList[i]["billno"].toString() == billNo) {
        if (allBillList[i]["details"]["itemList"].isNotEmpty) {
          itemList = allBillList[i]["details"]["itemList"];

          for (var item in itemList) {
            double itemTax = item["taxAmt"] ?? 0.0;
            double itemTotal = item["quantity"] * item["price"];

            // Apply tax for exclusive pricing
            if (inclusiveorexclusive.toLowerCase() == 'exclusive' &&
                (item["taxPer"] ?? 0.0) > 0.0) {
              itemTotal += itemTax;
            }

            total += itemTotal;
            tax += itemTax;
            qty += item["quantity"];

            // Handle Parcel Charges
            if (qtywiseparcelcharge && item["ordertype"] == 'PARCEL') {
              delCharges += item["quantity"] * FFAppState().delCharges;
              parcelQty += item["quantity"];
            }
          }

          // Update total after adding parcel charges
          total += delCharges;
          FFAppState().update(() {});

          // Update App State
          FFAppState().subTotal = total;
          FFAppState().taxamt = tax;
          FFAppState().billAmt = total;
          FFAppState().totalQuantity = qty;

          // Ensure FFAppState().parcelqty is correctly updated
          if (qtywiseparcelcharge) {
            FFAppState().parcelqty = parcelQty.toInt();
            FFAppState().noOfItems = qty.toInt();
          } else {
            FFAppState().parcelqty = 0;
            FFAppState().noOfItems = itemList.length;
          }
          break;
        }
      }
    }
  }
  return total.roundToDouble();
}
