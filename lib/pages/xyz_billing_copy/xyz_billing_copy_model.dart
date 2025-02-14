import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/discount_and_delivery_copy/discount_and_delivery_copy_widget.dart';
import '/components/menu_drawer/menu_drawer_widget.dart';
import '/components/xyzproduct_cart_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'xyz_billing_copy_widget.dart' show XyzBillingCopyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class XyzBillingCopyModel extends FlutterFlowModel<XyzBillingCopyWidget> {
  ///  Local state fields for this page.

  List<CategoryStructStruct> categoryHive = [];
  void addToCategoryHive(CategoryStructStruct item) => categoryHive.add(item);
  void removeFromCategoryHive(CategoryStructStruct item) =>
      categoryHive.remove(item);
  void removeAtIndexFromCategoryHive(int index) => categoryHive.removeAt(index);
  void insertAtIndexInCategoryHive(int index, CategoryStructStruct item) =>
      categoryHive.insert(index, item);
  void updateCategoryHiveAtIndex(
          int index, Function(CategoryStructStruct) updateFn) =>
      categoryHive[index] = updateFn(categoryHive[index]);

  List<ProductStructStruct> productHive = [];
  void addToProductHive(ProductStructStruct item) => productHive.add(item);
  void removeFromProductHive(ProductStructStruct item) =>
      productHive.remove(item);
  void removeAtIndexFromProductHive(int index) => productHive.removeAt(index);
  void insertAtIndexInProductHive(int index, ProductStructStruct item) =>
      productHive.insert(index, item);
  void updateProductHiveAtIndex(
          int index, Function(ProductStructStruct) updateFn) =>
      productHive[index] = updateFn(productHive[index]);

  List<TaxMasterRecord> taxcollection = [];
  void addToTaxcollection(TaxMasterRecord item) => taxcollection.add(item);
  void removeFromTaxcollection(TaxMasterRecord item) =>
      taxcollection.remove(item);
  void removeAtIndexFromTaxcollection(int index) =>
      taxcollection.removeAt(index);
  void insertAtIndexInTaxcollection(int index, TaxMasterRecord item) =>
      taxcollection.insert(index, item);
  void updateTaxcollectionAtIndex(
          int index, Function(TaxMasterRecord) updateFn) =>
      taxcollection[index] = updateFn(taxcollection[index]);

  bool stockcheck = true;

  String prdid = '0';

  ProductStructStruct? prditemrecipe;
  void updatePrditemrecipeStruct(Function(ProductStructStruct) updateFn) {
    updateFn(prditemrecipe ??= ProductStructStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getProductlistHive] action in xyzBillingCopy widget.
  List<ProductStructStruct>? hiveProductList;
  // Stores action output result for [Custom Action - getCategorylistHive] action in xyzBillingCopy widget.
  List<CategoryStructStruct>? categoryListHive;
  // Stores action output result for [Custom Action - scanPrinter] action in xyzBillingCopy widget.
  bool? resDevice2Copy;
  // Stores action output result for [Custom Action - connectDevice] action in xyzBillingCopy widget.
  bool? isConnected;
  // Model for MenuDrawer component.
  late MenuDrawerModel menuDrawerModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ProductRecord>? allprdrefresh;
  // Stores action output result for [Custom Action - addFirebasetoHiveProduct] action in Button widget.
  int? prdlist;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CategoryRecord>? listcategory;
  // Stores action output result for [Custom Action - addFirebasetoHiveCategory] action in Button widget.
  int? cat;
  // Stores action output result for [Custom Action - getProductlistHive] action in Button widget.
  List<ProductStructStruct>? prdhive2refresh;
  // Stores action output result for [Custom Action - getCategorylistHive] action in Button widget.
  List<CategoryStructStruct>? catlistrefresh;
  // State field(s) for ListView widget.
  ScrollController? listViewController1;
  // Stores action output result for [Custom Action - calSubTotalForHoldList] action in Container widget.
  double? res11;
  // State field(s) for ListView widget.
  ScrollController? listViewController2;
  // Stores action output result for [Custom Action - getProductlistHive] action in Container widget.
  List<ProductStructStruct>? prdhive;
  // State field(s) for ListView widget.
  ScrollController? listViewController3;
  // State field(s) for ListViewprd widget.
  ScrollController? listViewprd;
  // Stores action output result for [Custom Action - removeHoldListItem] action in Icon widget.
  List<dynamic>? res20;
  // Stores action output result for [Custom Action - calSubTotalForHoldList] action in Icon widget.
  double? res21;
  // Stores action output result for [Custom Action - calBillAmt] action in Icon widget.
  double? reuslt22;
  // Stores action output result for [Custom Action - setQuickPin] action in Button widget.
  String? one;
  // Stores action output result for [Custom Action - setQuickPin] action in Button widget.
  String? four;
  // Stores action output result for [Custom Action - setQuickPin] action in Button widget.
  String? seven;
  // Stores action output result for [Custom Action - setQuickPin] action in Button widget.
  String? two;
  // Stores action output result for [Custom Action - setQuickPin] action in Button widget.
  String? five;
  // Stores action output result for [Custom Action - setQuickPin] action in Button widget.
  String? eight;
  // Stores action output result for [Custom Action - setQuickPin] action in Button widget.
  String? zero;
  // Stores action output result for [Custom Action - setQuickPin] action in Button widget.
  String? three;
  // Stores action output result for [Custom Action - setQuickPin] action in Button widget.
  String? six;
  // Stores action output result for [Custom Action - setQuickPin] action in Button widget.
  String? nine;

  @override
  void initState(BuildContext context) {
    menuDrawerModel = createModel(context, () => MenuDrawerModel());
    listViewController1 = ScrollController();
    listViewController2 = ScrollController();
    listViewController3 = ScrollController();
    listViewprd = ScrollController();
  }

  @override
  void dispose() {
    menuDrawerModel.dispose();
    listViewController1?.dispose();
    listViewController2?.dispose();
    listViewController3?.dispose();
    listViewprd?.dispose();
  }
}
