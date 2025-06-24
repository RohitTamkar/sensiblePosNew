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

Future<List<dynamic>> addToHoldListprdKOT(
  int billno,
  List<TaxMasterRecord> taxcollection,
  String inclusiveorexclusive,
  List<SelItemListStruct> documentList,
) async {
  List<dynamic> list = FFAppState().allBillsList;
  List<dynamic> itemList = [];

  // ✅ 1️⃣ Group items using composite key: id + isDeletedItem
  Map<String, double> quantityMap = {};
  Map<String, SelItemListStruct> itemMap = {};

  for (var document in documentList) {
    String key = '${document.id}_${document.isDeletedItem}';
    if (quantityMap.containsKey(key)) {
      quantityMap[key] = quantityMap[key]! + document.quantity;
    } else {
      quantityMap[key] = document.quantity;
      itemMap[key] = document;
    }
  }

  // ✅ 2️⃣ Process each unique key
  for (var key in quantityMap.keys) {
    var document = itemMap[key]!;
    double quantity = quantityMap[key]!;

    String id = document.id;
    bool isDeleted = document.isDeletedItem;

    String taxId =
        document.taxId.isNotEmpty ? document.taxId : 'QPIz6c63YKBYVKT80oPv';

    TaxMasterRecord? taxRecord = taxcollection.firstWhere(
      (element) => element.id == taxId,
    );

    double taxPer = taxRecord.percentage ?? 0.0;
    double price = document.price;

    double taxAmtPerItem = (inclusiveorexclusive.toLowerCase() == 'inclusive')
        ? (price * taxPer) / (100.0 + taxPer)
        : (price * taxPer) / 100.0;

    double taxAmt = taxAmtPerItem * quantity;

    double total = (inclusiveorexclusive.toLowerCase() == 'inclusive')
        ? (price * quantity)
        : (price * quantity) + taxAmt;

    // ✅ 3️⃣ Update the specific bill in the list
    for (int i = 0; i < list.length; i++) {
      if (list[i]["billno"] == billno) {
        list[i]["details"] ??= {};
        itemList = list[i]["details"]["itemList"] ?? [];

        bool itemFound = false;
        for (int j = 0; j < itemList.length; j++) {
          if (itemList[j]["id"] == id &&
              itemList[j]["isDeleted"] == isDeleted) {
            // Update existing item with combined quantity
            itemList[j]["quantity"] = quantity;
            itemList[j]["qtystring"] = quantity.toString();
            itemList[j]["taxAmt"] = double.parse(taxAmt.toStringAsFixed(2));
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
            "kotTime": document.kotTime,
            "isDeleted": isDeleted,
          };
          itemList.add(data);
        }

        list[i]["details"]["itemList"] = itemList;
        break; // done for this bill
      }
    }
  }

  // ✅ 4️⃣ Update AppState and recalculate
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

  return itemList; // returns the updated itemList for this bill
}
