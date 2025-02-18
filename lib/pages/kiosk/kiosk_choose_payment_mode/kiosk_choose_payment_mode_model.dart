import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/kiosk/kiosk_header/kiosk_header_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'kiosk_choose_payment_mode_widget.dart'
    show KioskChoosePaymentModeWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class KioskChoosePaymentModeModel
    extends FlutterFlowModel<KioskChoosePaymentModeWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in KioskChoosePaymentMode widget.
  FooterRecord? footer;
  // Model for KioskHeader component.
  late KioskHeaderModel kioskHeaderModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  OutletRecord? outletDOc;
  // Stores action output result for [Backend Call - API (createQR)] action in Button widget.
  ApiCallResponse? paymentQrResponse;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  OutletRecord? outletDOccard;
  // Stores action output result for [Backend Call - API (cardSwipeSale)] action in Button widget.
  ApiCallResponse? cardPaymentApiResponse;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  OutletRecord? outletDOc2;
  // Stores action output result for [Backend Call - API (createQR)] action in Button widget.
  ApiCallResponse? paymentQrResponsecash;

  @override
  void initState(BuildContext context) {
    kioskHeaderModel = createModel(context, () => KioskHeaderModel());
  }

  @override
  void dispose() {
    kioskHeaderModel.dispose();
  }
}
