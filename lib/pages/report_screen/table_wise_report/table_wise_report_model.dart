import '/backend/backend.dart';
import '/components/custom_date/custom_date_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'table_wise_report_widget.dart' show TableWiseReportWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TableWiseReportModel extends FlutterFlowModel<TableWiseReportWidget> {
  ///  Local state fields for this page.

  bool loader = false;

  List<dynamic> jsonlist = [];
  void addToJsonlist(dynamic item) => jsonlist.add(item);
  void removeFromJsonlist(dynamic item) => jsonlist.remove(item);
  void removeAtIndexFromJsonlist(int index) => jsonlist.removeAt(index);
  void insertAtIndexInJsonlist(int index, dynamic item) =>
      jsonlist.insert(index, item);
  void updateJsonlistAtIndex(int index, Function(dynamic) updateFn) =>
      jsonlist[index] = updateFn(jsonlist[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkInternetConnection] action in TableWiseReport widget.
  bool? internetCheck;
  // Stores action output result for [Firestore Query - Query a collection] action in TableWiseReport widget.
  List<InvoiceRecord>? invoice;
  // Stores action output result for [Custom Action - tableWiseReport] action in TableWiseReport widget.
  List<dynamic>? jsonlisttable;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  List<InvoiceRecord>? invoicecustom;
  // Stores action output result for [Custom Action - tableWiseReport] action in Row widget.
  List<dynamic>? jsonlisttablecustom;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
