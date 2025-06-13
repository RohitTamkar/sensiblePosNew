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

Future<void> addProduct(
  String? name,
  String? regionalName,
  String? searchcode,
  String? shortName,
  String? hsncode,
  String? price,
  String? sellingPrice,
  String? purchasePrice,
  String? mrpPrice,
  String? discountPer,
  String? discountAmt,
  bool? stockable,
  bool? weightable,
  String? code,
  String? barcode,
  String? category,
  bool? isDeleted,
  DocumentReference? taxRef,
  DocumentReference? unitRef,
  DocumentReference? categoryRef,
  String? stock,
  String? currentStock,
  bool? isEnable,
  int? type,
  bool? purchasable,
) async {
  try {
    // Create a new document reference under the desired outlet collection
    var productRecordReference =
        ProductRecord.createDoc(FFAppState().outletIdRef!);

    // Set the document with the given data
    await productRecordReference.set(
      createProductRecordData(
        name: name,
        regionalName: regionalName,
        searchcode: int.tryParse(searchcode ?? ''),
        shortName: shortName,
        hsncode: int.tryParse(hsncode ?? ''),
        price: double.tryParse(price ?? ''),
        sellingPrice: double.tryParse(sellingPrice ?? ''),
        purchasePrice: double.tryParse(purchasePrice ?? ''),
        mrpPrice: double.tryParse(mrpPrice ?? ''),
        discountPer: double.tryParse(discountPer ?? ''),
        discountAmt: double.tryParse(discountAmt ?? ''),
        stockable: stockable,
        weightable: weightable,
        code: int.tryParse(code ?? ''),
        barcode: barcode,
        category: category,
        isDeleted: isDeleted ?? false,
        taxRef: taxRef,
        unitRef: unitRef,
        categoryRef: categoryRef,
        stock: int.tryParse(stock ?? ''),
        currentStock: int.tryParse(currentStock ?? ''),
        isEnable: isEnable ?? true,
        type: type ?? 0,
        purchasable: purchasable,
      ),
    );
  } catch (e) {
    // Optional: handle error
    print('Error adding product: $e');
  }
}
