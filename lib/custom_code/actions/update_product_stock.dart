// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

Future<void> updateProductStock(
  RecipeRecord recipeitmelist,
  SelItemListStruct sellitem,
) async {
  // Create a list to hold ProductListStockStruct objects
  List<ProductListStockStruct> productListStockList = [];

  for (var item in recipeitmelist.items) {
    // Find the corresponding product in the product list
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('OUTLET')
        .doc(FFAppState().outletIdRef?.id)
        .collection('PRODUCT')
        .where('id', isEqualTo: item.id)
        .get();

    for (var doc in querySnapshot.docs) {
      // If the product is found and is stockable, update its stock
      if (doc != null) {
        // Subtract the quantity from the product's stock
        int stock =
            (doc["currentStock"] - (item.quantity * sellitem.quantity).toInt());
        await doc.reference.update(createProductRecordData(
          currentStock: stock,
        ));

        // Add the product to the productListStockList with reqStock as the quantity from recipeitem
        productListStockList.add(ProductListStockStruct(
          code: doc["code"],
          name: doc["name"],
          reqStock: item.quantity * sellitem.quantity,
          id: item.id,
        ));
      }
    }
  }

  // Create the StockSummary document
  var stockSummaryRecordReference =
      StockSummaryRecord.createDoc(FFAppState().outletIdRef!);

  await stockSummaryRecordReference.set({
    ...createStockSummaryRecordData(
      createdBy: FFAppState().userdoc?.id,
      status: 'OUT',
      dayId: dateTimeFormat("yyyy-MM-dd", getCurrentTimestamp, locale: 'en'),
      monthId: dateTimeFormat("yyyy-MM", getCurrentTimestamp, locale: 'en'),
      createdAt: getCurrentTimestamp,
      stockType: 'OUT',
    ),
    ...mapToFirestore({
      'productListMap':
          getProductListStockListFirestoreData(productListStockList),
    }),
  });
}
