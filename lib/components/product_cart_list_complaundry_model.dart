import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'product_cart_list_complaundry_widget.dart'
    show ProductCartListComplaundryWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductCartListComplaundryModel
    extends FlutterFlowModel<ProductCartListComplaundryWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Custom Action - laundryaddToHoldListprdplus] action in TextField widget.
  List<dynamic>? resultplusCopy2Copy;
  // Stores action output result for [Custom Action - laundrycalSubTotalForHoldList] action in TextField widget.
  double? resultofSubCalCopy;
  // Stores action output result for [Custom Action - calBillAmt] action in TextField widget.
  double? reuslt12CopyCopy;
  // Stores action output result for [Custom Action - addToHoldListprdminus] action in Minus widget.
  List<dynamic>? resultminus;
  // Stores action output result for [Custom Action - calSubTotalForHoldListminus] action in Minus widget.
  double? resultmi;
  // Stores action output result for [Custom Action - calBillAmt] action in Minus widget.
  double? reu34;
  // State field(s) for productQty widget.
  FocusNode? productQtyFocusNode;
  TextEditingController? productQtyTextController;
  String? Function(BuildContext, String?)? productQtyTextControllerValidator;
  // Stores action output result for [Custom Action - laudryAddCustomQty] action in productQty widget.
  List<dynamic>? custqty;
  // Stores action output result for [Custom Action - laundrycalSubTotalForHoldList] action in productQty widget.
  double? calSubtotal;
  // Stores action output result for [Custom Action - calBillAmt] action in productQty widget.
  double? reuslt12CopyCopyCopy;
  // Stores action output result for [Custom Action - addToHoldListprdplus] action in Plus widget.
  List<dynamic>? resultplus;
  // Stores action output result for [Custom Action - calSubTotalForHoldList] action in Plus widget.
  double? res13;
  // Stores action output result for [Custom Action - calBillAmt] action in Plus widget.
  double? reuslt12;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    productQtyFocusNode?.dispose();
    productQtyTextController?.dispose();
  }
}
