import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/exit_confirm/exit_confirm_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/grocery_windows/add_product_grocery/add_product_grocery_widget.dart';
import '/grocery_windows/add_supplier/add_supplier_widget.dart';
import '/grocery_windows/payment_mode_grocery/payment_mode_grocery_widget.dart';
import '/grocery_windows/purchase/purchase_widget.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'purchase_order_widget.dart' show PurchaseOrderWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class PurchaseOrderModel extends FlutterFlowModel<PurchaseOrderWidget> {
  ///  Local state fields for this page.

  bool show = false;

  List<PaymentModeRecord> paymentMode = [];
  void addToPaymentMode(PaymentModeRecord item) => paymentMode.add(item);
  void removeFromPaymentMode(PaymentModeRecord item) =>
      paymentMode.remove(item);
  void removeAtIndexFromPaymentMode(int index) => paymentMode.removeAt(index);
  void insertAtIndexInPaymentMode(int index, PaymentModeRecord item) =>
      paymentMode.insert(index, item);
  void updatePaymentModeAtIndex(
          int index, Function(PaymentModeRecord) updateFn) =>
      paymentMode[index] = updateFn(paymentMode[index]);

  bool submenureport = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getProductlistHive] action in purchaseOrder widget.
  List<ProductStructStruct>? hiveProductList;
  // Stores action output result for [Custom Action - getCategorylistHive] action in purchaseOrder widget.
  List<CategoryStructStruct>? categoryListHive;
  // Stores action output result for [Custom Action - scanPrinter] action in purchaseOrder widget.
  bool? resDevice2Copy;
  // Stores action output result for [Custom Action - connectDevice] action in purchaseOrder widget.
  bool? isConnected;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for custname widget.
  FocusNode? custnameFocusNode;
  TextEditingController? custnameTextController;
  String? Function(BuildContext, String?)? custnameTextControllerValidator;
  // State field(s) for custmob widget.
  FocusNode? custmobFocusNode;
  TextEditingController? custmobTextController;
  String? Function(BuildContext, String?)? custmobTextControllerValidator;
  // Stores action output result for [Custom Action - removeHoldListItem] action in IconButton widget.
  List<dynamic>? res20;
  // Stores action output result for [Custom Action - calSubTotalForGrocery] action in IconButton widget.
  double? ret;
  // Stores action output result for [Custom Action - calBillAmtGrocery] action in IconButton widget.
  double? ads;
  // State field(s) for TextFieldsearch widget.
  FocusNode? textFieldsearchFocusNode;
  TextEditingController? textFieldsearchTextController;
  String? Function(BuildContext, String?)?
      textFieldsearchTextControllerValidator;
  List<PartyRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    custnameFocusNode?.dispose();
    custnameTextController?.dispose();

    custmobFocusNode?.dispose();
    custmobTextController?.dispose();

    textFieldsearchFocusNode?.dispose();
    textFieldsearchTextController?.dispose();
  }
}
