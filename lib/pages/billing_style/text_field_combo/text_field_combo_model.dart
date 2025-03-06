import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'text_field_combo_widget.dart' show TextFieldComboWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TextFieldComboModel extends FlutterFlowModel<TextFieldComboWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - comboAddToHoldListprd] action in TextField widget.
  List<dynamic>? resreplist23textstock1;
  // Stores action output result for [Custom Action - laundrycalSubTotalForHoldList] action in TextField widget.
  double? resrepliststock1;
  // Stores action output result for [Custom Action - calBillAmt] action in TextField widget.
  double? calbillAmt33stock1;
  // Stores action output result for [Custom Action - comboAddToHoldListprd] action in TextField widget.
  List<dynamic>? resreplist23textstock2;
  // Stores action output result for [Custom Action - laundrycalSubTotalForHoldList] action in TextField widget.
  double? resrepliststock2;
  // Stores action output result for [Custom Action - calBillAmt] action in TextField widget.
  double? calbillAmt33stock2;
  // Stores action output result for [Custom Action - comboAddToHoldListprd] action in TextField widget.
  List<dynamic>? resreplist23textstock6;
  // Stores action output result for [Custom Action - laundrycalSubTotalForHoldList] action in TextField widget.
  double? resrepliststock16;
  // Stores action output result for [Custom Action - calBillAmt] action in TextField widget.
  double? calbillAmt33stock6;
  // Stores action output result for [Custom Action - comboAddToHoldListprd] action in TextField widget.
  List<dynamic>? resreplist23textstock7;
  // Stores action output result for [Custom Action - laundrycalSubTotalForHoldList] action in TextField widget.
  double? resrepliststock7;
  // Stores action output result for [Custom Action - calBillAmt] action in TextField widget.
  double? calbillAmt33stock7;
  // Stores action output result for [Custom Action - comboAddToHoldListprd] action in TextField widget.
  List<dynamic>? resreplist23textstock13;
  // Stores action output result for [Custom Action - laundrycalSubTotalForHoldList] action in TextField widget.
  double? resrepliststock14;
  // Stores action output result for [Custom Action - calBillAmt] action in TextField widget.
  double? calbillAmt33stock3556;
  // Stores action output result for [Custom Action - comboAddToHoldListprd] action in TextField widget.
  List<dynamic>? resreplist23textstock8;
  // Stores action output result for [Custom Action - laundrycalSubTotalForHoldList] action in TextField widget.
  double? resrepliststock8;
  // Stores action output result for [Custom Action - calBillAmt] action in TextField widget.
  double? calbillAmt33stock8;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
