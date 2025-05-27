import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'today_stock_out_windows_widget.dart' show TodayStockOutWindowsWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TodayStockOutWindowsModel
    extends FlutterFlowModel<TodayStockOutWindowsWidget> {
  ///  Local state fields for this page.

  bool show = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkInternetConnection] action in TodayStockOutWindows widget.
  bool? netConn1;
  // Stores action output result for [Custom Action - todaysStockSummarReport] action in TodayStockOutWindows widget.
  List<dynamic>? saleReport2;
  DateTime? datePicked;
  // Stores action output result for [Custom Action - todaysStockSummarReport] action in Button widget.
  List<dynamic>? saleReportdate;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
