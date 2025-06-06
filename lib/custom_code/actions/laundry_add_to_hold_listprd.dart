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

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

Future<List<dynamic>> laundryAddToHoldListprd(
  ProductStructStruct document,
  int billno,
  List<TaxMasterRecord> taxcollection,
  String inclusiveorexclusive,
) async {
  List<dynamic> list = FFAppState().allBillsList;
  print(document);
  List<dynamic> itemList = [];

  String weightString = '';
  // if (weightString == '') {
  //   weightString = FFAppState().weight;
  // } else {
  //   weightString = "0.0 kg";
  // }
  double weight = 1.0;
  bool isWeightable = document.weightable;

  if (isWeightable) {
    // If FFAppState().weight is not empty, extract the numeric value
    if (FFAppState().weight.isNotEmpty) {
      weightString = FFAppState().weight;
      RegExp regex = RegExp(r'([\d.]+)');
      String? weightMatch = regex.firstMatch(weightString)?.group(0);
      if (weightMatch != null) {
        weight = double.parse(weightMatch);
      }
    }
  }

  // if(FFAppState().weight.isNotEmpty){
  //   weightString = FFAppState().weight;
  //   RegExp regex = RegExp(r'([\d.]+)');
  //   String? weightMatch = regex.firstMatch(weightString)?.group(0);
  //   weight = double.parse(weightMatch!);
  // }

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

  if (taxRecord != null) {
    double taxPer = taxRecord.percentage ?? 0.0;
    double price = document!.sellingPrice;
    double quantity = weight;

    // Calculate taxAmt for each item separately
    double taxAmtPerItem = (inclusiveorexclusive.toLowerCase() == 'inclusive')
        ? (price * taxPer) / (100.0 + taxPer)
        : (price * taxPer) / 100.0;

    double taxAmt = taxAmtPerItem * quantity;

    /* double total = (inclusiveorexclusive.toLowerCase() == 'inclusive')
        ? (price * quantity)
        : (price * quantity) + double.parse(taxAmt.toStringAsFixed(2));*/
    // double total = (inclusiveorexclusive.toLowerCase() == 'inclusive')
    //     ? (price * quantity)
    //     : (price * quantity);
    double total = (inclusiveorexclusive.toLowerCase() == 'inclusive')
        ? (price * quantity)
        : (price * quantity);

    final data = {
      "name": document!.name,
      "price": (document.sellingPrice)!.toDouble(),
      "quantity": double.parse(quantity.toStringAsFixed(2)),
      "total": double.parse(
          total.toStringAsFixed(2)), // Include taxAmt for exclusive tax
      "id": document!.id,
      "catId": document!.categoryId,
      "taxId": document!.taxId,
      "taxPer": taxPer,
      "taxAmt": double.parse(taxAmt.toStringAsFixed(2)),
      "currentStock": document!.stock ?? 0,
      "stockable": document!.stockable ?? false,
      "weightable": document!.weightable ?? false,
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
            if (isWeightable) {
              itemList[j]["quantity"] =
                  double.parse(itemList[j]["quantity"].toString()) + weight;
            } else {
              itemList[j]["quantity"]++;
            }

            itemList[j]["taxAmt"] +=
                taxAmtPerItem; // Update taxAmt for each item
            if (inclusiveorexclusive.toLowerCase() == 'inclusive') {
              itemList[j]["total"] = itemList[j]["quantity"] *
                  itemList[j]["price"]; // Update total for each item
            } else {
              itemList[j]["total"] =
                  itemList[j]["quantity"] * itemList[j]["price"];
            }
            list[index]["details"]["itemList"] = itemList;
            FFAppState().allBillsList = list;
            flag = true;
            break;
          }
        }

        if (!flag) {
          itemList.add(data);
          list[index]["details"]["itemList"] = itemList;
          FFAppState().allBillsList = list;
        }
      }
    }
  }

  print(FFAppState().allBillsList);
  return FFAppState().allBillsList;
}
