import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'table_v_iew_mobile_widget.dart' show TableVIewMobileWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TableVIewMobileModel extends FlutterFlowModel<TableVIewMobileWidget> {
  ///  Local state fields for this component.

  bool flag = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.
  Map<dynamic, bool> checkboxValueMap = {};
  List<dynamic> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  TableKotRecord? tablekot;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
