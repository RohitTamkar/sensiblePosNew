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
import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

Future<List<dynamic>> addToHoldListprdKOT(
  int billno,
  List<TaxMasterRecord> taxcollection,
  String inclusiveorexclusive,
  List<SelItemListStruct> documentList, // <-- renamed for clarity
) async {
  List<dynamic> list = FFAppState().allBillsList;
  List<dynamic> itemList = [];
  double quantity = 1.0;

  for (var document in documentList) {
    // Resolve taxId and unitId
    String taxId =
        document.taxId.isNotEmpty ? document.taxId : 'QPIz6c63YKBYVKT80oPv';
    TaxMasterRecord? taxRecord = taxcollection.firstWhere(
      (element) => element.id == taxId,
    );

    /*  String unitId = document.unitId.isNotEmpty ? document.unitId : 'HjExWViQAwNJCUiUPwBz';
    UnitTypeRecord? unitRecord = unitcollection.firstWhere(
          (element) => element.id == unitId,

    );*/

    /*   int disPer = document.discountPer.toInt();
    double disAmt = document.discountAmt;

    if (disAmt > 0) {
      disPer = (disAmt * 100 / document.sellingPrice).toInt();
    } else if (disPer > 0) {
      disAmt = (document.sellingPrice * disPer) / 100.0;
    }*/

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

      // total -= disAmt * quantity;

      int srNo = 1;

      for (var bill in list) {
        if (bill["billno"] == billno &&
            bill["details"]["itemList"].isNotEmpty) {
          itemList = bill["details"]["itemList"];
          srNo = itemList.length + 1;
          break;
        }
      }

      final data = {
        "srno": srNo,
        "name": document.name,
        "regionallang": '',
        "barcode": '',
        "price": price,
        "purPrice": price,
        "mrpPrice": 0,
        "quantity": quantity,
        "qtystring": quantity,
        "unit": '',
        "unitId": '',
        "total": double.parse(total.toStringAsFixed(2)),
        "id": document.id,
        "catId": document.catId,
        "taxId": taxId,
        "taxPer": double.parse(taxPer.toStringAsFixed(2)),
        "taxAmt": double.parse(taxAmt.toStringAsFixed(2)),
        "disPer": 0,
        "disAmt": 0,
        "mfgDate": " ",
        "expDate": " ",
        "stockable": false,
        "currentStock": 0,
        "kotPrint": document.kotPrint,
      };

      bool itemFound = false;
      for (int i = 0; i < list.length; i++) {
        if (list[i]["billno"] == billno) {
          for (int j = 0; j < itemList.length; j++) {
            if (itemList[j]["name"] == data["name"]) {
              itemList[j]["quantity"]++;
              itemList[j]["qtystring"] = itemList[j]["quantity"];
              /*itemList[j]["disAmt"] = double.parse(
                  (disAmt * itemList[j]["quantity"]).toStringAsFixed(2));*/
              itemList[j]["taxAmt"] = double.parse(
                  (taxAmtPerItem * itemList[j]["quantity"]).toStringAsFixed(2));

              itemList[j]["total"] =
                  inclusiveorexclusive.toLowerCase() == 'inclusive'
                      ? (itemList[j]["price"] * itemList[j]["quantity"])
                      : (itemList[j]["price"] * itemList[j]["quantity"]) +
                          itemList[j]["taxAmt"];
              itemList[j]["total"] -= itemList[j]["disAmt"];

              list[i]["details"]["itemList"] = itemList;
              FFAppState().allBillsList = list;
              itemFound = true;
              break;
            }
          }

          if (!itemFound) {
            data["srno"] = itemList.length + 1;
            itemList.add(data);
            list[i]["details"]["itemList"] = itemList;
            FFAppState().allBillsList = list;
          }
          break;
        }
      }
    }
  }

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
