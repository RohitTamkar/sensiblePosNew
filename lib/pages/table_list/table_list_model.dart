import '/backend/backend.dart';
import '/components/menu_drawer/menu_drawer_widget.dart';
import '/components/table_details/table_details_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'table_list_widget.dart' show TableListWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TableListModel extends FlutterFlowModel<TableListWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MenuDrawer component.
  late MenuDrawerModel menuDrawerModel;

  @override
  void initState(BuildContext context) {
    menuDrawerModel = createModel(context, () => MenuDrawerModel());
  }

  @override
  void dispose() {
    menuDrawerModel.dispose();
  }
}
