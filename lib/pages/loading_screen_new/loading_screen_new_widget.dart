import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/opening_bal_new/opening_bal_new_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'loading_screen_new_model.dart';
export 'loading_screen_new_model.dart';

class LoadingScreenNewWidget extends StatefulWidget {
  const LoadingScreenNewWidget({
    super.key,
    this.shiftDoc,
    this.userDoc,
    this.appSettingDoc,
    this.outletRef,
  });

  final dynamic shiftDoc;
  final DocumentReference? userDoc;
  final AppSettingsRecord? appSettingDoc;
  final DocumentReference? outletRef;

  static String routeName = 'loadingScreenNew';
  static String routePath = 'loadingScreenNew';

  @override
  State<LoadingScreenNewWidget> createState() => _LoadingScreenNewWidgetState();
}

class _LoadingScreenNewWidgetState extends State<LoadingScreenNewWidget> {
  late LoadingScreenNewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingScreenNewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.internetconnection = await actions.checkInternetConnection();
      if (true) {
        _model.productListCopy = await queryProductRecordOnce(
          parent: FFAppState().outletIdRef,
        );
        _model.categoryList = await queryCategoryRecordOnce(
          parent: FFAppState().outletIdRef,
        );
        _model.index = await actions.addFirebasetoHiveCategory(
          _model.categoryList!.toList(),
        );
        _model.pindex = await actions.addFirebasetoHiveProduct(
          _model.productListCopy!.toList(),
        );
        _model.invcode = await queryInvoiceRecordOnce(
          parent: FFAppState().outletIdRef,
          queryBuilder: (invoiceRecord) =>
              invoiceRecord.orderBy('invoiceDate', descending: true),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        _model.invcodeneww2 = await queryInvoiceRecordOnce(
          parent: FFAppState().outletIdRef,
          queryBuilder: (invoiceRecord) => invoiceRecord
              .where(
                'dayId',
                isEqualTo: dateTimeFormat(
                  "yyyy-MM-dd",
                  getCurrentTimestamp,
                  locale: FFLocalizations.of(context).languageCode,
                ),
              )
              .where(
                'isDeleted',
                isEqualTo: false,
              )
              .orderBy('count', descending: true),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        _model.isAppSetExistsNew = await queryAppSettingsRecordOnce(
          parent: FFAppState().outletIdRef,
          queryBuilder: (appSettingsRecord) => appSettingsRecord.where(
            'deviceId',
            isEqualTo: FFAppState().dId,
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        _model.taxcollection = await queryTaxMasterRecordOnce();
        _model.paymentmode = await queryPaymentModeRecordOnce();
        _model.masterAppsetting = await queryAppSettingsMasterRecordOnce();
        if (_model.isAppSetExistsNew != null) {
          FFAppState().appSettings = _model.isAppSetExistsNew!.settingList
              .toList()
              .cast<AppSettingsStruct>();
          safeSetState(() {});
          _model.returnAppsettiing2 = await actions.returnAppsetting(
            _model.masterAppsetting!.toList(),
            FFAppState().appSettings.toList(),
          );

          await _model.isAppSetExistsNew!.reference.update({
            ...mapToFirestore(
              {
                'settingList': getAppSettingsListFirestoreData(
                  _model.returnAppsettiing2,
                ),
              },
            ),
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'App Settings Updated !',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).info,
            ),
          );
        } else {
          _model.returnAppsettiing = await actions.returnAppsetting(
            _model.masterAppsetting!.toList(),
            FFAppState().appSettings.toList(),
          );

          var appSettingsRecordReference =
              AppSettingsRecord.createDoc(FFAppState().outletIdRef!);
          await appSettingsRecordReference.set({
            ...createAppSettingsRecordData(
              deviceId: FFAppState().dId,
            ),
            ...mapToFirestore(
              {
                'settingList': getAppSettingsListFirestoreData(
                  _model.returnAppsettiing,
                ),
              },
            ),
          });
          _model.doc = AppSettingsRecord.getDocumentFromData({
            ...createAppSettingsRecordData(
              deviceId: FFAppState().dId,
            ),
            ...mapToFirestore(
              {
                'settingList': getAppSettingsListFirestoreData(
                  _model.returnAppsettiing,
                ),
              },
            ),
          }, appSettingsRecordReference);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'App Settings Created !',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).info,
            ),
          );
        }

        _model.devicew = await queryAppSettingsRecordOnce(
          parent: FFAppState().outletIdRef,
          queryBuilder: (appSettingsRecord) => appSettingsRecord.where(
            'deviceId',
            isEqualTo: FFAppState().dId,
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        if (_model.devicew!.settingList
            .where((e) => e.title == 'enableCombo')
            .toList()
            .firstOrNull!
            .value) {
          if (_model.invcodeneww2?.count != null) {
            FFAppState().newcount = _model.invcodeneww2!.count;
            FFAppState().countLaundryForContinuesIncrement =
                valueOrDefault<int>(
              functions.returncountnewLaundry(valueOrDefault<String>(
                _model.invcodeneww2?.count?.toString(),
                '0',
              )),
              0,
            );
            safeSetState(() {});
          } else {
            FFAppState().newcount = 0;
            FFAppState().countLaundryForContinuesIncrement = 0;
            safeSetState(() {});
          }
        } else {
          if ((_model.invcode?.count != null) &&
              (_model.invcode?.shiftId ==
                  getJsonField(
                    widget!.shiftDoc,
                    r'''$.shiftId''',
                  ).toString().toString())) {
            FFAppState().newcount = _model.invcode!.count;
            FFAppState().countLaundryForContinuesIncrement =
                valueOrDefault<int>(
              functions.returncountnewLaundry(valueOrDefault<String>(
                _model.invcode?.invoice,
                '0',
              )),
              0,
            );
            safeSetState(() {});
          } else {
            FFAppState().newcount = 0;
            FFAppState().countLaundryForContinuesIncrement = 0;
            safeSetState(() {});
          }
        }

        if (_model.devicew!.settingList
            .where((e) => e.title == 'enableDualDisplayWindows')
            .toList()
            .firstOrNull!
            .value) {
          _model.instantTimer = InstantTimer.periodic(
            duration: Duration(milliseconds: 1000),
            callback: (timer) async {
              await actions.enableDualDisplay(
                context,
              );
            },
            startImmediately: true,
          );
        }
        if (_model.devicew!.settingList
            .where((e) => e.title == 'enableTables')
            .toList()
            .firstOrNull!
            .value) {
          _model.premises = await queryPremisesRecordOnce(
            parent: FFAppState().outletIdRef,
          );
          _model.tablekot = await queryTableJsonRecordOnce(
            parent: FFAppState().outletIdRef,
            singleRecord: true,
          ).then((s) => s.firstOrNull);
          if (_model.tablekot != null) {
            if (!functions.checkmergedtables(
                functions.stringToJson(_model.tablekot!.tableJson).toList())) {
              await _model.tablekot!.reference.update(createTableJsonRecordData(
                tableJson: functions.jsonToString(functions
                    .generatePremiseTablesjson(_model.premises!.toList())
                    .toList()),
              ));
            }
            FFAppState().docrefTable = _model.tablekot?.reference;
            safeSetState(() {});
          } else {
            var tableJsonRecordReference =
                TableJsonRecord.createDoc(FFAppState().outletIdRef!);
            await tableJsonRecordReference.set(createTableJsonRecordData(
              tableJson: functions.jsonToString(functions
                  .generatePremiseTablesjson(_model.premises!.toList())
                  .toList()),
            ));
            _model.doctoable = TableJsonRecord.getDocumentFromData(
                createTableJsonRecordData(
                  tableJson: functions.jsonToString(functions
                      .generatePremiseTablesjson(_model.premises!.toList())
                      .toList()),
                ),
                tableJsonRecordReference);
            FFAppState().docrefTable = _model.doctoable?.reference;
            safeSetState(() {});
          }

          _model.tablekotupdated = await queryTableJsonRecordOnce(
            parent: FFAppState().outletIdRef,
            singleRecord: true,
          ).then((s) => s.firstOrNull);
          FFAppState().table = functions
              .stringToJson(_model.tablekotupdated!.tableJson)
              .toList()
              .cast<dynamic>();
          safeSetState(() {});
        }
        if (FFAppState().navigate == 'CAPTAINAPP') {
          _model.tacx = await queryTaxMasterRecordOnce();

          context.pushNamed(
            CaptainTableListWidget.routeName,
            queryParameters: {
              'taxcollection': serializeParam(
                _model.tacx,
                ParamType.Document,
                isList: true,
              ),
              'doc': serializeParam(
                widget!.userDoc,
                ParamType.DocumentReference,
              ),
            }.withoutNulls,
            extra: <String, dynamic>{
              'taxcollection': _model.tacx,
            },
          );
        } else {
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            barrierColor: Color(0x00000000),
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
                    height: double.infinity,
                    child: OpeningBalNewWidget(
                      doc: widget!.userDoc,
                      shiftDetails: widget!.shiftDoc,
                    ),
                  ),
                ),
              );
            },
          ).then((value) => safeSetState(() {}));
        }
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('Alert'),
              content: Text('check internet connection !'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );

        context.pushNamed(WelcomeScreenNewWidget.routeName);
      }
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

    return Title(
        title: 'loadingScreenNew',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StreamBuilder<List<OutletRecord>>(
                  stream: queryOutletRecord(
                    queryBuilder: (outletRecord) => outletRecord.where(
                      'id',
                      isEqualTo: FFAppState().outletIdRef?.id,
                    ),
                    singleRecord: true,
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
                    List<OutletRecord> containerOutletRecordList =
                        snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final containerOutletRecord =
                        containerOutletRecordList.isNotEmpty
                            ? containerOutletRecordList.first
                            : null;

                    return Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Container(
                                      width: 85.0,
                                      height: 85.0,
                                      decoration: BoxDecoration(),
                                      child: Image.asset(
                                        'assets/images/IMG_20220412_140945.png',
                                        width: 100.0,
                                        height: 160.0,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'm86t7err' /* SENSIBLE */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .displaySmallFamily,
                                            fontSize: 36.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .displaySmallIsCustom,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'cobqr1nn' /* CONNECT */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmallFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 5.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .headlineSmallIsCustom,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.8,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.2,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.9,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.05,
                                          child: custom_widgets.ProgressBar(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.9,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.05,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (FFAppState().targetPlatform == 'windows')
                            Expanded(
                              flex: 5,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 15.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  containerOutletRecord?.name,
                                                  'Sensible',
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .displaySmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .displaySmallFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .displaySmallIsCustom,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 5.0, 0.0),
                                                  child: LinearPercentIndicator(
                                                    percent: 0.9,
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.3,
                                                    lineHeight: 22.0,
                                                    animation: true,
                                                    animateFromLastPercent:
                                                        true,
                                                    progressColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .tertiary,
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .customColor2,
                                                    center: Text(
                                                      functions.subscriptionDays(
                                                          getCurrentTimestamp,
                                                          containerOutletRecord!
                                                              .renewalDate),
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
                                                    barRadius:
                                                        Radius.circular(20.0),
                                                    padding: EdgeInsets.zero,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 5.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'hiha89an' /* Remaining Days */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmallIsCustom,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.08,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
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
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
