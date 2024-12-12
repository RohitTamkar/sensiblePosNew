import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/customer_details/customer_details_widget.dart';
import '/components/header/header_widget.dart';
import '/components/selection_option/selection_option_widget.dart';
import '/components/sendemail/sendemail_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'customer_ledgerreport_widget.dart' show CustomerLedgerreportWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomerLedgerreportModel
    extends FlutterFlowModel<CustomerLedgerreportWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  PartyRecord? party;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  UserProfileRecord? userdoc;
  // Stores action output result for [Custom Action - genrateExcelCustledgerReport] action in Icon widget.
  String? excelfile;
  // Stores action output result for [Backend Call - API (sendEmail)] action in Icon widget.
  ApiCallResponse? apiResult550;
  // Model for Header component.
  late HeaderModel headerModel;
  // Stores action output result for [Custom Action - scanPrinter] action in FloatingActionButton widget.
  bool? resDevice1;
  // Stores action output result for [Custom Action - scanPrinter] action in FloatingActionButton widget.
  bool? rd1;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
  }
}
