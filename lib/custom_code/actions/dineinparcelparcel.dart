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

Future<double> dineinparcelparcel(
  String billNo,
  List<dynamic> allBillList,
  String inclusiveorexclusive,
  bool qtywiseparcelcharge,
  String ordertype,
  dynamic obj,
) async {
  double total = 0;
  double qty = 0;
  double tax = 0;
  double delCharges = 0;
  List<dynamic> list = FFAppState().allBillsList;
  print(obj);
  List<dynamic> itemList = [];
//  print(obj.length);

  final data = {
    "name": obj['name'],
    "price": (obj['price'])!.toDouble(),
    "quantity": obj['quantity'],
    "total": total, // Include taxAmt for exclusive tax
    "id": obj['id'],
    "catId": obj['catId'],
    "taxId": obj['taxId'],
    "taxPer": obj['taxPer'],
    "taxAmt": obj['taxAmt'],
    "ordertype": ordertype,
  };

  var index;
  var flag = false;
  var flag1 = false;

  if (list.isNotEmpty) {
    for (int i = 0; i < list.length; i++) {
      if (list[i]["billno"].toString() == billNo) {
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
        if (itemList[j]["id"] == data["id"]) {
          itemList[j]["ordertype"] = ordertype;
          /*   if (inclusiveorexclusive.toLowerCase() == 'inclusive') {
            itemList[j]["total"] = itemList[j]["quantity"] *
                itemList[j]["price"]; // Update total for each item
          } else {
            */ /* itemList[j]["total"] =
                  itemList[j]["quantity"] * itemList[j]["price"] +
                      itemList[j]["taxAmt"];*/ /*
            itemList[j]["total"] =
                itemList[j]["quantity"] * itemList[j]["price"];
          } */ // Update total for each item

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

  /* List<dynamic> itemList = [];
  if (allBillList.isNotEmpty) {
    for (int i = 0; i < allBillList.length; i++) {
      print(allBillList[i]["billno"]);
      if (allBillList[i]["billno"].toString() == billNo) {
        if (allBillList[i]["details"]["itemList"].length >= 0) {
          itemList = (allBillList[i]["details"]["itemList"]);
          if (itemList.isNotEmpty) {
            for (int i = 0; i < itemList.length; i++) {
              tax += itemList[i]["taxAmt"];
              //tax = 0;
              double tax2 = itemList[i]["taxAmt"];
              if (inclusiveorexclusive.toLowerCase() == 'exclusive') {
                if (itemList[i]["taxPer"] > 0.0) {
                  total +=
                      itemList[i]["quantity"] * itemList[i]["price"] + tax2;
                } else {
                  total += itemList[i]["quantity"] * itemList[i]["price"];
                }
              } else {
                total += itemList[i]["quantity"] * itemList[i]["price"];
              }
              // total += itemList[i]["total"];
              if (qtywiseparcelcharge) {
                delCharges = itemList[i]["quantity"] * FFAppState().delCharges;
                total += delCharges;
              }
              qty += itemList[i]["quantity"];

              print("total");
              print(total);
            }
          }
          FFAppState().subTotal = total.toDouble();
          FFAppState().taxamt = tax.toDouble();
          FFAppState().billAmt = total.toDouble();
          FFAppState().totalQuantity = qty.toDouble();
          if (qtywiseparcelcharge) {
            FFAppState().noOfItems = qty.toInt();
          } else {
            FFAppState().noOfItems = itemList.length;
          }
          break;
        }
      }
    }
  }*/
  return total.roundToDouble();
}
