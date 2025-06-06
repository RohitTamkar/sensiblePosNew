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
import '/grocery_windows/grocery/grocery_widget.dart';
import '/grocery_windows/payment_mode_purches/payment_mode_purches_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'edit_purchase_order_widget.dart' show EditPurchaseOrderWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class EditPurchaseOrderModel extends FlutterFlowModel<EditPurchaseOrderWidget> {
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

  // Stores action output result for [Custom Action - getProductlistHive] action in EditPurchaseOrder widget.
  List<ProductStructStruct>? hiveProductList;
  // Stores action output result for [Custom Action - getCategorylistHive] action in EditPurchaseOrder widget.
  List<CategoryStructStruct>? categoryListHive;
  // Stores action output result for [Custom Action - scanPrinter] action in EditPurchaseOrder widget.
  bool? resDevice2Copy;
  // Stores action output result for [Custom Action - connectDevice] action in EditPurchaseOrder widget.
  bool? isConnected;
  // State field(s) for TextFieldsearch widget.
  FocusNode? textFieldsearchFocusNode;
  TextEditingController? textFieldsearchTextController;
  String? Function(BuildContext, String?)?
      textFieldsearchTextControllerValidator;
  List<PartyRecord> simpleSearchResults = [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldsearchFocusNode?.dispose();
    textFieldsearchTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();

    custnameFocusNode?.dispose();
    custnameTextController?.dispose();

    custmobFocusNode?.dispose();
    custmobTextController?.dispose();
  }
}
