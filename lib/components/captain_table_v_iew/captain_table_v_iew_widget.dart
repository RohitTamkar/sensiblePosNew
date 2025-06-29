import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'captain_table_v_iew_model.dart';
export 'captain_table_v_iew_model.dart';

class CaptainTableVIewWidget extends StatefulWidget {
  const CaptainTableVIewWidget({
    super.key,
    this.parameter3,
    this.taxcollection,
    this.apsetting,
    this.jsonlist,
    this.premisedoc,
  });

  final String? parameter3;
  final List<TaxMasterRecord>? taxcollection;
  final AppSettingsRecord? apsetting;
  final dynamic jsonlist;
  final List<PremisesRecord>? premisedoc;

  @override
  State<CaptainTableVIewWidget> createState() => _CaptainTableVIewWidgetState();
}

class _CaptainTableVIewWidgetState extends State<CaptainTableVIewWidget> {
  late CaptainTableVIewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CaptainTableVIewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) {
        final tablelist = widget!.jsonlist?.toList() ?? [];

        return GridView.builder(
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            childAspectRatio: 0.9,
          ),
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: tablelist.length,
          itemBuilder: (context, tablelistIndex) {
            final tablelistItem = tablelist[tablelistIndex];
            return StreamBuilder<List<TableKotRecord>>(
              stream: queryTableKotRecord(
                parent: FFAppState().outletIdRef,
                queryBuilder: (tableKotRecord) => tableKotRecord
                    .where(
                      'tableNo',
                      isEqualTo: getJsonField(
                        tablelistItem,
                        r'''$.id''',
                      ).toString(),
                    )
                    .where(
                      'kotStatus',
                      isNotEqualTo: 'FINAL',
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
                List<TableKotRecord> containerTableKotRecordList =
                    snapshot.data!;

                return ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    width: 100.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: valueOrDefault<Color>(
                        () {
                          if ((containerTableKotRecordList
                                      .where((e) =>
                                          e.tableNo ==
                                          getJsonField(
                                            tablelistItem,
                                            r'''$.id''',
                                          ).toString())
                                      .toList()
                                      .firstOrNull
                                      ?.tableNo ==
                                  getJsonField(
                                    tablelistItem,
                                    r'''$.id''',
                                  ).toString()) &&
                              (containerTableKotRecordList
                                      .where((e) =>
                                          e.tableNo ==
                                          getJsonField(
                                            tablelistItem,
                                            r'''$.id''',
                                          ).toString())
                                      .toList()
                                      .firstOrNull
                                      ?.kotStatus ==
                                  'PENDING')) {
                            return Color(0xFF9AF286);
                          } else if (containerTableKotRecordList
                                  .where((e) =>
                                      e.tableNo ==
                                      getJsonField(
                                        tablelistItem,
                                        r'''$.id''',
                                      ).toString())
                                  .toList()
                                  .firstOrNull
                                  ?.kotStatus ==
                              'BILLING') {
                            return Color(0xFFF485A2);
                          } else if ('EMPTY' ==
                              getJsonField(
                                tablelistItem,
                                r'''$.status''',
                              ).toString()) {
                            return Color(0xFFFEEB70);
                          } else {
                            return Color(0xFFD1CDCD);
                          }
                        }(),
                        Color(0xFFFFE69E),
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        width: 2.0,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if ((FFAppState().tableFlag == true) &&
                            ('${FFAppState().tableNo}' !=
                                getJsonField(
                                  tablelistItem,
                                  r'''$.id''',
                                ).toString()))
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 3.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'qt4myge0' /* Select Table */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                      Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            visualDensity:
                                                VisualDensity.compact,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                        child: Checkbox(
                                          value: _model.checkboxValueMap[
                                              tablelistItem] ??= FFAppState()
                                                          .postableList
                                                          .where((e) =>
                                                              e ==
                                                              getJsonField(
                                                                tablelistItem,
                                                                r'''$.id''',
                                                              ).toString())
                                                          .toList()
                                                          .firstOrNull !=
                                                      null &&
                                                  FFAppState()
                                                          .postableList
                                                          .where((e) =>
                                                              e ==
                                                              getJsonField(
                                                                tablelistItem,
                                                                r'''$.id''',
                                                              ).toString())
                                                          .toList()
                                                          .firstOrNull !=
                                                      ''
                                              ? true
                                              : false,
                                          onChanged: (newValue) async {
                                            safeSetState(() =>
                                                _model.checkboxValueMap[
                                                    tablelistItem] = newValue!);
                                            if (newValue!) {
                                              FFAppState().addToPostableList(
                                                  getJsonField(
                                                tablelistItem,
                                                r'''$.id''',
                                              ).toString());
                                              FFAppState().prmiseupdate =
                                                  widget!.parameter3!;
                                              safeSetState(() {});
                                            } else {
                                              FFAppState()
                                                  .removeFromPostableList(
                                                      getJsonField(
                                                tablelistItem,
                                                r'''$.id''',
                                              ).toString());
                                              FFAppState().prmiseupdate = '';
                                              safeSetState(() {});
                                            }
                                          },
                                          side: (FlutterFlowTheme.of(context)
                                                      .info !=
                                                  null)
                                              ? BorderSide(
                                                  width: 2,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info!,
                                                )
                                              : null,
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          checkColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 3.0)),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 1.5,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (containerTableKotRecordList
                                              .where((e) =>
                                                  e.tableNo ==
                                                  getJsonField(
                                                    tablelistItem,
                                                    r'''$.id''',
                                                  ).toString())
                                              .toList()
                                              .firstOrNull
                                              ?.tableNo ==
                                          getJsonField(
                                            tablelistItem,
                                            r'''$.id''',
                                          ).toString()) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Table Already In  Use ! ',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                      } else {
                                        if ('EMPTY' ==
                                            getJsonField(
                                              tablelistItem,
                                              r'''$.status''',
                                            ).toString()) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Table Already In  Use ! ',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                        } else {
                                          await actions.removeFromAllBillList(
                                            FFAppState().selBill,
                                          );
                                          await actions.clearValue();
                                          FFAppState().delCharges = 0.0;
                                          FFAppState().kotDocRef = null;
                                          FFAppState().tableViewHideShow = true;
                                          FFAppState().prdid = '';
                                          FFAppState().tableViewHideShow =
                                              false;
                                          FFAppState().tableNo = getJsonField(
                                            tablelistItem,
                                            r'''$.id''',
                                          ).toString();
                                          FFAppState().selectedPremise =
                                              widget!.parameter3!;
                                          FFAppState().kotDocRef = null;
                                          FFAppState().update(() {});

                                          context.pushNamed(
                                            CaptainProductCartWidget.routeName,
                                            queryParameters: {
                                              'taxcollection': serializeParam(
                                                widget!.taxcollection,
                                                ParamType.Document,
                                                isList: true,
                                              ),
                                              'doc': serializeParam(
                                                FFAppState().userdoc,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'taxcollection':
                                                  widget!.taxcollection,
                                            },
                                          );
                                        }
                                      }
                                    },
                                    onLongPress: () async {
                                      if ('MERGED' !=
                                          getJsonField(
                                            tablelistItem,
                                            r'''$.status''',
                                          ).toString()) {
                                        if ('EMPTY' ==
                                            getJsonField(
                                              tablelistItem,
                                              r'''$.status''',
                                            ).toString()) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                content: Text(
                                                    'Already Merged With Other  Tables !'),
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
                                        } else {
                                          FFAppState().tableFlag = true;
                                          FFAppState().tableNo = getJsonField(
                                            tablelistItem,
                                            r'''$.id''',
                                          ).toString();
                                          FFAppState().selectedPremise =
                                              widget!.parameter3!;
                                          FFAppState().kotDocRef =
                                              containerTableKotRecordList
                                                  .where((e) =>
                                                      e.tableNo ==
                                                      getJsonField(
                                                        tablelistItem,
                                                        r'''$.id''',
                                                      ).toString())
                                                  .toList()
                                                  .firstOrNull
                                                  ?.reference;
                                          FFAppState().update(() {});
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                content:
                                                    Text('Choose Tables....'),
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
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Already Merged !'),
                                                      content: Text(
                                                          'Do You Want To Split Tables?'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  false),
                                                          child: Text('Cancel'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  true),
                                                          child:
                                                              Text('Confirm'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (confirmDialogResponse) {
                                          FFAppState().table = functions
                                              .splitMergeTables(
                                                  widget!.premisedoc!.toList(),
                                                  getJsonField(
                                                    tablelistItem,
                                                    r'''$.id''',
                                                  ).toString(),
                                                  widget!.parameter3!,
                                                  (getJsonField(
                                                    tablelistItem,
                                                    r'''$.mergedFrom''',
                                                    true,
                                                  ) as List)
                                                      .map<String>(
                                                          (s) => s.toString())
                                                      .toList()!,
                                                  FFAppState().table.toList())
                                              .toList()
                                              .cast<dynamic>();
                                          FFAppState().update(() {});
                                        }
                                      }
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            if ((containerTableKotRecordList
                                                        .where((e) =>
                                                            e.tableNo ==
                                                            getJsonField(
                                                              tablelistItem,
                                                              r'''$.id''',
                                                            ).toString())
                                                        .toList()
                                                        .firstOrNull
                                                        ?.tableNo ==
                                                    getJsonField(
                                                      tablelistItem,
                                                      r'''$.id''',
                                                    ).toString()) &&
                                                (containerTableKotRecordList
                                                        .where((e) =>
                                                            e.tableNo ==
                                                            getJsonField(
                                                              tablelistItem,
                                                              r'''$.id''',
                                                            ).toString())
                                                        .toList()
                                                        .firstOrNull
                                                        ?.kotStatus !=
                                                    'FINAL'))
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(3.0, 0.0,
                                                                3.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        if (false)
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              functions.totalDuration(containerTableKotRecordList
                                                                  .where((e) =>
                                                                      e.tableNo ==
                                                                      getJsonField(
                                                                        tablelistItem,
                                                                        r'''$.id''',
                                                                      ).toString())
                                                                  .toList()
                                                                  .firstOrNull!
                                                                  .createdDate),
                                                              '0min',
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .lineColor,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmallIsCustom,
                                                                ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(3.0, 0.0,
                                                                3.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '1y6ri0te' /* ₹  */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmallIsCustom,
                                                              ),
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            containerTableKotRecordList
                                                                .where((e) =>
                                                                    e.tableNo ==
                                                                    getJsonField(
                                                                      tablelistItem,
                                                                      r'''$.id''',
                                                                    ).toString())
                                                                .toList()
                                                                .firstOrNull
                                                                ?.finalBillAmt
                                                                ?.toString(),
                                                            '0',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmallIsCustom,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            Text(
                                              getJsonField(
                                                tablelistItem,
                                                r'''$.typeName''',
                                              ).toString(),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelSmall
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmallFamily,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmallIsCustom,
                                                  ),
                                            ),
                                            if (getJsonField(
                                                  tablelistItem,
                                                  r'''$.mergedTables''',
                                                ) !=
                                                null)
                                              Text(
                                                '(${getJsonField(
                                                  tablelistItem,
                                                  r'''$.mergedTables''',
                                                ).toString()})',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelLarge
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLargeFamily,
                                                      color: Color(0xAD5000B6),
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLargeIsCustom,
                                                    ),
                                              ),
                                          ].divide(SizedBox(height: 3.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      if (false)
                                        Expanded(
                                          child: FFButtonWidget(
                                            onPressed: () {
                                              print('Button pressed ...');
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              '3cgj4eoh' /*  */,
                                            ),
                                            icon: Icon(
                                              Icons.print_sharp,
                                              size: 15.0,
                                            ),
                                            options: FFButtonOptions(
                                              height: 30.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMediumIsCustom,
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                            ),
                                          ),
                                        ),
                                      if ((containerTableKotRecordList
                                                  .where((e) =>
                                                      e.tableNo ==
                                                      getJsonField(
                                                        tablelistItem,
                                                        r'''$.id''',
                                                      ).toString())
                                                  .toList()
                                                  .firstOrNull
                                                  ?.tableNo ==
                                              getJsonField(
                                                tablelistItem,
                                                r'''$.id''',
                                              ).toString()) &&
                                          (containerTableKotRecordList
                                                  .where((e) =>
                                                      e.tableNo ==
                                                      getJsonField(
                                                        tablelistItem,
                                                        r'''$.id''',
                                                      ).toString())
                                                  .toList()
                                                  .firstOrNull
                                                  ?.kotStatus !=
                                              'FINAL'))
                                        Expanded(
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              _model.tablekot =
                                                  await queryTableKotRecordOnce(
                                                parent:
                                                    FFAppState().outletIdRef,
                                                queryBuilder:
                                                    (tableKotRecord) =>
                                                        tableKotRecord
                                                            .where(
                                                              'tableNo',
                                                              isEqualTo:
                                                                  getJsonField(
                                                                tablelistItem,
                                                                r'''$.id''',
                                                              ).toString(),
                                                            )
                                                            .where(
                                                              'kotStatus',
                                                              isNotEqualTo:
                                                                  'FINAL',
                                                            ),
                                                singleRecord: true,
                                              ).then((s) => s.firstOrNull);
                                              if (_model.tablekot != null) {
                                                await actions
                                                    .removeFromAllBillList(
                                                  FFAppState().selBill,
                                                );
                                                await actions.clearValue();
                                                FFAppState().delCharges = 0.0;
                                                FFAppState().kotDocRef = null;
                                                FFAppState().tableViewHideShow =
                                                    true;
                                                FFAppState().prdid = '';
                                                if (FFAppState()
                                                        .holdBillCount ==
                                                    0) {
                                                  FFAppState().holdBillCount =
                                                      FFAppState()
                                                              .holdBillCount +
                                                          1;
                                                  FFAppState().addToAllBillsList(
                                                      functions
                                                          .generateBillDetailsJson(
                                                              0.0,
                                                              0.0,
                                                              0.0,
                                                              'CASH',
                                                              0.0,
                                                              0.0,
                                                              FFAppState()
                                                                  .billAmt,
                                                              0.0,
                                                              FFAppState()
                                                                  .finalAmt,
                                                              '0',
                                                              FFAppState()
                                                                  .itemCartList
                                                                  .toList(),
                                                              FFAppState()
                                                                  .holdBillCount));
                                                  FFAppState().selBill = 1;
                                                }
                                                await actions
                                                    .addToHoldListprdKOT(
                                                  FFAppState().selBill,
                                                  widget!.taxcollection!
                                                      .toList(),
                                                  functions.enabletaxinclusive(
                                                      widget!.apsetting!
                                                          .settingList
                                                          .where((e) =>
                                                              e.title ==
                                                              'enableInclusiveTax')
                                                          .toList()
                                                          .firstOrNull!
                                                          .value),
                                                  _model.tablekot!.productList
                                                      .toList(),
                                                );
                                                FFAppState().tableViewHideShow =
                                                    false;
                                                FFAppState().tableNo =
                                                    getJsonField(
                                                  tablelistItem,
                                                  r'''$.id''',
                                                ).toString();
                                                FFAppState().selectedPremise =
                                                    widget!.parameter3!;
                                                FFAppState().kotDocRef =
                                                    _model.tablekot?.reference;

                                                _model.updatePage(() {});

                                                context.goNamed(
                                                  CaptainProductCartWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'taxcollection':
                                                        serializeParam(
                                                      widget!.taxcollection,
                                                      ParamType.Document,
                                                      isList: true,
                                                    ),
                                                    'doc': serializeParam(
                                                      FFAppState().userdoc,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'taxcollection':
                                                        widget!.taxcollection,
                                                  },
                                                );
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Table Is Empty !',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                              'hnkvya6y' /* View */,
                                            ),
                                            icon: Icon(
                                              Icons.remove_red_eye_outlined,
                                              size: 15.0,
                                            ),
                                            options: FFButtonOptions(
                                              height: 30.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconAlignment: IconAlignment.end,
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMediumIsCustom,
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                            ),
                                          ),
                                        ),
                                    ].divide(SizedBox(width: 4.0)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
