import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/qty_edit_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
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
import 'product_and_list_stockout_model.dart';
export 'product_and_list_stockout_model.dart';

class ProductAndListStockoutWidget extends StatefulWidget {
  const ProductAndListStockoutWidget({
    super.key,
    this.billDetails,
    this.doc,
    this.shiftDetails,
    required this.taxcollection,
  });

  final DocumentReference? billDetails;
  final DocumentReference? doc;
  final dynamic shiftDetails;
  final List<TaxMasterRecord>? taxcollection;

  static String routeName = 'ProductAndListStockout';
  static String routePath = 'productAndListStockout';

  @override
  State<ProductAndListStockoutWidget> createState() =>
      _ProductAndListStockoutWidgetState();
}

class _ProductAndListStockoutWidgetState
    extends State<ProductAndListStockoutWidget> with TickerProviderStateMixin {
  late ProductAndListStockoutModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasContainerTriggered1 = false;
  var hasContainerTriggered2 = false;
  var hasContainerTriggered3 = false;
  var hasContainerTriggered4 = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductAndListStockoutModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.hideStatusBar();
      FFAppState().shiftDocExists = getJsonField(
        widget!.shiftDetails,
        r'''$.shiftExists''',
      );
      FFAppState().update(() {});
      FFAppState().shiftDetailsNEw = widget!.shiftDetails!;
      safeSetState(() {});
      FFAppState().shiftDetailsJson = widget!.shiftDetails!;
      FFAppState().shiftdetails = widget!.shiftDetails!;
      safeSetState(() {});
      _model.hiveProductList = await actions.getProductlistHive();
      _model.categoryListHive = await actions.getCategorylistHive();
      FFAppState().productHive =
          _model.hiveProductList!.toList().cast<ProductStructStruct>();
      safeSetState(() {});
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

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
      stream: queryAppSettingsRecord(
        parent: FFAppState().outletIdRef,
        queryBuilder: (appSettingsRecord) => appSettingsRecord.where(
          'deviceId',
          isEqualTo: FFAppState().dId,
        ),
        singleRecord: true,
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
        List<AppSettingsRecord> productAndListStockoutAppSettingsRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final productAndListStockoutAppSettingsRecord =
            productAndListStockoutAppSettingsRecordList.isNotEmpty
                ? productAndListStockoutAppSettingsRecordList.first
                : null;

        return Title(
            title: 'ProductAndListStockout',
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
                  body: FutureBuilder<List<UnitTypeRecord>>(
                    future: queryUnitTypeRecordOnce(),
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
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsets.all(3.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.05,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.05,
                                    decoration: BoxDecoration(),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await actions.removeFromAllBillList(
                                          FFAppState().selBill,
                                        );
                                        _model.paymentmode =
                                            await queryPaymentModeRecordOnce();
                                        _model.taxcollection23 =
                                            await queryTaxMasterRecordOnce();
                                        if (FFAppState().navigate ==
                                            'GROCERY') {
                                          context.goNamed(
                                            BillingGroceryNewWidget.routeName,
                                            queryParameters: {
                                              'shiftdetail': serializeParam(
                                                FFAppState().shiftDetailsNEw,
                                                ParamType.JSON,
                                              ),
                                              'taxDetails': serializeParam(
                                                _model.taxcollection23,
                                                ParamType.Document,
                                                isList: true,
                                              ),
                                              'userref': serializeParam(
                                                FFAppState().userdoc,
                                                ParamType.DocumentReference,
                                              ),
                                              'paymentMode': serializeParam(
                                                _model.paymentmode,
                                                ParamType.Document,
                                                isList: true,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'taxDetails':
                                                  _model.taxcollection23,
                                              'paymentMode': _model.paymentmode,
                                            },
                                          );
                                        } else if (productAndListStockoutAppSettingsRecord!
                                            .settingList
                                            .where((e) =>
                                                e.title == 'enableweightScale')
                                            .toList()
                                            .firstOrNull!
                                            .value) {
                                          context.pushNamed(
                                            ProductAndListlaundrybillingWidget
                                                .routeName,
                                            queryParameters: {
                                              'billDetails': serializeParam(
                                                widget!.billDetails,
                                                ParamType.DocumentReference,
                                              ),
                                              'doc': serializeParam(
                                                FFAppState().userdoc,
                                                ParamType.DocumentReference,
                                              ),
                                              'shiftDetails': serializeParam(
                                                FFAppState().shiftDetailsNEw,
                                                ParamType.JSON,
                                              ),
                                              'taxcollection': serializeParam(
                                                _model.taxcollection23,
                                                ParamType.Document,
                                                isList: true,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'taxcollection':
                                                  _model.taxcollection23,
                                            },
                                          );
                                        } else if (productAndListStockoutAppSettingsRecord!
                                            .settingList
                                            .where(
                                                (e) => e.title == 'enableCombo')
                                            .toList()
                                            .firstOrNull!
                                            .value) {
                                          context.pushNamed(
                                            ProductComboBillingWidget.routeName,
                                            queryParameters: {
                                              'taxcollection': serializeParam(
                                                _model.taxcollection23,
                                                ParamType.Document,
                                                isList: true,
                                              ),
                                              'billDetails': serializeParam(
                                                widget!.billDetails,
                                                ParamType.DocumentReference,
                                              ),
                                              'doc': serializeParam(
                                                FFAppState().userdoc,
                                                ParamType.DocumentReference,
                                              ),
                                              'shiftDetails': serializeParam(
                                                FFAppState().shiftDetailsNEw,
                                                ParamType.JSON,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'taxcollection':
                                                  _model.taxcollection23,
                                            },
                                          );
                                        } else if (productAndListStockoutAppSettingsRecord!
                                            .settingList
                                            .where((e) =>
                                                e.title == 'enableTables')
                                            .toList()
                                            .firstOrNull!
                                            .value) {
                                          context.pushNamed(
                                            TableListWidget.routeName,
                                            queryParameters: {
                                              'shiftDetails': serializeParam(
                                                FFAppState().shiftDetailsJson,
                                                ParamType.JSON,
                                              ),
                                              'taxcollection': serializeParam(
                                                _model.taxcollection23,
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
                                                  _model.taxcollection23,
                                            },
                                          );
                                        } else {
                                          context.pushNamed(
                                            ProductAndListNewWidget.routeName,
                                            queryParameters: {
                                              'billDetails': serializeParam(
                                                widget!.billDetails,
                                                ParamType.DocumentReference,
                                              ),
                                              'doc': serializeParam(
                                                FFAppState().userdoc,
                                                ParamType.DocumentReference,
                                              ),
                                              'shiftDetails': serializeParam(
                                                FFAppState().shiftDetailsNEw,
                                                ParamType.JSON,
                                              ),
                                              'taxcollection': serializeParam(
                                                _model.taxcollection23,
                                                ParamType.Document,
                                                isList: true,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'taxcollection':
                                                  _model.taxcollection23,
                                            },
                                          );
                                        }

                                        safeSetState(() {});
                                      },
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 28.0,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 100.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.06,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                width: 100.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  3.0,
                                                                  0.0),
                                                      child: Text(
                                                        FFAppState().outletName,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBtnText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmallIsCustom,
                                                                ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  6.0,
                                                                  0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'ugsoeb1p' /* Admin */,
                                                        ),
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
                                                                      .secondary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmallIsCustom,
                                                                ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 200.0,
                                                      height: 40.0,
                                                      child: custom_widgets
                                                          .Datetimecountdown(
                                                        width: 200.0,
                                                        height: 40.0,
                                                        parameter: 0,
                                                      ),
                                                    ),
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        _model.allprdrefresh =
                                                            await queryProductRecordOnce(
                                                          parent: FFAppState()
                                                              .outletIdRef,
                                                        );
                                                        _model.prdlist =
                                                            await actions
                                                                .addFirebasetoHiveProduct(
                                                          _model.allprdrefresh!
                                                              .toList(),
                                                        );
                                                        _model.listcategory =
                                                            await queryCategoryRecordOnce(
                                                          parent: FFAppState()
                                                              .outletIdRef,
                                                        );
                                                        _model.cat = await actions
                                                            .addFirebasetoHiveCategory(
                                                          _model.listcategory!
                                                              .toList(),
                                                        );
                                                        _model.prdhive2refresh =
                                                            await actions
                                                                .getProductlistHive();
                                                        _model.catlistrefresh =
                                                            await actions
                                                                .getCategorylistHive();
                                                        FFAppState()
                                                            .categoryColor = '';
                                                        FFAppState()
                                                            .categoryID = '';
                                                        FFAppState()
                                                                .catAllColor =
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary;
                                                        FFAppState()
                                                                .outletCatRef =
                                                            FFAppState().catRef;
                                                        FFAppState()
                                                                .productHive =
                                                            _model
                                                                .prdhive2refresh!
                                                                .toList()
                                                                .cast<
                                                                    ProductStructStruct>();
                                                        FFAppState()
                                                                .categoryHive =
                                                            _model
                                                                .catlistrefresh!
                                                                .toList()
                                                                .cast<
                                                                    CategoryStructStruct>();
                                                        safeSetState(() {});

                                                        safeSetState(() {});
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'h5nu6kh1' /*  */,
                                                      ),
                                                      icon: Icon(
                                                        Icons.refresh_sharp,
                                                        size: 20.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsets.all(2.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        textStyle:
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
                                                        elevation: 0.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onLongPress: () async {
                                                    FFAppState().newcount = 0;
                                                    safeSetState(() {});
                                                  },
                                                  child: Text(
                                                    FFAppState().userName,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 3.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      flex: 18,
                                      child: Container(
                                        width: 100.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.065,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .customColor2,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              flex: 19,
                                              child: Container(
                                                width: 100.0,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.08,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4.0,
                                                      color: Color(0x32000000),
                                                      offset: Offset(
                                                        0.0,
                                                        2.0,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 750.0,
                                                      height: 50.0,
                                                      child: custom_widgets
                                                          .SearchHiveprd(
                                                        width: 750.0,
                                                        height: 50.0,
                                                        billno: FFAppState()
                                                            .selBill,
                                                        document: FFAppState()
                                                            .productHive,
                                                        billnum: FFAppState()
                                                            .selBill
                                                            .toString(),
                                                        disAmt:
                                                            FFAppState().disAmt,
                                                        delChargs: FFAppState()
                                                            .delCharges,
                                                        taxcollection: widget!
                                                            .taxcollection!,
                                                        appSettingsRecord:
                                                            productAndListStockoutAppSettingsRecord!,
                                                        purchase: false,
                                                        unitcollection:
                                                            containerUnitTypeRecordList,
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
                                    Expanded(
                                      flex: 10,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            3.0, 0.0, 0.0, 0.0),
                                        child: Container(
                                          width: 100.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.065,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
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
                                                  FFAppState().update(() {});
                                                },
                                                child: Container(
                                                  width: 36.0,
                                                  height: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                3.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      buttonSize: 35.0,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      icon: Icon(
                                                        Icons.add,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 16.0,
                                                      ),
                                                      onPressed: () {
                                                        print(
                                                            'IconButton pressed ...');
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Builder(
                                                  builder: (context) {
                                                    final holdListPL =
                                                        FFAppState()
                                                            .allBillsList
                                                            .map((e) =>
                                                                getJsonField(
                                                                  e,
                                                                  r'''$''',
                                                                ))
                                                            .toList();

                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount:
                                                          holdListPL.length,
                                                      itemBuilder: (context,
                                                          holdListPLIndex) {
                                                        final holdListPLItem =
                                                            holdListPL[
                                                                holdListPLIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      3.0,
                                                                      0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              FFAppState()
                                                                  .activeHoldBill = [];
                                                              FFAppState()
                                                                  .addToActiveHoldBill(
                                                                      getJsonField(
                                                                holdListPLItem,
                                                                r'''$.billno''',
                                                              ));
                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                              FFAppState()
                                                                      .selBill =
                                                                  getJsonField(
                                                                holdListPLItem,
                                                                r'''$.billno''',
                                                              );
                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                              _model.res11 =
                                                                  await actions
                                                                      .calSubTotalForHoldList(
                                                                FFAppState()
                                                                    .selBill
                                                                    .toString(),
                                                                FFAppState()
                                                                    .allBillsList
                                                                    .toList(),
                                                              );
                                                              await actions
                                                                  .calBillAmt(
                                                                FFAppState()
                                                                    .disAmt,
                                                                FFAppState()
                                                                    .delCharges,
                                                              );
                                                              FFAppState()
                                                                      .holdListColor =
                                                                  getJsonField(
                                                                holdListPLItem,
                                                                r'''$.billno''',
                                                              );
                                                              FFAppState()
                                                                  .update(
                                                                      () {});

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            onLongPress:
                                                                () async {
                                                              var confirmDialogResponse =
                                                                  await showDialog<
                                                                          bool>(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                Text('Delete Bill..?'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                child: Text('Cancel'),
                                                                              ),
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                child: Text('Confirm'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      ) ??
                                                                      false;
                                                              if (confirmDialogResponse) {
                                                                await actions
                                                                    .removeFromAllBillList(
                                                                  getJsonField(
                                                                    holdListPLItem,
                                                                    r'''$.billno''',
                                                                  ),
                                                                );
                                                              } else {
                                                                return;
                                                              }
                                                            },
                                                            child: Container(
                                                              width: 40.0,
                                                              height: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: getJsonField(
                                                                          holdListPLItem,
                                                                          r'''$.billno''',
                                                                        ) ==
                                                                        FFAppState().holdListColor
                                                                    ? FlutterFlowTheme.of(context).alternate
                                                                    : FlutterFlowTheme.of(context).tertiary,
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            7.0,
                                                                            0.0,
                                                                            7.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      getJsonField(
                                                                        holdListPLItem,
                                                                        r'''$.billno''',
                                                                      ).toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).headlineSmallIsCustom,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
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
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.04,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    width: 0.5,
                                                  ),
                                                ),
                                                child: FlutterFlowIconButton(
                                                  icon: Icon(
                                                    Icons.auto_delete,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 20.0,
                                                  ),
                                                  onPressed: () async {
                                                    var confirmDialogResponse =
                                                        await showDialog<bool>(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'Delete All Bills..?'),
                                                                  content: Text(
                                                                      'Are you sure you want to delete all Bills..'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                      child: Text(
                                                                          'cancle'),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                      child: Text(
                                                                          'confirm'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ) ??
                                                            false;
                                                    if (!confirmDialogResponse) {
                                                      return;
                                                    }
                                                    FFAppState().holdBillCount =
                                                        0;
                                                    FFAppState().allBillsList =
                                                        [];
                                                    FFAppState().update(() {});
                                                    FFAppState().itemCartList =
                                                        [];
                                                    FFAppState().update(() {});
                                                    await actions.clearValue();
                                                    FFAppState().noOfItems = 0;
                                                    FFAppState().update(() {});
                                                    FFAppState().prdid = '';
                                                    safeSetState(() {});
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 3.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 18,
                                        child: Container(
                                          width: 100.0,
                                          height: double.infinity,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            3.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.115,
                                                                      height: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                1.5),
                                                                            child:
                                                                                InkWell(
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
                                                                                          '7o9mheaw' /* All */,
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
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                              child: Container(
                                                                                width: double.infinity,
                                                                                height: 100.0,
                                                                                decoration: BoxDecoration(),
                                                                                child: Builder(
                                                                                  builder: (context) {
                                                                                    final categoryList = (productAndListStockoutAppSettingsRecord!.settingList.where((e) => e.title == 'sortCategoryByCode').toList().firstOrNull!.value ? FFAppState().categoryHive.sortedList(keyOf: (e) => e.code, desc: false) : FFAppState().categoryHive.sortedList(keyOf: (e) => e.name, desc: false)).toList();

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
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100.0,
                                                                      height: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                EdgeInsets.all(1.0),
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(),
                                                                              child: Builder(
                                                                                builder: (context) {
                                                                                  final productList = (productAndListStockoutAppSettingsRecord!.settingList.where((e) => e.title == 'sortProductByCode').toList().firstOrNull!.value ? FFAppState().productHive.sortedList(keyOf: (e) => e.code, desc: false).where((e) => e.stockable).toList() : FFAppState().productHive.sortedList(keyOf: (e) => e.name, desc: false).where((e) => e.stockable).toList()).toList();
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
                                                                                            if (!productAndListStockoutAppSettingsRecord!.settingList.where((e) => e.title == 'showProductImage').toList().firstOrNull!.value)
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

                                                                                                  _model.qtyunitresult = await actions.addToHoldListprdbarcode(
                                                                                                    productListItem,
                                                                                                    FFAppState().selBill,
                                                                                                    widget!.taxcollection!.toList(),
                                                                                                    functions.enabletaxinclusive(productAndListStockoutAppSettingsRecord!.settingList.where((e) => e.title == 'enableInclusiveTax').toList().firstOrNull!.value),
                                                                                                    containerUnitTypeRecordList.toList(),
                                                                                                    false,
                                                                                                  );
                                                                                                  _shouldSetState = true;
                                                                                                  _model.calculateResult23 = await actions.calSubTotalForHoldListkiosk(
                                                                                                    FFAppState().selBill.toString(),
                                                                                                    FFAppState().allBillsList.toList(),
                                                                                                    functions.enabletaxinclusive(productAndListStockoutAppSettingsRecord!.settingList.where((e) => e.title == 'enableInclusiveTax').toList().firstOrNull!.value),
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
                                                                                                onDoubleTap: () async {},
                                                                                                onLongPress: () async {},
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
                                                                                                                    'gxs0dz68' /* ₹  */,
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
                                                                                            if (productAndListStockoutAppSettingsRecord?.settingList?.where((e) => e.title == 'showProductImage').toList()?.firstOrNull?.value ?? true)
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

                                                                                                  _model.jsonlistnew2 = await actions.addToHoldListprdbarcode(
                                                                                                    productListItem,
                                                                                                    FFAppState().selBill,
                                                                                                    widget!.taxcollection!.toList(),
                                                                                                    functions.enabletaxinclusive(productAndListStockoutAppSettingsRecord!.settingList.where((e) => e.title == 'enableInclusiveTax').toList().firstOrNull!.value),
                                                                                                    containerUnitTypeRecordList.toList(),
                                                                                                    false,
                                                                                                  );
                                                                                                  _shouldSetState = true;
                                                                                                  _model.calculateResult23Copy = await actions.calSubTotalForHoldListkiosk(
                                                                                                    FFAppState().selBill.toString(),
                                                                                                    FFAppState().allBillsList.toList(),
                                                                                                    functions.enabletaxinclusive(productAndListStockoutAppSettingsRecord!.settingList.where((e) => e.title == 'enableInclusiveTax').toList().firstOrNull!.value),
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
                                                                                                                                        '6i2gcm8b' /* ₹ */,
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
                                        ),
                                      ),
                                      Expanded(
                                        flex: 10,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  3.0, 0.0, 0.0, 0.0),
                                          child: Container(
                                            width: 100.0,
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: double.infinity,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.045,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Stack(
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.003,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiary,
                                                            ),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 1.0,
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.25,
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.045,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                ),
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .textController,
                                                                  focusNode: _model
                                                                      .textFieldFocusNode,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.textController',
                                                                    Duration(
                                                                        milliseconds:
                                                                            2000),
                                                                    () => safeSetState(
                                                                        () {}),
                                                                  ),
                                                                  autofocus:
                                                                      false,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    hintText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'sv6h4702' /* Stock Out Reason... */,
                                                                    ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(4.0),
                                                                        topRight:
                                                                            Radius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(4.0),
                                                                        topRight:
                                                                            Radius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(4.0),
                                                                        topRight:
                                                                            Radius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(4.0),
                                                                        topRight:
                                                                            Radius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).headlineSmallIsCustom,
                                                                      ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  validator: _model
                                                                      .textControllerValidator
                                                                      .asValidator(
                                                                          context),
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
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 1.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            width: 100.0,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.03,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
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
                                                                    height:
                                                                        100.0,
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
                                                                              'lvu39mxx' /* Item Name */,
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
                                                                  flex: 15,
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.08,
                                                                    height:
                                                                        100.0,
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
                                                                            'hi2ti3vc' /* Qty */,
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
                                                                  flex: 10,
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.08,
                                                                    height:
                                                                        100.0,
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
                                                                            'ygb3b4es' /* Amt */,
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
                                                                    height:
                                                                        100.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
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
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Builder(
                                                          builder: (context) {
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
                                                              itemCount:
                                                                  bill.length,
                                                              itemBuilder:
                                                                  (context,
                                                                      billIndex) {
                                                                final billItem =
                                                                    bill[
                                                                        billIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.49,
                                                                    height: MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.07,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          5.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Expanded(
                                                                            flex:
                                                                                28,
                                                                            child:
                                                                                Padding(
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
                                                                                              'jn8svpx8' /* ₹  */,
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
                                                                            flex:
                                                                                14,
                                                                            child:
                                                                                Padding(
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
                                                                                              functions.enabletaxinclusive(productAndListStockoutAppSettingsRecord!.settingList.where((e) => e.title == 'enableInclusiveTax').toList().firstOrNull!.value),
                                                                                            );
                                                                                            await actions.calSubTotalForHoldListkiosk(
                                                                                              FFAppState().selBill.toString(),
                                                                                              _model.resultminus!.toList(),
                                                                                              functions.enabletaxinclusive(productAndListStockoutAppSettingsRecord!.settingList.where((e) => e.title == 'enableInclusiveTax').toList().firstOrNull!.value),
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
                                                                                            key: Key('Key1ud_${billIndex}_of_${bill.length}'),
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
                                                                                            parameter7: productAndListStockoutAppSettingsRecord?.settingList?.where((e) => e.title == 'enableInclusiveTax').toList()?.firstOrNull?.value,
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
                                                                                              functions.enabletaxinclusive(productAndListStockoutAppSettingsRecord!.settingList.where((e) => e.title == 'enableInclusiveTax').toList().firstOrNull!.value),
                                                                                            );
                                                                                            _shouldSetState = true;
                                                                                            await actions.calSubTotalForHoldListkiosk(
                                                                                              FFAppState().selBill.toString(),
                                                                                              _model.resultplus!.toList(),
                                                                                              functions.enabletaxinclusive(productAndListStockoutAppSettingsRecord!.settingList.where((e) => e.title == 'enableInclusiveTax').toList().firstOrNull!.value),
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
                                                                            flex:
                                                                                9,
                                                                            child:
                                                                                Padding(
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
                                                                            flex:
                                                                                5,
                                                                            child:
                                                                                Container(
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
                                                                                    functions.enabletaxinclusive(productAndListStockoutAppSettingsRecord!.settingList.where((e) => e.title == 'enableInclusiveTax').toList().firstOrNull!.value),
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
                                                              controller: _model
                                                                  .listViewprd,
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.07,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 15.0,
                                                          color:
                                                              Color(0x40000000),
                                                          offset: Offset(
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
                                                            MainAxisSize.max,
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
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'p07ojbt4' /* Item */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  FFAppState()
                                                                      .noOfItems
                                                                      .toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyLargeIsCustom,
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
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'hwn304r5' /* Qty */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodySmallIsCustom,
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
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 6,
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          3.0,
                                                                          0.0),
                                                              child: Column(
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
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'kzttltkz' /* Sub Total */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodySmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                        ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'gdaxhdc5' /* ₹  */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        FFAppState()
                                                                            .billAmt
                                                                            .toString(),
                                                                        textAlign:
                                                                            TextAlign.center,
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
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.085,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
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
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            flex: 4,
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.125,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.085,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Expanded(
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
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'afwxwb8j' /* Net Amt */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).lineColor,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                              ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'ugo6gf5j' /* ₹  */,
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
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        flex: 8,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      1.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.15,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.085,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                            ),
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                await actions
                                                                    .saveStockOut(
                                                                  context,
                                                                  productAndListStockoutAppSettingsRecord!,
                                                                  _model
                                                                      .textController
                                                                      .text,
                                                                );

                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'yszc5cr0' /* Save Stock Out */,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                height: 40.0,
                                                                padding: EdgeInsetsDirectional
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                textStyle: FlutterFlowTheme.of(
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
                                                                  'containerOnActionTriggerAnimation4']!,
                                                              hasBeenTriggered:
                                                                  hasContainerTriggered4),
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
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ));
      },
    );
  }
}
