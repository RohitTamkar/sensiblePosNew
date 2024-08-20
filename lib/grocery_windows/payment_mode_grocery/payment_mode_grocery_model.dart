import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'payment_mode_grocery_widget.dart' show PaymentModeGroceryWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaymentModeGroceryModel
    extends FlutterFlowModel<PaymentModeGroceryWidget> {
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

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - calculateGroceryAmtaction] action in Button widget.
  dynamic? result233;
  // Stores action output result for [Custom Action - filterProducts2] action in Button widget.
  List<SelItemListStruct>? prdlistsavebill;
  // Stores action output result for [Custom Action - oldbalanceplusamt] action in Button widget.
  int? totalcredit2;
  // Stores action output result for [Custom Action - addInvoiceBillhive] action in Button widget.
  InvoiceStructStruct? hiveInvoiceDataCopyCopy;
  // Stores action output result for [Custom Action - calShiftSummaryNewgrocery] action in Button widget.
  dynamic? shiftSummarResultsNew2;
  // Stores action output result for [Custom Action - shiftIdtoInt] action in Button widget.
  int? shiftidhive2;
  // Stores action output result for [Custom Action - hiveShiftCrud] action in Button widget.
  ShiftDetailsStruct? getOfflineShiftdetails;
  // Stores action output result for [Custom Action - hiveShiftCrud] action in Button widget.
  ShiftDetailsStruct? updatedShift;
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
  // Stores action output result for [Custom Action - calShiftSummaryNewgrocery] action in Button widget.
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
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
