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

import 'index.dart'; // Imports other custom actions
import '/custom_code/actions/index.dart' as actions;
import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

Future<List<dynamic>> addToHoldListprdKOT(
  int billno,
  List<TaxMasterRecord> taxcollection,
  String inclusiveorexclusive,
  List<SelItemListStruct> documentList,
) async {
  List<dynamic> list = FFAppState().allBillsList;
  List<dynamic> itemList = [];

  // First group all items by their ID to combine quantities
  Map<String, double> quantityMap = {};
  Map<String, SelItemListStruct> itemMap = {};

  for (var document in documentList) {
    if (quantityMap.containsKey(document.id)) {
      quantityMap[document.id] = quantityMap[document.id]! + document.quantity;
    } else {
      quantityMap[document.id] = document.quantity;
      itemMap[document.id] = document;
    }
  }

  // Now process each unique item with combined quantities
  for (var id in quantityMap.keys) {
    var document = itemMap[id]!;
    double quantity = quantityMap[id]!;

    String taxId =
        document.taxId.isNotEmpty ? document.taxId : 'QPIz6c63YKBYVKT80oPv';
    TaxMasterRecord? taxRecord = taxcollection.firstWhere(
      (element) => element.id == taxId,
    );

    if (taxRecord != null) {
      double taxPer = taxRecord.percentage ?? 0.0;
      double price = document.price;

      double taxAmtPerItem = (inclusiveorexclusive.toLowerCase() == 'inclusive')
          ? (price * taxPer) / (100.0 + taxPer)
          : (price * taxPer) / 100.0;

      double taxAmt = taxAmtPerItem * quantity;

      double total = (inclusiveorexclusive.toLowerCase() == 'inclusive')
          ? (price * quantity)
          : (price * quantity) + taxAmt;

      // Find the bill to update
      for (int i = 0; i < list.length; i++) {
        if (list[i]["billno"] == billno) {
          itemList = list[i]["details"]["itemList"] ?? [];

          // Check if item already exists in this bill
          bool itemFound = false;
          for (int j = 0; j < itemList.length; j++) {
            if (itemList[j]["id"] == id) {
              // Update existing item with combined quantity
              itemList[j]["quantity"] = quantity;
              itemList[j]["qtystring"] = quantity.toString();
              itemList[j]["taxAmt"] =
                  double.parse((taxAmtPerItem * quantity).toStringAsFixed(2));
              itemList[j]["total"] = double.parse(total.toStringAsFixed(2));
              itemFound = true;
              break;
            }
          }

          if (!itemFound) {
            // Add new item with combined quantity
            final data = {
              "srno": itemList.length + 1,
              "name": document.name,
              "regionallang": '',
              "barcode": '',
              "price": price,
              "purPrice": price,
              "mrpPrice": 0,
              "quantity": quantity,
              "qtystring": quantity.toString(),
              "unit": '',
              "unitId": '',
              "total": double.parse(total.toStringAsFixed(2)),
              "id": id,
              "catId": document.catId,
              "taxId": taxId,
              "taxPer": double.parse(taxPer.toStringAsFixed(2)),
              "taxAmt": double.parse(taxAmt.toStringAsFixed(2)),
              "disPer": 0.0,
              "disAmt": 0.0,
              "mfgDate": " ",
              "expDate": " ",
              "stockable": false,
              "currentStock": 0,
              "printKot": document.printKot,
              "kotTime": document.isDeletedItem,
              "isDeleted": false,
            };
            itemList.add(data);
          }

          list[i]["details"]["itemList"] = itemList;
          break;
        }
      }
    }
  }

  // Update the app state
  FFAppState().allBillsList = list;
  print(FFAppState().allBillsList);

  await actions.calSubTotalForHoldListkiosk(
    FFAppState().selBill.toString(),
    FFAppState().allBillsList.toList(),
    inclusiveorexclusive,
  );

  await actions.calBillAmt(
    FFAppState().disAmt,
    FFAppState().delCharges,
  );
  return itemList;
}
