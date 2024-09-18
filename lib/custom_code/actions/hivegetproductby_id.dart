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

Future<ProductStructStruct?> hivegetproductbyId(
  String? id,
  SelItemListStruct? itemBlob,
  String actionType,
) async {
  productBox = await Hive.openBox<ProductStructStruct>('product');

  dayId = dayId ?? '999'; // Make sure dayId is a String

  // add the new item into the Hive box
  switch (actionType) {
    case 'get':
      // Find the hivekey based on dayID
      int? hivekey = await findHiveKeyById(id);
      if (hivekey != null) {
        // Use the found hivekey to get the item
        ProductStructStruct? itemBlob = await productBox.get(hivekey);
        if (itemBlob != null) {
          print('get');
          print(itemBlob);
          return itemBlob;
        }
      }

      // If no item is found, return a default ShiftDetailsStruct
      print('else');
      print(dayId);
      return ProductStructStruct(id: id);
      break;

    default:
      throw Exception('Unsupported action type: $actionType');
  }
}

Future<int?> findHiveKeyById(String id) async {
  // Iterate through keys in the Hive box and find the corresponding hivekey
  for (var key in productBox.keys) {
    ProductStructStruct? item = await productBox.get(key);
    if (item != null && item.id == id) {
      return key;
    }
  }

  // Return null if no match is found
  return null;
}
