import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/kiosk/kiosk_header/kiosk_header_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'kiosk_bill_screen_model.dart';
export 'kiosk_bill_screen_model.dart';

class KioskBillScreenWidget extends StatefulWidget {
  const KioskBillScreenWidget({
    super.key,
    this.doc,
    this.shiftdoc,
    this.billdetails,
    this.appsetting,
    this.taxcollection,
  });

  final DocumentReference? doc;
  final dynamic shiftdoc;
  final DocumentReference? billdetails;
  final AppSettingsRecord? appsetting;
  final List<TaxMasterRecord>? taxcollection;

  static String routeName = 'KioskBillScreen';
  static String routePath = 'kioskBillScreen';

  @override
  State<KioskBillScreenWidget> createState() => _KioskBillScreenWidgetState();
}

class _KioskBillScreenWidgetState extends State<KioskBillScreenWidget>
    with TickerProviderStateMixin {
  late KioskBillScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KioskBillScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.pressed = false;
      safeSetState(() {});
      _model.prodoc = await queryProductRecordOnce(
        parent: FFAppState().outletIdRef,
        queryBuilder: (productRecord) => productRecord
            .where(
              'isDeleted',
              isEqualTo: false,
            )
            .where(
              'isEnable',
              isEqualTo: true,
            ),
      );
      _model.categorydoc = await queryCategoryRecordOnce(
        parent: FFAppState().outletIdRef,
        queryBuilder: (categoryRecord) => categoryRecord.orderBy('categoryNo'),
      );
      FFAppState().categoryColor = 'ALL';
      safeSetState(() {});
      _model.productDoc = _model.prodoc!.toList().cast<ProductRecord>();
      safeSetState(() {});
      if (!functions.isPrinterSelected(FFAppState().printerDevice)!) {
        _model.resDevice2Copy = await actions.scanPrinter(
          FFAppState().posMode,
        );
      }
      _model.connectdeviceCOPY23 = await actions.connectDevice(
        FFAppState().printerDevice,
        FFAppState().printerIndex,
      );
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
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
        title: 'KioskBillScreen',
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
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFF4ECE5),
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          alignment: AlignmentDirectional(0.0, -1.0),
                          image: Image.asset(
                            'assets/images/Top_img_4.png',
                          ).image,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 5.0),
                            child: Container(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 0.15,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 20.0, 20.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    wrapWithModel(
                                      model: _model.kioskHeaderModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: KioskHeaderWidget(),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 7.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '9j0g1ck5' /* Welcome to */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineSmall
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallFamily,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            fontSize: 20.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallIsCustom,
                                                          ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      FFAppState().outletName,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineSmall
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallFamily,
                                                            color: Color(
                                                                0xFF033BE8),
                                                            fontSize: 32.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallIsCustom,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (!widget!
                                                    .appsetting!.settingList
                                                    .where((e) =>
                                                        e.title ==
                                                        'disableOrderType')
                                                    .toList()
                                                    .firstOrNull!
                                                    .value)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                5.0, 0.0),
                                                    child: Stack(
                                                      children: [
                                                        if (FFAppState()
                                                                .orderType ==
                                                            'DINE IN')
                                                          FFButtonWidget(
                                                            onPressed: () {
                                                              print(
                                                                  'Button pressed ...');
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'uhllvaea' /* Dine In */,
                                                            ),
                                                            icon: Icon(
                                                              Icons
                                                                  .dinner_dining_rounded,
                                                              size: 24.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 55.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              iconColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              color: Color(
                                                                  0x00B6001A),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontSize:
                                                                            22.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                        if (FFAppState()
                                                                .orderType ==
                                                            'PARCEL')
                                                          FFButtonWidget(
                                                            onPressed: () {
                                                              print(
                                                                  'Button pressed ...');
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              '6gjpa29u' /* Parcel */,
                                                            ),
                                                            icon: Icon(
                                                              Icons
                                                                  .takeout_dining_rounded,
                                                              size: 30.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 55.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              iconColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              color: Color(
                                                                  0x00B6001A),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontSize:
                                                                            24.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                FlutterFlowIconButton(
                                                  borderRadius: 10.0,
                                                  buttonSize: 55.0,
                                                  icon: Icon(
                                                    Icons.replay,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 30.0,
                                                  ),
                                                  onPressed: () async {
                                                    _model.appsettingresfresh =
                                                        await queryAppSettingsRecordOnce(
                                                      parent: FFAppState()
                                                          .outletIdRef,
                                                      queryBuilder:
                                                          (appSettingsRecord) =>
                                                              appSettingsRecord
                                                                  .where(
                                                        'deviceId',
                                                        isEqualTo:
                                                            FFAppState().dId,
                                                      ),
                                                      singleRecord: true,
                                                    ).then((s) =>
                                                            s.firstOrNull);

                                                    context.pushNamed(
                                                      KioskBillScreenWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'doc': serializeParam(
                                                          widget!.doc,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                        'shiftdoc':
                                                            serializeParam(
                                                          widget!.shiftdoc,
                                                          ParamType.JSON,
                                                        ),
                                                        'appsetting':
                                                            serializeParam(
                                                          _model
                                                              .appsettingresfresh,
                                                          ParamType.Document,
                                                        ),
                                                        'taxcollection':
                                                            serializeParam(
                                                          widget!.taxcollection,
                                                          ParamType.Document,
                                                          isList: true,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'appsetting': _model
                                                            .appsettingresfresh,
                                                        'taxcollection': widget!
                                                            .taxcollection,
                                                      },
                                                    );

                                                    safeSetState(() {});
                                                  },
                                                ),
                                                if (false)
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 10.0,
                                                    buttonSize: 55.0,
                                                    icon: Icon(
                                                      Icons.settings_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 30.0,
                                                    ),
                                                    onPressed: () async {
                                                      context.pushNamed(
                                                          PrintSettingkioskWidget
                                                              .routeName);
                                                    },
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
                          ),
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: Container(
                                      width: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 25.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState().categoryColor =
                                                      'ALL';
                                                  safeSetState(() {});
                                                  _model.productDoc = _model
                                                      .prodoc!
                                                      .toList()
                                                      .cast<ProductRecord>();
                                                  safeSetState(() {});
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.06,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFFFE5C8),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    border: Border.all(
                                                      color: FFAppState()
                                                                  .categoryColor ==
                                                              'ALL'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(10.0),
                                                    child: Column(
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
                                                            '3zt1lnqa' /* ALL */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .displayMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .displayMediumFamily,
                                                                color: Color(
                                                                    0xFFEA7004),
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .displayMediumIsCustom,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Builder(
                                                builder: (context) {
                                                  final listcat = _model
                                                          .categorydoc
                                                          ?.where((e) =>
                                                              e.isDeleted ==
                                                              false)
                                                          .toList()
                                                          ?.sortedList(
                                                              keyOf: (e) =>
                                                                  valueOrDefault<
                                                                          bool>(
                                                                    widget!
                                                                        .appsetting
                                                                        ?.settingList
                                                                        ?.where((e) =>
                                                                            e.title ==
                                                                            'sortCategoryByCode')
                                                                        .toList()
                                                                        ?.firstOrNull
                                                                        ?.value,
                                                                    false,
                                                                  )
                                                                      ? e.code
                                                                          .toString()
                                                                      : e.name,
                                                              desc: false)
                                                          ?.toList() ??
                                                      [];

                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: listcat.length,
                                                    itemBuilder: (context,
                                                        listcatIndex) {
                                                      final listcatItem =
                                                          listcat[listcatIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    35.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            FFAppState()
                                                                    .categoryColor =
                                                                listcatItem.id;
                                                            safeSetState(() {});
                                                            _model.productDoc = _model
                                                                .prodoc!
                                                                .where((e) =>
                                                                    e.category ==
                                                                    listcatItem
                                                                        .id)
                                                                .toList()
                                                                .cast<
                                                                    ProductRecord>();
                                                            safeSetState(() {});
                                                          },
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          18.0),
                                                              border:
                                                                  Border.all(
                                                                color: listcatItem
                                                                            .id ==
                                                                        FFAppState()
                                                                            .categoryColor
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                width: 2.0,
                                                              ),
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
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                  child:
                                                                      Container(
                                                                    width: 85.0,
                                                                    height:
                                                                        85.0,
                                                                    clipBehavior:
                                                                        Clip.antiAlias,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child: Image
                                                                        .network(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        listcatItem
                                                                            .catImageUrl,
                                                                        'https://as1.ftcdn.net/v2/jpg/04/34/72/82/1000_F_434728286_OWQQvAFoXZLdGHlObozsolNeuSxhpr84.jpg',
                                                                      ),
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFFFFE5C8),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              3.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            listcatItem.name,
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).displayMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).displayMediumFamily,
                                                                                  color: Color(0xFFEA7004),
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).displayMediumIsCustom,
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
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
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
                                  child: Container(
                                    width: 100.0,
                                    height: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 20.0, 20.0),
                                      child: Builder(
                                        builder: (context) {
                                          final kioskBillScreenVar = _model
                                              .productDoc
                                              .where((e) => e.isEnable)
                                              .toList()
                                              .sortedList(
                                                  keyOf: (e) =>
                                                      valueOrDefault<bool>(
                                                        widget!.appsetting
                                                            ?.settingList
                                                            ?.where((e) =>
                                                                e.title ==
                                                                'sortProductByCode')
                                                            .toList()
                                                            ?.firstOrNull
                                                            ?.value,
                                                        false,
                                                      )
                                                          ? e.code.toString()
                                                          : e.name,
                                                  desc: false)
                                              .toList();

                                          return GridView.builder(
                                            padding: EdgeInsets.zero,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                              crossAxisSpacing: 5.0,
                                              mainAxisSpacing: 25.0,
                                              childAspectRatio: 0.7,
                                            ),
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                kioskBillScreenVar.length,
                                            itemBuilder: (context,
                                                kioskBillScreenVarIndex) {
                                              final kioskBillScreenVarItem =
                                                  kioskBillScreenVar[
                                                      kioskBillScreenVarIndex];
                                              return Container(
                                                width: 100.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 10.0,
                                                      color: Color(0x1A000000),
                                                      offset: Offset(
                                                        10.0,
                                                        10.0,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      flex: 7,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  0.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  20.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  20.0),
                                                        ),
                                                        child:
                                                            CachedNetworkImage(
                                                          fadeInDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      500),
                                                          fadeOutDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      500),
                                                          imageUrl:
                                                              valueOrDefault<
                                                                  String>(
                                                            kioskBillScreenVarItem
                                                                .imageUrl,
                                                            'https://as1.ftcdn.net/v2/jpg/04/34/72/82/1000_F_434728286_OWQQvAFoXZLdGHlObozsolNeuSxhpr84.jpg',
                                                          ),
                                                          width: 300.0,
                                                          height: 200.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 6,
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  7.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          functions
                                                                              .returnTitlecase(kioskBillScreenVarItem.name),
                                                                          'null',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                              color: Color(0xFF033BE8),
                                                                              fontSize: 15.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).headlineLargeIsCustom,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    if (!valueOrDefault<
                                                                        bool>(
                                                                      widget!
                                                                          .appsetting
                                                                          ?.settingList
                                                                          ?.where((e) =>
                                                                              e.title ==
                                                                              'hideRegionalLanguage')
                                                                          .toList()
                                                                          ?.firstOrNull
                                                                          ?.value,
                                                                      false,
                                                                    ))
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          kioskBillScreenVarItem
                                                                              .regionalName,
                                                                          'null',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: Color(0xFF033BE8),
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                FFLocalizations.of(context).getText(
                                                                              'zhqfsh59' /* ₹  */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                  color: Color(0xFF0046D3),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).headlineSmallIsCustom,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                valueOrDefault<String>(
                                                                              kioskBillScreenVarItem.sellingPrice.toString(),
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                  color: Color(0xFF0046D3),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).headlineSmallIsCustom,
                                                                                ),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                              color: Color(0xFF0046D3),
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).headlineSmallIsCustom,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Visibility(
                                                                    visible: !FFAppState()
                                                                        .cartItem
                                                                        .contains(
                                                                            kioskBillScreenVarItem.reference),
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
                                                                        var _shouldSetState =
                                                                            false;
                                                                        FFAppState().qty =
                                                                            1.0;
                                                                        safeSetState(
                                                                            () {});
                                                                        if (kioskBillScreenVarItem
                                                                            .stockable) {
                                                                          if (kioskBillScreenVarItem.currentStock >
                                                                              0) {
                                                                            if (FFAppState().holdBillCount ==
                                                                                0) {
                                                                              FFAppState().holdBillCount = FFAppState().holdBillCount + 1;
                                                                              FFAppState().addToAllBillsList(functions.generateBillDetailsJson(0.0, 0.0, 0.0, 'CASH', 0.0, 0.0, FFAppState().billAmt, 0.0, FFAppState().finalAmt, '0', FFAppState().itemCartList.toList(), FFAppState().holdBillCount));
                                                                              FFAppState().selBill = 1;
                                                                            }
                                                                            _model.result1 =
                                                                                await actions.addToHoldListkioskGst(
                                                                              kioskBillScreenVarItem,
                                                                              valueOrDefault<int>(
                                                                                FFAppState().selBill,
                                                                                1,
                                                                              ),
                                                                              widget!.taxcollection!.toList(),
                                                                              functions.enabletaxinclusive(valueOrDefault<bool>(
                                                                                widget!.appsetting?.settingList?.where((e) => e.title == 'enableInclusiveTax').toList()?.firstOrNull?.value,
                                                                                false,
                                                                              )),
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            _model.resp2 =
                                                                                await actions.calSubTotalForHoldListkiosk2(
                                                                              valueOrDefault<String>(
                                                                                FFAppState().selBill.toString(),
                                                                                '1',
                                                                              ),
                                                                              _model.result1!.toList(),
                                                                              functions.enabletaxinclusive(valueOrDefault<bool>(
                                                                                widget!.appsetting?.settingList?.where((e) => e.title == 'enableInclusiveTax').toList()?.firstOrNull?.value,
                                                                                false,
                                                                              )),
                                                                              widget!.appsetting!.settingList.where((e) => e.title == 'qtyWiseParcelCharges').toList().firstOrNull!.value,
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            _model.res3 =
                                                                                await actions.calBillAmt2(
                                                                              FFAppState().disAmt,
                                                                              FFAppState().delCharges,
                                                                              widget!.appsetting!.settingList.where((e) => e.title == 'qtyWiseParcelCharges').toList().firstOrNull!.value,
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            FFAppState().addToCartItem(kioskBillScreenVarItem.reference);
                                                                            safeSetState(() {});
                                                                            if (kioskBillScreenVarItem.stockable) {
                                                                              if (kioskBillScreenVarItem.currentStock <=
                                                                                  valueOrDefault<int>(
                                                                                    getJsonField(
                                                                                      functions
                                                                                          .filterBillList(FFAppState().selBill, FFAppState().allBillsList.toList())
                                                                                          .where((e) =>
                                                                                              kioskBillScreenVarItem.id ==
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
                                                                                    0,
                                                                                  )) {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      content: Text('Item  Out Of Stock.'),
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
                                                                                  content: Text('Item  Out Of Stock.'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                      child: Text('Ok'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            );
                                                                          }
                                                                        } else {
                                                                          if (FFAppState().holdBillCount ==
                                                                              0) {
                                                                            FFAppState().holdBillCount =
                                                                                FFAppState().holdBillCount + 1;
                                                                            FFAppState().addToAllBillsList(functions.generateBillDetailsJson(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                'CASH',
                                                                                0.0,
                                                                                0.0,
                                                                                FFAppState().billAmt,
                                                                                0.0,
                                                                                FFAppState().finalAmt,
                                                                                '0',
                                                                                FFAppState().itemCartList.toList(),
                                                                                FFAppState().holdBillCount));
                                                                            FFAppState().selBill =
                                                                                1;
                                                                          }
                                                                          _model.result4 =
                                                                              await actions.addToHoldListkioskGst(
                                                                            kioskBillScreenVarItem,
                                                                            valueOrDefault<int>(
                                                                              FFAppState().selBill,
                                                                              1,
                                                                            ),
                                                                            widget!.taxcollection!.toList(),
                                                                            functions.enabletaxinclusive(valueOrDefault<bool>(
                                                                              widget!.appsetting?.settingList?.where((e) => e.title == 'enableInclusiveTax').toList()?.firstOrNull?.value,
                                                                              false,
                                                                            )),
                                                                          );
                                                                          _shouldSetState =
                                                                              true;
                                                                          _model.res5 =
                                                                              await actions.calSubTotalForHoldListkiosk2(
                                                                            valueOrDefault<String>(
                                                                              FFAppState().selBill.toString(),
                                                                              '1',
                                                                            ),
                                                                            _model.result4!.toList(),
                                                                            functions.enabletaxinclusive(valueOrDefault<bool>(
                                                                              widget!.appsetting?.settingList?.where((e) => e.title == 'enableInclusiveTax').toList()?.firstOrNull?.value,
                                                                              false,
                                                                            )),
                                                                            widget!.appsetting!.settingList.where((e) => e.title == 'qtyWiseParcelCharges').toList().firstOrNull!.value,
                                                                          );
                                                                          _shouldSetState =
                                                                              true;
                                                                          _model.res6 =
                                                                              await actions.calBillAmt2(
                                                                            FFAppState().disAmt,
                                                                            FFAppState().delCharges,
                                                                            widget!.appsetting!.settingList.where((e) => e.title == 'qtyWiseParcelCharges').toList().firstOrNull!.value,
                                                                          );
                                                                          _shouldSetState =
                                                                              true;
                                                                          FFAppState()
                                                                              .addToCartItem(kioskBillScreenVarItem.reference);
                                                                          safeSetState(
                                                                              () {});
                                                                        }

                                                                        if (_shouldSetState)
                                                                          safeSetState(
                                                                              () {});
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            100.0,
                                                                        height:
                                                                            40.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0xFFFFC3C3),
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(12.0),
                                                                            bottomRight:
                                                                                Radius.circular(12.0),
                                                                            topLeft:
                                                                                Radius.circular(12.0),
                                                                            topRight:
                                                                                Radius.circular(12.0),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'z8ike2kl' /* Add */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  fontSize: 15.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Visibility(
                                                                    visible: FFAppState()
                                                                        .cartItem
                                                                        .contains(
                                                                            kioskBillScreenVarItem.reference),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100.0,
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFFE6FEC1),
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(12.0),
                                                                          bottomRight:
                                                                              Radius.circular(12.0),
                                                                          topLeft:
                                                                              Radius.circular(12.0),
                                                                          topRight:
                                                                              Radius.circular(12.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                FlutterFlowIconButton(
                                                                              borderRadius: 12.0,
                                                                              buttonSize: 40.0,
                                                                              fillColor: FlutterFlowTheme.of(context).tertiary,
                                                                              icon: Icon(
                                                                                Icons.remove_rounded,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 18.0,
                                                                              ),
                                                                              onPressed: () async {
                                                                                if (FFAppState().qty <
                                                                                    getJsonField(
                                                                                      functions
                                                                                          .filterBillList(FFAppState().selBill, FFAppState().allBillsList.toList())
                                                                                          .where((e) =>
                                                                                              kioskBillScreenVarItem.id ==
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
                                                                                    )) {
                                                                                  _model.resultkiosk = await actions.reduceQuantityHoldListkiosk(
                                                                                    functions
                                                                                        .filterBillList(FFAppState().selBill, FFAppState().allBillsList.toList())
                                                                                        .where((e) =>
                                                                                            kioskBillScreenVarItem.id ==
                                                                                            valueOrDefault<String>(
                                                                                              getJsonField(
                                                                                                e,
                                                                                                r'''$.id''',
                                                                                              )?.toString(),
                                                                                              '0',
                                                                                            ))
                                                                                        .toList()
                                                                                        .firstOrNull!,
                                                                                    FFAppState().selBill,
                                                                                    widget!.taxcollection!.toList(),
                                                                                    functions.enabletaxinclusive(valueOrDefault<bool>(
                                                                                      widget!.appsetting?.settingList?.where((e) => e.title == 'enableInclusiveTax').toList()?.firstOrNull?.value,
                                                                                      false,
                                                                                    )),
                                                                                  );
                                                                                  _model.res2345 = await actions.calSubTotalForHoldListkiosk2(
                                                                                    valueOrDefault<String>(
                                                                                      FFAppState().selBill.toString(),
                                                                                      '1',
                                                                                    ),
                                                                                    FFAppState().allBillsList.toList(),
                                                                                    functions.enabletaxinclusive(valueOrDefault<bool>(
                                                                                      widget!.appsetting?.settingList?.where((e) => e.title == 'enableInclusiveTax').toList()?.firstOrNull?.value,
                                                                                      false,
                                                                                    )),
                                                                                    widget!.appsetting!.settingList.where((e) => e.title == 'qtyWiseParcelCharges').toList().firstOrNull!.value,
                                                                                  );
                                                                                  _model.reu34 = await actions.calBillAmt2(
                                                                                    valueOrDefault<double>(
                                                                                      FFAppState().disAmt,
                                                                                      0.0,
                                                                                    ),
                                                                                    FFAppState().delCharges,
                                                                                    widget!.appsetting!.settingList.where((e) => e.title == 'qtyWiseParcelCharges').toList().firstOrNull!.value,
                                                                                  );
                                                                                } else {
                                                                                  _model.res20Copy = await actions.removeHoldListItem(
                                                                                    functions
                                                                                        .filterBillList(FFAppState().selBill, FFAppState().allBillsList.toList())
                                                                                        .where((e) =>
                                                                                            kioskBillScreenVarItem.id ==
                                                                                            valueOrDefault<String>(
                                                                                              getJsonField(
                                                                                                e,
                                                                                                r'''$.id''',
                                                                                              )?.toString(),
                                                                                              '0',
                                                                                            ))
                                                                                        .toList()
                                                                                        .firstOrNull!,
                                                                                    FFAppState().selBill,
                                                                                  );
                                                                                  _model.ssssss = await actions.calSubTotalForHoldListkiosk2(
                                                                                    FFAppState().selBill.toString(),
                                                                                    FFAppState().allBillsList.toList(),
                                                                                    functions.enabletaxinclusive(valueOrDefault<bool>(
                                                                                      widget!.appsetting?.settingList?.where((e) => e.title == 'enableInclusiveTax').toList()?.firstOrNull?.value,
                                                                                      false,
                                                                                    )),
                                                                                    widget!.appsetting!.settingList.where((e) => e.title == 'qtyWiseParcelCharges').toList().firstOrNull!.value,
                                                                                  );
                                                                                  _model.reuslt22Copy = await actions.calBillAmt2(
                                                                                    valueOrDefault<double>(
                                                                                      FFAppState().disAmt,
                                                                                      0.0,
                                                                                    ),
                                                                                    valueOrDefault<double>(
                                                                                      FFAppState().delCharges,
                                                                                      0.0,
                                                                                    ),
                                                                                    widget!.appsetting!.settingList.where((e) => e.title == 'qtyWiseParcelCharges').toList().firstOrNull!.value,
                                                                                  );
                                                                                  FFAppState().removeFromCartItem(kioskBillScreenVarItem.reference);
                                                                                  safeSetState(() {});
                                                                                }

                                                                                safeSetState(() {});
                                                                              },
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Text(
                                                                                functions.loadDefaultList(FFAppState().selBill, FFAppState().allBillsList.toList(), kioskBillScreenVarItem.reference.id).length > 0
                                                                                    ? valueOrDefault<String>(
                                                                                        getJsonField(
                                                                                          functions
                                                                                              .filterBillList(FFAppState().selBill, FFAppState().allBillsList.toList())
                                                                                              .where((e) =>
                                                                                                  kioskBillScreenVarItem.id ==
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
                                                                                        )?.toString(),
                                                                                        '0',
                                                                                      )
                                                                                    : '0',
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                      fontSize: 13.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                FlutterFlowIconButton(
                                                                              borderRadius: 12.0,
                                                                              buttonSize: 40.0,
                                                                              fillColor: FlutterFlowTheme.of(context).tertiary,
                                                                              icon: Icon(
                                                                                Icons.add,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 18.0,
                                                                              ),
                                                                              onPressed: () async {
                                                                                var _shouldSetState = false;
                                                                                if (kioskBillScreenVarItem.stockable) {
                                                                                  if (kioskBillScreenVarItem.currentStock <=
                                                                                      functions.doubleToInt(valueOrDefault<double>(
                                                                                        getJsonField(
                                                                                          functions
                                                                                              .filterBillList(FFAppState().selBill, FFAppState().allBillsList.toList())
                                                                                              .where((e) =>
                                                                                                  kioskBillScreenVarItem.id ==
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
                                                                                    await showDialog(
                                                                                      context: context,
                                                                                      builder: (alertDialogContext) {
                                                                                        return AlertDialog(
                                                                                          content: Text('Item  Out Of Stock.'),
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
                                                                                _model.kioskresult = await actions.plusQuantityHoldListkiosk(
                                                                                  functions
                                                                                      .filterBillList(FFAppState().selBill, FFAppState().allBillsList.toList())
                                                                                      .where((e) =>
                                                                                          kioskBillScreenVarItem.id ==
                                                                                          valueOrDefault<String>(
                                                                                            getJsonField(
                                                                                              e,
                                                                                              r'''$.id''',
                                                                                            )?.toString(),
                                                                                            '0',
                                                                                          ))
                                                                                      .toList()
                                                                                      .firstOrNull!,
                                                                                  FFAppState().selBill,
                                                                                  widget!.taxcollection!.toList(),
                                                                                  functions.enabletaxinclusive(valueOrDefault<bool>(
                                                                                    widget!.appsetting?.settingList?.where((e) => e.title == 'enableInclusiveTax').toList()?.firstOrNull?.value,
                                                                                    false,
                                                                                  )),
                                                                                );
                                                                                _shouldSetState = true;
                                                                                _model.res234 = await actions.calSubTotalForHoldListkiosk2(
                                                                                  valueOrDefault<String>(
                                                                                    FFAppState().selBill.toString(),
                                                                                    '1',
                                                                                  ),
                                                                                  FFAppState().allBillsList.toList(),
                                                                                  functions.enabletaxinclusive(valueOrDefault<bool>(
                                                                                    widget!.appsetting?.settingList?.where((e) => e.title == 'enableInclusiveTax').toList()?.firstOrNull?.value,
                                                                                    false,
                                                                                  )),
                                                                                  widget!.appsetting!.settingList.where((e) => e.title == 'qtyWiseParcelCharges').toList().firstOrNull!.value,
                                                                                );
                                                                                _shouldSetState = true;
                                                                                _model.reuslt12 = await actions.calBillAmt2(
                                                                                  valueOrDefault<double>(
                                                                                    FFAppState().disAmt,
                                                                                    0.0,
                                                                                  ),
                                                                                  FFAppState().delCharges,
                                                                                  widget!.appsetting!.settingList.where((e) => e.title == 'qtyWiseParcelCharges').toList().firstOrNull!.value,
                                                                                );
                                                                                _shouldSetState = true;
                                                                                if (_shouldSetState) safeSetState(() {});
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ).animateOnPageLoad(
                                                                            animationsMap['containerOnPageLoadAnimation']!),
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
                                              );
                                            },
                                          );
                                        },
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
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).parkingPrimary,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            content: Text(
                                                'Are You Sure You Want To Cancel This Order ?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Confirm'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                              if (confirmDialogResponse) {
                                await actions.removeFromAllBillList(
                                  FFAppState().selBill,
                                );
                                await actions.clearValue();
                                FFAppState().subTotal = 0.0;
                                FFAppState().parcelqty = 0;
                                FFAppState().delCharges = 0.0;
                                FFAppState().update(() {});
                                FFAppState().finalAmt = 0.0;
                                FFAppState().billAmt = 0.0;
                                FFAppState().count = FFAppState().count;
                                FFAppState().cartItem = [];
                                FFAppState().isBillPrinted = true;
                                FFAppState().noOfItems = 0;
                                FFAppState().update(() {});
                              }
                            },
                            text: FFLocalizations.of(context).getText(
                              '2wg5nblz' /* Cancel Order */,
                            ),
                            icon: Icon(
                              Icons.close_sharp,
                              size: 24.0,
                            ),
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 0.3,
                              height: 95.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconColor: FlutterFlowTheme.of(context).primary,
                              color: Color(0x00FFAC47),
                              textStyle: FlutterFlowTheme.of(context)
                                  .displayMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .displayMediumFamily,
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .displayMediumIsCustom,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 5.0, 0.0),
                                    child: Icon(
                                      Icons.shopping_cart_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      FFAppState().noOfItems.toString(),
                                      '0',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .displayLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .displayLargeFamily,
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .displayLargeIsCustom,
                                        ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (FFAppState().delCharges > 0.0)
                                    RichText(
                                      textScaler:
                                          MediaQuery.of(context).textScaler,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'opsb36aw' /* ParcelCharges  */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .displayMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displayMediumFamily,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .displayMediumIsCustom,
                                                ),
                                          ),
                                          TextSpan(
                                            text: widget!
                                                    .appsetting!.settingList
                                                    .where((e) =>
                                                        e.title ==
                                                        'qtyWiseParcelCharges')
                                                    .toList()
                                                    .firstOrNull!
                                                    .value
                                                ? (FFAppState().delCharges *
                                                        valueOrDefault<int>(
                                                          FFAppState()
                                                              .parcelqty,
                                                          0,
                                                        ))
                                                    .toString()
                                                : (FFAppState().delCharges *
                                                        valueOrDefault<int>(
                                                          FFAppState()
                                                              .noOfItems,
                                                          0,
                                                        ))
                                                    .toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .displayMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displayMediumFamily,
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .displayMediumIsCustom,
                                                ),
                                          )
                                        ],
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
                                    ),
                                ],
                              ),
                            ],
                          ),
                          RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    'g1lljtgj' /* ₹  */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .displayMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .displayMediumFamily,
                                        fontSize: 22.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .displayMediumIsCustom,
                                      ),
                                ),
                                TextSpan(
                                  text: valueOrDefault<String>(
                                    FFAppState().finalAmt.toString(),
                                    '0',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .displayMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .displayMediumFamily,
                                        fontSize: 24.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .displayMediumIsCustom,
                                      ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              _model.pressed = true;
                              safeSetState(() {});
                              _model.connectdevice12 =
                                  await actions.connectDevice(
                                FFAppState().printerDevice,
                                FFAppState().printerIndex,
                              );
                              if (FFAppState().isPrinterConnected) {
                                if (functions
                                    .filterBillList(FFAppState().selBill,
                                        FFAppState().allBillsList.toList())
                                    .isNotEmpty) {
                                  FFAppState().isBillPrinted = false;
                                  safeSetState(() {});
                                  if (widget!.appsetting!.settingList
                                      .where((e) =>
                                          e.title == 'qtyWiseParcelCharges')
                                      .toList()
                                      .firstOrNull!
                                      .value) {
                                    context.goNamed(
                                      KioskCartdineinparcelWidget.routeName,
                                      queryParameters: {
                                        'doc': serializeParam(
                                          widget!.doc,
                                          ParamType.DocumentReference,
                                        ),
                                        'shiftdetails': serializeParam(
                                          widget!.shiftdoc,
                                          ParamType.JSON,
                                        ),
                                        'appsetting': serializeParam(
                                          widget!.appsetting,
                                          ParamType.Document,
                                        ),
                                        'taxcollection': serializeParam(
                                          widget!.taxcollection,
                                          ParamType.Document,
                                          isList: true,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'appsetting': widget!.appsetting,
                                        'taxcollection': widget!.taxcollection,
                                      },
                                    );
                                  } else {
                                    context.goNamed(
                                      KioskCartWidget.routeName,
                                      queryParameters: {
                                        'doc': serializeParam(
                                          widget!.doc,
                                          ParamType.DocumentReference,
                                        ),
                                        'shiftdetails': serializeParam(
                                          widget!.shiftdoc,
                                          ParamType.JSON,
                                        ),
                                        'appsetting': serializeParam(
                                          widget!.appsetting,
                                          ParamType.Document,
                                        ),
                                        'taxcollection': serializeParam(
                                          widget!.taxcollection,
                                          ParamType.Document,
                                          isList: true,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'appsetting': widget!.appsetting,
                                        'taxcollection': widget!.taxcollection,
                                      },
                                    );
                                  }
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        content: Text(
                                            'Choose Menu For Proceed Order !'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
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
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      content: Text('Printer Not Connected !'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                _model.connectdevice1 =
                                    await actions.connectDevice(
                                  FFAppState().printerDevice,
                                  FFAppState().printerIndex,
                                );
                              }

                              safeSetState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              '7t41axvs' /* Proceed Order */,
                            ),
                            icon: Icon(
                              Icons.chevron_right,
                              size: 25.0,
                            ),
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 0.35,
                              height: 95.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconColor:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .displayMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .displayMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .displayMediumIsCustom,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          if (false)
                            FFButtonWidget(
                              onPressed: () async {
                                _model.phonePedata = await PhonePeQRCall.call(
                                  merchantId: 'SENSIBLEQRTESTUAT',
                                  transactionId: getCurrentTimestamp
                                      .millisecondsSinceEpoch
                                      .toString(),
                                  merchantOrderId: FFAppState().paytmOrderId,
                                  amount: functions
                                      .toDecimal(FFAppState().finalAmt),
                                  storeId: FFAppState().userdoc?.id,
                                  expiresIn: 1800,
                                );

                                if ((_model.phonePedata?.succeeded ?? true)) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text(getJsonField(
                                          (_model.phonePedata?.jsonBody ?? ''),
                                          r'''$''',
                                        ).toString()),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );

                                  context.pushNamed(
                                    KioskPaymentCopyWidget.routeName,
                                    queryParameters: {
                                      'data': serializeParam(
                                        getJsonField(
                                          (_model.phonePedata?.jsonBody ?? ''),
                                          r'''$.data.qrString''',
                                        ).toString(),
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                }

                                safeSetState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                'f5wun5so' /* PhonePe */,
                              ),
                              options: FFButtonOptions(
                                height: 80.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .titleSmallIsCustom,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
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
  }
}
