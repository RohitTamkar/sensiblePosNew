import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/opening_bal_new/opening_bal_new_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'loading_screen_new_widget.dart' show LoadingScreenNewWidget;
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class LoadingScreenNewModel extends FlutterFlowModel<LoadingScreenNewWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkInternetConnection] action in loadingScreenNew widget.
  bool? internetconnection;
  // Stores action output result for [Firestore Query - Query a collection] action in loadingScreenNew widget.
  List<ProductRecord>? productListCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in loadingScreenNew widget.
  List<CategoryRecord>? categoryList;
  // Stores action output result for [Custom Action - addFirebasetoHiveCategory] action in loadingScreenNew widget.
  int? index;
  // Stores action output result for [Custom Action - addFirebasetoHiveProduct] action in loadingScreenNew widget.
  int? pindex;
  // Stores action output result for [Firestore Query - Query a collection] action in loadingScreenNew widget.
  InvoiceRecord? invcode;
  // Stores action output result for [Firestore Query - Query a collection] action in loadingScreenNew widget.
  InvoiceRecord? invcodeneww2;
  // Stores action output result for [Firestore Query - Query a collection] action in loadingScreenNew widget.
  AppSettingsRecord? isAppSetExistsNew;
  // Stores action output result for [Firestore Query - Query a collection] action in loadingScreenNew widget.
  List<TaxMasterRecord>? taxcollection;
  // Stores action output result for [Firestore Query - Query a collection] action in loadingScreenNew widget.
  List<PaymentModeRecord>? paymentmode;
  // Stores action output result for [Firestore Query - Query a collection] action in loadingScreenNew widget.
  List<AppSettingsMasterRecord>? masterAppsetting;
  // Stores action output result for [Custom Action - returnAppsetting] action in loadingScreenNew widget.
  List<AppSettingsStruct>? returnAppsettiing2;
  // Stores action output result for [Custom Action - returnAppsetting] action in loadingScreenNew widget.
  List<AppSettingsStruct>? returnAppsettiing;
  // Stores action output result for [Backend Call - Create Document] action in loadingScreenNew widget.
  AppSettingsRecord? doc;
  // Stores action output result for [Firestore Query - Query a collection] action in loadingScreenNew widget.
  AppSettingsRecord? devicew;
  InstantTimer? instantTimer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
