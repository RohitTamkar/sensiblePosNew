import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/menu_drawer/menu_drawer_widget.dart';
import '/components/qty_edit_widget.dart';
import '/components/table_details/table_details_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'captain_product_cart_model.dart';
export 'captain_product_cart_model.dart';

class CaptainProductCartWidget extends StatefulWidget {
  const CaptainProductCartWidget({
    super.key,
    this.taxcollection,
    this.doc,
  });

  final List<TaxMasterRecord>? taxcollection;
  final DocumentReference? doc;

  static String routeName = 'CaptainProductCart';
  static String routePath = 'captainProductCart';

  @override
  State<CaptainProductCartWidget> createState() =>
      _CaptainProductCartWidgetState();
}

class _CaptainProductCartWidgetState extends State<CaptainProductCartWidget>
    with TickerProviderStateMixin {
  late CaptainProductCartModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasContainerTriggered1 = false;
  var hasContainerTriggered2 = false;
  var hasContainerTriggered3 = false;
  var hasContainerTriggered4 = false;
  var hasContainerTriggered5 = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CaptainProductCartModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().tableViewHideShow = true;
      safeSetState(() {});
      _model.hiveProductList = await actions.getProductlistHive();
      _model.categoryListHive = await actions.getCategorylistHive();
      _model.premiseDoc = await queryPremisesRecordOnce(
        parent: FFAppState().outletIdRef,
      );
      FFAppState().productHive =
          _model.hiveProductList!.toList().cast<ProductStructStruct>();
      if (!functions.checkmergedtables(FFAppState().table.toList())) {
        FFAppState().table = functions
            .generatePremiseTablesjson(_model.premiseDoc!.toList())
            .toList()
            .cast<dynamic>();
      }
      FFAppState().categoryHive =
          _model.categoryListHive!.toList().cast<CategoryStructStruct>();
      safeSetState(() {});
      if (!functions.isPrinterSelected(FFAppState().printerDevice)!) {
        _model.resDevice2Copy = await actions.scanPrinter(
          FFAppState().posMode,
        );
      }
      _model.isConnected = await actions.connectDevice(
        FFAppState().printerDevice,
        FFAppState().printerIndex,
      );
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: Offset(0.92, 0.92),
            end: Offset(1.0, 1.0),
          ),
          SaturateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: Offset(0.92, 0.92),
            end: Offset(1.0, 1.0),
          ),
          SaturateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 180.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 180.0.ms,
            begin: Offset(0.9, 0.9),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 180.0.ms,
            begin: Offset(0.9, 0.9),
            end: Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 180.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 180.0.ms,
            begin: Offset(0.9, 0.9),
            end: Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 180.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<AppSettingsRecord>>(
      stream: FFAppState().appsdetting(
        requestFn: () => queryAppSettingsRecord(
          parent: FFAppState().outletIdRef,
          queryBuilder: (appSettingsRecord) => appSettingsRecord.where(
            'deviceId',
            isEqualTo: FFAppState().dId,
          ),
          singleRecord: true,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitFadingCircle(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 40.0,
                ),
              ),
            ),
          );
        }
        List<AppSettingsRecord> captainProductCartAppSettingsRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final captainProductCartAppSettingsRecord =
            captainProductCartAppSettingsRecordList.isNotEmpty
                ? captainProductCartAppSettingsRecordList.first
                : null;

        return Title(
            title: 'CaptainProductCart',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                drawer: Container(
                  width: MediaQuery.sizeOf(context).width * 0.28,
                  child: Drawer(
                    elevation: 16.0,
                    child: wrapWithModel(
                      model: _model.menuDrawerModel,
                      updateCallback: () => safeSetState(() {}),
                      child: MenuDrawerWidget(
                        billdetails: null,
                        doc: widget!.doc,
                        shiftDetails: FFAppState().shiftDetailsJson,
                        tax: widget!.taxcollection,
                        appSettings23: captainProductCartAppSettingsRecord,
                      ),
                    ),
                  ),
                ),
                body: StreamBuilder<List<UnitTypeRecord>>(
                  stream: queryUnitTypeRecord(),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 40.0,
                          height: 40.0,
                          child: SpinKitFadingCircle(
                            color: FlutterFlowTheme.of(context).primary,
                            size: 40.0,
                          ),
                        ),
                      );
                    }
                    List<UnitTypeRecord> containerUnitTypeRecordList =
                        snapshot.data!;

                    return Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 0.1,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 15.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 5.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.goNamed(
                                                CaptainTableListWidget
                                                    .routeName,
                                                queryParameters: {
                                                  'taxcollection':
                                                      serializeParam(
                                                    widget!.taxcollection,
                                                    ParamType.Document,
                                                    isList: true,
                                                  ),
                                                  'doc': serializeParam(
                                                    widget!.doc,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'taxcollection':
                                                      widget!.taxcollection,
                                                },
                                              );
                                            },
                                            child: Icon(
                                              Icons.chevron_left,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              size: 24.0,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 3.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                FFAppState().outletName,
                                                'SENSIBLE',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBtnText,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallIsCustom,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 6.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                FFAppState().userName,
                                                'SK',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmallFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmallIsCustom,
                                                  ),
                                            ),
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              FFAppState().tableViewHideShow =
                                                  true;
                                              _model.allprdrefresh =
                                                  await queryProductRecordOnce(
                                                parent:
                                                    FFAppState().outletIdRef,
                                              );
                                              _model.prdlist = await actions
                                                  .addFirebasetoHiveProduct(
                                                _model.allprdrefresh!.toList(),
                                              );
                                              _model.listcategory =
                                                  await queryCategoryRecordOnce(
                                                parent:
                                                    FFAppState().outletIdRef,
                                              );
                                              _model.cat = await actions
                                                  .addFirebasetoHiveCategory(
                                                _model.listcategory!.toList(),
                                              );
                                              _model.hiveProductList25 =
                                                  await actions
                                                      .getProductlistHive();
                                              _model.categoryListHive25 =
                                                  await actions
                                                      .getCategorylistHive();
                                              FFAppState().productHive = _model
                                                  .hiveProductList25!
                                                  .toList()
                                                  .cast<ProductStructStruct>();
                                              _model.premiseDocCopy =
                                                  await queryPremisesRecordOnce(
                                                parent:
                                                    FFAppState().outletIdRef,
                                              );
                                              if (!functions.checkmergedtables(
                                                  FFAppState()
                                                      .table
                                                      .toList())) {
                                                FFAppState().table = functions
                                                    .generatePremiseTablesjson(
                                                        _model.premiseDoc!
                                                            .toList())
                                                    .toList()
                                                    .cast<dynamic>();
                                              }
                                              FFAppState().categoryHive = _model
                                                  .categoryListHive25!
                                                  .toList()
                                                  .cast<CategoryStructStruct>();
                                              FFAppState().update(() {});

                                              safeSetState(() {});
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'bz90fpo4' /*  */,
                                            ),
                                            icon: Icon(
                                              Icons.replay_sharp,
                                              size: 20.0,
                                            ),
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmallFamily,
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmallIsCustom,
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          if (FFAppState().kotDocRef != null)
                                            FFButtonWidget(
                                              onPressed: () async {
                                                _model.tkot =
                                                    await TableKotRecord
                                                        .getDocumentOnce(
                                                            FFAppState()
                                                                .kotDocRef!);
                                                if (_model.tkot != null) {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              TableDetailsWidget(
                                                            tablekot:
                                                                _model.tkot,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Table Is Empty !',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  );
                                                }

                                                safeSetState(() {});
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'mul5e0k4' /* Show Kot */,
                                              ),
                                              icon: Icon(
                                                Icons.restaurant_menu_sharp,
                                                size: 15.0,
                                              ),
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallIsCustom,
                                                    ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                        ].divide(SizedBox(width: 5.0)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 9,
                            child: StreamBuilder<List<PremisesRecord>>(
                              stream: FFAppState().premise(
                                requestFn: () => queryPremisesRecord(
                                  parent: FFAppState().outletIdRef,
                                ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 40.0,
                                      height: 40.0,
                                      child: SpinKitFadingCircle(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 40.0,
                                      ),
                                    ),
                                  );
                                }
                                List<PremisesRecord>
                                    containerPremisesRecordList =
                                    snapshot.data!;

                                return Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 10.0, 10.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.table_bar,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  size: 24.0,
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'trxrzvyy' /* Selected Table */,
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmall
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallIsCustom,
                                                          ),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent4,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  6.0,
                                                                  12.0,
                                                                  6.0),
                                                      child: Text(
                                                        FFAppState().tableNo,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmallIsCustom,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 10.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 10.0),
                                        child: Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.05,
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 15.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  flex: 8,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                1.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        if (animationsMap[
                                                                'containerOnActionTriggerAnimation1'] !=
                                                            null) {
                                                          safeSetState(() =>
                                                              hasContainerTriggered1 =
                                                                  true);
                                                          SchedulerBinding
                                                              .instance
                                                              .addPostFrameCallback((_) async =>
                                                                  await animationsMap[
                                                                          'containerOnActionTriggerAnimation1']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0));
                                                        }
                                                      },
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.15,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        ),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            var _shouldSetState =
                                                                false;
                                                            if (functions
                                                                    .filterBillList(
                                                                        FFAppState()
                                                                            .selBill,
                                                                        FFAppState()
                                                                            .allBillsList
                                                                            .toList())
                                                                    .length >
                                                                0) {
                                                              _model.prdlistsavebillkot =
                                                                  await actions
                                                                      .filterProductsKot(
                                                                FFAppState()
                                                                    .selBill,
                                                                FFAppState()
                                                                    .allBillsList
                                                                    .toList(),
                                                                true,
                                                              );
                                                              _shouldSetState =
                                                                  true;
                                                              _model.internetconkot =
                                                                  await actions
                                                                      .checkInternetConnection();
                                                              _shouldSetState =
                                                                  true;
                                                              if (_model
                                                                  .internetconkot!) {
                                                                if (FFAppState()
                                                                        .kotDocRef !=
                                                                    null) {
                                                                  await FFAppState()
                                                                      .kotDocRef!
                                                                      .update({
                                                                    ...createTableKotRecordData(
                                                                      finalBillAmt:
                                                                          FFAppState()
                                                                              .finalAmt,
                                                                      id: '',
                                                                    ),
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'productList':
                                                                            getSelItemListListFirestoreData(
                                                                          _model
                                                                              .prdlistsavebillkot,
                                                                        ),
                                                                      },
                                                                    ),
                                                                  });
                                                                } else {
                                                                  var tableKotRecordReference =
                                                                      TableKotRecord.createDoc(
                                                                          FFAppState()
                                                                              .outletIdRef!);
                                                                  await tableKotRecordReference
                                                                      .set({
                                                                    ...createTableKotRecordData(
                                                                      dayId: functions
                                                                          .getDayId(),
                                                                      createdDate:
                                                                          getCurrentTimestamp
                                                                              .millisecondsSinceEpoch,
                                                                      checkInTime:
                                                                          getCurrentTimestamp
                                                                              .millisecondsSinceEpoch,
                                                                      orderType:
                                                                          'TABLE_KOT',
                                                                      kotStatus:
                                                                          'PENDING',
                                                                      tableNo:
                                                                          FFAppState()
                                                                              .tableNo,
                                                                      premiseName:
                                                                          FFAppState()
                                                                              .selectedPremise,
                                                                      finalBillAmt:
                                                                          FFAppState()
                                                                              .finalAmt,
                                                                      billAmt:
                                                                          FFAppState()
                                                                              .billAmt,
                                                                    ),
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'productList':
                                                                            getSelItemListListFirestoreData(
                                                                          _model
                                                                              .prdlistsavebillkot,
                                                                        ),
                                                                      },
                                                                    ),
                                                                  });
                                                                  _model.kotCopy =
                                                                      TableKotRecord
                                                                          .getDocumentFromData({
                                                                    ...createTableKotRecordData(
                                                                      dayId: functions
                                                                          .getDayId(),
                                                                      createdDate:
                                                                          getCurrentTimestamp
                                                                              .millisecondsSinceEpoch,
                                                                      checkInTime:
                                                                          getCurrentTimestamp
                                                                              .millisecondsSinceEpoch,
                                                                      orderType:
                                                                          'TABLE_KOT',
                                                                      kotStatus:
                                                                          'PENDING',
                                                                      tableNo:
                                                                          FFAppState()
                                                                              .tableNo,
                                                                      premiseName:
                                                                          FFAppState()
                                                                              .selectedPremise,
                                                                      finalBillAmt:
                                                                          FFAppState()
                                                                              .finalAmt,
                                                                      billAmt:
                                                                          FFAppState()
                                                                              .billAmt,
                                                                    ),
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'productList':
                                                                            getSelItemListListFirestoreData(
                                                                          _model
                                                                              .prdlistsavebillkot,
                                                                        ),
                                                                      },
                                                                    ),
                                                                  }, tableKotRecordReference);
                                                                  _shouldSetState =
                                                                      true;

                                                                  await _model
                                                                      .kotCopy!
                                                                      .reference
                                                                      .update(
                                                                          createTableKotRecordData(
                                                                    id: _model
                                                                        .kotCopy
                                                                        ?.reference
                                                                        .id,
                                                                  ));
                                                                }
                                                              } else {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      content: Text(
                                                                          'Internet Not Available'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                                return;
                                                              }

                                                              await actions
                                                                  .removeFromAllBillList(
                                                                FFAppState()
                                                                    .selBill,
                                                              );
                                                              _model.prdid =
                                                                  null;
                                                              await actions
                                                                  .clearValue();
                                                              FFAppState()
                                                                  .noOfItems = 0;
                                                              FFAppState()
                                                                      .subTotal =
                                                                  0.0;
                                                              FFAppState()
                                                                      .delCharges =
                                                                  0.0;
                                                              FFAppState()
                                                                      .kotDocRef =
                                                                  null;
                                                              FFAppState()
                                                                  .prdid = '';
                                                              FFAppState()
                                                                      .finalAmt =
                                                                  0.0;
                                                              FFAppState()
                                                                      .billAmt =
                                                                  0.0;
                                                              FFAppState()
                                                                      .tableViewHideShow =
                                                                  true;
                                                              safeSetState(
                                                                  () {});

                                                              context.goNamed(
                                                                CaptainTableListWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'taxcollection':
                                                                      serializeParam(
                                                                    widget!
                                                                        .taxcollection,
                                                                    ParamType
                                                                        .Document,
                                                                    isList:
                                                                        true,
                                                                  ),
                                                                  'doc':
                                                                      serializeParam(
                                                                    widget!.doc,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  'taxcollection':
                                                                      widget!
                                                                          .taxcollection,
                                                                },
                                                              );

                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            } else {
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            }

                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                          },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'mah91h2w' /* Save Kot */,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height: 40.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: Colors
                                                                          .white,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .titleSmallIsCustom,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'containerOnActionTriggerAnimation1']!,
                                                        hasBeenTriggered:
                                                            hasContainerTriggered1),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 8,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                1.0, 0.0),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.15,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          var _shouldSetState =
                                                              false;
                                                          if (functions
                                                                  .filterBillList(
                                                                      FFAppState()
                                                                          .selBill,
                                                                      FFAppState()
                                                                          .allBillsList
                                                                          .toList())
                                                                  .length >
                                                              0) {
                                                            _model.prdlistsavebillupi =
                                                                await actions
                                                                    .filterProductsKot(
                                                              FFAppState()
                                                                  .selBill,
                                                              FFAppState()
                                                                  .allBillsList
                                                                  .toList(),
                                                              false,
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            _model.internetconCopy =
                                                                await actions
                                                                    .checkInternetConnection();
                                                            _shouldSetState =
                                                                true;
                                                            if (_model
                                                                .internetconCopy!) {
                                                              if (FFAppState()
                                                                      .kotDocRef !=
                                                                  null) {
                                                                await FFAppState()
                                                                    .kotDocRef!
                                                                    .update({
                                                                  ...createTableKotRecordData(
                                                                    finalBillAmt:
                                                                        FFAppState()
                                                                            .finalAmt,
                                                                    billAmt:
                                                                        FFAppState()
                                                                            .billAmt,
                                                                  ),
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'productList':
                                                                          getSelItemListListFirestoreData(
                                                                        _model
                                                                            .prdlistsavebillupi,
                                                                      ),
                                                                    },
                                                                  ),
                                                                });
                                                              } else {
                                                                var tableKotRecordReference =
                                                                    TableKotRecord.createDoc(
                                                                        FFAppState()
                                                                            .outletIdRef!);
                                                                await tableKotRecordReference
                                                                    .set({
                                                                  ...createTableKotRecordData(
                                                                    dayId: functions
                                                                        .getDayId(),
                                                                    createdDate:
                                                                        getCurrentTimestamp
                                                                            .millisecondsSinceEpoch,
                                                                    checkInTime:
                                                                        getCurrentTimestamp
                                                                            .millisecondsSinceEpoch,
                                                                    orderType:
                                                                        'TABLE_KOT',
                                                                    kotStatus:
                                                                        'PENDING',
                                                                    tableNo:
                                                                        FFAppState()
                                                                            .tableNo,
                                                                    premiseName:
                                                                        FFAppState()
                                                                            .selectedPremise,
                                                                    finalBillAmt:
                                                                        FFAppState()
                                                                            .finalAmt,
                                                                    billAmt:
                                                                        FFAppState()
                                                                            .billAmt,
                                                                  ),
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'productList':
                                                                          getSelItemListListFirestoreData(
                                                                        _model
                                                                            .prdlistsavebillupi,
                                                                      ),
                                                                    },
                                                                  ),
                                                                });
                                                                _model.kot =
                                                                    TableKotRecord
                                                                        .getDocumentFromData({
                                                                  ...createTableKotRecordData(
                                                                    dayId: functions
                                                                        .getDayId(),
                                                                    createdDate:
                                                                        getCurrentTimestamp
                                                                            .millisecondsSinceEpoch,
                                                                    checkInTime:
                                                                        getCurrentTimestamp
                                                                            .millisecondsSinceEpoch,
                                                                    orderType:
                                                                        'TABLE_KOT',
                                                                    kotStatus:
                                                                        'PENDING',
                                                                    tableNo:
                                                                        FFAppState()
                                                                            .tableNo,
                                                                    premiseName:
                                                                        FFAppState()
                                                                            .selectedPremise,
                                                                    finalBillAmt:
                                                                        FFAppState()
                                                                            .finalAmt,
                                                                    billAmt:
                                                                        FFAppState()
                                                                            .billAmt,
                                                                  ),
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'productList':
                                                                          getSelItemListListFirestoreData(
                                                                        _model
                                                                            .prdlistsavebillupi,
                                                                      ),
                                                                    },
                                                                  ),
                                                                }, tableKotRecordReference);
                                                                _shouldSetState =
                                                                    true;

                                                                await _model
                                                                    .kot!
                                                                    .reference
                                                                    .update(
                                                                        createTableKotRecordData(
                                                                  id: _model
                                                                      .kot
                                                                      ?.reference
                                                                      .id,
                                                                ));
                                                                FFAppState()
                                                                        .kotDocRef =
                                                                    _model.kot
                                                                        ?.reference;
                                                                safeSetState(
                                                                    () {});
                                                              }

                                                              _model.tablekot =
                                                                  await queryTableKotRecordOnce(
                                                                parent: FFAppState()
                                                                    .outletIdRef,
                                                                queryBuilder:
                                                                    (tableKotRecord) =>
                                                                        tableKotRecord
                                                                            .where(
                                                                  'id',
                                                                  isEqualTo:
                                                                      FFAppState()
                                                                          .kotDocRef
                                                                          ?.id,
                                                                ),
                                                                singleRecord:
                                                                    true,
                                                              ).then((s) => s
                                                                      .firstOrNull);
                                                              _shouldSetState =
                                                                  true;
                                                              _model.returnedListkot =
                                                                  await actions
                                                                      .selectBillPrint(
                                                                FFAppState()
                                                                    .selBill
                                                                    .toString(),
                                                                FFAppState()
                                                                    .allBillsList
                                                                    .toList(),
                                                              );
                                                              _shouldSetState =
                                                                  true;
                                                              _model.devicekot =
                                                                  await actions
                                                                      .newCustomAction(
                                                                FFAppState()
                                                                    .printerIndex,
                                                              );
                                                              _shouldSetState =
                                                                  true;
                                                              _model.spoutletkot =
                                                                  await queryServicePointOutletRecordOnce(
                                                                parent: FFAppState()
                                                                    .outletIdRef,
                                                              );
                                                              _shouldSetState =
                                                                  true;
                                                              if (captainProductCartAppSettingsRecord!
                                                                  .settingList
                                                                  .where((e) =>
                                                                      e.title ==
                                                                      'printTableKotwithUsb')
                                                                  .toList()
                                                                  .firstOrNull!
                                                                  .value) {
                                                                await actions
                                                                    .printKOTwithusbtable(
                                                                  _model
                                                                      .returnedListkot!
                                                                      .toList(),
                                                                  _model
                                                                      .devicekot!
                                                                      .toList(),
                                                                  FFAppState()
                                                                      .isPrinterConnected,
                                                                  FFAppState()
                                                                      .printerName,
                                                                  _model
                                                                      .tablekot!,
                                                                  FFAppState()
                                                                      .paperSize,
                                                                  captainProductCartAppSettingsRecord!,
                                                                  _model
                                                                      .spoutletkot!
                                                                      .toList(),
                                                                );
                                                              }
                                                              if (captainProductCartAppSettingsRecord!
                                                                  .settingList
                                                                  .where((e) =>
                                                                      e.title ==
                                                                      'enableEthernetPrint')
                                                                  .toList()
                                                                  .firstOrNull!
                                                                  .value) {
                                                                await actions
                                                                    .printEthernetKot(
                                                                  _model
                                                                      .returnedListkot!
                                                                      .toList(),
                                                                  _model
                                                                      .devicekot!
                                                                      .toList(),
                                                                  FFAppState()
                                                                      .isPrinterConnected,
                                                                  FFAppState()
                                                                      .printerName,
                                                                  _model
                                                                      .tablekot!,
                                                                  FFAppState()
                                                                      .paperSize,
                                                                  _model
                                                                      .spoutletkot!
                                                                      .toList(),
                                                                  captainProductCartAppSettingsRecord!,
                                                                );
                                                              }
                                                              _model.prdlistsavebillkotupdate =
                                                                  await actions
                                                                      .filterProductsKot(
                                                                FFAppState()
                                                                    .selBill,
                                                                FFAppState()
                                                                    .allBillsList
                                                                    .toList(),
                                                                true,
                                                              );
                                                              _shouldSetState =
                                                                  true;

                                                              await FFAppState()
                                                                  .kotDocRef!
                                                                  .update({
                                                                ...mapToFirestore(
                                                                  {
                                                                    'productList':
                                                                        getSelItemListListFirestoreData(
                                                                      _model
                                                                          .prdlistsavebillkotupdate,
                                                                    ),
                                                                  },
                                                                ),
                                                              });
                                                              await actions
                                                                  .removeFromAllBillList(
                                                                FFAppState()
                                                                    .selBill,
                                                              );
                                                              _model.prdid =
                                                                  null;
                                                              await actions
                                                                  .clearValue();
                                                              FFAppState()
                                                                  .noOfItems = 0;
                                                              FFAppState()
                                                                      .subTotal =
                                                                  0.0;
                                                              FFAppState()
                                                                      .delCharges =
                                                                  0.0;
                                                              FFAppState()
                                                                      .kotDocRef =
                                                                  null;
                                                              FFAppState()
                                                                  .prdid = '';
                                                              FFAppState()
                                                                      .finalAmt =
                                                                  0.0;
                                                              FFAppState()
                                                                      .billAmt =
                                                                  0.0;
                                                              FFAppState()
                                                                      .tableViewHideShow =
                                                                  true;
                                                              safeSetState(
                                                                  () {});

                                                              context.goNamed(
                                                                CaptainTableListWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'taxcollection':
                                                                      serializeParam(
                                                                    widget!
                                                                        .taxcollection,
                                                                    ParamType
                                                                        .Document,
                                                                    isList:
                                                                        true,
                                                                  ),
                                                                  'doc':
                                                                      serializeParam(
                                                                    widget!.doc,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  'taxcollection':
                                                                      widget!
                                                                          .taxcollection,
                                                                },
                                                              );

                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            } else {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    content: Text(
                                                                        'Internet Not Available'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            }
                                                          } else {
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          }

                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'b9m51l01' /* Print Kot */,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          height: 40.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily,
                                                                    color: Colors
                                                                        .white,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .titleSmallIsCustom,
                                                                  ),
                                                          elevation: 0.0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                    ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'containerOnActionTriggerAnimation2']!,
                                                        hasBeenTriggered:
                                                            hasContainerTriggered2),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 15.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 5.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 45.0,
                                          child:
                                              custom_widgets.SearchHiveprdtable(
                                            width: double.infinity,
                                            height: 45.0,
                                            billno: FFAppState().selBill,
                                            billnum:
                                                FFAppState().selBill.toString(),
                                            disAmt: FFAppState().disAmt,
                                            delChargs: FFAppState().delCharges,
                                            purchase: false,
                                            document: FFAppState().productHive,
                                            taxcollection:
                                                widget!.taxcollection!,
                                            appSettingsRecord:
                                                captainProductCartAppSettingsRecord!,
                                            unitcollection:
                                                containerUnitTypeRecordList,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 10.0),
                                          child: SingleChildScrollView(
                                            controller: _model.columnController,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 25.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 520.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        3.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 50.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      await actions
                                                                          .hideAppbar();
                                                                      FFAppState()
                                                                          .categoryColor = '';
                                                                      FFAppState()
                                                                          .update(
                                                                              () {});
                                                                      FFAppState()
                                                                              .outletCatRef =
                                                                          FFAppState()
                                                                              .catRef;
                                                                      FFAppState()
                                                                          .update(
                                                                              () {});
                                                                      FFAppState()
                                                                          .catAllColor = FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary;
                                                                      FFAppState()
                                                                          .update(
                                                                              () {});
                                                                      FFAppState()
                                                                          .categoryID = '';
                                                                      safeSetState(
                                                                          () {});
                                                                      _model.prdhiveall =
                                                                          await actions
                                                                              .getProductlistHive();
                                                                      FFAppState().productHive = _model
                                                                          .prdhiveall!
                                                                          .toList()
                                                                          .cast<
                                                                              ProductStructStruct>();
                                                                      safeSetState(
                                                                          () {});

                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          50.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          FFAppState()
                                                                              .catAllColor,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                3.0,
                                                                                12.0,
                                                                                3.0,
                                                                                12.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '970lo5b2' /* All */,
                                                                              ),
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                    color: FlutterFlowTheme.of(context).lineColor,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final categoryList = (captainProductCartAppSettingsRecord!.settingList.where((e) => e.title == 'sortCategoryByCode').toList().firstOrNull!.value
                                                                                ? FFAppState().categoryHive.sortedList(keyOf: (e) => e.code, desc: false)
                                                                                : FFAppState().categoryHive.sortedList(keyOf: (e) => e.name, desc: false))
                                                                            .toList();

                                                                        return ListView
                                                                            .separated(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          scrollDirection:
                                                                              Axis.horizontal,
                                                                          itemCount:
                                                                              categoryList.length,
                                                                          separatorBuilder: (_, __) =>
                                                                              SizedBox(width: 2.0),
                                                                          itemBuilder:
                                                                              (context, categoryListIndex) {
                                                                            final categoryListItem =
                                                                                categoryList[categoryListIndex];
                                                                            return InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                FFAppState().catAllColor = Color(4292855973);
                                                                                safeSetState(() {});
                                                                                FFAppState().categoryColor = categoryListItem.id;
                                                                                FFAppState().update(() {});
                                                                                _model.prdhive = await actions.getProductlistHive();
                                                                                FFAppState().categoryID = categoryListItem.id;
                                                                                safeSetState(() {});
                                                                                FFAppState().productHive = _model.prdhive!.where((e) => e.categoryId == categoryListItem.id).toList().cast<ProductStructStruct>();
                                                                                safeSetState(() {});

                                                                                safeSetState(() {});
                                                                              },
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: FFAppState().categoryColor == categoryListItem.id ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).secondary,
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 12.0, 10.0, 12.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Text(
                                                                                        categoryListItem.name,
                                                                                        textAlign: TextAlign.center,
                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                              color: FlutterFlowTheme.of(context).lineColor,
                                                                                              fontSize: 14.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                          controller:
                                                                              _model.listViewController,
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        2.0)),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 19,
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(7.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final productList = (captainProductCartAppSettingsRecord!.settingList.where((e) => e.title == 'sortProductByCode').toList().firstOrNull!.value
                                                                            ? FFAppState().productHive.sortedList(
                                                                                keyOf: (e) => e.code,
                                                                                desc: false)
                                                                            : FFAppState().productHive.sortedList(keyOf: (e) => e.name, desc: false))
                                                                        .toList();
                                                                    if (productList
                                                                        .isEmpty) {
                                                                      return Center(
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/9091-empty-sad-shopping-bag.gif',
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.28,
                                                                        ),
                                                                      );
                                                                    }

                                                                    return GridView
                                                                        .builder(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      gridDelegate:
                                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                                        crossAxisCount:
                                                                            3,
                                                                        crossAxisSpacing:
                                                                            4.0,
                                                                        mainAxisSpacing:
                                                                            7.0,
                                                                        childAspectRatio:
                                                                            1.0,
                                                                      ),
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          productList
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              productListIndex) {
                                                                        final productListItem =
                                                                            productList[productListIndex];
                                                                        return Container(
                                                                          width:
                                                                              113.0,
                                                                          height:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(5.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).customColor2,
                                                                              width: 1.0,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              if (!captainProductCartAppSettingsRecord!.settingList.where((e) => e.title == 'showProductImage').toList().firstOrNull!.value)
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    var _shouldSetState = false;
                                                                                    FFAppState().groceryshow = false;
                                                                                    safeSetState(() {});
                                                                                    if (productListItem.stockable) {
                                                                                      if (productListItem.stock > 0) {
                                                                                        if (FFAppState().prdid != productListItem.id) {
                                                                                          if (FFAppState().holdBillCount == 0) {
                                                                                            FFAppState().holdBillCount = FFAppState().holdBillCount + 1;
                                                                                            FFAppState().addToAllBillsList(functions.generateBillDetailsJson(0.0, 0.0, 0.0, 'CASH', 0.0, 0.0, FFAppState().billAmt, 0.0, FFAppState().finalAmt, '0', FFAppState().itemCartList.toList(), FFAppState().holdBillCount));
                                                                                            FFAppState().selBill = 1;
                                                                                          }
                                                                                          FFAppState().prdid = productListItem.id;
                                                                                          safeSetState(() {});
                                                                                        } else {
                                                                                          if (productListItem.stock >
                                                                                              functions.doubleToInt(valueOrDefault<double>(
                                                                                                getJsonField(
                                                                                                  functions
                                                                                                      .filterBillList(FFAppState().selBill, FFAppState().allBillsList.toList())
                                                                                                      .where((e) =>
                                                                                                          productListItem.id ==
                                                                                                          valueOrDefault<String>(
                                                                                                            getJsonField(
                                                                                                              e,
                                                                                                              r'''$.id''',
                                                                                                            )?.toString(),
                                                                                                            '0',
                                                                                                          ))
                                                                                                      .toList()
                                                                                                      .firstOrNull,
                                                                                                  r'''$.quantity''',
                                                                                                ),
                                                                                                0.0,
                                                                                              ))!) {
                                                                                            if (FFAppState().holdBillCount == 0) {
                                                                                              FFAppState().holdBillCount = FFAppState().holdBillCount + 1;
                                                                                              FFAppState().addToAllBillsList(functions.generateBillDetailsJson(0.0, 0.0, 0.0, 'CASH', 0.0, 0.0, FFAppState().billAmt, 0.0, FFAppState().finalAmt, '0', FFAppState().itemCartList.toList(), FFAppState().holdBillCount));
                                                                                              FFAppState().selBill = 1;
                                                                                            }
                                                                                          } else {
                                                                                            await showDialog(
                                                                                              context: context,
                                                                                              builder: (alertDialogContext) {
                                                                                                return AlertDialog(
                                                                                                  content: Text('Item Out Of  Stock'),
                                                                                                  actions: [
                                                                                                    TextButton(
                                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                      child: Text('Ok'),
                                                                                                    ),
                                                                                                  ],
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                            if (_shouldSetState) safeSetState(() {});
                                                                                            return;
                                                                                          }
                                                                                        }
                                                                                      } else {
                                                                                        await showDialog(
                                                                                          context: context,
                                                                                          builder: (alertDialogContext) {
                                                                                            return AlertDialog(
                                                                                              content: Text('Item Out Of Stock'),
                                                                                              actions: [
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                  child: Text('Ok'),
                                                                                                ),
                                                                                              ],
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                        if (_shouldSetState) safeSetState(() {});
                                                                                        return;
                                                                                      }
                                                                                    } else {
                                                                                      if (FFAppState().holdBillCount == 0) {
                                                                                        FFAppState().holdBillCount = FFAppState().holdBillCount + 1;
                                                                                        FFAppState().addToAllBillsList(functions.generateBillDetailsJson(0.0, 0.0, 0.0, 'CASH', 0.0, 0.0, FFAppState().billAmt, 0.0, FFAppState().finalAmt, '0', FFAppState().itemCartList.toList(), FFAppState().holdBillCount));
                                                                                        FFAppState().selBill = 1;
                                                                                      }
                                                                                    }

                                                                                    _model.qtyunitresult = await actions.addToHoldListprdtable(
                                                                                      productListItem,
                                                                                      FFAppState().selBill,
                                                                                      widget!.taxcollection!.toList(),
                                                                                      functions.enabletaxinclusive(captainProductCartAppSettingsRecord!.settingList.where((e) => e.title == 'enableInclusiveTax').toList().firstOrNull!.value),
                                                                                      containerUnitTypeRecordList.toList(),
                                                                                      false,
                                                                                    );
                                                                                    _shouldSetState = true;
                                                                                    _model.calculateResult23 = await actions.calSubTotalForHoldListkiosk(
                                                                                      FFAppState().selBill.toString(),
                                                                                      FFAppState().allBillsList.toList(),
                                                                                      functions.enabletaxinclusive(captainProductCartAppSettingsRecord!.settingList.where((e) => e.title == 'enableInclusiveTax').toList().firstOrNull!.value),
                                                                                    );
                                                                                    _shouldSetState = true;
                                                                                    _model.calbillAmt3 = await actions.calBillAmt(
                                                                                      FFAppState().disAmt,
                                                                                      FFAppState().delCharges,
                                                                                    );
                                                                                    _shouldSetState = true;
                                                                                    await _model.listViewprd?.animateTo(
                                                                                      _model.listViewprd!.position.maxScrollExtent,
                                                                                      duration: Duration(milliseconds: 100),
                                                                                      curve: Curves.ease,
                                                                                    );
                                                                                    await _model.listViewprd?.animateTo(
                                                                                      _model.listViewprd!.position.maxScrollExtent,
                                                                                      duration: Duration(milliseconds: 100),
                                                                                      curve: Curves.ease,
                                                                                    );
                                                                                    if (_shouldSetState) safeSetState(() {});
                                                                                  },
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: FFAppState().productColor == productListItem.id ? FlutterFlowTheme.of(context).secondary : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      borderRadius: BorderRadius.circular(5.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(5.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 7.0),
                                                                                            child: Text(
                                                                                              productListItem.name.maybeHandleOverflow(
                                                                                                maxChars: 25,
                                                                                              ),
                                                                                              textAlign: TextAlign.center,
                                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Flexible(
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      '6zo8l30y' /* ₹  */,
                                                                                                    ),
                                                                                                    textAlign: TextAlign.center,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                        ),
                                                                                                  ),
                                                                                                  Flexible(
                                                                                                    child: Text(
                                                                                                      productListItem.sellingPrice.toString(),
                                                                                                      textAlign: TextAlign.center,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          if (productListItem.stockable)
                                                                                            Flexible(
                                                                                              child: Text(
                                                                                                'Stock :${productListItem.stock.toString()}',
                                                                                                textAlign: TextAlign.justify,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ).animateOnActionTrigger(animationsMap['containerOnActionTriggerAnimation4']!, hasBeenTriggered: hasContainerTriggered4),
                                                                              if (captainProductCartAppSettingsRecord?.settingList?.where((e) => e.title == 'showProductImage').toList()?.firstOrNull?.value ?? true)
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    var _shouldSetState = false;
                                                                                    FFAppState().groceryshow = false;
                                                                                    safeSetState(() {});
                                                                                    if (productListItem.stockable) {
                                                                                      if (productListItem.stock > 0) {
                                                                                        if (FFAppState().prdid != productListItem.id) {
                                                                                          if (FFAppState().holdBillCount == 0) {
                                                                                            FFAppState().holdBillCount = FFAppState().holdBillCount + 1;
                                                                                            FFAppState().addToAllBillsList(functions.generateBillDetailsJson(0.0, 0.0, 0.0, 'CASH', 0.0, 0.0, FFAppState().billAmt, 0.0, FFAppState().finalAmt, '0', FFAppState().itemCartList.toList(), FFAppState().holdBillCount));
                                                                                            FFAppState().selBill = 1;
                                                                                          }
                                                                                          FFAppState().prdid = productListItem.id;
                                                                                          safeSetState(() {});
                                                                                        } else {
                                                                                          if (productListItem.stock >
                                                                                              functions.doubleToInt(valueOrDefault<double>(
                                                                                                getJsonField(
                                                                                                  functions
                                                                                                      .filterBillList(FFAppState().selBill, FFAppState().allBillsList.toList())
                                                                                                      .where((e) =>
                                                                                                          productListItem.id ==
                                                                                                          valueOrDefault<String>(
                                                                                                            getJsonField(
                                                                                                              e,
                                                                                                              r'''$.id''',
                                                                                                            )?.toString(),
                                                                                                            '0',
                                                                                                          ))
                                                                                                      .toList()
                                                                                                      .firstOrNull,
                                                                                                  r'''$.quantity''',
                                                                                                ),
                                                                                                0.0,
                                                                                              ))!) {
                                                                                            if (FFAppState().holdBillCount == 0) {
                                                                                              FFAppState().holdBillCount = FFAppState().holdBillCount + 1;
                                                                                              FFAppState().addToAllBillsList(functions.generateBillDetailsJson(0.0, 0.0, 0.0, 'CASH', 0.0, 0.0, FFAppState().billAmt, 0.0, FFAppState().finalAmt, '0', FFAppState().itemCartList.toList(), FFAppState().holdBillCount));
                                                                                              FFAppState().selBill = 1;
                                                                                            }
                                                                                          } else {
                                                                                            await showDialog(
                                                                                              context: context,
                                                                                              builder: (alertDialogContext) {
                                                                                                return AlertDialog(
                                                                                                  content: Text('Item Out Of  Stock'),
                                                                                                  actions: [
                                                                                                    TextButton(
                                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                      child: Text('Ok'),
                                                                                                    ),
                                                                                                  ],
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                            if (_shouldSetState) safeSetState(() {});
                                                                                            return;
                                                                                          }
                                                                                        }
                                                                                      } else {
                                                                                        await showDialog(
                                                                                          context: context,
                                                                                          builder: (alertDialogContext) {
                                                                                            return AlertDialog(
                                                                                              content: Text('Item Out Of Stock'),
                                                                                              actions: [
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                  child: Text('Ok'),
                                                                                                ),
                                                                                              ],
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                        if (_shouldSetState) safeSetState(() {});
                                                                                        return;
                                                                                      }
                                                                                    } else {
                                                                                      if (FFAppState().holdBillCount == 0) {
                                                                                        FFAppState().holdBillCount = FFAppState().holdBillCount + 1;
                                                                                        FFAppState().addToAllBillsList(functions.generateBillDetailsJson(0.0, 0.0, 0.0, 'CASH', 0.0, 0.0, FFAppState().billAmt, 0.0, FFAppState().finalAmt, '0', FFAppState().itemCartList.toList(), FFAppState().holdBillCount));
                                                                                        FFAppState().selBill = 1;
                                                                                      }
                                                                                    }

                                                                                    _model.qtyunitresult23 = await actions.addToHoldListprdtable(
                                                                                      productListItem,
                                                                                      FFAppState().selBill,
                                                                                      widget!.taxcollection!.toList(),
                                                                                      functions.enabletaxinclusive(captainProductCartAppSettingsRecord!.settingList.where((e) => e.title == 'enableInclusiveTax').toList().firstOrNull!.value),
                                                                                      containerUnitTypeRecordList.toList(),
                                                                                      false,
                                                                                    );
                                                                                    _shouldSetState = true;
                                                                                    _model.calculateResult23Copy = await actions.calSubTotalForHoldListkiosk(
                                                                                      FFAppState().selBill.toString(),
                                                                                      FFAppState().allBillsList.toList(),
                                                                                      functions.enabletaxinclusive(captainProductCartAppSettingsRecord!.settingList.where((e) => e.title == 'enableInclusiveTax').toList().firstOrNull!.value),
                                                                                    );
                                                                                    _shouldSetState = true;
                                                                                    _model.calbillAmt3img = await actions.calBillAmt(
                                                                                      FFAppState().disAmt,
                                                                                      FFAppState().delCharges,
                                                                                    );
                                                                                    _shouldSetState = true;
                                                                                    await _model.listViewprd?.animateTo(
                                                                                      _model.listViewprd!.position.maxScrollExtent,
                                                                                      duration: Duration(milliseconds: 100),
                                                                                      curve: Curves.ease,
                                                                                    );
                                                                                    if (_shouldSetState) safeSetState(() {});
                                                                                  },
                                                                                  onDoubleTap: () async {},
                                                                                  onLongPress: () async {},
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: FFAppState().productColor == productListItem.id ? FlutterFlowTheme.of(context).secondary : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      borderRadius: BorderRadius.circular(5.0),
                                                                                    ),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Container(
                                                                                            width: double.infinity,
                                                                                            height: MediaQuery.sizeOf(context).height * 0.14,
                                                                                            decoration: BoxDecoration(
                                                                                              color: Color(0x1A000000),
                                                                                              image: DecorationImage(
                                                                                                fit: BoxFit.cover,
                                                                                                image: CachedNetworkImageProvider(
                                                                                                  functions.imageurltostring(productListItem.imageUrl),
                                                                                                ),
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                                            ),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                                    child: Container(
                                                                                                      width: double.infinity,
                                                                                                      height: MediaQuery.sizeOf(context).height * 0.15,
                                                                                                      decoration: BoxDecoration(
                                                                                                        image: DecorationImage(
                                                                                                          fit: BoxFit.cover,
                                                                                                          image: Image.network(
                                                                                                            '',
                                                                                                          ).image,
                                                                                                        ),
                                                                                                        gradient: LinearGradient(
                                                                                                          colors: [
                                                                                                            Colors.transparent,
                                                                                                            Color(0xA7000000)
                                                                                                          ],
                                                                                                          stops: [0.0, 1.0],
                                                                                                          begin: AlignmentDirectional(0.0, -1.0),
                                                                                                          end: AlignmentDirectional(0, 1.0),
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                                      ),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsets.all(5.0),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                                                          children: [
                                                                                                            Flexible(
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                                                                child: Text(
                                                                                                                  productListItem.name,
                                                                                                                  textAlign: TextAlign.center,
                                                                                                                  style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                                        color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FontWeight.w600,
                                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                children: [
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                                                    child: Text(
                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                        '1f0lsshn' /* ₹ */,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                                            color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Flexible(
                                                                                                                    child: Text(
                                                                                                                      valueOrDefault<String>(
                                                                                                                        productListItem.sellingPrice.toString(),
                                                                                                                        '120',
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                                            color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                            if (productListItem.stockable)
                                                                                                              Flexible(
                                                                                                                child: Text(
                                                                                                                  'Stock :${productListItem.stock.toString()}',
                                                                                                                  textAlign: TextAlign.justify,
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                        color: FlutterFlowTheme.of(context).parkingPrimary,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ).animateOnActionTrigger(animationsMap['containerOnActionTriggerAnimation5']!, hasBeenTriggered: hasContainerTriggered5),
                                                                            ],
                                                                          ),
                                                                        ).animateOnActionTrigger(
                                                                            animationsMap[
                                                                                'containerOnActionTriggerAnimation3']!,
                                                                            hasBeenTriggered:
                                                                                hasContainerTriggered3);
                                                                      },
                                                                      controller:
                                                                          _model
                                                                              .gridViewController,
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    badges.Badge(
                                                      badgeContent: Text(
                                                        valueOrDefault<String>(
                                                          functions
                                                              .filterBillList(
                                                                  FFAppState()
                                                                      .selBill,
                                                                  FFAppState()
                                                                      .allBillsList
                                                                      .toList())
                                                              .length
                                                              .toString(),
                                                          '0',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmallIsCustom,
                                                                ),
                                                      ),
                                                      showBadge: true,
                                                      shape: badges
                                                          .BadgeShape.circle,
                                                      badgeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      elevation: 4.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  8.0,
                                                                  8.0,
                                                                  8.0),
                                                      position:
                                                          badges.BadgePosition
                                                              .topEnd(),
                                                      animationType: badges
                                                          .BadgeAnimationType
                                                          .scale,
                                                      toAnimate: true,
                                                      child: Icon(
                                                        Icons
                                                            .shopping_cart_sharp,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 26.0,
                                                      ),
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '9pzkhf0z' /* Cart */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontSize: 17.0,
                                                            letterSpacing: 1.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumIsCustom,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 10.0)),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  height: 600.0,
                                                  decoration: BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if (FFAppState()
                                                            .fabButtonHide)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        5.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height: MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.003,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            15.0,
                                                                            0.0,
                                                                            15.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children:
                                                                          [
                                                                        Expanded(
                                                                          child:
                                                                              TextFormField(
                                                                            controller:
                                                                                _model.textController1,
                                                                            focusNode:
                                                                                _model.textFieldFocusNode1,
                                                                            onChanged: (_) =>
                                                                                EasyDebounce.debounce(
                                                                              '_model.textController1',
                                                                              Duration(milliseconds: 2000),
                                                                              () => safeSetState(() {}),
                                                                            ),
                                                                            autofocus:
                                                                                false,
                                                                            obscureText:
                                                                                false,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              isDense: true,
                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                'vbd11c20' /* Amt. */,
                                                                              ),
                                                                              hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                              enabledBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0x00000000),
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(5.0),
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0x00000000),
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(5.0),
                                                                              ),
                                                                              errorBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0x00000000),
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(5.0),
                                                                              ),
                                                                              focusedErrorBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0x00000000),
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(5.0),
                                                                              ),
                                                                              filled: true,
                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).headlineSmallIsCustom,
                                                                                ),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            validator:
                                                                                _model.textController1Validator.asValidator(context),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              TextFormField(
                                                                            controller:
                                                                                _model.textController2,
                                                                            focusNode:
                                                                                _model.textFieldFocusNode2,
                                                                            onChanged: (_) =>
                                                                                EasyDebounce.debounce(
                                                                              '_model.textController2',
                                                                              Duration(milliseconds: 2000),
                                                                              () => safeSetState(() {}),
                                                                            ),
                                                                            autofocus:
                                                                                false,
                                                                            obscureText:
                                                                                false,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              isDense: true,
                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                'qvnestmu' /* Qty */,
                                                                              ),
                                                                              hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                              enabledBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0x00000000),
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(5.0),
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0x00000000),
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(5.0),
                                                                              ),
                                                                              errorBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0x00000000),
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(5.0),
                                                                              ),
                                                                              focusedErrorBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0x00000000),
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(5.0),
                                                                              ),
                                                                              filled: true,
                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                ),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            validator:
                                                                                _model.textController2Validator.asValidator(context),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              TextFormField(
                                                                            controller:
                                                                                _model.textController3,
                                                                            focusNode:
                                                                                _model.textFieldFocusNode3,
                                                                            onChanged: (_) =>
                                                                                EasyDebounce.debounce(
                                                                              '_model.textController3',
                                                                              Duration(milliseconds: 2000),
                                                                              () => safeSetState(() {}),
                                                                            ),
                                                                            autofocus:
                                                                                false,
                                                                            obscureText:
                                                                                false,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              isDense: true,
                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                'ir0ttj40' /* Price */,
                                                                              ),
                                                                              hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                              enabledBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0x00000000),
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(5.0),
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0x00000000),
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(5.0),
                                                                              ),
                                                                              errorBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0x00000000),
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(5.0),
                                                                              ),
                                                                              focusedErrorBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0x00000000),
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(5.0),
                                                                              ),
                                                                              filled: true,
                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                ),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            validator:
                                                                                _model.textController3Validator.asValidator(context),
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 15.0)),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      3.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: 30.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .customColor2,
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  flex: 28,
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.12,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'n4yeacwy' /* Item Name */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 14,
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.08,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'hyvzamvd' /* Qty */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 9,
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.08,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'mu7rtla4' /* Amt */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 5,
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        100.0,
                                                                    height: 1.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        2.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 100.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final bill = functions
                                                                      .filterBillList(
                                                                          FFAppState()
                                                                              .selBill,
                                                                          FFAppState()
                                                                              .allBillsList
                                                                              .toList())
                                                                      .toList();

                                                                  return ListView
                                                                      .builder(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount: bill
                                                                        .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            billIndex) {
                                                                      final billItem =
                                                                          bill[
                                                                              billIndex];
                                                                      return Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            4.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.49,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(10.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Text(
                                                                                        getJsonField(
                                                                                          billItem,
                                                                                          r'''$.name''',
                                                                                        ).toString().maybeHandleOverflow(
                                                                                              maxChars: 15,
                                                                                              replacement: '…',
                                                                                            ),
                                                                                        textAlign: TextAlign.start,
                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            '0a9dapy5' /* ₹  */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          getJsonField(
                                                                                            billItem,
                                                                                            r'''$.price''',
                                                                                          ).toString(),
                                                                                          style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 10.0)),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 1.0, 0.0),
                                                                                          child: Container(
                                                                                            width: 150.0,
                                                                                            height: 40.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsets.all(1.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    flex: 7,
                                                                                                    child: InkWell(
                                                                                                      splashColor: Colors.transparent,
                                                                                                      focusColor: Colors.transparent,
                                                                                                      hoverColor: Colors.transparent,
                                                                                                      highlightColor: Colors.transparent,
                                                                                                      onTap: () async {
                                                                                                        FFAppState().groceryshow = false;
                                                                                                        safeSetState(() {});
                                                                                                        _model.resultminus = await actions.addToHoldListprdminus(
                                                                                                          ProductStructStruct.maybeFromMap(billItem)!,
                                                                                                          FFAppState().selBill,
                                                                                                          widget!.taxcollection!.toList(),
                                                                                                          functions.enabletaxinclusive(captainProductCartAppSettingsRecord!.settingList.where((e) => e.title == 'enableInclusiveTax').toList().firstOrNull!.value),
                                                                                                        );
                                                                                                        await actions.calSubTotalForHoldListkiosk(
                                                                                                          FFAppState().selBill.toString(),
                                                                                                          _model.resultminus!.toList(),
                                                                                                          functions.enabletaxinclusive(captainProductCartAppSettingsRecord!.settingList.where((e) => e.title == 'enableInclusiveTax').toList().firstOrNull!.value),
                                                                                                        );
                                                                                                        _model.reu34 = await actions.calBillAmt(
                                                                                                          valueOrDefault<double>(
                                                                                                            FFAppState().disAmt,
                                                                                                            0.0,
                                                                                                          ),
                                                                                                          FFAppState().delCharges,
                                                                                                        );

                                                                                                        safeSetState(() {});
                                                                                                      },
                                                                                                      child: Container(
                                                                                                        width: MediaQuery.sizeOf(context).width * 0.03,
                                                                                                        height: double.infinity,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).customColor3,
                                                                                                          borderRadius: BorderRadius.only(
                                                                                                            bottomLeft: Radius.circular(10.0),
                                                                                                            bottomRight: Radius.circular(0.0),
                                                                                                            topLeft: Radius.circular(10.0),
                                                                                                            topRight: Radius.circular(0.0),
                                                                                                          ),
                                                                                                        ),
                                                                                                        child: Icon(
                                                                                                          Icons.remove,
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          size: 15.0,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Expanded(
                                                                                                    flex: 13,
                                                                                                    child: Container(
                                                                                                      width: MediaQuery.sizeOf(context).width * 0.02,
                                                                                                      height: double.infinity,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      ),
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: QtyEditWidget(
                                                                                                        key: Key('Keyoq7_${billIndex}_of_${bill.length}'),
                                                                                                        parameter1: getJsonField(
                                                                                                          billItem,
                                                                                                          r'''$.quantity''',
                                                                                                        ),
                                                                                                        parameter2: !_model.qtyCheck,
                                                                                                        parameter3: getJsonField(
                                                                                                          billItem,
                                                                                                          r'''$.stockable''',
                                                                                                        ),
                                                                                                        parameter4: getJsonField(
                                                                                                          billItem,
                                                                                                          r'''$.currentStock''',
                                                                                                        ),
                                                                                                        parameter5: ProductStructStruct.maybeFromMap(billItem),
                                                                                                        parameter6: widget!.taxcollection!,
                                                                                                        parameter7: captainProductCartAppSettingsRecord?.settingList?.where((e) => e.title == 'enableInclusiveTax').toList()?.firstOrNull?.value,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Expanded(
                                                                                                    flex: 7,
                                                                                                    child: InkWell(
                                                                                                      splashColor: Colors.transparent,
                                                                                                      focusColor: Colors.transparent,
                                                                                                      hoverColor: Colors.transparent,
                                                                                                      highlightColor: Colors.transparent,
                                                                                                      onTap: () async {
                                                                                                        var _shouldSetState = false;
                                                                                                        FFAppState().groceryshow = false;
                                                                                                        safeSetState(() {});
                                                                                                        if (getJsonField(
                                                                                                          billItem,
                                                                                                          r'''$.stockable''',
                                                                                                        )) {
                                                                                                          if (!functions.greatethanlesskiosk(
                                                                                                              functions.jsontoint(getJsonField(
                                                                                                                billItem,
                                                                                                                r'''$.currentStock''',
                                                                                                              )),
                                                                                                              functions.jsontoint(getJsonField(
                                                                                                                billItem,
                                                                                                                r'''$.quantity''',
                                                                                                              )))) {
                                                                                                            await showDialog(
                                                                                                              context: context,
                                                                                                              builder: (alertDialogContext) {
                                                                                                                return AlertDialog(
                                                                                                                  content: Text('Item Out Of Stock !'),
                                                                                                                  actions: [
                                                                                                                    TextButton(
                                                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                                      child: Text('Ok'),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                );
                                                                                                              },
                                                                                                            );
                                                                                                            if (_shouldSetState) safeSetState(() {});
                                                                                                            return;
                                                                                                          }
                                                                                                        }
                                                                                                        _model.resultplus = await actions.addToHoldListprdplus(
                                                                                                          ProductStructStruct.maybeFromMap(billItem)!,
                                                                                                          FFAppState().selBill,
                                                                                                          widget!.taxcollection!.toList(),
                                                                                                          functions.enabletaxinclusive(captainProductCartAppSettingsRecord!.settingList.where((e) => e.title == 'enableInclusiveTax').toList().firstOrNull!.value),
                                                                                                        );
                                                                                                        _shouldSetState = true;
                                                                                                        await actions.calSubTotalForHoldListkiosk(
                                                                                                          FFAppState().selBill.toString(),
                                                                                                          _model.resultplus!.toList(),
                                                                                                          functions.enabletaxinclusive(captainProductCartAppSettingsRecord!.settingList.where((e) => e.title == 'enableInclusiveTax').toList().firstOrNull!.value),
                                                                                                        );
                                                                                                        _model.reuslt12 = await actions.calBillAmt(
                                                                                                          valueOrDefault<double>(
                                                                                                            FFAppState().disAmt,
                                                                                                            0.0,
                                                                                                          ),
                                                                                                          FFAppState().delCharges,
                                                                                                        );
                                                                                                        _shouldSetState = true;
                                                                                                        if (_shouldSetState) safeSetState(() {});
                                                                                                      },
                                                                                                      child: Container(
                                                                                                        width: MediaQuery.sizeOf(context).width * 0.03,
                                                                                                        height: double.infinity,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).customColor3,
                                                                                                          borderRadius: BorderRadius.only(
                                                                                                            bottomLeft: Radius.circular(0.0),
                                                                                                            bottomRight: Radius.circular(10.0),
                                                                                                            topLeft: Radius.circular(0.0),
                                                                                                            topRight: Radius.circular(10.0),
                                                                                                          ),
                                                                                                        ),
                                                                                                        child: Icon(
                                                                                                          Icons.add,
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          size: 15.0,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                          functions
                                                                                              .getTotal(
                                                                                                  valueOrDefault<double>(
                                                                                                    getJsonField(
                                                                                                      billItem,
                                                                                                      r'''$.quantity''',
                                                                                                    ),
                                                                                                    0.0,
                                                                                                  ),
                                                                                                  valueOrDefault<double>(
                                                                                                    getJsonField(
                                                                                                      billItem,
                                                                                                      r'''$.price''',
                                                                                                    ),
                                                                                                    0.0,
                                                                                                  ))
                                                                                              .toString(),
                                                                                          textAlign: TextAlign.center,
                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                      ].divide(SizedBox(width: 10.0)),
                                                                                    ),
                                                                                    Container(
                                                                                      width: 40.0,
                                                                                      height: 40.0,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          FFAppState().groceryshow = false;
                                                                                          safeSetState(() {});
                                                                                          _model.res20 = await actions.removeHoldListItem(
                                                                                            getJsonField(
                                                                                              billItem,
                                                                                              r'''$''',
                                                                                            ),
                                                                                            FFAppState().selBill,
                                                                                          );
                                                                                          _model.ddddd = await actions.calSubTotalForHoldListkiosk(
                                                                                            FFAppState().selBill.toString(),
                                                                                            FFAppState().allBillsList.toList(),
                                                                                            functions.enabletaxinclusive(captainProductCartAppSettingsRecord!.settingList.where((e) => e.title == 'enableInclusiveTax').toList().firstOrNull!.value),
                                                                                          );
                                                                                          _model.reuslt22 = await actions.calBillAmt(
                                                                                            valueOrDefault<double>(
                                                                                              FFAppState().disAmt,
                                                                                              0.0,
                                                                                            ),
                                                                                            FFAppState().delCharges,
                                                                                          );
                                                                                          FFAppState().prdid = '';
                                                                                          safeSetState(() {});

                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.delete,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 20.0,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ].divide(SizedBox(height: 7.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                    controller:
                                                                        _model
                                                                            .listViewprd,
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.05,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius:
                                                                    15.0,
                                                                color: Color(
                                                                    0x40000000),
                                                                offset: Offset(
                                                                  2.0,
                                                                  -2.0,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  flex: 3,
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'i1ryg0k7' /* Item */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        FFAppState()
                                                                            .noOfItems
                                                                            .toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 3,
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'uy6ghr9v' /* Qty */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          FFAppState()
                                                                              .totalQuantity
                                                                              .toString(),
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 6,
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            3.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '2utwq7vg' /* Sub Total */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                              ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.end,
                                                                          children: [
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'ke0azxwh' /* ₹  */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              FFAppState().billAmt.toString(),
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 5.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ));
      },
    );
  }
}
