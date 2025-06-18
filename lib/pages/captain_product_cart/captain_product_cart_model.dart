import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/menu_drawer/menu_drawer_widget.dart';
import '/components/qty_edit_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'captain_product_cart_widget.dart' show CaptainProductCartWidget;
import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CaptainProductCartModel
    extends FlutterFlowModel<CaptainProductCartWidget> {
  ///  Local state fields for this page.

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

  bool stockcheck = true;

  String? prdid;

  bool flag = true;

  bool qtyCheck = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getProductlistHive] action in CaptainProductCart widget.
  List<ProductStructStruct>? hiveProductList;
  // Stores action output result for [Custom Action - getCategorylistHive] action in CaptainProductCart widget.
  List<CategoryStructStruct>? categoryListHive;
  // Stores action output result for [Firestore Query - Query a collection] action in CaptainProductCart widget.
  List<PremisesRecord>? premiseDoc;
  // Stores action output result for [Custom Action - scanPrinter] action in CaptainProductCart widget.
  bool? resDevice2Copy;
  // Stores action output result for [Custom Action - connectDevice] action in CaptainProductCart widget.
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
  List<ProductStructStruct>? hiveProductList25;
  // Stores action output result for [Custom Action - getCategorylistHive] action in Button widget.
  List<CategoryStructStruct>? categoryListHive25;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<PremisesRecord>? premiseDocCopy;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Custom Action - filterProductsKot] action in Button widget.
  List<SelItemListStruct>? prdlistsavebillkot;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? internetconkot;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TableKotRecord? kotCopy;
  // Stores action output result for [Custom Action - filterProductsKot] action in Button widget.
  List<SelItemListStruct>? prdlistsavebillupi;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? internetconCopy;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TableKotRecord? kot;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  TableKotRecord? tablekot;
  // Stores action output result for [Custom Action - selectBillPrint] action in Button widget.
  List<dynamic>? returnedListkot;
  // Stores action output result for [Custom Action - newCustomAction] action in Button widget.
  List<dynamic>? devicekot;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ServicePointOutletRecord>? spoutletkot;
  // Stores action output result for [Custom Action - filterProductsKot] action in Button widget.
  List<SelItemListStruct>? prdlistsavebillkotupdate;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // Stores action output result for [Custom Action - getProductlistHive] action in Container widget.
  List<ProductStructStruct>? prdhiveall;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // Stores action output result for [Custom Action - getProductlistHive] action in Container widget.
  List<ProductStructStruct>? prdhive;
  // State field(s) for GridView widget.
  ScrollController? gridViewController;
  // Stores action output result for [Custom Action - addToHoldListprdtable] action in ProductName widget.
  List<dynamic>? qtyunitresult;
  // Stores action output result for [Custom Action - calSubTotalForHoldListkiosk] action in ProductName widget.
  double? calculateResult23;
  // Stores action output result for [Custom Action - calBillAmt] action in ProductName widget.
  double? calbillAmt3;
  // Stores action output result for [Custom Action - addToHoldListprdtable] action in productimage widget.
  List<dynamic>? qtyunitresult23;
  // Stores action output result for [Custom Action - calSubTotalForHoldListkiosk] action in productimage widget.
  double? calculateResult23Copy;
  // Stores action output result for [Custom Action - calBillAmt] action in productimage widget.
  double? calbillAmt3img;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for ListViewprd widget.
  ScrollController? listViewprd;
  // Stores action output result for [Custom Action - addToHoldListprdminus] action in Minus widget.
  List<dynamic>? resultminus;
  // Stores action output result for [Custom Action - calBillAmt] action in Minus widget.
  double? reu34;
  // Stores action output result for [Custom Action - addToHoldListprdplus] action in Plus widget.
  List<dynamic>? resultplus;
  // Stores action output result for [Custom Action - calBillAmt] action in Plus widget.
  double? reuslt12;
  // Stores action output result for [Custom Action - removeHoldListItem] action in Icon widget.
  List<dynamic>? res20;
  // Stores action output result for [Custom Action - calSubTotalForHoldListkiosk] action in Icon widget.
  double? ddddd;
  // Stores action output result for [Custom Action - calBillAmt] action in Icon widget.
  double? reuslt22;

  @override
  void initState(BuildContext context) {
    menuDrawerModel = createModel(context, () => MenuDrawerModel());
    columnController = ScrollController();
    listViewController = ScrollController();
    gridViewController = ScrollController();
    listViewprd = ScrollController();
  }

  @override
  void dispose() {
    menuDrawerModel.dispose();
    columnController?.dispose();
    listViewController?.dispose();
    gridViewController?.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    listViewprd?.dispose();
  }
}
