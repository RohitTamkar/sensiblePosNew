import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'category_reportnew_widget.dart' show CategoryReportnewWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoryReportnewModel extends FlutterFlowModel<CategoryReportnewWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkInternetConnection] action in CategoryReportnew widget.
  bool? netConn;
  // Stores action output result for [Custom Action - productSaleReport] action in CategoryReportnew widget.
  List<dynamic>? saleReport;
  DateTime? datePicked;
  // Stores action output result for [Custom Action - productSaleReport] action in Button widget.
  List<dynamic>? saleReportcustom;
  // Model for Header component.
  late HeaderModel headerModel;
  // Stores action output result for [Custom Action - scanPrinter] action in FloatingActionButton widget.
  bool? resDevice;
  // Stores action output result for [Custom Action - scanPrinter] action in FloatingActionButton widget.
  bool? rd;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
  }
}
