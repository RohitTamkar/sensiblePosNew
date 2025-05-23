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

import 'package:collection/collection.dart';

import 'index.dart'; // Imports other custom actions
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;

Future<void> saveStockOut(
  BuildContext context,
  AppSettingsRecord productAndListStockoutAppSettingsRecord,
  String stockoutreason,
) async {
  // Early exit if no bills to process
  if (functions
      .filterBillList(FFAppState().selBill, FFAppState().allBillsList.toList())
      .isEmpty) {
    return;
  }

  final prdlistsavebillupi = await actions.filterProducts2(
    FFAppState().selBill,
    FFAppState().allBillsList.toList(),
  );

  // Check shift exists
  if (!getJsonField(FFAppState().shiftDetailsJson, r'''$.shiftExists''')) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Login again to start Shift',
          style: TextStyle(color: FlutterFlowTheme.of(context).primaryText),
        ),
        duration: const Duration(milliseconds: 4000),
        backgroundColor: const Color(0x00000000),
      ),
    );
    return;
  }

  // Check if stock management is enabled
  final stockEnabled = productAndListStockoutAppSettingsRecord.settingList
          .firstWhereOrNull((e) => e.title == 'enableStock')
          ?.value ??
      false;

  if (stockEnabled && prdlistsavebillupi != null) {
    await _processStockUpdates(prdlistsavebillupi);
  }

  await actions.updateProductStockOut(
      prdlistsavebillupi!.toList(), stockoutreason);
  await _clearAppState();
  FFAppState().update(() {});
}

Future<void> _processStockUpdates(List<SelItemListStruct> products) async {
  for (int i = 0; i < products.length; i++) {
    final product = products[i];
    final stockupdateprd = await queryProductRecordOnce(
      parent: FFAppState().outletIdRef,
      queryBuilder: (productRecord) => productRecord
          .where('id', isEqualTo: product.id)
          .where('stockable', isEqualTo: true),
      singleRecord: true,
    ).then((s) => s.firstOrNull);

    if (stockupdateprd == null) continue;

    // Update Firestore stock
    await stockupdateprd.reference.update({
      'currentStock':
          FieldValue.increment(-(functions.doubleToInt(product.quantity)!)),
    });

    // Update Hive local storage
    final itemprd = await actions.hivegetproductbyId(
      stockupdateprd.reference.id,
      product,
      'get',
    );

    if (itemprd == null) continue;

    FFAppState().updateProductHiveputStruct((e) => e
      ..id = itemprd.id
      ..price = itemprd.price
      ..category = itemprd.category
      ..code = itemprd.code
      ..name = itemprd.name
      ..sellingPrice = itemprd.sellingPrice
      ..mrpPrice = itemprd.mrpPrice
      ..purchasePrice = itemprd.purchasePrice
      ..categoryId = itemprd.categoryId
      ..taxId = itemprd.taxId
      ..unitId = itemprd.unitId
      ..regionalName = itemprd.regionalName
      ..barcode = itemprd.barcode
      ..hsncode = itemprd.hsncode
      ..reorderLevel = itemprd.reorderLevel
      ..searchcode = itemprd.searchcode
      ..shortName = itemprd.shortName
      ..weightable = itemprd.weightable
      ..stockable = itemprd.stockable
      ..discountPer = itemprd.discountPer
      ..discountAmt = itemprd.discountAmt
      ..productMasterId = itemprd.productMasterId
      ..recipeRefId = itemprd.recipeRefId
      ..imageUrl = itemprd.imageUrl
      ..serviceOutletId = itemprd.serviceOutletId
      ..type = itemprd.type
      ..recipeId = itemprd.recipeId
      ..stock = itemprd.stock - functions.doubleToInt(product.quantity)!
      ..isDeleted = itemprd.isDeleted
      ..keywords = itemprd.keywords.toList()
      ..synC = itemprd.synC
      ..hivekey = itemprd.hivekey
      ..version = itemprd.version);

    await actions.hiveProductCrud(
      FFAppState().productHiveput.hivekey,
      FFAppState().productHiveput,
      'update',
    );

    // Refresh product list
    final newProductList = await actions.getProductlistHive();
    FFAppState().productHive =
        newProductList?.toList().cast<ProductStructStruct>() ?? [];
  }
}

Future<void> _clearAppState() async {
  await actions.removeFromAllBillList(FFAppState().selBill);

  FFAppState()
    ..lastBill = FFAppState().finalAmt
    ..noOfItems = 0
    ..subTotal = 0.0
    ..delCharges = 0.0
    ..oldBalance = 0
    ..custCredit = 0
    ..custNameRef = null
    ..setCustRef = null
    ..setCustName = ''
    ..setCustMobNo = ''
    ..prdid = ''
    ..finalAmt = 0.0
    ..billAmt = 0.0
    ..productHiveput = ProductStructStruct();
}
