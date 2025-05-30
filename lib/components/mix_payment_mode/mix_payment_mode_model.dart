import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'mix_payment_mode_widget.dart' show MixPaymentModeWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MixPaymentModeModel extends FlutterFlowModel<MixPaymentModeWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for paymode1 widget.
  FocusNode? paymode1FocusNode;
  TextEditingController? paymode1TextController;
  String? Function(BuildContext, String?)? paymode1TextControllerValidator;
  // State field(s) for paymode2 widget.
  FocusNode? paymode2FocusNode;
  TextEditingController? paymode2TextController;
  String? Function(BuildContext, String?)? paymode2TextControllerValidator;
  // Stores action output result for [Custom Action - calculateMixpaymentamt] action in Button widget.
  dynamic? listjson23;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    paymode1FocusNode?.dispose();
    paymode1TextController?.dispose();

    paymode2FocusNode?.dispose();
    paymode2TextController?.dispose();
  }
}
