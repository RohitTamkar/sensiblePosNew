import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/discount_and_delivery_copy/discount_and_delivery_copy_widget.dart';
import '/components/menu_drawer/menu_drawer_widget.dart';
import '/components/mix_payment_mode/mix_payment_mode_widget.dart';
import '/components/qty_edit_widget.dart';
import '/components/table_v_iew/table_v_iew_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'table_list_model.dart';
export 'table_list_model.dart';

class TableListWidget extends StatefulWidget {
  const TableListWidget({
    super.key,
    this.shiftDetails,
    this.taxcollection,
    this.doc,
  });

  final dynamic shiftDetails;
  final List<TaxMasterRecord>? taxcollection;
  final DocumentReference? doc;

  static String routeName = 'TableList';
  static String routePath = 'tableList';

  @override
  State<TableListWidget> createState() => _TableListWidgetState();
}

class _TableListWidgetState extends State<TableListWidget>
    with TickerProviderStateMixin {
  late TableListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasContainerTriggered1 = false;
  var hasContainerTriggered2 = false;
  var hasContainerTriggered3 = false;
  var hasContainerTriggered4 = false;
  var hasContainerTriggered5 = false;
  var hasContainerTriggered6 = false;
  var hasContainerTriggered7 = false;
  var hasContainerTriggered8 = false;
  var hasContainerTriggered9 = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TableListModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().tableViewHideShow = true;
      safeSetState(() {});
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
      'containerOnActionTriggerAnimation2': AnimationInfo(
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
      'containerOnActionTriggerAnimation3': AnimationInfo(
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
      'containerOnActionTriggerAnimation4': AnimationInfo(
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
      'containerOnActionTriggerAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 120.0.ms,
            begin: Offset(0.9, 0.9),
            end: Offset(1.0, 1.0),
          ),
          SaturateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 120.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation6': AnimationInfo(
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
      'containerOnActionTriggerAnimation7': AnimationInfo(
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
      'containerOnActionTriggerAnimation8': AnimationInfo(
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
      'containerOnActionTriggerAnimation9': AnimationInfo(
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
        List<AppSettingsRecord> tableListAppSettingsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final tableListAppSettingsRecord =
            tableListAppSettingsRecordList.isNotEmpty
                ? tableListAppSettingsRecordList.first
                : null;

        return Title(
            title: 'TableList',
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
                  width: MediaQuery.sizeOf(context).width * 0.11,
                  child: Drawer(
                    elevation: 16.0,
                    child: wrapWithModel(
                      model: _model.menuDrawerModel,
                      updateCallback: () => safeSetState(() {}),
                      child: MenuDrawerWidget(),
                    ),
                  ),
                ),
                body: Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: 100.0,
                              height: MediaQuery.sizeOf(context).height * 0.04,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 3.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        FFAppState().outletName,
                                        'SENSIBLE',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .titleSmallIsCustom,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 6.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        FFAppState().userName,
                                        'SK',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodySmallIsCustom,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.05,
                            height: MediaQuery.sizeOf(context).height * 0.04,
                            decoration: BoxDecoration(),
                            child: Image.asset(
                              'assets/images/IMG_20220412_140945.png',
                              width: 100.0,
                              height: 100.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 3.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 15,
                                child: Container(
                                  width: 100.0,
                                  height: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 3.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                scaffoldKey.currentState!
                                                    .openDrawer();
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.05,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.06,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.menu_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .lineColor,
                                                      size: 18.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 3.0, 0.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.14,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.06,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Flexible(
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            FFAppState()
                                                                    .tableViewHideShow =
                                                                false;
                                                            safeSetState(() {});
                                                          },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'bke4nom9' /* Load Menu */,
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
                                                                .primaryBackground,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      letterSpacing:
                                                                          0.0,
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
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 3.0, 0.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.14,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.06,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Flexible(
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            FFAppState()
                                                                    .tableViewHideShow =
                                                                true;
                                                            safeSetState(() {});
                                                          },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            '1ll896bu' /* Filter Table */,
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
                                                                .primaryBackground,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      letterSpacing:
                                                                          0.0,
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
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 3.0, 0.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.14,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.06,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Flexible(
                                                        child: FFButtonWidget(
                                                          onPressed: () {
                                                            print(
                                                                'Button pressed ...');
                                                          },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'n8mn6fkt' /* Change Table */,
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
                                                                .primaryBackground,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      letterSpacing:
                                                                          0.0,
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
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.12,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.06,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  if (FFAppState()
                                                      .tableViewHideShow)
                                                    Expanded(
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
                                                          FFAppState()
                                                                  .tableViewHideShow =
                                                              functions.toggleLogin(
                                                                  FFAppState()
                                                                      .tableViewHideShow);
                                                          FFAppState()
                                                              .update(() {});
                                                        },
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              width: 0.5,
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .lunch_dining,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .customColor1,
                                                                size: 30.0,
                                                              ),
                                                              Icon(
                                                                Icons.sync_alt,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 25.0,
                                                              ),
                                                              Icon(
                                                                Icons
                                                                    .table_bar_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .customColor1,
                                                                size: 30.0,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (!FFAppState()
                                                      .tableViewHideShow)
                                                    Flexible(
                                                      child: Container(
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          FFAppState().tableNo,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                fontSize: 22.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (FFAppState().tableViewHideShow)
                                        Flexible(
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                            child: StreamBuilder<
                                                List<PremisesRecord>>(
                                              stream: FFAppState().list(
                                                requestFn: () =>
                                                    queryPremisesRecord(
                                                  parent:
                                                      FFAppState().outletIdRef,
                                                ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 40.0,
                                                      height: 40.0,
                                                      child:
                                                          SpinKitFadingCircle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 40.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<PremisesRecord>
                                                    listViewPremisesRecordList =
                                                    snapshot.data!;

                                                return ListView.separated(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      listViewPremisesRecordList
                                                          .length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(height: 25.0),
                                                  itemBuilder:
                                                      (context, listViewIndex) {
                                                    final listViewPremisesRecord =
                                                        listViewPremisesRecordList[
                                                            listViewIndex];
                                                    return Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor2,
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            12.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                listViewPremisesRecord
                                                                    .name,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .titleMediumIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                            TableVIewWidget(
                                                              key: Key(
                                                                  'Key6bd_${listViewIndex}_of_${listViewPremisesRecordList.length}'),
                                                              parameter2:
                                                                  listViewPremisesRecord,
                                                              parameter3:
                                                                  listViewPremisesRecord
                                                                      .name,
                                                              taxcollection: widget!
                                                                  .taxcollection,
                                                              apsetting:
                                                                  tableListAppSettingsRecord,
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 10.0)),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  controller: _model
                                                      .listViewController1,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      if (!FFAppState().tableViewHideShow)
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 3.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  flex: 18,
                                                  child: StreamBuilder<
                                                      List<UnitTypeRecord>>(
                                                    stream:
                                                        queryUnitTypeRecord(),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 40.0,
                                                            height: 40.0,
                                                            child:
                                                                SpinKitFadingCircle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 40.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<UnitTypeRecord>
                                                          containerUnitTypeRecordList =
                                                          snapshot.data!;

                                                      return Container(
                                                        width: 100.0,
                                                        height: double.infinity,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: double
                                                                    .infinity,
                                                                child: Stack(
                                                                  children: [
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.115,
                                                                                    height: double.infinity,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.5),
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              await actions.hideAppbar();
                                                                                              FFAppState().categoryColor = '';
                                                                                              FFAppState().update(() {});
                                                                                              FFAppState().outletCatRef = FFAppState().catRef;
                                                                                              FFAppState().update(() {});
                                                                                              FFAppState().catAllColor = FlutterFlowTheme.of(context).primary;
                                                                                              FFAppState().update(() {});
                                                                                              FFAppState().categoryID = '';
                                                                                              safeSetState(() {});
                                                                                              _model.prdhiveall = await actions.getProductlistHive();
                                                                                              FFAppState().productHive = _model.prdhiveall!.toList().cast<ProductStructStruct>();
                                                                                              safeSetState(() {});

                                                                                              safeSetState(() {});
                                                                                            },
                                                                                            child: Container(
                                                                                              width: double.infinity,
                                                                                              decoration: BoxDecoration(
                                                                                                color: valueOrDefault<Color>(
                                                                                                  FFAppState().catAllColor,
                                                                                                  FlutterFlowTheme.of(context).secondary,
                                                                                                ),
                                                                                                border: Border.all(
                                                                                                  color: FlutterFlowTheme.of(context).customColor1,
                                                                                                ),
                                                                                              ),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(3.0, 12.0, 3.0, 12.0),
                                                                                                    child: Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'd91diq32' /* All */,
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
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                            child: Container(
                                                                                              width: double.infinity,
                                                                                              height: 100.0,
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Builder(
                                                                                                builder: (context) {
                                                                                                  final categoryList = (tableListAppSettingsRecord!.settingList.where((e) => e.title == 'sortCategoryByCode').toList().firstOrNull!.value ? FFAppState().categoryHive.sortedList(keyOf: (e) => e.code, desc: false) : FFAppState().categoryHive.sortedList(keyOf: (e) => e.name, desc: false)).toList();

                                                                                                  return ListView.builder(
                                                                                                    padding: EdgeInsets.zero,
                                                                                                    scrollDirection: Axis.vertical,
                                                                                                    itemCount: categoryList.length,
                                                                                                    itemBuilder: (context, categoryListIndex) {
                                                                                                      final categoryListItem = categoryList[categoryListIndex];
                                                                                                      return Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.5),
                                                                                                        child: InkWell(
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
                                                                                                            width: double.infinity,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FFAppState().categoryColor == categoryListItem.id ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).secondary,
                                                                                                            ),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(3.0, 12.0, 3.0, 12.0),
                                                                                                              child: Text(
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
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                    controller: _model.listViewController2,
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
                                                                                Expanded(
                                                                                  flex: 19,
                                                                                  child: Container(
                                                                                    width: 100.0,
                                                                                    height: double.infinity,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Stack(
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsets.all(1.0),
                                                                                          child: Container(
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Builder(
                                                                                              builder: (context) {
                                                                                                final productList = (tableListAppSettingsRecord!.settingList.where((e) => e.title == 'sortProductByCode').toList().firstOrNull!.value ? FFAppState().productHive.sortedList(keyOf: (e) => e.code, desc: false) : FFAppState().productHive.sortedList(keyOf: (e) => e.name, desc: false)).toList();
                                                                                                if (productList.isEmpty) {
                                                                                                  return Center(
                                                                                                    child: Image.asset(
                                                                                                      'assets/images/9091-empty-sad-shopping-bag.gif',
                                                                                                      width: MediaQuery.sizeOf(context).width * 0.28,
                                                                                                    ),
                                                                                                  );
                                                                                                }

                                                                                                return GridView.builder(
                                                                                                  padding: EdgeInsets.zero,
                                                                                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                                                    crossAxisCount: 5,
                                                                                                    crossAxisSpacing: 3.0,
                                                                                                    mainAxisSpacing: 4.0,
                                                                                                    childAspectRatio: 1.3,
                                                                                                  ),
                                                                                                  scrollDirection: Axis.vertical,
                                                                                                  itemCount: productList.length,
                                                                                                  itemBuilder: (context, productListIndex) {
                                                                                                    final productListItem = productList[productListIndex];
                                                                                                    return Container(
                                                                                                      width: 113.0,
                                                                                                      height: 100.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                                        border: Border.all(
                                                                                                          color: FlutterFlowTheme.of(context).customColor2,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                      ),
                                                                                                      child: Stack(
                                                                                                        children: [
                                                                                                          if (!tableListAppSettingsRecord!.settingList.where((e) => e.title == 'showProductImage').toList().firstOrNull!.value)
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
                                                                                                                  functions.enabletaxinclusive(tableListAppSettingsRecord!.settingList.where((e) => e.title == 'enableInclusiveTax').toList().firstOrNull!.value),
                                                                                                                  containerUnitTypeRecordList.toList(),
                                                                                                                  false,
                                                                                                                );
                                                                                                                _shouldSetState = true;
                                                                                                                _model.calculateResult23 = await actions.calSubTotalForHoldListkiosk(
                                                                                                                  FFAppState().selBill.toString(),
                                                                                                                  FFAppState().allBillsList.toList(),
                                                                                                                  functions.enabletaxinclusive(tableListAppSettingsRecord!.settingList.where((e) => e.title == 'enableInclusiveTax').toList().firstOrNull!.value),
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
                                                                                                                  padding: EdgeInsets.all(2.0),
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
                                                                                                                                  'u3h7zdhu' /* ₹  */,
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
                                                                                                            ).animateOnActionTrigger(animationsMap['containerOnActionTriggerAnimation2']!, hasBeenTriggered: hasContainerTriggered2),
                                                                                                          if (tableListAppSettingsRecord?.settingList?.where((e) => e.title == 'showProductImage').toList()?.firstOrNull?.value ?? true)
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
                                                                                                                  functions.enabletaxinclusive(tableListAppSettingsRecord!.settingList.where((e) => e.title == 'enableInclusiveTax').toList().firstOrNull!.value),
                                                                                                                  containerUnitTypeRecordList.toList(),
                                                                                                                  false,
                                                                                                                );
                                                                                                                _shouldSetState = true;
                                                                                                                _model.calculateResult23Copy = await actions.calSubTotalForHoldListkiosk(
                                                                                                                  FFAppState().selBill.toString(),
                                                                                                                  FFAppState().allBillsList.toList(),
                                                                                                                  functions.enabletaxinclusive(tableListAppSettingsRecord!.settingList.where((e) => e.title == 'enableInclusiveTax').toList().firstOrNull!.value),
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
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsets.all(0.5),
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
                                                                                                                                        colors: [Colors.transparent, Color(0xA7000000)],
                                                                                                                                        stops: [0.0, 1.0],
                                                                                                                                        begin: AlignmentDirectional(0.0, -1.0),
                                                                                                                                        end: AlignmentDirectional(0, 1.0),
                                                                                                                                      ),
                                                                                                                                      borderRadius: BorderRadius.circular(5.0),
                                                                                                                                    ),
                                                                                                                                    child: Padding(
                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 3.0),
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
                                                                                                                                                      'xrm24tw5' /* ₹ */,
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
                                                                                                              ),
                                                                                                            ).animateOnActionTrigger(animationsMap['containerOnActionTriggerAnimation3']!, hasBeenTriggered: hasContainerTriggered3),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ).animateOnActionTrigger(animationsMap['containerOnActionTriggerAnimation1']!, hasBeenTriggered: hasContainerTriggered1);
                                                                                                  },
                                                                                                  controller: _model.gridViewController,
                                                                                                );
                                                                                              },
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
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 10,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(3.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            if (FFAppState()
                                                                .fabButtonHide)
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.045,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Stack(
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
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.003,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          elevation:
                                                                              1.0,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.09,
                                                                            height:
                                                                                MediaQuery.sizeOf(context).height * 0.045,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                            ),
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.textController1,
                                                                              focusNode: _model.textFieldFocusNode1,
                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                '_model.textController1',
                                                                                Duration(milliseconds: 2000),
                                                                                () => safeSetState(() {}),
                                                                              ),
                                                                              autofocus: false,
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                isDense: true,
                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                  'z0o1cr2h' /* Amt. */,
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
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                errorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).headlineSmallIsCustom,
                                                                                  ),
                                                                              textAlign: TextAlign.center,
                                                                              validator: _model.textController1Validator.asValidator(context),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          elevation:
                                                                              1.0,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.09,
                                                                            height:
                                                                                MediaQuery.sizeOf(context).height * 0.045,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                            ),
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.textController2,
                                                                              focusNode: _model.textFieldFocusNode2,
                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                '_model.textController2',
                                                                                Duration(milliseconds: 2000),
                                                                                () => safeSetState(() {}),
                                                                              ),
                                                                              autofocus: false,
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                isDense: true,
                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                  'bc33dcql' /* Qty */,
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
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                errorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                  ),
                                                                              textAlign: TextAlign.center,
                                                                              validator: _model.textController2Validator.asValidator(context),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          elevation:
                                                                              1.0,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.09,
                                                                            height:
                                                                                MediaQuery.sizeOf(context).height * 0.045,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                            ),
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.textController3,
                                                                              focusNode: _model.textFieldFocusNode3,
                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                '_model.textController3',
                                                                                Duration(milliseconds: 2000),
                                                                                () => safeSetState(() {}),
                                                                              ),
                                                                              autofocus: false,
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                isDense: true,
                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                  '68h5pby6' /* Price */,
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
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                errorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.only(
                                                                                    topLeft: Radius.circular(4.0),
                                                                                    topRight: Radius.circular(4.0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                  ),
                                                                              textAlign: TextAlign.center,
                                                                              validator: _model.textController3Validator.asValidator(context),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          1.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100.0,
                                                                      height: MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.03,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            flex:
                                                                                28,
                                                                            child:
                                                                                Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.12,
                                                                              height: 100.0,
                                                                              decoration: BoxDecoration(),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'ae9spqmr' /* Item Name */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                15,
                                                                            child:
                                                                                Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.08,
                                                                              height: 100.0,
                                                                              decoration: BoxDecoration(),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'q6gkve4e' /* Qty */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
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
                                                                            flex:
                                                                                10,
                                                                            child:
                                                                                Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.08,
                                                                              height: 100.0,
                                                                              decoration: BoxDecoration(),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'nmnwdj1z' /* Amt */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
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
                                                                            flex:
                                                                                5,
                                                                            child:
                                                                                Container(
                                                                              width: 100.0,
                                                                              height: 100.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            2.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 100.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final bill = functions
                                                                          .filterBillList(
                                                                              FFAppState().selBill,
                                                                              FFAppState().allBillsList.toList())
                                                                          .toList();

                                                                      return ListView
                                                                          .builder(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        scrollDirection:
                                                                            Axis.vertical,
                                                                        itemCount:
                                                                            bill.length,
                                                                        itemBuilder:
                                                                            (context,
                                                                                billIndex) {
                                                                          final billItem =
                                                                              bill[billIndex];
                                                                          return Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                4.0),
                                                                            child:
                                                                                Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.49,
                                                                              height: MediaQuery.sizeOf(context).height * 0.07,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      flex: 28,
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                        child: Container(
                                                                                          width: MediaQuery.sizeOf(context).width * 0.25,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                                                  child: Text(
                                                                                                    getJsonField(
                                                                                                      billItem,
                                                                                                      r'''$.name''',
                                                                                                    ).toString().maybeHandleOverflow(
                                                                                                          maxChars: 15,
                                                                                                          replacement: '…',
                                                                                                        ),
                                                                                                    textAlign: TextAlign.start,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 15.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'dswp2kbz' /* ₹  */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                            fontSize: 13.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      getJsonField(
                                                                                                        billItem,
                                                                                                        r'''$.price''',
                                                                                                      ).toString(),
                                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                            fontSize: 13.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 14,
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 1.0, 0.0),
                                                                                        child: Container(
                                                                                          width: MediaQuery.sizeOf(context).width * 0.08,
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
                                                                                                        functions.enabletaxinclusive(tableListAppSettingsRecord!.settingList.where((e) => e.title == 'enableInclusiveTax').toList().firstOrNull!.value),
                                                                                                      );
                                                                                                      await actions.calSubTotalForHoldListkiosk(
                                                                                                        FFAppState().selBill.toString(),
                                                                                                        _model.resultminus!.toList(),
                                                                                                        functions.enabletaxinclusive(tableListAppSettingsRecord!.settingList.where((e) => e.title == 'enableInclusiveTax').toList().firstOrNull!.value),
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
                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        boxShadow: [
                                                                                                          BoxShadow(
                                                                                                            blurRadius: 5.0,
                                                                                                            color: Color(0x27000000),
                                                                                                            offset: Offset(
                                                                                                              -4.0,
                                                                                                              1.0,
                                                                                                            ),
                                                                                                            spreadRadius: 1.0,
                                                                                                          )
                                                                                                        ],
                                                                                                        borderRadius: BorderRadius.only(
                                                                                                          bottomLeft: Radius.circular(5.0),
                                                                                                          bottomRight: Radius.circular(0.0),
                                                                                                          topLeft: Radius.circular(5.0),
                                                                                                          topRight: Radius.circular(0.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                      child: Icon(
                                                                                                        Icons.remove,
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        size: 20.0,
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
                                                                                                      key: Key('Keyzaz_${billIndex}_of_${bill.length}'),
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
                                                                                                      parameter7: tableListAppSettingsRecord?.settingList?.where((e) => e.title == 'enableInclusiveTax').toList()?.firstOrNull?.value,
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
                                                                                                        functions.enabletaxinclusive(tableListAppSettingsRecord!.settingList.where((e) => e.title == 'enableInclusiveTax').toList().firstOrNull!.value),
                                                                                                      );
                                                                                                      _shouldSetState = true;
                                                                                                      await actions.calSubTotalForHoldListkiosk(
                                                                                                        FFAppState().selBill.toString(),
                                                                                                        _model.resultplus!.toList(),
                                                                                                        functions.enabletaxinclusive(tableListAppSettingsRecord!.settingList.where((e) => e.title == 'enableInclusiveTax').toList().firstOrNull!.value),
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
                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        boxShadow: [
                                                                                                          BoxShadow(
                                                                                                            blurRadius: 5.0,
                                                                                                            color: Color(0x25000000),
                                                                                                            offset: Offset(
                                                                                                              4.0,
                                                                                                              1.0,
                                                                                                            ),
                                                                                                            spreadRadius: 1.0,
                                                                                                          )
                                                                                                        ],
                                                                                                        borderRadius: BorderRadius.only(
                                                                                                          bottomLeft: Radius.circular(0.0),
                                                                                                          bottomRight: Radius.circular(5.0),
                                                                                                          topLeft: Radius.circular(0.0),
                                                                                                          topRight: Radius.circular(5.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                      child: Icon(
                                                                                                        Icons.add,
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        size: 20.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 9,
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 1.0, 0.0),
                                                                                        child: Container(
                                                                                          width: MediaQuery.sizeOf(context).width * 0.042,
                                                                                          height: MediaQuery.sizeOf(context).height * 0.08,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: Text(
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
                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 5,
                                                                                      child: Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 0.03,
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
                                                                                              functions.enabletaxinclusive(tableListAppSettingsRecord!.settingList.where((e) => e.title == 'enableInclusiveTax').toList().firstOrNull!.value),
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
                                                                                            size: 30.0,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                        controller:
                                                                            _model.listViewprd,
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.07,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        15.0,
                                                                    color: Color(
                                                                        0x40000000),
                                                                    offset:
                                                                        Offset(
                                                                      2.0,
                                                                      -2.0,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if (tableListAppSettingsRecord
                                                                            ?.settingList
                                                                            ?.where((e) =>
                                                                                e.title ==
                                                                                'enableCustomer')
                                                                            .toList()
                                                                            ?.firstOrNull
                                                                            ?.value ??
                                                                        true)
                                                                      Expanded(
                                                                        flex:
                                                                            11,
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              2.0,
                                                                              0.0),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              scaffoldKey.currentState!.openEndDrawer();
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              height: MediaQuery.sizeOf(context).height * 0.075,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                    child: Container(
                                                                                      width: MediaQuery.sizeOf(context).width * 0.03,
                                                                                      height: MediaQuery.sizeOf(context).width * 0.03,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        shape: BoxShape.circle,
                                                                                        border: Border.all(
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          width: 0.5,
                                                                                        ),
                                                                                      ),
                                                                                      child: Icon(
                                                                                        Icons.person,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        size: 17.0,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            valueOrDefault<String>(
                                                                                              FFAppState().setCustName,
                                                                                              'Customer Name',
                                                                                            ),
                                                                                            textAlign: TextAlign.center,
                                                                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                                ),
                                                                                          ),
                                                                                          Text(
                                                                                            valueOrDefault<String>(
                                                                                              FFAppState().setCustMobNo,
                                                                                              'Mobile Number',
                                                                                            ),
                                                                                            textAlign: TextAlign.center,
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
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    Expanded(
                                                                      flex: 3,
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '23eiifyp' /* Item */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            FFAppState().noOfItems.toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
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
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'v4qtl8v1' /* Qty */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              FFAppState().totalQuantity.toString(),
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
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
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            3.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.end,
                                                                          children: [
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '6etu4dpz' /* Sub Total */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                  ),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'qm2arvtv' /* ₹  */,
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
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.085,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          2.0,
                                                                          0.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            barrierColor:
                                                                                Color(0x00000000),
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return GestureDetector(
                                                                                onTap: () {
                                                                                  FocusScope.of(context).unfocus();
                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                },
                                                                                child: Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: Container(
                                                                                    height: 360.0,
                                                                                    child: DiscountAndDeliveryCopyWidget(
                                                                                      appsetting: tableListAppSettingsRecord,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));

                                                                          if (animationsMap['containerOnActionTriggerAnimation4'] !=
                                                                              null) {
                                                                            safeSetState(() =>
                                                                                hasContainerTriggered4 = true);
                                                                            SchedulerBinding.instance.addPostFrameCallback((_) async =>
                                                                                await animationsMap['containerOnActionTriggerAnimation4']!.controller.forward(from: 0.0));
                                                                          }
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.032,
                                                                          height:
                                                                              MediaQuery.sizeOf(context).width * 0.032,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).lineColor,
                                                                              width: 0.5,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.receipt,
                                                                              color: FlutterFlowTheme.of(context).lineColor,
                                                                              size: 16.0,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ).animateOnActionTrigger(
                                                                              animationsMap['containerOnActionTriggerAnimation4']!,
                                                                              hasBeenTriggered: hasContainerTriggered4),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 3,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            if (animationsMap['containerOnActionTriggerAnimation5'] !=
                                                                                null) {
                                                                              safeSetState(() => hasContainerTriggered5 = true);
                                                                              SchedulerBinding.instance.addPostFrameCallback((_) async => await animationsMap['containerOnActionTriggerAnimation5']!.controller.forward(from: 0.0));
                                                                            }
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                MediaQuery.sizeOf(context).height * 0.085,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              boxShadow: [
                                                                                BoxShadow(
                                                                                  blurRadius: 3.0,
                                                                                  color: Color(0x33000000),
                                                                                  offset: Offset(
                                                                                    1.0,
                                                                                    1.0,
                                                                                  ),
                                                                                  spreadRadius: 2.0,
                                                                                )
                                                                              ],
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.all(2.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'hueej3py' /* Last Bill */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                          color: FlutterFlowTheme.of(context).lineColor,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'rbjlujlf' /* ₹ */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                              color: FlutterFlowTheme.of(context).lineColor,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                      Text(
                                                                                        valueOrDefault<String>(
                                                                                          FFAppState().lastBill.toString(),
                                                                                          '00.00',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                              color: FlutterFlowTheme.of(context).lineColor,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ).animateOnActionTrigger(animationsMap['containerOnActionTriggerAnimation5']!,
                                                                                hasBeenTriggered: hasContainerTriggered5),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 4,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.02,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                blurRadius: 3.0,
                                                                                color: Color(0x33000000),
                                                                                offset: Offset(
                                                                                  1.0,
                                                                                  1.0,
                                                                                ),
                                                                                spreadRadius: 2.0,
                                                                              )
                                                                            ],
                                                                          ),
                                                                          child:
                                                                              FlutterFlowDropDown<String>(
                                                                            controller: _model.dropDownValueController ??=
                                                                                FormFieldController<String>(
                                                                              _model.dropDownValue ??= FFAppState().defPayMode,
                                                                            ),
                                                                            options:
                                                                                FFAppState().paymentmodenew,
                                                                            onChanged:
                                                                                (val) async {
                                                                              safeSetState(() => _model.dropDownValue = val);
                                                                              FFAppState().PayMode = _model.dropDownValue!;
                                                                              safeSetState(() {});
                                                                              _model.returntrue = await actions.paymentmodemix(
                                                                                FFAppState().PayMode,
                                                                              );
                                                                              if (_model.returntrue!) {
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return GestureDetector(
                                                                                      onTap: () {
                                                                                        FocusScope.of(context).unfocus();
                                                                                        FocusManager.instance.primaryFocus?.unfocus();
                                                                                      },
                                                                                      child: Padding(
                                                                                        padding: MediaQuery.viewInsetsOf(context),
                                                                                        child: Container(
                                                                                          height: 360.0,
                                                                                          child: MixPaymentModeWidget(
                                                                                            appsetting: tableListAppSettingsRecord,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => safeSetState(() {}));
                                                                              }

                                                                              safeSetState(() {});
                                                                            },
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                double.infinity,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                  color: FlutterFlowTheme.of(context).lineColor,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                ),
                                                                            hintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              'xv2mgsas' /* Pay Mode */,
                                                                            ),
                                                                            icon:
                                                                                Icon(
                                                                              Icons.keyboard_arrow_down,
                                                                              color: FlutterFlowTheme.of(context).lineColor,
                                                                              size: 22.0,
                                                                            ),
                                                                            elevation:
                                                                                2.0,
                                                                            borderColor:
                                                                                Colors.transparent,
                                                                            borderWidth:
                                                                                0.0,
                                                                            borderRadius:
                                                                                0.0,
                                                                            margin: EdgeInsetsDirectional.fromSTEB(
                                                                                7.0,
                                                                                4.0,
                                                                                5.0,
                                                                                4.0),
                                                                            hidesUnderline:
                                                                                true,
                                                                            isSearchable:
                                                                                false,
                                                                            isMultiSelect:
                                                                                false,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 4,
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.125,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.085,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.end,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                                                children: [
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '2e68vh3e' /* Final Amt */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).lineColor,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                    children: [
                                                                                      Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '8cb76b14' /* ₹  */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                              color: FlutterFlowTheme.of(context).lineColor,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                      Text(
                                                                                        FFAppState().finalAmt.toString(),
                                                                                        style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).lineColor,
                                                                                              fontSize: 26.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).headlineMediumIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
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
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Expanded(
                                                                  flex: 8,
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            1.0,
                                                                            0.0),
                                                                    child:
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
                                                                        if (animationsMap['containerOnActionTriggerAnimation6'] !=
                                                                            null) {
                                                                          safeSetState(() =>
                                                                              hasContainerTriggered6 = true);
                                                                          SchedulerBinding
                                                                              .instance
                                                                              .addPostFrameCallback((_) async => await animationsMap['containerOnActionTriggerAnimation6']!.controller.forward(from: 0.0));
                                                                        }
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.15,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.085,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                        ),
                                                                        child:
                                                                            FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            var _shouldSetState =
                                                                                false;
                                                                            if (functions.filterBillList(FFAppState().selBill, FFAppState().allBillsList.toList()).length >
                                                                                0) {
                                                                              _model.prdlistsavebillkot = await actions.filterProductsKot(
                                                                                FFAppState().selBill,
                                                                                FFAppState().allBillsList.toList(),
                                                                              );
                                                                              _shouldSetState = true;
                                                                              _model.internetconkot = await actions.checkInternetConnection();
                                                                              _shouldSetState = true;
                                                                              if (_model.internetconkot!) {
                                                                                if (FFAppState().kotDocRef != null) {
                                                                                  await FFAppState().kotDocRef!.update({
                                                                                    ...mapToFirestore(
                                                                                      {
                                                                                        'productList': getSelItemListListFirestoreData(
                                                                                          _model.prdlistsavebillkot,
                                                                                        ),
                                                                                      },
                                                                                    ),
                                                                                  });
                                                                                } else {
                                                                                  var tableKotRecordReference = TableKotRecord.createDoc(FFAppState().outletIdRef!);
                                                                                  await tableKotRecordReference.set({
                                                                                    ...createTableKotRecordData(
                                                                                      dayId: functions.getDayId(),
                                                                                      createdDate: getCurrentTimestamp.millisecondsSinceEpoch,
                                                                                      checkInTime: getCurrentTimestamp.millisecondsSinceEpoch,
                                                                                      orderType: 'TABLE_KOT',
                                                                                      kotStatus: 'PENDING',
                                                                                      tableNo: FFAppState().tableNo,
                                                                                      premiseName: FFAppState().selectedPremise,
                                                                                    ),
                                                                                    ...mapToFirestore(
                                                                                      {
                                                                                        'productList': getSelItemListListFirestoreData(
                                                                                          _model.prdlistsavebillkot,
                                                                                        ),
                                                                                      },
                                                                                    ),
                                                                                  });
                                                                                  _model.kotCopy = TableKotRecord.getDocumentFromData({
                                                                                    ...createTableKotRecordData(
                                                                                      dayId: functions.getDayId(),
                                                                                      createdDate: getCurrentTimestamp.millisecondsSinceEpoch,
                                                                                      checkInTime: getCurrentTimestamp.millisecondsSinceEpoch,
                                                                                      orderType: 'TABLE_KOT',
                                                                                      kotStatus: 'PENDING',
                                                                                      tableNo: FFAppState().tableNo,
                                                                                      premiseName: FFAppState().selectedPremise,
                                                                                    ),
                                                                                    ...mapToFirestore(
                                                                                      {
                                                                                        'productList': getSelItemListListFirestoreData(
                                                                                          _model.prdlistsavebillkot,
                                                                                        ),
                                                                                      },
                                                                                    ),
                                                                                  }, tableKotRecordReference);
                                                                                  _shouldSetState = true;

                                                                                  await _model.kotCopy!.reference.update(createTableKotRecordData(
                                                                                    id: _model.kotCopy?.reference.id,
                                                                                  ));
                                                                                }
                                                                              } else {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      content: Text('Internet Not Available'),
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

                                                                              await actions.removeFromAllBillList(
                                                                                FFAppState().selBill,
                                                                              );
                                                                              safeSetState(() {
                                                                                _model.dropDownValueController?.value = 'CASH';
                                                                              });
                                                                              _model.prdid = null;
                                                                              await actions.clearValue();
                                                                              FFAppState().noOfItems = 0;
                                                                              FFAppState().subTotal = 0.0;
                                                                              FFAppState().delCharges = 0.0;
                                                                              FFAppState().kotDocRef = null;
                                                                              FFAppState().prdid = '';
                                                                              FFAppState().finalAmt = 0.0;
                                                                              FFAppState().billAmt = 0.0;
                                                                              FFAppState().tableViewHideShow = true;
                                                                              safeSetState(() {});
                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                              return;
                                                                            } else {
                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                              return;
                                                                            }

                                                                            if (_shouldSetState)
                                                                              safeSetState(() {});
                                                                          },
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'qv96tsse' /* Save Kot */,
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            height:
                                                                                40.0,
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                0.0,
                                                                                16.0,
                                                                                0.0),
                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                  color: Colors.white,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                ),
                                                                            elevation:
                                                                                0.0,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ).animateOnActionTrigger(
                                                                            animationsMap[
                                                                                'containerOnActionTriggerAnimation6']!,
                                                                            hasBeenTriggered:
                                                                                hasContainerTriggered6),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 8,
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            1.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.15,
                                                                      height: MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.085,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          var _shouldSetState =
                                                                              false;
                                                                          if (functions.filterBillList(FFAppState().selBill, FFAppState().allBillsList.toList()).length >
                                                                              0) {
                                                                            _model.prdlistsavebillupi =
                                                                                await actions.filterProductsKot(
                                                                              FFAppState().selBill,
                                                                              FFAppState().allBillsList.toList(),
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            _model.internetconCopy =
                                                                                await actions.checkInternetConnection();
                                                                            _shouldSetState =
                                                                                true;
                                                                            if (_model.internetconCopy!) {
                                                                              if (FFAppState().kotDocRef != null) {
                                                                                await FFAppState().kotDocRef!.update({
                                                                                  ...mapToFirestore(
                                                                                    {
                                                                                      'productList': getSelItemListListFirestoreData(
                                                                                        _model.prdlistsavebillupi,
                                                                                      ),
                                                                                    },
                                                                                  ),
                                                                                });
                                                                              } else {
                                                                                var tableKotRecordReference = TableKotRecord.createDoc(FFAppState().outletIdRef!);
                                                                                await tableKotRecordReference.set({
                                                                                  ...createTableKotRecordData(
                                                                                    dayId: functions.getDayId(),
                                                                                    createdDate: getCurrentTimestamp.millisecondsSinceEpoch,
                                                                                    checkInTime: getCurrentTimestamp.millisecondsSinceEpoch,
                                                                                    orderType: 'TABLE_KOT',
                                                                                    kotStatus: 'PENDING',
                                                                                    tableNo: FFAppState().tableNo,
                                                                                    premiseName: FFAppState().selectedPremise,
                                                                                  ),
                                                                                  ...mapToFirestore(
                                                                                    {
                                                                                      'productList': getSelItemListListFirestoreData(
                                                                                        _model.prdlistsavebillupi,
                                                                                      ),
                                                                                    },
                                                                                  ),
                                                                                });
                                                                                _model.kot = TableKotRecord.getDocumentFromData({
                                                                                  ...createTableKotRecordData(
                                                                                    dayId: functions.getDayId(),
                                                                                    createdDate: getCurrentTimestamp.millisecondsSinceEpoch,
                                                                                    checkInTime: getCurrentTimestamp.millisecondsSinceEpoch,
                                                                                    orderType: 'TABLE_KOT',
                                                                                    kotStatus: 'PENDING',
                                                                                    tableNo: FFAppState().tableNo,
                                                                                    premiseName: FFAppState().selectedPremise,
                                                                                  ),
                                                                                  ...mapToFirestore(
                                                                                    {
                                                                                      'productList': getSelItemListListFirestoreData(
                                                                                        _model.prdlistsavebillupi,
                                                                                      ),
                                                                                    },
                                                                                  ),
                                                                                }, tableKotRecordReference);
                                                                                _shouldSetState = true;

                                                                                await _model.kot!.reference.update(createTableKotRecordData(
                                                                                  id: _model.kot?.reference.id,
                                                                                ));
                                                                                FFAppState().kotDocRef = _model.kot?.reference;
                                                                                safeSetState(() {});
                                                                              }

                                                                              _model.tablekot = await queryTableKotRecordOnce(
                                                                                parent: FFAppState().outletIdRef,
                                                                                queryBuilder: (tableKotRecord) => tableKotRecord.where(
                                                                                  'id',
                                                                                  isEqualTo: FFAppState().kotDocRef?.id,
                                                                                ),
                                                                                singleRecord: true,
                                                                              ).then((s) => s.firstOrNull);
                                                                              _shouldSetState = true;
                                                                              _model.returnedListkot = await actions.selectBillPrint(
                                                                                FFAppState().selBill.toString(),
                                                                                FFAppState().allBillsList.toList(),
                                                                              );
                                                                              _shouldSetState = true;
                                                                              _model.devicekot = await actions.newCustomAction(
                                                                                FFAppState().printerIndex,
                                                                              );
                                                                              _shouldSetState = true;
                                                                              _model.spoutletkot = await queryServicePointOutletRecordOnce(
                                                                                parent: FFAppState().outletIdRef,
                                                                              );
                                                                              _shouldSetState = true;
                                                                              if (tableListAppSettingsRecord!.settingList.where((e) => e.title == 'printTableKotwithUsb').toList().firstOrNull!.value) {
                                                                                await actions.printKOTwithusbtable(
                                                                                  _model.returnedListkot!.toList(),
                                                                                  _model.devicekot!.toList(),
                                                                                  FFAppState().isPrinterConnected,
                                                                                  FFAppState().printerName,
                                                                                  _model.tablekot!,
                                                                                  FFAppState().paperSize,
                                                                                  tableListAppSettingsRecord!,
                                                                                  _model.spoutletkot!.toList(),
                                                                                );
                                                                              }
                                                                              if (tableListAppSettingsRecord!.settingList.where((e) => e.title == 'enableEthernetPrint').toList().firstOrNull!.value) {
                                                                                await actions.printEthernetKot(
                                                                                  _model.returnedListkot!.toList(),
                                                                                  _model.devicekot!.toList(),
                                                                                  FFAppState().isPrinterConnected,
                                                                                  FFAppState().printerName,
                                                                                  _model.tablekot!,
                                                                                  FFAppState().paperSize,
                                                                                  _model.spoutletkot!.toList(),
                                                                                  tableListAppSettingsRecord!,
                                                                                );
                                                                              }
                                                                              await actions.removeFromAllBillList(
                                                                                FFAppState().selBill,
                                                                              );
                                                                              safeSetState(() {
                                                                                _model.dropDownValueController?.value = 'CASH';
                                                                              });
                                                                              _model.prdid = null;
                                                                              await actions.clearValue();
                                                                              FFAppState().noOfItems = 0;
                                                                              FFAppState().subTotal = 0.0;
                                                                              FFAppState().delCharges = 0.0;
                                                                              FFAppState().kotDocRef = null;
                                                                              FFAppState().prdid = '';
                                                                              FFAppState().finalAmt = 0.0;
                                                                              FFAppState().billAmt = 0.0;
                                                                              FFAppState().tableViewHideShow = true;
                                                                              safeSetState(() {});
                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                              return;
                                                                            } else {
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    content: Text('Internet Not Available'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                              return;
                                                                            }
                                                                          } else {
                                                                            if (_shouldSetState)
                                                                              safeSetState(() {});
                                                                            return;
                                                                          }

                                                                          if (_shouldSetState)
                                                                            safeSetState(() {});
                                                                        },
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          'gvu7pq4r' /* Print Kot */,
                                                                        ),
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              40.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              0.0,
                                                                              16.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                color: Colors.white,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w800,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                              ),
                                                                          elevation:
                                                                              0.0,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ).animateOnActionTrigger(
                                                                            animationsMap[
                                                                                'containerOnActionTriggerAnimation7']!,
                                                                            hasBeenTriggered:
                                                                                hasContainerTriggered7),
                                                                  ),
                                                                ),
                                                                if (tableListAppSettingsRecord
                                                                        ?.settingList
                                                                        ?.where((e) =>
                                                                            e.title ==
                                                                            'enableSaveBill')
                                                                        .toList()
                                                                        ?.firstOrNull
                                                                        ?.value ??
                                                                    true)
                                                                  Expanded(
                                                                    flex: 8,
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          1.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.15,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.085,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                        ),
                                                                        child:
                                                                            FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            var _shouldSetState =
                                                                                false;
                                                                            if (functions.filterBillList(FFAppState().selBill, FFAppState().allBillsList.toList()).length >
                                                                                0) {
                                                                              if (getJsonField(
                                                                                FFAppState().shiftDetailsJson,
                                                                                r'''$.shiftExists''',
                                                                              )) {
                                                                                FFAppState().count = FFAppState().count + 1;
                                                                                FFAppState().newcount = FFAppState().newcount + 1;
                                                                                FFAppState().billcount = FFAppState().billcount + 1;
                                                                              } else {
                                                                                FFAppState().count = FFAppState().count + 1;
                                                                                FFAppState().newcount = FFAppState().newcount + 1;
                                                                                FFAppState().billcount = FFAppState().billcount + 1;
                                                                              }

                                                                              _model.prdlistsavebill = await actions.filterProductsKot(
                                                                                FFAppState().selBill,
                                                                                FFAppState().allBillsList.toList(),
                                                                              );
                                                                              _shouldSetState = true;
                                                                              if (FFAppState().setCustRef != null) {
                                                                                if (_model.dropDownValue == 'CREDIT') {
                                                                                  if (FFAppState().oldBalance < FFAppState().custCredit) {
                                                                                    _model.totalcredit2 = await actions.oldbalanceplusamt(
                                                                                      FFAppState().oldBalance,
                                                                                      FFAppState().finalAmt,
                                                                                    );
                                                                                    _shouldSetState = true;

                                                                                    await FFAppState().setCustRef!.update(createPartyRecordData(
                                                                                          credit: true,
                                                                                          oldBalance: valueOrDefault<int>(
                                                                                            _model.totalcredit2,
                                                                                            0,
                                                                                          ),
                                                                                          lastVisit: getCurrentTimestamp.millisecondsSinceEpoch.toString(),
                                                                                        ));
                                                                                  } else {
                                                                                    await showDialog(
                                                                                      context: context,
                                                                                      builder: (alertDialogContext) {
                                                                                        return AlertDialog(
                                                                                          content: Text('Credit Limit Exceeded !'),
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
                                                                              }
                                                                              _model.internetcon = await actions.checkInternetConnection();
                                                                              _shouldSetState = true;
                                                                              if (_model.internetcon!) {
                                                                                var invoiceRecordReference = InvoiceRecord.createDoc(FFAppState().outletIdRef!);
                                                                                await invoiceRecordReference.set({
                                                                                  ...createInvoiceRecordData(
                                                                                    invoice: functions.genInvoiceNum(FFAppState().newcount, FFAppState().shiftDetails.shiftNo),
                                                                                    party: valueOrDefault<String>(
                                                                                      FFAppState().setCustRef?.id,
                                                                                      'NA',
                                                                                    ),
                                                                                    products: '',
                                                                                    invoiceDate: functions.timestampToMili(getCurrentTimestamp),
                                                                                    paymentMode: _model.dropDownValue,
                                                                                    dayId: functions.getDayId(),
                                                                                    discountAmt: valueOrDefault<double>(
                                                                                      FFAppState().disAmt,
                                                                                      0.0,
                                                                                    ),
                                                                                    discountPer: valueOrDefault<double>(
                                                                                      FFAppState().disPer,
                                                                                      0.0,
                                                                                    ),
                                                                                    delliveryChrg: valueOrDefault<double>(
                                                                                      FFAppState().delCharges,
                                                                                      0.0,
                                                                                    ),
                                                                                    taxAmt: FFAppState().taxamt,
                                                                                    billAmt: valueOrDefault<double>(
                                                                                      FFAppState().billAmt,
                                                                                      0.0,
                                                                                    ),
                                                                                    finalBillAmt: valueOrDefault<double>(
                                                                                      FFAppState().finalAmt,
                                                                                      0.0,
                                                                                    ),
                                                                                    shiftId: getJsonField(
                                                                                      FFAppState().shiftDetailsJson,
                                                                                      r'''$.shiftId''',
                                                                                    ).toString(),
                                                                                    isDeleted: false,
                                                                                    count: FFAppState().newcount,
                                                                                  ),
                                                                                  ...mapToFirestore(
                                                                                    {
                                                                                      'productList': getSelItemListListFirestoreData(
                                                                                        _model.prdlistsavebill,
                                                                                      ),
                                                                                    },
                                                                                  ),
                                                                                });
                                                                                _model.invonline = InvoiceRecord.getDocumentFromData({
                                                                                  ...createInvoiceRecordData(
                                                                                    invoice: functions.genInvoiceNum(FFAppState().newcount, FFAppState().shiftDetails.shiftNo),
                                                                                    party: valueOrDefault<String>(
                                                                                      FFAppState().setCustRef?.id,
                                                                                      'NA',
                                                                                    ),
                                                                                    products: '',
                                                                                    invoiceDate: functions.timestampToMili(getCurrentTimestamp),
                                                                                    paymentMode: _model.dropDownValue,
                                                                                    dayId: functions.getDayId(),
                                                                                    discountAmt: valueOrDefault<double>(
                                                                                      FFAppState().disAmt,
                                                                                      0.0,
                                                                                    ),
                                                                                    discountPer: valueOrDefault<double>(
                                                                                      FFAppState().disPer,
                                                                                      0.0,
                                                                                    ),
                                                                                    delliveryChrg: valueOrDefault<double>(
                                                                                      FFAppState().delCharges,
                                                                                      0.0,
                                                                                    ),
                                                                                    taxAmt: FFAppState().taxamt,
                                                                                    billAmt: valueOrDefault<double>(
                                                                                      FFAppState().billAmt,
                                                                                      0.0,
                                                                                    ),
                                                                                    finalBillAmt: valueOrDefault<double>(
                                                                                      FFAppState().finalAmt,
                                                                                      0.0,
                                                                                    ),
                                                                                    shiftId: getJsonField(
                                                                                      FFAppState().shiftDetailsJson,
                                                                                      r'''$.shiftId''',
                                                                                    ).toString(),
                                                                                    isDeleted: false,
                                                                                    count: FFAppState().newcount,
                                                                                  ),
                                                                                  ...mapToFirestore(
                                                                                    {
                                                                                      'productList': getSelItemListListFirestoreData(
                                                                                        _model.prdlistsavebill,
                                                                                      ),
                                                                                    },
                                                                                  ),
                                                                                }, invoiceRecordReference);
                                                                                _shouldSetState = true;

                                                                                await _model.invonline!.reference.update(createInvoiceRecordData(
                                                                                  id: _model.invonline?.reference.id,
                                                                                ));
                                                                              } else {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      content: Text('Internet Not Available'),
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

                                                                              if (getJsonField(
                                                                                FFAppState().shiftDetailsJson,
                                                                                r'''$.shiftExists''',
                                                                              )) {
                                                                                _model.shiftSummarResultsNew2 = await actions.calShiftSummary(
                                                                                  _model.invonline!,
                                                                                  FFAppState().shiftDetailsJson,
                                                                                );
                                                                                _shouldSetState = true;
                                                                                FFAppState().updateShiftDetailsStruct(
                                                                                  (e) => e
                                                                                    ..billCount = valueOrDefault<int>(
                                                                                      FFAppState().billcount,
                                                                                      0,
                                                                                    )
                                                                                    ..totalSale = getJsonField(
                                                                                      _model.shiftSummarResultsNew2,
                                                                                      r'''$.totalSale''',
                                                                                    )
                                                                                    ..deliveryCharges = getJsonField(
                                                                                      _model.shiftSummarResultsNew2,
                                                                                      r'''$.deliveryCharges''',
                                                                                    )
                                                                                    ..tax = getJsonField(
                                                                                      _model.shiftSummarResultsNew2,
                                                                                      r'''$.tax''',
                                                                                    )
                                                                                    ..lastBillNo = getJsonField(
                                                                                      _model.shiftSummarResultsNew2,
                                                                                      r'''$.lastBillNo''',
                                                                                    ).toString()
                                                                                    ..discount = getJsonField(
                                                                                      _model.shiftSummarResultsNew2,
                                                                                      r'''$.discount''',
                                                                                    )
                                                                                    ..lastBillTime = functions.timestampToMili(getCurrentTimestamp)
                                                                                    ..cashSale = getJsonField(
                                                                                      _model.shiftSummarResultsNew2,
                                                                                      r'''$.cashSale''',
                                                                                    )
                                                                                    ..paymentJson = getJsonField(
                                                                                      _model.shiftSummarResultsNew2,
                                                                                      r'''$.paymentJson''',
                                                                                    ).toString()
                                                                                    ..dayId = getJsonField(
                                                                                      _model.shiftSummarResultsNew2,
                                                                                      r'''$.dayId''',
                                                                                    ).toString()
                                                                                    ..code = FFAppState().shiftDetails.code
                                                                                    ..endTime = FFAppState().shiftDetails.endTime
                                                                                    ..advanceAmtTotal = FFAppState().shiftDetails.advanceAmtTotal
                                                                                    ..customerReciveAmtTotal = FFAppState().shiftDetails.customerReciveAmtTotal
                                                                                    ..expensesAmtTotal = FFAppState().shiftDetails.expensesAmtTotal
                                                                                    ..openingAmt = FFAppState().shiftDetails.openingAmt
                                                                                    ..receiveAmtTotal = FFAppState().shiftDetails.receiveAmtTotal
                                                                                    ..refoundAmount = FFAppState().shiftDetails.refoundAmount
                                                                                    ..roundOff = FFAppState().shiftDetails.roundOff
                                                                                    ..cashInHand = FFAppState().shiftDetails.cashInHand
                                                                                    ..startTime = FFAppState().shiftDetails.startTime
                                                                                    ..inActive = FFAppState().shiftDetails.inActive
                                                                                    ..shiftNo = FFAppState().shiftDetails.shiftNo
                                                                                    ..subTotalBill = FFAppState().shiftDetails.subTotalBill
                                                                                    ..userId = FFAppState().shiftDetails.userId
                                                                                    ..deviceId = FFAppState().shiftDetails.deviceId
                                                                                    ..version = FFAppState().shiftDetails.version
                                                                                    ..shiftId = getJsonField(
                                                                                      _model.shiftSummarResultsNew2,
                                                                                      r'''$.shiftId''',
                                                                                    ).toString()
                                                                                    ..synC = FFAppState().shiftDetails.synC
                                                                                    ..newIDShift = FFAppState().shiftDetails.newIDShift
                                                                                    ..hivekey = FFAppState().shiftDetails.hivekey
                                                                                    ..id = FFAppState().shiftDetails.id,
                                                                                );
                                                                                if (_model.internetcon!) {
                                                                                  _model.shiftondata = await queryShiftRecordOnce(
                                                                                    parent: FFAppState().outletIdRef,
                                                                                    queryBuilder: (shiftRecord) => shiftRecord.where(
                                                                                      'id',
                                                                                      isEqualTo: valueOrDefault<String>(
                                                                                        getJsonField(
                                                                                          FFAppState().shiftDetailsJson,
                                                                                          r'''$.ref''',
                                                                                        )?.toString(),
                                                                                        'NA',
                                                                                      ),
                                                                                    ),
                                                                                    singleRecord: true,
                                                                                  ).then((s) => s.firstOrNull);
                                                                                  _shouldSetState = true;

                                                                                  await _model.shiftondata!.reference.update(createShiftRecordData(
                                                                                    billCount: FFAppState().shiftDetails.billCount,
                                                                                    dayId: getJsonField(
                                                                                      _model.shiftSummarResultsNew2,
                                                                                      r'''$.dayId''',
                                                                                    ).toString(),
                                                                                    lastBillNo: getJsonField(
                                                                                      _model.shiftSummarResultsNew2,
                                                                                      r'''$.lastBillNo''',
                                                                                    ).toString(),
                                                                                    lastBillTime: functions.timestampToMili(getCurrentTimestamp),
                                                                                    tax: getJsonField(
                                                                                      _model.shiftSummarResultsNew2,
                                                                                      r'''$.tax''',
                                                                                    ),
                                                                                    deliveryCharges: getJsonField(
                                                                                      _model.shiftSummarResultsNew2,
                                                                                      r'''$.deliveryCharges''',
                                                                                    ),
                                                                                    discount: getJsonField(
                                                                                      _model.shiftSummarResultsNew2,
                                                                                      r'''$.discount''',
                                                                                    ),
                                                                                    totalSale: getJsonField(
                                                                                      _model.shiftSummarResultsNew2,
                                                                                      r'''$.totalSale''',
                                                                                    ),
                                                                                    cashSale: getJsonField(
                                                                                      _model.shiftSummarResultsNew2,
                                                                                      r'''$.cashSale''',
                                                                                    ),
                                                                                    paymentJson: getJsonField(
                                                                                      _model.shiftSummarResultsNew2,
                                                                                      r'''$.paymentJson''',
                                                                                    ).toString(),
                                                                                    code: FFAppState().shiftDetails.code,
                                                                                    endTime: FFAppState().shiftDetails.endTime,
                                                                                    advanceAmtTotal: FFAppState().shiftDetails.advanceAmtTotal,
                                                                                    customerReciveAmtTotal: FFAppState().shiftDetails.customerReciveAmtTotal,
                                                                                    expensesAmtTotal: FFAppState().shiftDetails.expensesAmtTotal,
                                                                                    openingAmt: FFAppState().shiftDetails.openingAmt,
                                                                                    receiveAmtTotal: FFAppState().shiftDetails.receiveAmtTotal,
                                                                                    refoundAmount: FFAppState().shiftDetails.refoundAmount,
                                                                                    roundOff: FFAppState().shiftDetails.roundOff,
                                                                                    cashInHand: FFAppState().shiftDetails.cashInHand,
                                                                                    startTime: FFAppState().shiftDetails.startTime,
                                                                                    inActive: FFAppState().shiftDetails.inActive,
                                                                                    shiftNo: FFAppState().shiftDetails.shiftNo,
                                                                                    shiftId: getJsonField(
                                                                                      _model.shiftSummarResultsNew2,
                                                                                      r'''$.shiftId''',
                                                                                    ).toString(),
                                                                                  ));
                                                                                } else {
                                                                                  if (_shouldSetState) safeSetState(() {});
                                                                                  return;
                                                                                }

                                                                                if (tableListAppSettingsRecord!.settingList.where((e) => e.title == 'enableStock').toList().firstOrNull!.value) {
                                                                                  FFAppState().startLoop = 0;
                                                                                  while (FFAppState().startLoop < _model.prdlistsavebill!.length) {
                                                                                    _model.stockupdateprd = await queryProductRecordOnce(
                                                                                      parent: FFAppState().outletIdRef,
                                                                                      queryBuilder: (productRecord) => productRecord
                                                                                          .where(
                                                                                            'id',
                                                                                            isEqualTo: (_model.prdlistsavebill?.elementAtOrNull(FFAppState().startLoop))?.id,
                                                                                          )
                                                                                          .where(
                                                                                            'stockable',
                                                                                            isEqualTo: true,
                                                                                          ),
                                                                                      singleRecord: true,
                                                                                    ).then((s) => s.firstOrNull);
                                                                                    _shouldSetState = true;
                                                                                    if (_model.stockupdateprd != null) {
                                                                                      await _model.stockupdateprd!.reference.update({
                                                                                        ...mapToFirestore(
                                                                                          {
                                                                                            'currentStock': FieldValue.increment(-(functions.doubleToInt((_model.prdlistsavebill?.elementAtOrNull(FFAppState().startLoop))?.quantity)!)),
                                                                                          },
                                                                                        ),
                                                                                      });
                                                                                      _model.itemprd = await actions.hivegetproductbyId(
                                                                                        _model.stockupdateprd?.reference.id,
                                                                                        _model.prdlistsavebill?.elementAtOrNull(FFAppState().startLoop),
                                                                                        'get',
                                                                                      );
                                                                                      _shouldSetState = true;
                                                                                      FFAppState().updateProductHiveputStruct(
                                                                                        (e) => e
                                                                                          ..id = _model.itemprd?.id
                                                                                          ..price = _model.itemprd?.price
                                                                                          ..category = _model.itemprd?.category
                                                                                          ..code = _model.itemprd?.code
                                                                                          ..name = _model.itemprd?.name
                                                                                          ..sellingPrice = _model.itemprd?.sellingPrice
                                                                                          ..mrpPrice = _model.itemprd?.mrpPrice
                                                                                          ..purchasePrice = _model.itemprd?.purchasePrice
                                                                                          ..categoryId = _model.itemprd?.categoryId
                                                                                          ..taxId = _model.itemprd?.taxId
                                                                                          ..unitId = _model.itemprd?.unitId
                                                                                          ..regionalName = _model.itemprd?.regionalName
                                                                                          ..barcode = _model.itemprd?.barcode
                                                                                          ..hsncode = _model.itemprd?.hsncode
                                                                                          ..reorderLevel = _model.itemprd?.reorderLevel
                                                                                          ..searchcode = _model.itemprd?.searchcode
                                                                                          ..shortName = _model.itemprd?.shortName
                                                                                          ..weightable = _model.itemprd?.weightable
                                                                                          ..stockable = _model.itemprd?.stockable
                                                                                          ..discountPer = _model.itemprd?.discountPer
                                                                                          ..discountAmt = _model.itemprd?.discountAmt
                                                                                          ..productMasterId = _model.itemprd?.productMasterId
                                                                                          ..recipeRefId = _model.itemprd?.recipeRefId
                                                                                          ..imageUrl = _model.itemprd?.imageUrl
                                                                                          ..serviceOutletId = _model.itemprd?.serviceOutletId
                                                                                          ..type = _model.itemprd?.type
                                                                                          ..recipeId = _model.itemprd?.recipeId
                                                                                          ..stock = _model.itemprd!.stock - (functions.doubleToInt((_model.prdlistsavebill?.elementAtOrNull(FFAppState().startLoop))?.quantity)!)
                                                                                          ..isDeleted = _model.itemprd?.isDeleted
                                                                                          ..keywords = _model.itemprd!.keywords.toList()
                                                                                          ..synC = _model.itemprd?.synC
                                                                                          ..hivekey = _model.itemprd?.hivekey
                                                                                          ..version = _model.itemprd?.version,
                                                                                      );
                                                                                      _model.productupdated = await actions.hiveProductCrud(
                                                                                        FFAppState().productHiveput.hivekey,
                                                                                        FFAppState().productHiveput,
                                                                                        'update',
                                                                                      );
                                                                                      _shouldSetState = true;
                                                                                      FFAppState().productHive = [];
                                                                                      FFAppState().productHiveput = ProductStructStruct();
                                                                                      _model.newupdatedproductlist2 = await actions.getProductlistHive();
                                                                                      _shouldSetState = true;
                                                                                      FFAppState().productHive = _model.newupdatedproductlist2!.toList().cast<ProductStructStruct>();
                                                                                    }
                                                                                    FFAppState().startLoop = FFAppState().startLoop + 1;
                                                                                  }
                                                                                  await actions.updateProductStocknew(
                                                                                    _model.prdlistsavebill!.toList(),
                                                                                  );
                                                                                }
                                                                                await actions.removeFromAllBillList(
                                                                                  FFAppState().selBill,
                                                                                );
                                                                                safeSetState(() {
                                                                                  _model.dropDownValueController?.value = 'CASH';
                                                                                });
                                                                                FFAppState().lastBill = FFAppState().finalAmt;
                                                                                _model.prdid = null;
                                                                                await actions.clearValue();
                                                                                FFAppState().noOfItems = 0;
                                                                                FFAppState().subTotal = 0.0;
                                                                                FFAppState().count = FFAppState().billcount;
                                                                                FFAppState().delCharges = 0.0;
                                                                                FFAppState().oldBalance = 0;
                                                                                FFAppState().custCredit = 0;
                                                                                FFAppState().custNameRef = null;
                                                                                FFAppState().setCustRef = null;
                                                                                FFAppState().setCustName = '';
                                                                                FFAppState().setCustMobNo = '';
                                                                                FFAppState().prdid = '';
                                                                                FFAppState().finalAmt = 0.0;
                                                                                FFAppState().billAmt = 0.0;
                                                                                FFAppState().tableViewHideShow = true;
                                                                                safeSetState(() {});
                                                                                if (_shouldSetState) safeSetState(() {});
                                                                                return;
                                                                              } else {
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  SnackBar(
                                                                                    content: Text(
                                                                                      'Login again to start Shift ',
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                    ),
                                                                                    duration: Duration(milliseconds: 4000),
                                                                                    backgroundColor: Color(0x00000000),
                                                                                  ),
                                                                                );
                                                                                if (_shouldSetState) safeSetState(() {});
                                                                                return;
                                                                              }
                                                                            } else {
                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                              return;
                                                                            }

                                                                            if (_shouldSetState)
                                                                              safeSetState(() {});
                                                                          },
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'l5p8byv1' /* Save Bill */,
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            width:
                                                                                double.infinity,
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            textStyle: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).headlineSmallIsCustom,
                                                                                ),
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Colors.transparent,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                      ).animateOnActionTrigger(
                                                                              animationsMap['containerOnActionTriggerAnimation8']!,
                                                                              hasBeenTriggered: hasContainerTriggered8),
                                                                    ),
                                                                  ),
                                                                Expanded(
                                                                  flex: 8,
                                                                  child:
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
                                                                      if (animationsMap[
                                                                              'containerOnActionTriggerAnimation9'] !=
                                                                          null) {
                                                                        safeSetState(() =>
                                                                            hasContainerTriggered9 =
                                                                                true);
                                                                        SchedulerBinding
                                                                            .instance
                                                                            .addPostFrameCallback((_) async =>
                                                                                await animationsMap['containerOnActionTriggerAnimation9']!.controller.forward(from: 0.0));
                                                                      }
                                                                    },
                                                                    child:
                                                                        ClipRRect(
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.15,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.085,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                        ),
                                                                        child:
                                                                            FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            var _shouldSetState =
                                                                                false;
                                                                            if (getJsonField(
                                                                              FFAppState().shiftDetailsJson,
                                                                              r'''$.shiftExists''',
                                                                            )) {
                                                                              FFAppState().count = FFAppState().count + 1;
                                                                              FFAppState().newcount = FFAppState().newcount + 1;
                                                                              FFAppState().billcount = FFAppState().billcount + 1;
                                                                            } else {
                                                                              FFAppState().count = FFAppState().count + 1;
                                                                              FFAppState().newcount = FFAppState().newcount + 1;
                                                                              FFAppState().billcount = FFAppState().billcount + 1;
                                                                            }

                                                                            _model.prdlinstnewtx =
                                                                                await actions.filterProductsKot(
                                                                              FFAppState().selBill,
                                                                              FFAppState().allBillsList.toList(),
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            if (!isAndroid) {
                                                                              await actions.newCustomAction5();
                                                                            }
                                                                            if (_model.dropDownValue ==
                                                                                'CREDIT') {
                                                                              if (FFAppState().setCustRef?.id != null && FFAppState().setCustRef?.id != '') {
                                                                                if (FFAppState().oldBalance < FFAppState().custCredit) {
                                                                                  _model.totalcredit = await actions.oldbalanceplusamt(
                                                                                    FFAppState().oldBalance,
                                                                                    FFAppState().finalAmt,
                                                                                  );
                                                                                  _shouldSetState = true;

                                                                                  await FFAppState().setCustRef!.update(createPartyRecordData(
                                                                                        credit: true,
                                                                                        oldBalance: valueOrDefault<int>(
                                                                                          _model.totalcredit,
                                                                                          0,
                                                                                        ),
                                                                                        lastVisit: getCurrentTimestamp.millisecondsSinceEpoch.toString(),
                                                                                      ));
                                                                                } else {
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return AlertDialog(
                                                                                        content: Text('Credit Limit Exceeded !'),
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
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      content: Text('Select Customer '),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text('Ok'),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                                scaffoldKey.currentState!.openEndDrawer();
                                                                                if (_shouldSetState) safeSetState(() {});
                                                                                return;
                                                                              }
                                                                            }
                                                                            _model.interprd =
                                                                                await actions.checkInternetConnection();
                                                                            _shouldSetState =
                                                                                true;
                                                                            if (_model.interprd!) {
                                                                              var invoiceRecordReference = InvoiceRecord.createDoc(FFAppState().outletIdRef!);
                                                                              await invoiceRecordReference.set({
                                                                                ...createInvoiceRecordData(
                                                                                  invoice: functions.genInvoiceNum(FFAppState().newcount, FFAppState().shiftDetails.shiftNo),
                                                                                  party: valueOrDefault<String>(
                                                                                    FFAppState().setCustRef?.id,
                                                                                    'NA',
                                                                                  ),
                                                                                  products: '',
                                                                                  invoiceDate: functions.timestampToMili(getCurrentTimestamp),
                                                                                  paymentMode: _model.dropDownValue,
                                                                                  dayId: functions.getDayId(),
                                                                                  discountAmt: valueOrDefault<double>(
                                                                                    FFAppState().disAmt,
                                                                                    0.0,
                                                                                  ),
                                                                                  discountPer: valueOrDefault<double>(
                                                                                    FFAppState().disPer,
                                                                                    0.0,
                                                                                  ),
                                                                                  delliveryChrg: valueOrDefault<double>(
                                                                                    FFAppState().delCharges,
                                                                                    0.0,
                                                                                  ),
                                                                                  taxAmt: FFAppState().taxamt,
                                                                                  billAmt: valueOrDefault<double>(
                                                                                    FFAppState().billAmt,
                                                                                    0.0,
                                                                                  ),
                                                                                  finalBillAmt: valueOrDefault<double>(
                                                                                    FFAppState().finalAmt,
                                                                                    0.0,
                                                                                  ),
                                                                                  shiftId: getJsonField(
                                                                                    FFAppState().shiftDetailsJson,
                                                                                    r'''$.shiftId''',
                                                                                  ).toString(),
                                                                                  isDeleted: false,
                                                                                  count: FFAppState().newcount,
                                                                                ),
                                                                                ...mapToFirestore(
                                                                                  {
                                                                                    'productList': getSelItemListListFirestoreData(
                                                                                      _model.prdlinstnewtx,
                                                                                    ),
                                                                                  },
                                                                                ),
                                                                              });
                                                                              _model.invonlineprt = InvoiceRecord.getDocumentFromData({
                                                                                ...createInvoiceRecordData(
                                                                                  invoice: functions.genInvoiceNum(FFAppState().newcount, FFAppState().shiftDetails.shiftNo),
                                                                                  party: valueOrDefault<String>(
                                                                                    FFAppState().setCustRef?.id,
                                                                                    'NA',
                                                                                  ),
                                                                                  products: '',
                                                                                  invoiceDate: functions.timestampToMili(getCurrentTimestamp),
                                                                                  paymentMode: _model.dropDownValue,
                                                                                  dayId: functions.getDayId(),
                                                                                  discountAmt: valueOrDefault<double>(
                                                                                    FFAppState().disAmt,
                                                                                    0.0,
                                                                                  ),
                                                                                  discountPer: valueOrDefault<double>(
                                                                                    FFAppState().disPer,
                                                                                    0.0,
                                                                                  ),
                                                                                  delliveryChrg: valueOrDefault<double>(
                                                                                    FFAppState().delCharges,
                                                                                    0.0,
                                                                                  ),
                                                                                  taxAmt: FFAppState().taxamt,
                                                                                  billAmt: valueOrDefault<double>(
                                                                                    FFAppState().billAmt,
                                                                                    0.0,
                                                                                  ),
                                                                                  finalBillAmt: valueOrDefault<double>(
                                                                                    FFAppState().finalAmt,
                                                                                    0.0,
                                                                                  ),
                                                                                  shiftId: getJsonField(
                                                                                    FFAppState().shiftDetailsJson,
                                                                                    r'''$.shiftId''',
                                                                                  ).toString(),
                                                                                  isDeleted: false,
                                                                                  count: FFAppState().newcount,
                                                                                ),
                                                                                ...mapToFirestore(
                                                                                  {
                                                                                    'productList': getSelItemListListFirestoreData(
                                                                                      _model.prdlinstnewtx,
                                                                                    ),
                                                                                  },
                                                                                ),
                                                                              }, invoiceRecordReference);
                                                                              _shouldSetState = true;

                                                                              await _model.invonlineprt!.reference.update(createInvoiceRecordData(
                                                                                id: _model.invonlineprt?.reference.id,
                                                                              ));
                                                                            } else {
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    content: Text('Internet Not Available'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                              return;
                                                                            }

                                                                            if (getJsonField(
                                                                              FFAppState().shiftDetailsJson,
                                                                              r'''$.shiftExists''',
                                                                            )) {
                                                                              _model.shiftSummarResultsNew = await actions.calShiftSummary(
                                                                                _model.invonlineprt!,
                                                                                FFAppState().shiftDetailsJson,
                                                                              );
                                                                              _shouldSetState = true;
                                                                              FFAppState().updateShiftDetailsStruct(
                                                                                (e) => e
                                                                                  ..billCount = valueOrDefault<int>(
                                                                                    FFAppState().billcount,
                                                                                    0,
                                                                                  )
                                                                                  ..totalSale = getJsonField(
                                                                                    _model.shiftSummarResultsNew,
                                                                                    r'''$.totalSale''',
                                                                                  )
                                                                                  ..deliveryCharges = getJsonField(
                                                                                    _model.shiftSummarResultsNew,
                                                                                    r'''$.deliveryCharges''',
                                                                                  )
                                                                                  ..tax = getJsonField(
                                                                                    _model.shiftSummarResultsNew,
                                                                                    r'''$.tax''',
                                                                                  )
                                                                                  ..lastBillNo = getJsonField(
                                                                                    _model.shiftSummarResultsNew,
                                                                                    r'''$.lastBillNo''',
                                                                                  ).toString()
                                                                                  ..discount = getJsonField(
                                                                                    _model.shiftSummarResultsNew,
                                                                                    r'''$.discount''',
                                                                                  )
                                                                                  ..lastBillTime = functions.timestampToMili(getCurrentTimestamp)
                                                                                  ..cashSale = getJsonField(
                                                                                    _model.shiftSummarResultsNew,
                                                                                    r'''$.cashSale''',
                                                                                  )
                                                                                  ..paymentJson = getJsonField(
                                                                                    _model.shiftSummarResultsNew,
                                                                                    r'''$.paymentJson''',
                                                                                  ).toString()
                                                                                  ..dayId = getJsonField(
                                                                                    _model.shiftSummarResultsNew,
                                                                                    r'''$.dayId''',
                                                                                  ).toString()
                                                                                  ..shiftId = getJsonField(
                                                                                    _model.shiftSummarResultsNew,
                                                                                    r'''$.shiftId''',
                                                                                  ).toString()
                                                                                  ..hivekey = FFAppState().shiftDetails.hivekey
                                                                                  ..newIDShift = FFAppState().shiftDetails.newIDShift
                                                                                  ..code = FFAppState().shiftDetails.code
                                                                                  ..endTime = FFAppState().shiftDetails.endTime
                                                                                  ..advanceAmtTotal = FFAppState().shiftDetails.advanceAmtTotal
                                                                                  ..customerReciveAmtTotal = FFAppState().shiftDetails.customerReciveAmtTotal
                                                                                  ..expensesAmtTotal = FFAppState().shiftDetails.expensesAmtTotal
                                                                                  ..openingAmt = FFAppState().shiftDetails.openingAmt
                                                                                  ..receiveAmtTotal = FFAppState().shiftDetails.receiveAmtTotal
                                                                                  ..refoundAmount = FFAppState().shiftDetails.refoundAmount
                                                                                  ..roundOff = FFAppState().shiftDetails.roundOff
                                                                                  ..cashInHand = FFAppState().shiftDetails.cashInHand
                                                                                  ..startTime = FFAppState().shiftDetails.startTime
                                                                                  ..inActive = FFAppState().shiftDetails.inActive
                                                                                  ..shiftNo = FFAppState().shiftDetails.shiftNo
                                                                                  ..subTotalBill = FFAppState().shiftDetails.subTotalBill
                                                                                  ..version = FFAppState().shiftDetails.version
                                                                                  ..userId = FFAppState().shiftDetails.userId
                                                                                  ..deviceId = FFAppState().shiftDetails.deviceId
                                                                                  ..synC = FFAppState().shiftDetails.synC
                                                                                  ..id = FFAppState().shiftDetails.id,
                                                                              );
                                                                              if (_model.interprd!) {
                                                                                _model.shiftondataprint = await queryShiftRecordOnce(
                                                                                  parent: FFAppState().outletIdRef,
                                                                                  queryBuilder: (shiftRecord) => shiftRecord.where(
                                                                                    'id',
                                                                                    isEqualTo: valueOrDefault<String>(
                                                                                      getJsonField(
                                                                                        FFAppState().shiftDetailsJson,
                                                                                        r'''$.ref''',
                                                                                      )?.toString(),
                                                                                      'NA',
                                                                                    ),
                                                                                  ),
                                                                                  singleRecord: true,
                                                                                ).then((s) => s.firstOrNull);
                                                                                _shouldSetState = true;

                                                                                await _model.shiftondataprint!.reference.update(createShiftRecordData(
                                                                                  billCount: FFAppState().shiftDetails.billCount,
                                                                                  dayId: getJsonField(
                                                                                    _model.shiftSummarResultsNew,
                                                                                    r'''$.dayId''',
                                                                                  ).toString(),
                                                                                  lastBillNo: getJsonField(
                                                                                    _model.shiftSummarResultsNew,
                                                                                    r'''$.lastBillNo''',
                                                                                  ).toString(),
                                                                                  lastBillTime: functions.timestampToMili(getCurrentTimestamp),
                                                                                  tax: getJsonField(
                                                                                    _model.shiftSummarResultsNew,
                                                                                    r'''$.tax''',
                                                                                  ),
                                                                                  deliveryCharges: getJsonField(
                                                                                    _model.shiftSummarResultsNew,
                                                                                    r'''$.deliveryCharges''',
                                                                                  ),
                                                                                  discount: getJsonField(
                                                                                    _model.shiftSummarResultsNew,
                                                                                    r'''$.discount''',
                                                                                  ),
                                                                                  totalSale: getJsonField(
                                                                                    _model.shiftSummarResultsNew,
                                                                                    r'''$.totalSale''',
                                                                                  ),
                                                                                  cashSale: getJsonField(
                                                                                    _model.shiftSummarResultsNew,
                                                                                    r'''$.cashSale''',
                                                                                  ),
                                                                                  paymentJson: getJsonField(
                                                                                    _model.shiftSummarResultsNew,
                                                                                    r'''$.paymentJson''',
                                                                                  ).toString(),
                                                                                  code: FFAppState().shiftDetails.code,
                                                                                  endTime: FFAppState().shiftDetails.endTime,
                                                                                  advanceAmtTotal: FFAppState().shiftDetails.advanceAmtTotal,
                                                                                  customerReciveAmtTotal: FFAppState().shiftDetails.customerReciveAmtTotal,
                                                                                  expensesAmtTotal: FFAppState().shiftDetails.expensesAmtTotal,
                                                                                  openingAmt: FFAppState().shiftDetails.openingAmt,
                                                                                  receiveAmtTotal: FFAppState().shiftDetails.receiveAmtTotal,
                                                                                  refoundAmount: FFAppState().shiftDetails.refoundAmount,
                                                                                  roundOff: FFAppState().shiftDetails.roundOff,
                                                                                  cashInHand: getJsonField(
                                                                                    _model.shiftSummarResultsNew,
                                                                                    r'''$.cashSale''',
                                                                                  ),
                                                                                  startTime: FFAppState().shiftDetails.startTime,
                                                                                  inActive: FFAppState().shiftDetails.inActive,
                                                                                  shiftNo: FFAppState().shiftDetails.shiftNo,
                                                                                  shiftId: getJsonField(
                                                                                    _model.shiftSummarResultsNew,
                                                                                    r'''$.shiftId''',
                                                                                  ).toString(),
                                                                                ));
                                                                              } else {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      content: Text('Internet Not Available'),
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
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(
                                                                                  content: Text(
                                                                                    'Login again to start Shift ',
                                                                                    style: TextStyle(
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                                  ),
                                                                                  duration: Duration(milliseconds: 4000),
                                                                                  backgroundColor: Color(0x00000000),
                                                                                ),
                                                                              );
                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                              return;
                                                                            }

                                                                            if (!functions.isPrinterSelected(FFAppState().printerDevice)!) {
                                                                              _model.resDevice2 = await actions.scanPrinter(
                                                                                FFAppState().posMode,
                                                                              );
                                                                              _shouldSetState = true;
                                                                            }
                                                                            _model.isconnected =
                                                                                await actions.connectDevice(
                                                                              FFAppState().printerDevice,
                                                                              FFAppState().printerIndex,
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            if (_model.isconnected!) {
                                                                              FFAppState().lastBill = FFAppState().finalAmt;
                                                                              _model.returnedList2 = await actions.selectBillPrint(
                                                                                FFAppState().selBill.toString(),
                                                                                FFAppState().allBillsList.toList(),
                                                                              );
                                                                              _shouldSetState = true;
                                                                              _model.device = await actions.newCustomAction(
                                                                                FFAppState().printerIndex,
                                                                              );
                                                                              _shouldSetState = true;
                                                                              await actions.printBillnewhiveNEW(
                                                                                _model.returnedList2!.toList(),
                                                                                _model.device!.toList(),
                                                                                FFAppState().isPrinterConnected,
                                                                                FFAppState().printerName,
                                                                                _model.invonlineprt!,
                                                                                FFAppState().paperSize,
                                                                                tableListAppSettingsRecord!,
                                                                              );
                                                                              _model.spoutlet = await queryServicePointOutletRecordOnce(
                                                                                parent: FFAppState().outletIdRef,
                                                                              );
                                                                              _shouldSetState = true;
                                                                              if (tableListAppSettingsRecord!.settingList.where((e) => e.title == 'printKotWithBill').toList().firstOrNull!.value) {
                                                                                await actions.printKOTwithusbkioskhive(
                                                                                  _model.returnedList2!.toList(),
                                                                                  _model.device!.toList(),
                                                                                  FFAppState().isPrinterConnected,
                                                                                  FFAppState().printerName,
                                                                                  _model.invonlineprt!,
                                                                                  FFAppState().paperSize,
                                                                                  tableListAppSettingsRecord!,
                                                                                  FFAppState().port,
                                                                                  FFAppState().ipAddresss,
                                                                                  _model.spoutlet!.toList(),
                                                                                );
                                                                              }
                                                                              if (tableListAppSettingsRecord!.settingList.where((e) => e.title == 'enableEthernetPrint').toList().firstOrNull!.value) {
                                                                                await actions.printEthernethive(
                                                                                  _model.returnedList2!.toList(),
                                                                                  _model.device!.toList(),
                                                                                  FFAppState().isPrinterConnected,
                                                                                  FFAppState().printerName,
                                                                                  _model.invonlineprt!,
                                                                                  FFAppState().paperSize,
                                                                                  FFAppState().port,
                                                                                  FFAppState().ipAddresss,
                                                                                  _model.spoutlet!.toList(),
                                                                                  tableListAppSettingsRecord!,
                                                                                );
                                                                              }
                                                                              if (tableListAppSettingsRecord!.settingList.where((e) => e.title == 'enableStock').toList().firstOrNull!.value) {
                                                                                FFAppState().startLoop = 0;
                                                                                while (FFAppState().startLoop < _model.prdlinstnewtx!.length) {
                                                                                  _model.stockupdateprdprt = await queryProductRecordOnce(
                                                                                    parent: FFAppState().outletIdRef,
                                                                                    queryBuilder: (productRecord) => productRecord
                                                                                        .where(
                                                                                          'id',
                                                                                          isEqualTo: (_model.prdlinstnewtx?.elementAtOrNull(FFAppState().startLoop))?.id,
                                                                                        )
                                                                                        .where(
                                                                                          'stockable',
                                                                                          isEqualTo: true,
                                                                                        ),
                                                                                    singleRecord: true,
                                                                                  ).then((s) => s.firstOrNull);
                                                                                  _shouldSetState = true;
                                                                                  if (_model.stockupdateprdprt != null) {
                                                                                    await _model.stockupdateprdprt!.reference.update({
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'currentStock': FieldValue.increment(-(functions.doubleToInt((_model.prdlinstnewtx?.elementAtOrNull(FFAppState().startLoop))?.quantity)!)),
                                                                                        },
                                                                                      ),
                                                                                    });
                                                                                    _model.itemprd2 = await actions.hivegetproductbyId(
                                                                                      _model.stockupdateprdprt?.reference.id,
                                                                                      _model.prdlinstnewtx?.elementAtOrNull(FFAppState().startLoop),
                                                                                      'get',
                                                                                    );
                                                                                    _shouldSetState = true;
                                                                                    FFAppState().updateProductHiveputStruct(
                                                                                      (e) => e
                                                                                        ..id = _model.itemprd2?.id
                                                                                        ..price = _model.itemprd2?.price
                                                                                        ..category = _model.itemprd2?.category
                                                                                        ..code = _model.itemprd2?.code
                                                                                        ..name = _model.itemprd2?.name
                                                                                        ..sellingPrice = _model.itemprd2?.sellingPrice
                                                                                        ..mrpPrice = _model.itemprd2?.mrpPrice
                                                                                        ..purchasePrice = _model.itemprd2?.purchasePrice
                                                                                        ..categoryId = _model.itemprd2?.categoryId
                                                                                        ..taxId = _model.itemprd2?.taxId
                                                                                        ..unitId = _model.itemprd2?.unitId
                                                                                        ..regionalName = _model.itemprd2?.regionalName
                                                                                        ..barcode = _model.itemprd2?.barcode
                                                                                        ..hsncode = _model.itemprd2?.hsncode
                                                                                        ..reorderLevel = _model.itemprd2?.reorderLevel
                                                                                        ..searchcode = _model.itemprd2?.searchcode
                                                                                        ..shortName = _model.itemprd2?.shortName
                                                                                        ..weightable = _model.itemprd2?.weightable
                                                                                        ..stockable = _model.itemprd2?.stockable
                                                                                        ..discountPer = _model.itemprd2?.discountPer
                                                                                        ..discountAmt = _model.itemprd2?.discountAmt
                                                                                        ..productMasterId = _model.itemprd2?.productMasterId
                                                                                        ..recipeRefId = _model.itemprd2?.recipeRefId
                                                                                        ..imageUrl = _model.itemprd2?.imageUrl
                                                                                        ..serviceOutletId = _model.itemprd2?.serviceOutletId
                                                                                        ..type = _model.itemprd2?.type
                                                                                        ..recipeId = _model.itemprd2?.recipeId
                                                                                        ..stock = _model.itemprd2!.stock - (functions.doubleToInt((_model.prdlinstnewtx?.elementAtOrNull(FFAppState().startLoop))?.quantity)!)
                                                                                        ..isDeleted = _model.itemprd2?.isDeleted
                                                                                        ..keywords = _model.itemprd2!.keywords.toList()
                                                                                        ..synC = _model.itemprd2?.synC
                                                                                        ..hivekey = _model.itemprd2?.hivekey
                                                                                        ..version = _model.itemprd2?.version,
                                                                                    );
                                                                                    _model.productupdated2 = await actions.hiveProductCrud(
                                                                                      FFAppState().productHiveput.hivekey,
                                                                                      FFAppState().productHiveput,
                                                                                      'update',
                                                                                    );
                                                                                    _shouldSetState = true;
                                                                                    FFAppState().productHive = [];
                                                                                    FFAppState().productHiveput = ProductStructStruct();
                                                                                    _model.newupdatedproductlist22 = await actions.getProductlistHive();
                                                                                    _shouldSetState = true;
                                                                                    FFAppState().productHive = _model.newupdatedproductlist22!.toList().cast<ProductStructStruct>();
                                                                                  }
                                                                                  FFAppState().startLoop = FFAppState().startLoop + 1;
                                                                                }
                                                                                await actions.updateProductStocknew(
                                                                                  _model.prdlinstnewtx!.toList(),
                                                                                );
                                                                              }
                                                                              await actions.removeFromAllBillList(
                                                                                FFAppState().selBill,
                                                                              );
                                                                              safeSetState(() {
                                                                                _model.dropDownValueController?.value = 'CASH';
                                                                              });
                                                                              _model.prdid = null;
                                                                              await actions.clearValue();
                                                                              FFAppState().subTotal = 0.0;
                                                                              FFAppState().delCharges = 0.0;
                                                                              FFAppState().oldBalance = 0;
                                                                              FFAppState().custCredit = 0;
                                                                              FFAppState().custNameRef = null;
                                                                              FFAppState().setCustRef = null;
                                                                              FFAppState().setCustName = '';
                                                                              FFAppState().setCustMobNo = '';
                                                                              FFAppState().noOfItems = 0;
                                                                              FFAppState().prdid = '';
                                                                              FFAppState().finalAmt = 0.0;
                                                                              FFAppState().billAmt = 0.0;
                                                                              FFAppState().count = FFAppState().billcount;
                                                                              FFAppState().tableViewHideShow = true;
                                                                              safeSetState(() {});
                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                              return;
                                                                            } else {
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    title: Text('printer connection'),
                                                                                    content: Text('printer not connected'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                              return;
                                                                            }

                                                                            if (_shouldSetState)
                                                                              safeSetState(() {});
                                                                          },
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            '9hdy3rfp' /* Print Bill */,
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            width:
                                                                                130.0,
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            textStyle: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).headlineSmallIsCustom,
                                                                                ),
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Colors.transparent,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ).animateOnActionTrigger(
                                                                          animationsMap[
                                                                              'containerOnActionTriggerAnimation9']!,
                                                                          hasBeenTriggered:
                                                                              hasContainerTriggered9),
                                                                ),
                                                              ],
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
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
