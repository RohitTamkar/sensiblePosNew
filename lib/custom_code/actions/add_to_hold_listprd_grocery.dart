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

Future<List<dynamic>> addToHoldListprdGrocery(
  ProductStructStruct document,
  int billno,
  List<TaxMasterRecord> taxcollection,
  String inclusiveorexclusive,
  List<UnitTypeRecord> unitcollection,
) async {
  List<dynamic> list = FFAppState().allBillsList;
  print(document);
  List<dynamic> itemList = [];
  var y = 1.0;

  String? taxId = '';
  if (document!.taxId.isNotEmpty) {
    taxId = document.taxId;
  } else {
    taxId = 'QPIz6c63YKBYVKT80oPv';
  }
  TaxMasterRecord? taxRecord = taxcollection.firstWhere(
    (element) => element.id == taxId,
    orElse: null,
  );

  String? unitId = '';
  if (document!.unitId.isNotEmpty) {
    unitId = document?.unitId;
  } else {
    unitId = 'HjExWViQAwNJCUiUPwBz';
  }
  UnitTypeRecord? unitRecord = unitcollection.firstWhere(
    (element) => element.id == unitId,
    orElse: null,
  );
  int disPer = document.discountPer.toInt();
  double disAmt = document.discountAmt;

  if (disAmt > 0) {
    disPer = (disAmt * 100 / document.sellingPrice).toInt();
  } else if (disPer > 0) {
    disAmt = (document.sellingPrice * disPer) / 100.0;
  }
  if (taxRecord != null) {
    double taxPer = taxRecord.percentage ?? 0.0;
    double price = document!.sellingPrice;
    double quantity = y.toDouble();

    // Calculate taxAmt for each item separately
    double taxAmtPerItem = (inclusiveorexclusive.toLowerCase() == 'inclusive')
        ? (price * taxPer) / (100.0 + taxPer)
        : (price * taxPer) / 100.0;

    double taxAmt = taxAmtPerItem * quantity;

    double total = (inclusiveorexclusive.toLowerCase() == 'inclusive')
        ? (price * quantity)
        : (price * quantity) + double.parse(taxAmt.toStringAsFixed(2));

    // Deduct discount amount from total
    total -= disAmt * quantity;

    // Add tax amount for exclusive tax
    /* if (inclusiveorexclusive.toLowerCase() == 'exclusive') {
      total += taxAmt;
    }
*/
    int srNo = 1;
    if (list.isNotEmpty) {
      for (var bill in list) {
        if (bill["billno"] == billno) {
          if (bill["details"]["itemList"].isNotEmpty) {
            itemList = bill["details"]["itemList"];
            srNo = itemList.length + 1;
            break;
          }
        }
      }
    }

    final data = {
      "srno": srNo,
      "name": document!.name,
      "regionallang": document!.regionalName,
      "barcode": document!.barcode,
      "price": (document.sellingPrice)!.toDouble(),
      "mrpPrice": (document.mrpPrice)!.toDouble(),
      "quantity": quantity,
      "unit": unitRecord.unitType, //kg,pcs,doz
      "unitId": unitRecord.id,
      "total": total, // Include taxAmt for exclusive tax
      "id": document!.id,
      "catId": document!.categoryId,
      "taxId": document!.taxId,
      "taxPer": double.parse(taxPer.toStringAsFixed(2)),
      "taxAmt": double.parse(taxAmt.toStringAsFixed(2)),
      "disPer": double.parse(disPer.toStringAsFixed(2)),
      "disAmt": disAmt,
      "mfgDate": " ",
      "expDate": " ",
    };

    var index;
    var flag = false;
    var flag1 = false;

    if (list.isNotEmpty) {
      for (int i = 0; i < list.length; i++) {
        if (list[i]["billno"] == billno) {
          if (list[i]["details"]["itemList"].length > 0) {
            itemList = (list[i]["details"]["itemList"]);
            index = i;
            flag1 = true;
            break;
          } else {
            itemList.add(data);
            list[i]["details"]["itemList"] = itemList;

            FFAppState().allBillsList = list;
            break;
          }
        }
      }

      if (flag1) {
        for (int j = 0; j < itemList.length; j++) {
          if (itemList[j]["name"] == data["name"]) {
            itemList[j]["quantity"]++;
            itemList[j]["disAmt"] = double.parse(
                (disAmt * itemList[j]["quantity"]).toStringAsFixed(2));
            itemList[j]["taxAmt"] +=
                double.parse(taxAmtPerItem.toStringAsFixed(2));
            // Update taxAmt for each item
            if (inclusiveorexclusive.toLowerCase() == 'inclusive') {
              itemList[j]["total"] =
                  itemList[j]["quantity"] * itemList[j]["price"];
              // Update total for each item
              double tt = itemList[j]["total"];
              itemList[j]["total"] = double.parse(tt.toStringAsFixed(2));
            } else {
              itemList[j]["total"] =
                  itemList[j]["quantity"] * itemList[j]["price"];
              double tt = itemList[j]["total"];
              itemList[j]["total"] = double.parse(tt.toStringAsFixed(2));
            }
            list[index]["details"]["itemList"] = itemList;
            FFAppState().allBillsList = list;
            flag = true;
            break;
          }
        }

        if (!flag) {
          data["srno"] = itemList.length + 1;
          itemList.add(data);
          list[index]["details"]["itemList"] = itemList;
          FFAppState().allBillsList = list;
        }
      }
    }
  }

  print(FFAppState().allBillsList);
  return itemList;
}
