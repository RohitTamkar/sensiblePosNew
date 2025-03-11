import '';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/selectlabel/selectlabel_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'payment_mode_purches_widget.dart' show PaymentModePurchesWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaymentModePurchesModel
    extends FlutterFlowModel<PaymentModePurchesWidget> {
  ///  Local state fields for this component.

  String? amount = '';

  List<PaymentModeRecord> paymentM = [];
  void addToPaymentM(PaymentModeRecord item) => paymentM.add(item);
  void removeFromPaymentM(PaymentModeRecord item) => paymentM.remove(item);
  void removeAtIndexFromPaymentM(int index) => paymentM.removeAt(index);
  void insertAtIndexInPaymentM(int index, PaymentModeRecord item) =>
      paymentM.insert(index, item);
  void updatePaymentMAtIndex(int index, Function(PaymentModeRecord) updateFn) =>
      paymentM[index] = updateFn(paymentM[index]);

  List<ProductListStockStruct> listodprd = [];
  void addToListodprd(ProductListStockStruct item) => listodprd.add(item);
  void removeFromListodprd(ProductListStockStruct item) =>
      listodprd.remove(item);
  void removeAtIndexFromListodprd(int index) => listodprd.removeAt(index);
  void insertAtIndexInListodprd(int index, ProductListStockStruct item) =>
      listodprd.insert(index, item);
  void updateListodprdAtIndex(
          int index, Function(ProductListStockStruct) updateFn) =>
      listodprd[index] = updateFn(listodprd[index]);

  ProductListStockStruct? prdstock;
  void updatePrdstockStruct(Function(ProductListStockStruct) updateFn) {
    updateFn(prdstock ??= ProductListStockStruct());
  }

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in PaymentModePurches widget.
  List<PurchaseRecord>? listOfOrdersAdmin;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Custom Action - calSubTotalForGrocery] action in Button widget.
  double? ret;
  // Stores action output result for [Custom Action - calBillAmtGroceryPay] action in Button widget.
  double? add;
  // Stores action output result for [Custom Action - calculateGroceryAmtaction] action in Button widget.
  dynamic? result233;
  // State field(s) for TextFielddisper widget.
  FocusNode? textFielddisperFocusNode;
  TextEditingController? textFielddisperTextController;
  String? Function(BuildContext, String?)?
      textFielddisperTextControllerValidator;
  // State field(s) for TextFielddisamt widget.
  FocusNode? textFielddisamtFocusNode;
  TextEditingController? textFielddisamtTextController;
  String? Function(BuildContext, String?)?
      textFielddisamtTextControllerValidator;
  // State field(s) for TextFieldgstper widget.
  FocusNode? textFieldgstperFocusNode;
  TextEditingController? textFieldgstperTextController;
  String? Function(BuildContext, String?)?
      textFieldgstperTextControllerValidator;
  // State field(s) for TextFieldextra widget.
  FocusNode? textFieldextraFocusNode;
  TextEditingController? textFieldextraTextController;
  String? Function(BuildContext, String?)?
      textFieldextraTextControllerValidator;
  // Stores action output result for [Custom Action - filterProductsPurches] action in Button widget.
  List<PurchaseSaleItemListStruct>? prdlinstnewtx;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  AppSettingsRecord? appsettingnew;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  OutletRecord? outletdoc;
  // Stores action output result for [Custom Action - oldbalanceplusamt] action in Button widget.
  int? totalcredit;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PaymentRecord? paymentDoc22d;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PurchaseRecord? purchaseordnew;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ProductRecord? stockupdateprdprt;
  // Stores action output result for [Custom Action - hivegetproductbyId2] action in Button widget.
  ProductStructStruct? itemprd2;
  // Stores action output result for [Custom Action - hiveProductCrud] action in Button widget.
  ProductStructStruct? productupdated2;
  // Stores action output result for [Custom Action - getProductlistHive] action in Button widget.
  List<ProductStructStruct>? newupdatedproductlist22;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  StockSummaryRecord? purchase;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  PartyRecord? partydetails;
  // Stores action output result for [Custom Action - generateInvoice] action in Button widget.
  String? returnurl2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    textFielddisperFocusNode?.dispose();
    textFielddisperTextController?.dispose();

    textFielddisamtFocusNode?.dispose();
    textFielddisamtTextController?.dispose();

    textFieldgstperFocusNode?.dispose();
    textFieldgstperTextController?.dispose();

    textFieldextraFocusNode?.dispose();
    textFieldextraTextController?.dispose();
  }
}
