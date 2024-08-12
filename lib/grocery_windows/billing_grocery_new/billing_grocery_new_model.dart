import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/grocery_windows/grocery/grocery_widget.dart';
import '/grocery_windows/grocery_header/grocery_header_widget.dart';
import '/grocery_windows/spplier_gro/spplier_gro_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'billing_grocery_new_widget.dart' show BillingGroceryNewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BillingGroceryNewModel extends FlutterFlowModel<BillingGroceryNewWidget> {
  ///  Local state fields for this page.

  bool show = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getProductlistHive] action in BillingGroceryNew widget.
  List<ProductStructStruct>? hiveProductList;
  // Stores action output result for [Custom Action - getCategorylistHive] action in BillingGroceryNew widget.
  List<CategoryStructStruct>? categoryListHive;
  // Stores action output result for [Custom Action - scanPrinter] action in BillingGroceryNew widget.
  bool? resDevice2Copy;
  // Stores action output result for [Custom Action - connectDevice] action in BillingGroceryNew widget.
  bool? isConnected;
  // Model for GroceryHeader component.
  late GroceryHeaderModel groceryHeaderModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for custmob widget.
  FocusNode? custmobFocusNode;
  TextEditingController? custmobTextController;
  String? Function(BuildContext, String?)? custmobTextControllerValidator;
  // State field(s) for custAddress widget.
  FocusNode? custAddressFocusNode;
  TextEditingController? custAddressTextController;
  String? Function(BuildContext, String?)? custAddressTextControllerValidator;
  // State field(s) for custEancode widget.
  FocusNode? custEancodeFocusNode;
  TextEditingController? custEancodeTextController;
  String? Function(BuildContext, String?)? custEancodeTextControllerValidator;
  // Stores action output result for [Custom Action - removeHoldListItem] action in IconButton widget.
  List<dynamic>? res20;
  // Stores action output result for [Custom Action - calSubTotalForGrocery] action in IconButton widget.
  double? ret;
  // Stores action output result for [Custom Action - calBillAmtGrocery] action in IconButton widget.
  double? ads;
  // Stores action output result for [Custom Action - filterProducts2] action in Button widget.
  List<SelItemListStruct>? prdlinstnewtx;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  AppSettingsRecord? appsettingnew;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  OutletRecord? outletdoc;
  // Stores action output result for [Custom Action - oldbalanceplusamt] action in Button widget.
  int? totalcredit;
  // Stores action output result for [Custom Action - addInvoiceBillhive] action in Button widget.
  InvoiceStructStruct? hiveInvoiceData;
  // Stores action output result for [Custom Action - calShiftSummaryNew] action in Button widget.
  dynamic? shiftSummarResultsNew;
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

  @override
  void initState(BuildContext context) {
    groceryHeaderModel = createModel(context, () => GroceryHeaderModel());
  }

  @override
  void dispose() {
    groceryHeaderModel.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    custmobFocusNode?.dispose();
    custmobTextController?.dispose();

    custAddressFocusNode?.dispose();
    custAddressTextController?.dispose();

    custEancodeFocusNode?.dispose();
    custEancodeTextController?.dispose();
  }
}
