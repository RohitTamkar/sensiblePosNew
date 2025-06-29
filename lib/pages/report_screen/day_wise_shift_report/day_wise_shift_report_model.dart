import '/backend/backend.dart';
import '/components/custom_date/custom_date_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'day_wise_shift_report_widget.dart' show DayWiseShiftReportWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DayWiseShiftReportModel
    extends FlutterFlowModel<DayWiseShiftReportWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - scanPrinter] action in IconButton widget.
  bool? resDevice;
  // Stores action output result for [Custom Action - scanPrinter] action in IconButton widget.
  bool? rd;
  // Stores action output result for [Custom Action - scanPrinter] action in FloatingActionButton widget.
  bool? resDevice1;
  // Stores action output result for [Custom Action - scanPrinter] action in FloatingActionButton widget.
  bool? rd1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
