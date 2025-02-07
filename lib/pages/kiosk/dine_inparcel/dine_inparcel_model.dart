import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dine_inparcel_widget.dart' show DineInparcelWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DineInparcelModel extends FlutterFlowModel<DineInparcelWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Custom Action - calSubTotalForHoldListkiosk2] action in ChoiceChips widget.
  double? ddr4Copy;
  // Stores action output result for [Custom Action - calBillAmt2] action in ChoiceChips widget.
  double? reusltddrCopy;
  // Stores action output result for [Custom Action - calSubTotalForHoldListkiosk2] action in ChoiceChips widget.
  double? ddr45Copy;
  // Stores action output result for [Custom Action - calBillAmt2] action in ChoiceChips widget.
  double? reusltddr67Copy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
