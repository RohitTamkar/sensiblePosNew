// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

Future<List<dynamic>?> todaysStockSummarReport() async {
  // Fetch documents from Firestore
  final productSnapshot = await FirebaseFirestore.instance
      .collection('OUTLET')
      .doc(FFAppState().outletIdRef?.id)
      .collection('PRODUCT')
      .where('stockable', isEqualTo: true)
      .get();

  final purchaseSnapshot = await FirebaseFirestore.instance
      .collection('OUTLET')
      .doc(FFAppState().outletIdRef?.id)
      .collection('PURCHASE')
      .where('dayId', isEqualTo: FFAppState().filterDate)
      .get();

  final stockSnapshot = await FirebaseFirestore.instance
      .collection('OUTLET')
      .doc(FFAppState().outletIdRef?.id)
      .collection('STOCK_SUMMARY')
      .where('dayId', isEqualTo: FFAppState().filterDate)
      .get();

  final invoiceSnapshot = await FirebaseFirestore.instance
      .collection('OUTLET')
      .doc(FFAppState().outletIdRef?.id)
      .collection('INVOICE')
      .where('dayId', isEqualTo: FFAppState().filterDate)
      .get();

  // Convert Firestore docs to typed model objects
  final prdList = productSnapshot.docs
      .map((doc) => ProductRecord.fromSnapshot(doc))
      .toList();
  final purchasedDocList = purchaseSnapshot.docs
      .map((doc) => PurchaseRecord.fromSnapshot(doc))
      .toList();
  final stockDocList = stockSnapshot.docs
      .map((doc) => StockSummaryRecord.fromSnapshot(doc))
      .toList();
  final invDocList = invoiceSnapshot.docs
      .map((doc) => InvoiceRecord.fromSnapshot(doc))
      .toList();

  // Final JSON list to return
  List<Map<String, dynamic>> stockSummaryList = [];

  for (var product in prdList) {
    final productName = product.name ?? '';
    final rate = product.sellingPrice ?? 0;

    final productId = product.id;

    // Inward calculation
    int inwardQty = inwardItemsqty(purchasedDocList, productId) ?? 0;
    double inwardAmt = inwardQty * rate;

    // Outward calculation
    int outwardQty = outwardItemsqty(stockDocList, productId) ?? 0;
    double outwardAmt = outwardQty * rate;

    // Stockout calculation
    dynamic stockoutjson =
        stockoutwardItemsqty(stockDocList, productId, rate) ?? 0;
    //double stockoutwardAmt = stockoutwardQty * rate;

    // Get closing stock
    int closingStock = product.currentStock?.toInt() ?? 0;

    // Derive opening stock
    int openingQty = closingStock - inwardQty + outwardQty;
    double openingAmt = openingQty * rate;
    double closingAmt = closingStock * rate;

    stockSummaryList.add({
      'productName': productName,
      'openingQty': openingQty,
      'openingQtyAmt': openingAmt,
      'inwardQty': inwardQty,
      'inwardQtyAmt': inwardAmt,
      'outwardsaleQty': outwardQty,
      'outwardsaleAmt': outwardAmt,
      'closingStock': closingStock,
      'closingStockAmt': closingAmt,
      'stockoutwardjson': stockoutjson,
    });
  }

  return stockSummaryList;
}

int? outwardItemsqty(
  List<StockSummaryRecord>? stockDocList,
  String? productId,
) {
  if (stockDocList == null || productId == null) {
    return null;
  }

  int totalQty = 0;

  for (var StockSummaryRecord in stockDocList) {
    if (StockSummaryRecord.stockType != "STOCKOUT" &&
        StockSummaryRecord.productListMap != null) {
      for (var product in StockSummaryRecord.productListMap!) {
        if (product.id == productId) {
          totalQty += product.reqStock.toInt() ?? 0;
        }
      }
    }
  }

  return totalQty;
}

Map<String, dynamic>? stockoutwardItemsqty(
  List<StockSummaryRecord>? stockDocList,
  String? productId,
  double rate,
) {
  if (stockDocList == null || productId == null) {
    return null;
  }

  int totalQty = 0;
  double totalAmt = 0.0;
  List<Map<String, dynamic>> reasons = [];

  for (var stockSummary in stockDocList) {
    if (stockSummary.stockType == "STOCKOUT" &&
        stockSummary.productListMap != null) {
      for (var product in stockSummary.productListMap!) {
        if (product.id == productId) {
          int qty = product.reqStock.toInt() ?? 0;
          totalQty += qty;
          totalAmt += qty * rate;

          reasons.add({
            'reason': stockSummary.reason ?? 'N/A',
            'qty': qty,
            'amt': qty * rate,
          });
        }
      }
    }
  }

  return {
    'qty': totalQty,
    'amt': totalAmt,
    'reason': reasons,
  };
}

int? inwardItemsqty(
  List<PurchaseRecord>? purchasedDocList,
  String? productId,
) {
  if (purchasedDocList == null || productId == null) {
    return null;
  }

  int totalQty = 0;

  for (var purchaseRecord in purchasedDocList) {
    if (purchaseRecord.productList != null) {
      for (var product in purchaseRecord.productList!) {
        if (product.id == productId) {
          totalQty += product.quantity.toInt() ?? 0;
        }
      }
    }
  }

  return totalQty;
}
