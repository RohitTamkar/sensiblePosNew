import '';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/menu_drawer/menu_drawer_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/grocery_windows/add_customer_grocery/add_customer_grocery_widget.dart';
import '/pages/billing_style/text_field_combo/text_field_combo_widget.dart';
import '/pages/billing_style/xyzproduct_cart/xyzproduct_cart_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'product_combo_billing_widget.dart' show ProductComboBillingWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class ProductComboBillingModel
    extends FlutterFlowModel<ProductComboBillingWidget> {
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

  RecipeItemListStruct? rescipeitems;
  void updateRescipeitemsStruct(Function(RecipeItemListStruct) updateFn) {
    updateFn(rescipeitems ??= RecipeItemListStruct());
  }

  List<String> liststring = ['DIGITAL', 'CASH'];
  void addToListstring(String item) => liststring.add(item);
  void removeFromListstring(String item) => liststring.remove(item);
  void removeAtIndexFromListstring(int index) => liststring.removeAt(index);
  void insertAtIndexInListstring(int index, String item) =>
      liststring.insert(index, item);
  void updateListstringAtIndex(int index, Function(String) updateFn) =>
      liststring[index] = updateFn(liststring[index]);

  List<InvoiceRecord> invoices = [];
  void addToInvoices(InvoiceRecord item) => invoices.add(item);
  void removeFromInvoices(InvoiceRecord item) => invoices.remove(item);
  void removeAtIndexFromInvoices(int index) => invoices.removeAt(index);
  void insertAtIndexInInvoices(int index, InvoiceRecord item) =>
      invoices.insert(index, item);
  void updateInvoicesAtIndex(int index, Function(InvoiceRecord) updateFn) =>
      invoices[index] = updateFn(invoices[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getProductlistHive] action in productComboBilling widget.
  List<ProductStructStruct>? hiveProductList;
  // Stores action output result for [Firestore Query - Query a collection] action in productComboBilling widget.
  List<InvoiceRecord>? invoiceslist20;
  // Stores action output result for [Custom Action - scanPrinter] action in productComboBilling widget.
  bool? resDevice2Copy;
  // Stores action output result for [Custom Action - connectDevice] action in productComboBilling widget.
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
  // State field(s) for ListView widget.
  ScrollController? listViewController2;
  // Stores action output result for [Firestore Query - Query a collection] action in ProductName widget.
  RecipeRecord? receipeproductlist;
  // Stores action output result for [Custom Action - comboAddToHoldListprd] action in ProductName widget.
  List<dynamic>? resreplist;
  // Stores action output result for [Custom Action - laundrycalSubTotalForHoldList] action in ProductName widget.
  double? calculateResultresc;
  // Stores action output result for [Custom Action - calBillAmt] action in ProductName widget.
  double? calbillAmt334;
  // Stores action output result for [Custom Action - laundryAddToHoldListprd] action in ProductName widget.
  List<dynamic>? addtosavebill22;
  // Stores action output result for [Custom Action - laundrycalSubTotalForHoldList] action in ProductName widget.
  double? calculateResult233;
  // Stores action output result for [Custom Action - calBillAmt] action in ProductName widget.
  double? calbillAmt3;
  // Stores action output result for [Firestore Query - Query a collection] action in ProductName widget.
  RecipeRecord? receipeproductliststock;
  // Stores action output result for [Custom Action - comboAddToHoldListprd] action in ProductName widget.
  List<dynamic>? resrepliststock;
  // Stores action output result for [Custom Action - laundrycalSubTotalForHoldList] action in ProductName widget.
  double? calculateResultstock2;
  // Stores action output result for [Custom Action - calBillAmt] action in ProductName widget.
  double? calbillAmt3stock;
  // Stores action output result for [Custom Action - laundryAddToHoldListprd] action in ProductName widget.
  List<dynamic>? addtosavebillstock;
  // Stores action output result for [Custom Action - laundrycalSubTotalForHoldList] action in ProductName widget.
  double? calculateResultstock;
  // Stores action output result for [Custom Action - calBillAmt] action in ProductName widget.
  double? calbillAmtstock;
  // Stores action output result for [Firestore Query - Query a collection] action in ProductName widget.
  RecipeRecord? receipeproductliststock2;
  // Stores action output result for [Custom Action - comboAddToHoldListprd] action in ProductName widget.
  List<dynamic>? resrepliststock2;
  // Stores action output result for [Custom Action - laundrycalSubTotalForHoldList] action in ProductName widget.
  double? calculateResultstock22;
  // Stores action output result for [Custom Action - calBillAmt] action in ProductName widget.
  double? calbillAmt3stock2;
  // Stores action output result for [Custom Action - laundryAddToHoldListprd] action in ProductName widget.
  List<dynamic>? addtosavebillstock2;
  // Stores action output result for [Custom Action - laundrycalSubTotalForHoldList] action in ProductName widget.
  double? calculateResultstock222;
  // Stores action output result for [Custom Action - calBillAmt] action in ProductName widget.
  double? calbillAmtstock22;
  // Stores action output result for [Firestore Query - Query a collection] action in ProductName widget.
  RecipeRecord? receipeproductliststock33;
  // Stores action output result for [Custom Action - comboAddToHoldListprd] action in ProductName widget.
  List<dynamic>? resrepliststock3;
  // Stores action output result for [Custom Action - laundrycalSubTotalForHoldList] action in ProductName widget.
  double? calculateResultstock33;
  // Stores action output result for [Custom Action - calBillAmt] action in ProductName widget.
  double? calbillAmt3stock33;
  // Stores action output result for [Custom Action - laundryAddToHoldListprd] action in ProductName widget.
  List<dynamic>? addtosavebillstock3;
  // Stores action output result for [Custom Action - laundrycalSubTotalForHoldList] action in ProductName widget.
  double? calculateResultstock3;
  // Stores action output result for [Custom Action - calBillAmt] action in ProductName widget.
  double? calbillAmtstock3;
  // State field(s) for ListViewprd widget.
  ScrollController? listViewprd;
  // Stores action output result for [Custom Action - removeHoldListItem] action in IconButton widget.
  List<dynamic>? res20;
  // Stores action output result for [Custom Action - calSubTotalForHoldList] action in IconButton widget.
  double? res21;
  // Stores action output result for [Custom Action - calBillAmt] action in IconButton widget.
  double? reuslt22;
  // State field(s) for ListView widget.
  ScrollController? listViewController3;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  OutletRecord? outletdid2Copy;
  // Stores action output result for [Custom Action - scanPrinter] action in Button widget.
  bool? resDevice2billCopy;
  // Stores action output result for [Custom Action - connectDevice] action in Button widget.
  bool? isconnectedbillCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  InvoiceRecord? invoicecusrt;
  // Stores action output result for [Custom Action - docToJson] action in Button widget.
  dynamic? resultItembillCopy;
  // Stores action output result for [Custom Action - newCustomAction] action in Button widget.
  List<dynamic>? device233Copy;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<InvoiceRecord>? invoiceslist;
  // Stores action output result for [Custom Action - filterProducts2] action in Button widget.
  List<SelItemListStruct>? prdlinstnewtx;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  OutletRecord? outlecdoc;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? interprd;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  InvoiceRecord? invonlineprt;
  // Stores action output result for [Custom Action - addInvoiceBillhive] action in Button widget.
  InvoiceStructStruct? hiveInvoiceData;
  // Stores action output result for [Custom Action - calShiftSummaryNew] action in Button widget.
  dynamic? shiftSummarResultsNew;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ShiftRecord? shiftondataprint;
  // Stores action output result for [Custom Action - hiveShiftCrud] action in Button widget.
  ShiftDetailsStruct? updatedShiftDetails;
  // Stores action output result for [Custom Action - scanPrinter] action in Button widget.
  bool? resDevice2;
  // Stores action output result for [Custom Action - connectDevice] action in Button widget.
  bool? isconnected;
  // Stores action output result for [Custom Action - selectBillPrint] action in Button widget.
  List<dynamic>? returnedList2;
  // Stores action output result for [Custom Action - newCustomAction] action in Button widget.
  List<dynamic>? device;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ServicePointOutletRecord>? spoutlet;
  // Stores action output result for [Custom Action - filterProducts2] action in Button widget.
  List<SelItemListStruct>? prdlinstnewtx2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  OutletRecord? outlecdoccust;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? interprdcust;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  InvoiceRecord? invonlineprtcust;
  // Stores action output result for [Custom Action - addInvoiceBillhive] action in Button widget.
  InvoiceStructStruct? hiveInvoiceDatacust;
  // Stores action output result for [Custom Action - calShiftSummaryNew] action in Button widget.
  dynamic? shiftSummarResultscust;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ShiftRecord? shiftondataprintcust;
  // Stores action output result for [Custom Action - hiveShiftCrud] action in Button widget.
  ShiftDetailsStruct? updatedShiftDetailscust;
  // Stores action output result for [Custom Action - scanPrinter] action in Button widget.
  bool? resDevice2cust;
  // Stores action output result for [Custom Action - connectDevice] action in Button widget.
  bool? isconnectedcust;
  // Stores action output result for [Custom Action - selectBillPrint] action in Button widget.
  List<dynamic>? returnedList2cust;
  // Stores action output result for [Custom Action - newCustomAction] action in Button widget.
  List<dynamic>? devicecust;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ServicePointOutletRecord>? spoutletcust;
  // Stores action output result for [Custom Action - filterProducts2] action in Button widget.
  List<SelItemListStruct>? prdlistsavebill;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? internetcon;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  InvoiceRecord? invonline;
  // Stores action output result for [Custom Action - addInvoiceBillhive] action in Button widget.
  InvoiceStructStruct? hiveInvoiceDataCopyCopy;
  // Stores action output result for [Custom Action - calShiftSummaryNew] action in Button widget.
  dynamic? shiftSummarResultsNew2;
  // Stores action output result for [Custom Action - shiftIdtoInt] action in Button widget.
  int? shiftidhive2;
  // Stores action output result for [Custom Action - hiveShiftCrud] action in Button widget.
  ShiftDetailsStruct? getOfflineShiftdetails;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ShiftRecord? shiftondata;
  // Stores action output result for [Custom Action - hiveShiftCrud] action in Button widget.
  ShiftDetailsStruct? updatedShift23;
  // State field(s) for TextFieldsearch widget.
  FocusNode? textFieldsearchFocusNode;
  TextEditingController? textFieldsearchTextController;
  String? Function(BuildContext, String?)?
      textFieldsearchTextControllerValidator;
  List<PartyRecord> simpleSearchResults = [];
  // State field(s) for CustListView widget.
  ScrollController? custListView;
  // State field(s) for SearchListView widget.
  ScrollController? searchListView;

  @override
  void initState(BuildContext context) {
    menuDrawerModel = createModel(context, () => MenuDrawerModel());
    listViewController1 = ScrollController();
    listViewController2 = ScrollController();
    listViewprd = ScrollController();
    listViewController3 = ScrollController();
    custListView = ScrollController();
    searchListView = ScrollController();
  }

  @override
  void dispose() {
    menuDrawerModel.dispose();
    listViewController1?.dispose();
    listViewController2?.dispose();
    listViewprd?.dispose();
    listViewController3?.dispose();
    textFieldsearchFocusNode?.dispose();
    textFieldsearchTextController?.dispose();

    custListView?.dispose();
    searchListView?.dispose();
  }
}
