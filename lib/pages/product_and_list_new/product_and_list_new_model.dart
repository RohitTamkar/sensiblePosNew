import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/discount_and_delivery_copy/discount_and_delivery_copy_widget.dart';
import '/components/menu_drawer/menu_drawer_widget.dart';
import '/components/mix_payment_mode/mix_payment_mode_widget.dart';
import '/components/qty_edit_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/kiosk/dine_inparcelkds/dine_inparcelkds_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'product_and_list_new_widget.dart' show ProductAndListNewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class ProductAndListNewModel extends FlutterFlowModel<ProductAndListNewWidget> {
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

  bool flag = true;

  bool qtyCheck = false;

  ///  State fields for stateful widgets in this page.

  final shortcutsFocusNode = FocusNode();
  // Stores action output result for [Custom Action - getProductlistHive] action in ProductAndListNew widget.
  List<ProductStructStruct>? hiveProductList;
  // Stores action output result for [Custom Action - getCategorylistHive] action in ProductAndListNew widget.
  List<CategoryStructStruct>? categoryListHive;
  // Stores action output result for [Custom Action - scanPrinter] action in ProductAndListNew widget.
  bool? resDevice2Copy;
  // Stores action output result for [Custom Action - connectDevice] action in ProductAndListNew widget.
  bool? isConnected;
  // Stores action output result for [Custom Action - filterProducts2] action in ProductAndListNew widget.
  List<SelItemListStruct>? prdlinstnewtxCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in ProductAndListNew widget.
  AppSettingsRecord? appsetting;
  // Stores action output result for [Custom Action - oldbalanceplusamt] action in ProductAndListNew widget.
  int? totalcreditCopy;
  // Stores action output result for [Custom Action - checkInternetConnection] action in ProductAndListNew widget.
  bool? interprdCopy;
  // Stores action output result for [Backend Call - Create Document] action in ProductAndListNew widget.
  InvoiceRecord? invonlineprtCopy;
  // Stores action output result for [Custom Action - addInvoiceBillhive] action in ProductAndListNew widget.
  InvoiceStructStruct? hiveInvoiceDataCopy;
  // Stores action output result for [Custom Action - calShiftSummaryNew] action in ProductAndListNew widget.
  dynamic? shiftSummarResultsNewCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in ProductAndListNew widget.
  ShiftRecord? shiftondataprintCopy;
  // Stores action output result for [Custom Action - hiveShiftCrud] action in ProductAndListNew widget.
  ShiftDetailsStruct? updatedShiftDetailsCopy;
  // Stores action output result for [Custom Action - scanPrinter] action in ProductAndListNew widget.
  bool? resDevice2Copy2;
  // Stores action output result for [Custom Action - connectDevice] action in ProductAndListNew widget.
  bool? isconnectedCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in ProductAndListNew widget.
  OutletRecord? outletdocenter;
  // Stores action output result for [Custom Action - selectBillPrint] action in ProductAndListNew widget.
  List<dynamic>? returnedList2Copy;
  // Stores action output result for [Custom Action - newCustomAction] action in ProductAndListNew widget.
  List<dynamic>? deviceCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in ProductAndListNew widget.
  List<ServicePointOutletRecord>? spoutletCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in ProductAndListNew widget.
  ProductRecord? stockupdateprdprtCopy;
  // Stores action output result for [Custom Action - hivegetproductbyId] action in ProductAndListNew widget.
  ProductStructStruct? itemprd2Copy;
  // Stores action output result for [Custom Action - hiveProductCrud] action in ProductAndListNew widget.
  ProductStructStruct? productupdated2Copy;
  // Stores action output result for [Custom Action - getProductlistHive] action in ProductAndListNew widget.
  List<ProductStructStruct>? newupdatedproductlist22Copy;
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
  // Stores action output result for [Custom Action - getProductlistHive] action in Container widget.
  List<ProductStructStruct>? prdhiveall;
  // State field(s) for ListView widget.
  ScrollController? listViewController2;
  // Stores action output result for [Custom Action - getProductlistHive] action in Container widget.
  List<ProductStructStruct>? prdhive;
  // State field(s) for GridView widget.
  ScrollController? gridViewController;
  // Stores action output result for [Custom Action - addToHoldListprdbarcode] action in ProductName widget.
  List<dynamic>? qtyunitresult;
  // Stores action output result for [Custom Action - calSubTotalForHoldListkiosk] action in ProductName widget.
  double? calculateResult23;
  // Stores action output result for [Custom Action - calBillAmt] action in ProductName widget.
  double? calbillAmt3;
  // Stores action output result for [Custom Action - addToHoldListprdbarcode] action in productimage widget.
  List<dynamic>? jsonlistnew2;
  // Stores action output result for [Custom Action - calSubTotalForHoldListkiosk] action in productimage widget.
  double? calculateResult23Copy;
  // Stores action output result for [Custom Action - calBillAmt] action in productimage widget.
  double? calbillAmt3img;
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
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Custom Action - paymentmodemix] action in DropDown widget.
  bool? returntrue;
  // Stores action output result for [Custom Action - filterProducts2] action in Button widget.
  List<SelItemListStruct>? prdlistsavebillupi;
  // Stores action output result for [Custom Action - oldbalanceplusamt] action in Button widget.
  int? totalcredit2upi;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? internetconCopy;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  InvoiceRecord? invonlineCopy;
  // Stores action output result for [Custom Action - calShiftSummary] action in Button widget.
  dynamic? shiftSummarResultsNew2Copy;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ShiftRecord? shiftondataCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ProductRecord? stockupdateprdCopy;
  // Stores action output result for [Custom Action - hivegetproductbyId] action in Button widget.
  ProductStructStruct? itemprdCopy;
  // Stores action output result for [Custom Action - hiveProductCrud] action in Button widget.
  ProductStructStruct? productupdatedCopy;
  // Stores action output result for [Custom Action - getProductlistHive] action in Button widget.
  List<ProductStructStruct>? newupdatedproductlist2Copy;
  // Stores action output result for [Custom Action - filterProducts2] action in Button widget.
  List<SelItemListStruct>? prdlistsavebill;
  // Stores action output result for [Custom Action - oldbalanceplusamt] action in Button widget.
  int? totalcredit2;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? internetcon;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  InvoiceRecord? invonline;
  // Stores action output result for [Custom Action - calShiftSummary] action in Button widget.
  dynamic? shiftSummarResultsNew2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ShiftRecord? shiftondata;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ProductRecord? stockupdateprd;
  // Stores action output result for [Custom Action - hivegetproductbyId] action in Button widget.
  ProductStructStruct? itemprd;
  // Stores action output result for [Custom Action - hiveProductCrud] action in Button widget.
  ProductStructStruct? productupdated;
  // Stores action output result for [Custom Action - getProductlistHive] action in Button widget.
  List<ProductStructStruct>? newupdatedproductlist2;
  // Stores action output result for [Custom Action - filterProducts2] action in Button widget.
  List<SelItemListStruct>? prdlinstnewtx;
  // Stores action output result for [Custom Action - oldbalanceplusamt] action in Button widget.
  int? totalcredit;
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
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ProductRecord? stockupdateprdprt;
  // Stores action output result for [Custom Action - hivegetproductbyId] action in Button widget.
  ProductStructStruct? itemprd2;
  // Stores action output result for [Custom Action - hiveProductCrud] action in Button widget.
  ProductStructStruct? productupdated2;
  // Stores action output result for [Custom Action - getProductlistHive] action in Button widget.
  List<ProductStructStruct>? newupdatedproductlist22;
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
    shortcutsFocusNode.requestFocus();
    menuDrawerModel = createModel(context, () => MenuDrawerModel());
    listViewController1 = ScrollController();
    listViewController2 = ScrollController();
    gridViewController = ScrollController();
    listViewprd = ScrollController();
    custListView = ScrollController();
    searchListView = ScrollController();
  }

  @override
  void dispose() {
    menuDrawerModel.dispose();
    listViewController1?.dispose();
    listViewController2?.dispose();
    gridViewController?.dispose();
    listViewprd?.dispose();
    textFieldsearchFocusNode?.dispose();
    textFieldsearchTextController?.dispose();

    custListView?.dispose();
    searchListView?.dispose();
  }
}
