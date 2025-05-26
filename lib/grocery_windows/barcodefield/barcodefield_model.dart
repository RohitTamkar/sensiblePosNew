import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'barcodefield_widget.dart' show BarcodefieldWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BarcodefieldModel extends FlutterFlowModel<BarcodefieldWidget> {
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
  List<dynamic>? allbillistChange;
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
  // State field(s) for TextFieldunit widget.
  FocusNode? textFieldunitFocusNode;
  TextEditingController? textFieldunitTextController;
  String? Function(BuildContext, String?)? textFieldunitTextControllerValidator;
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
  // State field(s) for TextFieldmrprate widget.
  FocusNode? textFieldmrprateFocusNode;
  TextEditingController? textFieldmrprateTextController;
  String? Function(BuildContext, String?)?
      textFieldmrprateTextControllerValidator;
  // Stores action output result for [Custom Action - ratePriceChangedFunctiongrocery] action in TextFieldmrprate widget.
  List<dynamic>? ratechanged2;
  // Stores action output result for [Custom Action - calSubTotalForGrocery] action in TextFieldmrprate widget.
  double? outputr22;
  // Stores action output result for [Custom Action - calBillAmtGrocery] action in TextFieldmrprate widget.
  double? reuslt1222;
  // Stores action output result for [Custom Action - ratePriceChangedFunctiongrocery] action in TextFieldmrprate widget.
  List<dynamic>? ratechanged2Copy;
  // Stores action output result for [Custom Action - calSubTotalForGrocery] action in TextFieldmrprate widget.
  double? outputr22Copy;
  // Stores action output result for [Custom Action - calBillAmtGrocery] action in TextFieldmrprate widget.
  double? reuslt1222Copy;
  // State field(s) for TextFieldmfgdate widget.
  FocusNode? textFieldmfgdateFocusNode;
  TextEditingController? textFieldmfgdateTextController;
  String? Function(BuildContext, String?)?
      textFieldmfgdateTextControllerValidator;
  // Stores action output result for [Custom Action - addToHoldListGrmfgdate] action in TextFieldmfgdate widget.
  List<dynamic>? list;
  // Stores action output result for [Custom Action - addToHoldListGrmfgdate] action in TextFieldmfgdate widget.
  List<dynamic>? listCopy;
  DateTime? datePicked1;
  // Stores action output result for [Custom Action - addToHoldListGrmfgdate] action in Icon widget.
  List<dynamic>? listCopyCopy;
  // State field(s) for TextFieldexpdate widget.
  FocusNode? textFieldexpdateFocusNode;
  TextEditingController? textFieldexpdateTextController;
  String? Function(BuildContext, String?)?
      textFieldexpdateTextControllerValidator;
  DateTime? datePicked2;
  // State field(s) for TextFieldbarchNo widget.
  FocusNode? textFieldbarchNoFocusNode;
  TextEditingController? textFieldbarchNoTextController;
  String? Function(BuildContext, String?)?
      textFieldbarchNoTextControllerValidator;
  // State field(s) for TextFieldnetWt widget.
  FocusNode? textFieldnetWtFocusNode;
  TextEditingController? textFieldnetWtTextController;
  String? Function(BuildContext, String?)?
      textFieldnetWtTextControllerValidator;
  DateTime? datePicked3;
  // Stores action output result for [Custom Action - addToHoldListGrmfgdate] action in Icon widget.
  List<dynamic>? listicon2;
  DateTime? datePicked4;
  // Stores action output result for [Custom Action - addToHoldListGrmfgdate] action in Icon widget.
  List<dynamic>? listicon;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldqtFocusNode?.dispose();
    textFieldqtTextController?.dispose();

    textFieldunitFocusNode?.dispose();
    textFieldunitTextController?.dispose();

    textFieldrateFocusNode?.dispose();
    textFieldrateTextController?.dispose();

    textFieldmrprateFocusNode?.dispose();
    textFieldmrprateTextController?.dispose();

    textFieldmfgdateFocusNode?.dispose();
    textFieldmfgdateTextController?.dispose();

    textFieldexpdateFocusNode?.dispose();
    textFieldexpdateTextController?.dispose();

    textFieldbarchNoFocusNode?.dispose();
    textFieldbarchNoTextController?.dispose();

    textFieldnetWtFocusNode?.dispose();
    textFieldnetWtTextController?.dispose();
  }
}
