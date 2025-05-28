import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'qty_edit_widget.dart' show QtyEditWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QtyEditModel extends FlutterFlowModel<QtyEditWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextFieldqty2 widget.
  FocusNode? textFieldqty2FocusNode;
  TextEditingController? textFieldqty2TextController;
  String? Function(BuildContext, String?)? textFieldqty2TextControllerValidator;
  // Stores action output result for [Custom Action - editCustomQty] action in TextFieldqty2 widget.
  List<dynamic>? resultqty;
  // Stores action output result for [Custom Action - calBillAmt] action in TextFieldqty2 widget.
  double? reuslt1223;
  // Stores action output result for [Custom Action - editCustomQty] action in TextFieldqty2 widget.
  List<dynamic>? resultqtyCopy;
  // Stores action output result for [Custom Action - calBillAmt] action in TextFieldqty2 widget.
  double? reuslt1223Copy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldqty2FocusNode?.dispose();
    textFieldqty2TextController?.dispose();
  }
}
