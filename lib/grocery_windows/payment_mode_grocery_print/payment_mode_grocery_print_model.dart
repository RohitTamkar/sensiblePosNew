import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'payment_mode_grocery_print_widget.dart'
    show PaymentModeGroceryPrintWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaymentModeGroceryPrintModel
    extends FlutterFlowModel<PaymentModeGroceryPrintWidget> {
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

  bool flag = false;

  ///  State fields for stateful widgets in this component.

  final paymentModeGroceryPrintShortcutsFocusNode = FocusNode();
  // Stores action output result for [Custom Action - calculateGroceryAmtaction] action in PaymentModeGroceryPrint widget.
  dynamic? result233;
  // Stores action output result for [Custom Action - filterProducts2] action in PaymentModeGroceryPrint widget.
  List<SelItemListStruct>? prdlinstnewtxCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in PaymentModeGroceryPrint widget.
  AppSettingsRecord? appsettingnewCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in PaymentModeGroceryPrint widget.
  OutletRecord? outletdocCopy;
  // Stores action output result for [Custom Action - oldbalanceplusamt] action in PaymentModeGroceryPrint widget.
  int? totalcreditCopy;
  // Stores action output result for [Backend Call - Create Document] action in PaymentModeGroceryPrint widget.
  PaymentRecord? paymentDoc22dCopy;
  // Stores action output result for [Backend Call - Create Document] action in PaymentModeGroceryPrint widget.
  InvoiceRecord? invonlineprtCopy;
  // Stores action output result for [Custom Action - addInvoiceBillhive] action in PaymentModeGroceryPrint widget.
  InvoiceStructStruct? hiveInvoiceDataCopy;
  // Stores action output result for [Custom Action - calShiftSummaryNewgrocery] action in PaymentModeGroceryPrint widget.
  dynamic? shiftSummarResultsNewCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in PaymentModeGroceryPrint widget.
  ShiftRecord? shiftondataprintCopy;
  // Stores action output result for [Custom Action - hiveShiftCrud] action in PaymentModeGroceryPrint widget.
  ShiftDetailsStruct? updatedShiftDetailsCopy;
  // Stores action output result for [Custom Action - scanPrinter] action in PaymentModeGroceryPrint widget.
  bool? resDevice2Copy;
  // Stores action output result for [Custom Action - connectDevice] action in PaymentModeGroceryPrint widget.
  bool? isconnectedCopy;
  // Stores action output result for [Custom Action - selectBillPrint] action in PaymentModeGroceryPrint widget.
  List<dynamic>? returnedList2Copy;
  // Stores action output result for [Custom Action - newCustomAction] action in PaymentModeGroceryPrint widget.
  List<dynamic>? deviceCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in PaymentModeGroceryPrint widget.
  ProductRecord? stockupdateprdprtCopy;
  // Stores action output result for [Custom Action - hivegetproductbyId] action in PaymentModeGroceryPrint widget.
  ProductStructStruct? itemprd2Copy;
  // Stores action output result for [Custom Action - hiveProductCrud] action in PaymentModeGroceryPrint widget.
  ProductStructStruct? productupdated2Copy;
  // Stores action output result for [Custom Action - getProductlistHive] action in PaymentModeGroceryPrint widget.
  List<ProductStructStruct>? newupdatedproductlist22Copy;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Custom Action - calSubTotalForGrocery] action in Button widget.
  double? ret;
  // Stores action output result for [Custom Action - calBillAmtGroceryPay] action in Button widget.
  double? add;
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
  // Stores action output result for [Custom Action - calculateGroceryAmtaction] action in Button widget.
  dynamic? resultsave;
  // Stores action output result for [Custom Action - filterProducts2] action in Button widget.
  List<SelItemListStruct>? prdlistsavebill;
  // Stores action output result for [Custom Action - oldbalanceplusamt] action in Button widget.
  int? totalcredit2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PaymentRecord? paymentDoc2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  InvoiceRecord? invonline;
  // Stores action output result for [Custom Action - addInvoiceBillhive] action in Button widget.
  InvoiceStructStruct? hiveInvoiceDataCopyCopy;
  // Stores action output result for [Custom Action - calShiftSummaryNewgroceryPrint] action in Button widget.
  dynamic? shiftSummarResultsNew2;
  // Stores action output result for [Custom Action - shiftIdtoInt] action in Button widget.
  int? shiftidhive2;
  // Stores action output result for [Custom Action - hiveShiftCrud] action in Button widget.
  ShiftDetailsStruct? getOfflineShiftdetails;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ShiftRecord? shiftondata;
  // Stores action output result for [Custom Action - hiveShiftCrud] action in Button widget.
  ShiftDetailsStruct? updatedShift;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ProductRecord? stockupdateprdsave;
  // Stores action output result for [Custom Action - hivegetproductbyId] action in Button widget.
  ProductStructStruct? itemprd;
  // Stores action output result for [Custom Action - hiveProductCrud] action in Button widget.
  ProductStructStruct? productupdated;
  // Stores action output result for [Custom Action - getProductlistHive] action in Button widget.
  List<ProductStructStruct>? newupdatedproductlist2;
  // Stores action output result for [Custom Action - calculateGroceryAmtaction] action in Button widget.
  dynamic? resultprint;
  // Stores action output result for [Custom Action - filterProducts2] action in Button widget.
  List<SelItemListStruct>? prdlinstnewtx;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  AppSettingsRecord? appsettingnew;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  OutletRecord? outletdoc;
  // Stores action output result for [Custom Action - oldbalanceplusamt] action in Button widget.
  int? totalcredit;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PaymentRecord? paymentDoc22d;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  InvoiceRecord? invonlineprt;
  // Stores action output result for [Custom Action - addInvoiceBillhive] action in Button widget.
  InvoiceStructStruct? hiveInvoiceData;
  // Stores action output result for [Custom Action - calShiftSummaryNewgrocery] action in Button widget.
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
  ProductRecord? stockupdateprdprt;
  // Stores action output result for [Custom Action - hivegetproductbyId] action in Button widget.
  ProductStructStruct? itemprd2;
  // Stores action output result for [Custom Action - hiveProductCrud] action in Button widget.
  ProductStructStruct? productupdated2;
  // Stores action output result for [Custom Action - getProductlistHive] action in Button widget.
  List<ProductStructStruct>? newupdatedproductlist22;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    paymentModeGroceryPrintShortcutsFocusNode.dispose();
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
