import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'labeltest_widget.dart' show LabeltestWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LabeltestModel extends FlutterFlowModel<LabeltestWidget> {
  ///  Local state fields for this page.

  List<PurchaseSaleItemListStruct> productlist = [];
  void addToProductlist(PurchaseSaleItemListStruct item) =>
      productlist.add(item);
  void removeFromProductlist(PurchaseSaleItemListStruct item) =>
      productlist.remove(item);
  void removeAtIndexFromProductlist(int index) => productlist.removeAt(index);
  void insertAtIndexInProductlist(int index, PurchaseSaleItemListStruct item) =>
      productlist.insert(index, item);
  void updateProductlistAtIndex(
          int index, Function(PurchaseSaleItemListStruct) updateFn) =>
      productlist[index] = updateFn(productlist[index]);

  PurchaseSaleItemListStruct? purchasesell;
  void updatePurchasesellStruct(Function(PurchaseSaleItemListStruct) updateFn) {
    updateFn(purchasesell ??= PurchaseSaleItemListStruct());
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
