import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/captain_table_v_iew/captain_table_v_iew_widget.dart';
import '/components/menu_drawer/menu_drawer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'captain_table_list_model.dart';
export 'captain_table_list_model.dart';

class CaptainTableListWidget extends StatefulWidget {
  const CaptainTableListWidget({
    super.key,
    this.taxcollection,
    this.doc,
  });

  final List<TaxMasterRecord>? taxcollection;
  final DocumentReference? doc;

  static String routeName = 'CaptainTableList';
  static String routePath = 'captainTableList';

  @override
  State<CaptainTableListWidget> createState() => _CaptainTableListWidgetState();
}

class _CaptainTableListWidgetState extends State<CaptainTableListWidget> {
  late CaptainTableListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CaptainTableListModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.hideAppbar();
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
        List<AppSettingsRecord> captainTableListAppSettingsRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final captainTableListAppSettingsRecord =
            captainTableListAppSettingsRecordList.isNotEmpty
                ? captainTableListAppSettingsRecordList.first
                : null;

        return Title(
            title: 'CaptainTableList',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: WillPopScope(
                onWillPop: () async => false,
                child: Scaffold(
                  key: scaffoldKey,
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  drawer: Container(
                    width: MediaQuery.sizeOf(context).width * 0.25,
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
                          appSettings23: captainTableListAppSettingsRecord,
                        ),
                      ),
                    ),
                  ),
                  body: Column(
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
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        scaffoldKey.currentState!.openDrawer();
                                      },
                                      child: Icon(
                                        Icons.dehaze,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        size: 24.0,
                                      ),
                                    ),
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
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodySmallIsCustom,
                                            ),
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        FFAppState().tableViewHideShow = true;
                                        _model.allprdrefresh =
                                            await queryProductRecordOnce(
                                          parent: FFAppState().outletIdRef,
                                        );
                                        _model.prdlist = await actions
                                            .addFirebasetoHiveProduct(
                                          _model.allprdrefresh!.toList(),
                                        );
                                        _model.listcategory =
                                            await queryCategoryRecordOnce(
                                          parent: FFAppState().outletIdRef,
                                        );
                                        _model.cat = await actions
                                            .addFirebasetoHiveCategory(
                                          _model.listcategory!.toList(),
                                        );
                                        _model.hiveProductList25 =
                                            await actions.getProductlistHive();
                                        _model.categoryListHive25 =
                                            await actions.getCategorylistHive();
                                        FFAppState().productHive = _model
                                            .hiveProductList25!
                                            .toList()
                                            .cast<ProductStructStruct>();
                                        _model.premiseDocCopy =
                                            await queryPremisesRecordOnce(
                                          parent: FFAppState().outletIdRef,
                                        );
                                        if (!functions.checkmergedtables(
                                            FFAppState().table.toList())) {
                                          FFAppState().table = functions
                                              .generatePremiseTablesjson(_model
                                                  .premiseDocCopy!
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
                                      text: FFLocalizations.of(context).getText(
                                        'in63rpqv' /*  */,
                                      ),
                                      icon: Icon(
                                        Icons.replay_sharp,
                                        size: 20.0,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleSmallIsCustom,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 5.0)),
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
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 40.0,
                                  ),
                                ),
                              );
                            }
                            List<PremisesRecord> containerPremisesRecordList =
                                snapshot.data!;

                            return Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if (FFAppState().tableFlag)
                                          Expanded(
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              content: Text(
                                                                  'Are You Sure To Merge Tables ?'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: Text(
                                                                      'Cancel'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: Text(
                                                                      'Confirm'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                if (confirmDialogResponse) {
                                                  FFAppState().table = functions
                                                      .generateMergeTables(
                                                          containerPremisesRecordList
                                                              .toList(),
                                                          FFAppState().tableNo,
                                                          FFAppState()
                                                              .selectedPremise,
                                                          FFAppState()
                                                              .postableList
                                                              .toList(),
                                                          FFAppState()
                                                              .table
                                                              .toList())
                                                      .toList()
                                                      .cast<dynamic>();
                                                  FFAppState().tableNo = '';
                                                  FFAppState().postableList =
                                                      [];
                                                  FFAppState().tableFlag =
                                                      false;
                                                  safeSetState(() {});
                                                } else {
                                                  FFAppState().tableNo = '';
                                                  FFAppState().postableList =
                                                      [];
                                                  FFAppState().tableFlag =
                                                      false;
                                                  safeSetState(() {});
                                                }
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '1io45k9h' /* Merge Tables */,
                                              ),
                                              icon: FaIcon(
                                                FontAwesomeIcons.mixer,
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
                                                            0.0, 0.0, 5.0, 0.0),
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
                                                      fontWeight:
                                                          FontWeight.normal,
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
                                          ),
                                        if (FFAppState().tableFlag)
                                          Expanded(
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                if (FFAppState().kotDocRef !=
                                                    null) {
                                                  if (FFAppState()
                                                          .postableList
                                                          .length ==
                                                      1) {
                                                    var confirmDialogResponse =
                                                        await showDialog<bool>(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  content: Text(
                                                                      'Are You Sure To Move Table Kot Orders?'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                      child: Text(
                                                                          'Cancel'),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                      child: Text(
                                                                          'Confirm'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ) ??
                                                            false;
                                                    if (confirmDialogResponse) {
                                                      await FFAppState()
                                                          .kotDocRef!
                                                          .update(
                                                              createTableKotRecordData(
                                                            tableNo: FFAppState()
                                                                .postableList
                                                                .firstOrNull,
                                                            premiseName:
                                                                FFAppState()
                                                                    .prmiseupdate,
                                                          ));
                                                      FFAppState().tableNo = '';
                                                      FFAppState()
                                                          .postableList = [];
                                                      FFAppState().tableFlag =
                                                          false;
                                                      FFAppState().kotDocRef =
                                                          null;
                                                      safeSetState(() {});
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Table Kot Move Successfully !',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                    } else {
                                                      FFAppState().tableNo = '';
                                                      FFAppState()
                                                          .postableList = [];
                                                      FFAppState().tableFlag =
                                                          false;
                                                      FFAppState().kotDocRef =
                                                          null;
                                                      FFAppState()
                                                          .update(() {});
                                                    }
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          content: Text(
                                                              'Choose Single Table Only !'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  }
                                                } else {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        content: Text(
                                                            'Table Is Empty !'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                }
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'pzy7q28j' /* Move Kot */,
                                              ),
                                              icon: Icon(
                                                Icons.move_down,
                                                size: 18.0,
                                              ),
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 5.0, 0.0),
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
                                                      fontWeight:
                                                          FontWeight.normal,
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
                                          ),
                                      ].divide(SizedBox(width: 5.0)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if (FFAppState().tableFlag)
                                          Expanded(
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                FFAppState().tableNo = '';
                                                FFAppState().postableList = [];
                                                FFAppState().tableFlag = false;
                                                FFAppState().kotDocRef = null;
                                                safeSetState(() {});
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'f4pqpfvb' /* Cancel */,
                                              ),
                                              icon: Icon(
                                                Icons.cancel_rounded,
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
                                                            0.0, 0.0, 5.0, 0.0),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
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
                                          ),
                                      ].divide(SizedBox(width: 5.0)),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          child: Builder(
                                            builder: (context) {
                                              final json =
                                                  FFAppState().table.toList();

                                              return ListView.separated(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: json.length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(height: 25.0),
                                                itemBuilder:
                                                    (context, jsonIndex) {
                                                  final jsonItem =
                                                      json[jsonIndex];
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFD8D9F0),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        7.0,
                                                                        10.0,
                                                                        7.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  getJsonField(
                                                                    jsonItem,
                                                                    r'''$.premise''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        CaptainTableVIewWidget(
                                                          key: Key(
                                                              'Keyoyg_${jsonIndex}_of_${json.length}'),
                                                          parameter3:
                                                              getJsonField(
                                                            jsonItem,
                                                            r'''$.premise''',
                                                          ).toString(),
                                                          taxcollection: widget!
                                                              .taxcollection,
                                                          apsetting:
                                                              captainTableListAppSettingsRecord,
                                                          jsonlist:
                                                              getJsonField(
                                                            jsonItem,
                                                            r'''$.type''',
                                                          ),
                                                          premisedoc:
                                                              containerPremisesRecordList,
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 10.0)),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 5.0)),
                                ),
                              ),
                            );
                          },
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
