import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'opening_bal_new_widget.dart' show OpeningBalNewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OpeningBalNewModel extends FlutterFlowModel<OpeningBalNewWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<TaxMasterRecord>? taxcollection;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<PaymentModeRecord>? paymentmode;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  AppSettingsRecord? devicew;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ShiftRecord? shiftDoc1;
  // Stores action output result for [Custom Action - hiveShiftCrud] action in Button widget.
  ShiftDetailsStruct? createdshiftDetailshive;
  // Stores action output result for [Custom Action - hiveGetShiftDetails] action in Button widget.
  List<ShiftDetailsStruct>? shiftdetailshive;
  // Stores action output result for [Custom Action - shiftDetailNew] action in Button widget.
  dynamic? shiftDetailsNew2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
