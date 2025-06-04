import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'table_v_iew_model.dart';
export 'table_v_iew_model.dart';

class TableVIewWidget extends StatefulWidget {
  const TableVIewWidget({
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
  State<TableVIewWidget> createState() => _TableVIewWidgetState();
}

class _TableVIewWidgetState extends State<TableVIewWidget> {
  late TableVIewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TableVIewModel());

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
            crossAxisCount: 9,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            childAspectRatio: 1.1,
          ),
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
                      isEqualTo: 'PENDING',
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
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: valueOrDefault<Color>(
                        () {
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
                            return FlutterFlowTheme.of(context).tertiary;
                          } else if ('EMPTY' ==
                              getJsonField(
                                tablelistItem,
                                r'''$.status''',
                              ).toString()) {
                            return FlutterFlowTheme.of(context).warning;
                          } else {
                            return Color(0xFFD1CDCD);
                          }
                        }(),
                        Color(0xFFFFE69E),
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 9.0, 0.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.table_bar,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    if ((FFAppState().tableFlag == true) &&
                                        ('${FFAppState().tableNo}' !=
                                            getJsonField(
                                              tablelistItem,
                                              r'''$.id''',
                                            ).toString()))
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
                                              tablelistItem] ??= false,
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
                                              safeSetState(() {});
                                            } else {
                                              FFAppState()
                                                  .removeFromPostableList(
                                                      getJsonField(
                                                tablelistItem,
                                                r'''$.id''',
                                              ).toString());
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
                                  ],
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
                                          ('EMPTY' !=
                                              getJsonField(
                                                tablelistItem,
                                                r'''$.status''',
                                              ).toString())) {
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
                                        FFAppState().tableViewHideShow = false;
                                        FFAppState().tableNo = getJsonField(
                                          tablelistItem,
                                          r'''$.id''',
                                        ).toString();
                                        FFAppState().selectedPremise =
                                            widget!.parameter3!;
                                        FFAppState().kotDocRef = null;
                                        FFAppState().update(() {});
                                      }
                                    },
                                    onLongPress: () async {
                                      if ('MERGED' !=
                                          getJsonField(
                                            tablelistItem,
                                            r'''$.status''',
                                          ).toString()) {
                                        FFAppState().tableFlag = true;
                                        FFAppState().tableNo = getJsonField(
                                          tablelistItem,
                                          r'''$.id''',
                                        ).toString();
                                        FFAppState().selectedPremise =
                                            widget!.parameter3!;
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
                                      height: 100.0,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          if (false)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(3.0, 0.0, 3.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                3.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'rrjrzvc9' /* 45 */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'rzxnfl70' /* Mins */,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .lineColor,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmallIsCustom,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          if (false)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(3.0, 0.0, 3.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'bsswx6co' /* ₹  */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmallFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmallIsCustom,
                                                        ),
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'ir8cwke0' /* 70 */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmallFamily,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmallIsCustom,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          Text(
                                            getJsonField(
                                              tablelistItem,
                                              r'''$.typeName''',
                                            ).toString(),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLargeFamily,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .labelLargeIsCustom,
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
                                                    fontWeight: FontWeight.w600,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .labelLargeIsCustom,
                                                  ),
                                            ),
                                        ],
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
                                      Expanded(
                                        child: FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'usclusxa' /*  */,
                                          ),
                                          icon: Icon(
                                            Icons.print_sharp,
                                            size: 15.0,
                                          ),
                                          options: FFButtonOptions(
                                            height: 30.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
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
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            _model.tablekot =
                                                await queryTableKotRecordOnce(
                                              parent: FFAppState().outletIdRef,
                                              queryBuilder: (tableKotRecord) =>
                                                  tableKotRecord
                                                      .where(
                                                        'tableNo',
                                                        isEqualTo: getJsonField(
                                                          tablelistItem,
                                                          r'''$.id''',
                                                        ).toString(),
                                                      )
                                                      .where(
                                                        'kotStatus',
                                                        isEqualTo: 'PENDING',
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
                                              if (FFAppState().holdBillCount ==
                                                  0) {
                                                FFAppState().holdBillCount =
                                                    FFAppState().holdBillCount +
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
                                              await actions.addToHoldListprdKOT(
                                                FFAppState().selBill,
                                                widget!.taxcollection!.toList(),
                                                functions.enabletaxinclusive(
                                                    widget!
                                                        .apsetting!.settingList
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
                                            'ya7prppr' /*  */,
                                          ),
                                          icon: Icon(
                                            Icons.remove_red_eye_outlined,
                                            size: 15.0,
                                          ),
                                          options: FFButtonOptions(
                                            height: 30.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconAlignment: IconAlignment.start,
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            color: FlutterFlowTheme.of(context)
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
                                                          !FlutterFlowTheme.of(
                                                                  context)
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
