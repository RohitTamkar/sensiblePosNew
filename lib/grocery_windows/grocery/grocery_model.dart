import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'grocery_widget.dart' show GroceryWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GroceryModel extends FlutterFlowModel<GroceryWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - addToHoldListGrCalculationqty] action in IconButton widget.
  List<dynamic>? allbillistplusCopy;
  // Stores action output result for [Custom Action - calSubTotalForGrocery] action in IconButton widget.
  double? output1Copy;
  // Stores action output result for [Custom Action - calBillAmtGrocery] action in IconButton widget.
  double? reuslt121Copy;
  // State field(s) for TextFieldqt widget.
  FocusNode? textFieldqtFocusNode;
  TextEditingController? textFieldqtTextController;
  String? Function(BuildContext, String?)? textFieldqtTextControllerValidator;
  // Stores action output result for [Custom Action - addToHoldListGrCalculationqty] action in TextFieldqt widget.
  List<dynamic>? allbillist;
  // Stores action output result for [Custom Action - calSubTotalForGrocery] action in TextFieldqt widget.
  double? output;
  // Stores action output result for [Custom Action - calBillAmtGrocery] action in TextFieldqt widget.
  double? reuslt12;
  // Stores action output result for [Custom Action - addToHoldListGrCalculationqty] action in TextFieldqt widget.
  List<dynamic>? allbillistCopy;
  // Stores action output result for [Custom Action - calSubTotalForGrocery] action in TextFieldqt widget.
  double? outputCopy;
  // Stores action output result for [Custom Action - calBillAmtGrocery] action in TextFieldqt widget.
  double? reuslt12Copy;
  // Stores action output result for [Custom Action - addToHoldListGrCalculationqty] action in IconButton widget.
  List<dynamic>? all;
  // Stores action output result for [Custom Action - calSubTotalForGrocery] action in IconButton widget.
  double? output1;
  // Stores action output result for [Custom Action - calBillAmtGrocery] action in IconButton widget.
  double? reuslt121;
  // State field(s) for TextFieldrate widget.
  FocusNode? textFieldrateFocusNode;
  TextEditingController? textFieldrateTextController;
  String? Function(BuildContext, String?)? textFieldrateTextControllerValidator;
  // Stores action output result for [Custom Action - ratePriceChangedFunctiongrocery] action in TextFieldrate widget.
  List<dynamic>? ratechanged;
  // Stores action output result for [Custom Action - calSubTotalForGrocery] action in TextFieldrate widget.
  double? outputr2;
  // Stores action output result for [Custom Action - calBillAmtGrocery] action in TextFieldrate widget.
  double? reuslt122;
  // Stores action output result for [Custom Action - ratePriceChangedFunctiongrocery] action in TextFieldrate widget.
  List<dynamic>? ratechangedCopy;
  // Stores action output result for [Custom Action - calSubTotalForGrocery] action in TextFieldrate widget.
  double? outputr2Copy;
  // Stores action output result for [Custom Action - calBillAmtGrocery] action in TextFieldrate widget.
  double? reuslt122Copy;
  // State field(s) for TextFielddisPer widget.
  FocusNode? textFielddisPerFocusNode;
  TextEditingController? textFielddisPerTextController;
  String? Function(BuildContext, String?)?
      textFielddisPerTextControllerValidator;
  // Stores action output result for [Custom Action - addToHoldListGrCalculationdisPer] action in TextFielddisPer widget.
  List<dynamic>? itemlist;
  // Stores action output result for [Custom Action - calSubTotalForGrocery] action in TextFielddisPer widget.
  double? outputdisper;
  // Stores action output result for [Custom Action - calBillAmtGrocery] action in TextFielddisPer widget.
  double? reuslt12ss;
  // Stores action output result for [Custom Action - addToHoldListGrCalculationdisPer] action in TextFielddisPer widget.
  List<dynamic>? itemlistCopy;
  // Stores action output result for [Custom Action - calSubTotalForGrocery] action in TextFielddisPer widget.
  double? outputdisperCopy;
  // Stores action output result for [Custom Action - calBillAmtGrocery] action in TextFielddisPer widget.
  double? reuslt12ssCopy;
  // State field(s) for TextFielddisAmt widget.
  FocusNode? textFielddisAmtFocusNode;
  TextEditingController? textFielddisAmtTextController;
  String? Function(BuildContext, String?)?
      textFielddisAmtTextControllerValidator;
  // Stores action output result for [Custom Action - disAmtChangedFunctiongrocery] action in TextFielddisAmt widget.
  List<dynamic>? allbillistdiscper;
  // Stores action output result for [Custom Action - calSubTotalForGrocery] action in TextFielddisAmt widget.
  double? output5;
  // Stores action output result for [Custom Action - calBillAmtGrocery] action in TextFielddisAmt widget.
  double? reuslt1245;
  // Stores action output result for [Custom Action - disAmtChangedFunctiongrocery] action in TextFielddisAmt widget.
  List<dynamic>? allbillistdiscperCopy;
  // Stores action output result for [Custom Action - calSubTotalForGrocery] action in TextFielddisAmt widget.
  double? output5Copy;
  // Stores action output result for [Custom Action - calBillAmtGrocery] action in TextFielddisAmt widget.
  double? reuslt1245Copy;
  // State field(s) for TextFieldtaxPer widget.
  FocusNode? textFieldtaxPerFocusNode;
  TextEditingController? textFieldtaxPerTextController;
  String? Function(BuildContext, String?)?
      textFieldtaxPerTextControllerValidator;
  // Stores action output result for [Custom Action - taxPerChangedFunctiongrocery] action in TextFieldtaxPer widget.
  List<dynamic>? taxperchenged;
  // Stores action output result for [Custom Action - calSubTotalForGrocery] action in TextFieldtaxPer widget.
  double? output2;
  // Stores action output result for [Custom Action - calBillAmtGrocery] action in TextFieldtaxPer widget.
  double? reuslt12m;
  // Stores action output result for [Custom Action - taxPerChangedFunctiongrocery] action in TextFieldtaxPer widget.
  List<dynamic>? taxperchengedCopy;
  // Stores action output result for [Custom Action - calSubTotalForGrocery] action in TextFieldtaxPer widget.
  double? output2Copy;
  // Stores action output result for [Custom Action - calBillAmtGrocery] action in TextFieldtaxPer widget.
  double? reuslt12mCopy;
  // State field(s) for TextFieldTaxAmt widget.
  FocusNode? textFieldTaxAmtFocusNode;
  TextEditingController? textFieldTaxAmtTextController;
  String? Function(BuildContext, String?)?
      textFieldTaxAmtTextControllerValidator;
  // Stores action output result for [Custom Action - taxAmtChangedFunctiongrocery] action in TextFieldTaxAmt widget.
  List<dynamic>? taxamtchanged;
  // Stores action output result for [Custom Action - calSubTotalForGrocery] action in TextFieldTaxAmt widget.
  double? output3;
  // Stores action output result for [Custom Action - calBillAmtGrocery] action in TextFieldTaxAmt widget.
  double? reuslt12g;
  // Stores action output result for [Custom Action - taxAmtChangedFunctiongrocery] action in TextFieldTaxAmt widget.
  List<dynamic>? taxamtchangedCopy;
  // Stores action output result for [Custom Action - calSubTotalForGrocery] action in TextFieldTaxAmt widget.
  double? output3Copy;
  // Stores action output result for [Custom Action - calBillAmtGrocery] action in TextFieldTaxAmt widget.
  double? reuslt12gCopy;

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
