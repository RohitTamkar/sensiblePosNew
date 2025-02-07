import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/kiosk/dine_inparcel/dine_inparcel_widget.dart';
import '/pages/kiosk/kiosk_header/kiosk_header_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'kiosk_cartdineinparcel_widget.dart' show KioskCartdineinparcelWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class KioskCartdineinparcelModel
    extends FlutterFlowModel<KioskCartdineinparcelWidget> {
  ///  Local state fields for this page.

  bool btnPressed = false;

  ///  State fields for stateful widgets in this page.

  // Model for KioskHeader component.
  late KioskHeaderModel kioskHeaderModel;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Custom Action - calSubTotalForHoldListkiosk2] action in ChoiceChips widget.
  double? ddr4;
  // Stores action output result for [Custom Action - calBillAmt2] action in ChoiceChips widget.
  double? reusltddr;
  // Stores action output result for [Custom Action - calSubTotalForHoldListkiosk2] action in ChoiceChips widget.
  double? ddr45;
  // Stores action output result for [Custom Action - calBillAmt2] action in ChoiceChips widget.
  double? reusltddr67;
  // Stores action output result for [Custom Action - reduceQuantityHoldListkiosk] action in IconButton widget.
  List<dynamic>? res2cart;
  // Stores action output result for [Custom Action - calSubTotalForHoldListkiosk2] action in IconButton widget.
  double? res2345;
  // Stores action output result for [Custom Action - calBillAmt2] action in IconButton widget.
  double? reu34;
  // Stores action output result for [Custom Action - plusQuantityHoldListkiosk] action in IconButton widget.
  List<dynamic>? resultkioskcart;
  // Stores action output result for [Custom Action - calSubTotalForHoldListkiosk2] action in IconButton widget.
  double? res23456;
  // Stores action output result for [Custom Action - calBillAmt2] action in IconButton widget.
  double? reuslt123;
  // Stores action output result for [Custom Action - removeHoldListItem] action in IconButton widget.
  List<dynamic>? res20Copy;
  // Stores action output result for [Custom Action - calBillAmt2] action in IconButton widget.
  double? reuslt22Copy;
  // Stores action output result for [Custom Action - setCloseUnixTime] action in Button widget.
  DateTime? closeUnixTime;
  // Stores action output result for [Backend Call - API (razorpayQRCreation)] action in Button widget.
  ApiCallResponse? qrResp;
  // Stores action output result for [Custom Action - connectDevice] action in Button widget.
  bool? connectdeviceCOPY23;

  @override
  void initState(BuildContext context) {
    kioskHeaderModel = createModel(context, () => KioskHeaderModel());
  }

  @override
  void dispose() {
    kioskHeaderModel.dispose();
  }
}
