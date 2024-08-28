import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'parking_check_i_n_widget.dart' show ParkingCheckINWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ParkingCheckINModel extends FlutterFlowModel<ParkingCheckINWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDownvechicle widget.
  String? dropDownvechicleValue;
  FormFieldController<String>? dropDownvechicleValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDownvechicle widget.
  ProductRecord? prd;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for Advance_amt widget.
  FocusNode? advanceAmtFocusNode;
  TextEditingController? advanceAmtTextController;
  String? Function(BuildContext, String?)? advanceAmtTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  InvoiceRecord? countdatagetPRINT;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  InvoiceRecord? docInvoicecars;
  // Stores action output result for [Custom Action - calShiftSummary] action in Button widget.
  dynamic? shiftSummarRkiosk;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ShiftRecord? shiftref;
  // Stores action output result for [Custom Action - scanPrinter] action in Button widget.
  bool? resDevice2;
  // Stores action output result for [Custom Action - selectBillPrint] action in Button widget.
  List<dynamic>? returnedList2kiosk;
  // Stores action output result for [Custom Action - newCustomAction] action in Button widget.
  List<dynamic>? device;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  OutletRecord? outletdoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  InvoiceRecord? countdataget;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  InvoiceRecord? docInvoicecars2;
  // Stores action output result for [Custom Action - calShiftSummary] action in Button widget.
  dynamic? shiftSummarRkiosk2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ShiftRecord? shiftref2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    advanceAmtFocusNode?.dispose();
    advanceAmtTextController?.dispose();
  }
}
