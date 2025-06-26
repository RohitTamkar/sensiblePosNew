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

Future<List<dynamic>> updateItemTablekot(
    dynamic obj, int billNo, List<String> kotRemarks) async {
  List<dynamic> allBillList = FFAppState().allBillsList;

  if (allBillList.isNotEmpty) {
    for (int i = 0; i < allBillList.length; i++) {
      if (allBillList[i]["billno"] == billNo) {
        List<dynamic> itemList = allBillList[i]["details"]["itemList"];
        if (itemList.isNotEmpty) {
          // Find the index of the matching item
          int index = itemList.indexWhere((item) => item == obj);
          if (index != -1) {
            // Instead of removing, mark as deleted
            itemList[index]["kotRemark"] = kotRemarks;

            allBillList[i]["details"]["itemList"] = itemList;
          }
        }
        break; // Bill found, no need to continue loop
      }
    }
  }

  FFAppState().allBillsList = allBillList;
  return allBillList;
}
