import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'grocery_widget.dart' show GroceryWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GroceryModel extends FlutterFlowModel<GroceryWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextFieldqt widget.
  FocusNode? textFieldqtFocusNode;
  TextEditingController? textFieldqtTextController;
  String? Function(BuildContext, String?)? textFieldqtTextControllerValidator;
  // Stores action output result for [Custom Action - addToHoldListGrCalculation] action in TextFieldqt widget.
  List<dynamic>? allbillist;
  // Stores action output result for [Custom Action - calSubTotalForGrocery] action in TextFieldqt widget.
  double? output;
  // Stores action output result for [Custom Action - calBillAmt] action in TextFieldqt widget.
  double? reuslt12;
  // State field(s) for TextFieldrate widget.
  FocusNode? textFieldrateFocusNode;
  TextEditingController? textFieldrateTextController;
  String? Function(BuildContext, String?)? textFieldrateTextControllerValidator;
  // Stores action output result for [Custom Action - ratePriceChangedFunctiongrocery] action in TextFieldrate widget.
  List<dynamic>? ratechanged;
  // Stores action output result for [Custom Action - calSubTotalForGrocery] action in TextFieldrate widget.
  double? outputr2;
  // Stores action output result for [Custom Action - calBillAmt] action in TextFieldrate widget.
  double? reuslt12Copy;
  // State field(s) for TextFielddisPer widget.
  FocusNode? textFielddisPerFocusNode;
  TextEditingController? textFielddisPerTextController;
  String? Function(BuildContext, String?)?
      textFielddisPerTextControllerValidator;
  // Stores action output result for [Custom Action - addToHoldListGrCalculationdisPer] action in TextFielddisPer widget.
  List<dynamic>? itemlist;
  // Stores action output result for [Custom Action - calSubTotalForGrocery] action in TextFielddisPer widget.
  double? outputdisper;
  // Stores action output result for [Custom Action - calBillAmt] action in TextFielddisPer widget.
  double? reuslt12Copy2;
  // State field(s) for TextFielddisAmt widget.
  FocusNode? textFielddisAmtFocusNode;
  TextEditingController? textFielddisAmtTextController;
  String? Function(BuildContext, String?)?
      textFielddisAmtTextControllerValidator;
  // Stores action output result for [Custom Action - disAmtChangedFunctiongrocery] action in TextFielddisAmt widget.
  List<dynamic>? allbillistdiscper;
  // Stores action output result for [Custom Action - calSubTotalForGrocery] action in TextFielddisAmt widget.
  double? output5;
  // Stores action output result for [Custom Action - calBillAmt] action in TextFielddisAmt widget.
  double? reuslt12Copy2Copy;
  // State field(s) for TextFieldtaxPer widget.
  FocusNode? textFieldtaxPerFocusNode;
  TextEditingController? textFieldtaxPerTextController;
  String? Function(BuildContext, String?)?
      textFieldtaxPerTextControllerValidator;
  // Stores action output result for [Custom Action - taxPerChangedFunctiongrocery] action in TextFieldtaxPer widget.
  List<dynamic>? taxperchenged;
  // Stores action output result for [Custom Action - calSubTotalForGrocery] action in TextFieldtaxPer widget.
  double? output2;
  // Stores action output result for [Custom Action - calBillAmt] action in TextFieldtaxPer widget.
  double? reuslt12Copy2Copy2;
  // State field(s) for TextFieldTaxAmt widget.
  FocusNode? textFieldTaxAmtFocusNode;
  TextEditingController? textFieldTaxAmtTextController;
  String? Function(BuildContext, String?)?
      textFieldTaxAmtTextControllerValidator;
  // Stores action output result for [Custom Action - taxAmtChangedFunctiongrocery] action in TextFieldTaxAmt widget.
  List<dynamic>? taxamtchanged;
  // Stores action output result for [Custom Action - calSubTotalForGrocery] action in TextFieldTaxAmt widget.
  double? output3;
  // Stores action output result for [Custom Action - calBillAmt] action in TextFieldTaxAmt widget.
  double? reuslt12Copy2Copy2Copy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldqtFocusNode?.dispose();
    textFieldqtTextController?.dispose();

    textFieldrateFocusNode?.dispose();
    textFieldrateTextController?.dispose();

    textFielddisPerFocusNode?.dispose();
    textFielddisPerTextController?.dispose();

    textFielddisAmtFocusNode?.dispose();
    textFielddisAmtTextController?.dispose();

    textFieldtaxPerFocusNode?.dispose();
    textFieldtaxPerTextController?.dispose();

    textFieldTaxAmtFocusNode?.dispose();
    textFieldTaxAmtTextController?.dispose();
  }
}
