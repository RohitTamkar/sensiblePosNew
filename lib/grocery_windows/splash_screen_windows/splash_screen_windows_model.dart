import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'splash_screen_windows_widget.dart' show SplashScreenWindowsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SplashScreenWindowsModel
    extends FlutterFlowModel<SplashScreenWindowsWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkInternetConnection] action in SplashScreenWindows widget.
  bool? internet;
  // Stores action output result for [Custom Action - getPlatformDetails] action in SplashScreenWindows widget.
  dynamic? docRes;
  // Stores action output result for [Custom Action - checkPlatform] action in SplashScreenWindows widget.
  String? platform;
  // Stores action output result for [Firestore Query - Query a collection] action in SplashScreenWindows widget.
  DeviceRecord? deiviceexistnew;
  // Stores action output result for [Backend Call - Create Document] action in SplashScreenWindows widget.
  DeviceRecord? refnew;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
