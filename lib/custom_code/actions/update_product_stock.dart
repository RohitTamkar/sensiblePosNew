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

Future updateProductStock(
  RecipeRecord recipeitmelist,
) async {
  // Iterate through each item in the recipe item list

  List<ProductRecord> productlist;
  for (var item in recipeitmelist.items) {
    // Find the corresponding product in the product list
    QuerySnapshot querySnapshot;
    querySnapshot = await FirebaseFirestore.instance
        .collection('OUTLET')
        .doc(FFAppState().outletIdRef?.id)
        .collection('PRODUCT')
        .where('id', isEqualTo: item.id)
        .get();
    for (var doc in querySnapshot.docs) {
      // If the product is found and is stockable, update its stock
      if (doc != null && item.stockable == true) {
        // Subtract the quantity from the product's stock
        int stock = (doc["currentStock"] - item.quantity) as int;
        doc.reference.update(createProductRecordData(
          currentStock: stock,
        ));

        // Update the product record in Firebase
      }
    }
  }
}
