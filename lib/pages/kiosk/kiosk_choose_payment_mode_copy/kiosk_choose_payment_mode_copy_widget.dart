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
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'kiosk_choose_payment_mode_copy_model.dart';
export 'kiosk_choose_payment_mode_copy_model.dart';

class KioskChoosePaymentModeCopyWidget extends StatefulWidget {
  const KioskChoosePaymentModeCopyWidget({
    super.key,
    this.doc,
    this.shiftdetails,
    this.appSettings,
    this.taxcollection,
    this.qrJson,
    this.paytmOrderId,
    this.isPaytm,
  });

  final DocumentReference? doc;
  final dynamic shiftdetails;
  final AppSettingsRecord? appSettings;
  final List<TaxMasterRecord>? taxcollection;
  final dynamic qrJson;
  final String? paytmOrderId;
  final bool? isPaytm;

  static String routeName = 'KioskChoosePaymentModeCopy';
  static String routePath = 'kioskChoosePaymentModeCopy';

  @override
  State<KioskChoosePaymentModeCopyWidget> createState() =>
      _KioskChoosePaymentModeCopyWidgetState();
}

class _KioskChoosePaymentModeCopyWidgetState
    extends State<KioskChoosePaymentModeCopyWidget>
    with TickerProviderStateMixin {
  late KioskChoosePaymentModeCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KioskChoosePaymentModeCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.footer = await queryFooterRecordOnce(
        parent: FFAppState().outletIdRef,
        singleRecord: true,
      ).then((s) => s.firstOrNull);
    });

    animationsMap.addAll({
      'iconOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.35, 1.35),
          ),
          TintEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            color: Color(0xFFFFDD42),
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.35, 1.35),
          ),
          TintEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            color: Color(0xFFFFDD42),
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
        title: 'KioskChoosePaymentModeCopy',
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
              backgroundColor: Color(0xFFF4ECE5),
              body: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    alignment: AlignmentDirectional(0.0, -1.0),
                    image: Image.asset(
                      'assets/images/Top_img_3.png',
                    ).image,
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.kioskHeaderModel,
                        updateCallback: () => safeSetState(() {}),
                        child: KioskHeaderWidget(),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 20.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).primary,
                            borderRadius: 15.0,
                            borderWidth: 0.5,
                            buttonSize: 65.0,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            icon: Icon(
                              Icons.keyboard_backspace_outlined,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 40.0,
                            ),
                            onPressed: () async {
                              context.goNamed(
                                KioskBillScreenWidget.routeName,
                                queryParameters: {
                                  'doc': serializeParam(
                                    widget!.doc,
                                    ParamType.DocumentReference,
                                  ),
                                  'shiftdoc': serializeParam(
                                    widget!.shiftdetails,
                                    ParamType.JSON,
                                  ),
                                  'appsetting': serializeParam(
                                    widget!.appSettings,
                                    ParamType.Document,
                                  ),
                                  'taxcollection': serializeParam(
                                    widget!.taxcollection,
                                    ParamType.Document,
                                    isList: true,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'appsetting': widget!.appSettings,
                                  'taxcollection': widget!.taxcollection,
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 190.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      25.0, 8.0, 25.0, 8.0),
                                  child: Icon(
                                    Icons.currency_rupee_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    size: 40.0,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                '5j75u6tj' /* Choose Payment Type  */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .displayLarge
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .displayLargeFamily,
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 40.0,
                                    letterSpacing: 5.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .displayLargeIsCustom,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 80.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'ph3diwsf' /* Please Collect Your Token & Bi... */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .displayLarge
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .displayLargeFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .parkingSecondaryBackground,
                                      fontSize: 30.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .displayLargeIsCustom,
                                    ),
                              ),
                            ),
                            if (!valueOrDefault<bool>(
                              widget!.appSettings?.settingList
                                  ?.where(
                                      (e) => e.title == 'hideUpiPaymentMode')
                                  .toList()
                                  ?.firstOrNull
                                  ?.value,
                              false,
                            ))
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().PayMode = 'UPI QR';
                                  safeSetState(() {});
                                  _model.outletDOc =
                                      await queryOutletRecordOnce(
                                    queryBuilder: (outletRecord) =>
                                        outletRecord.where(
                                      'id',
                                      isEqualTo: FFAppState().outletIdRef?.id,
                                    ),
                                    singleRecord: true,
                                  ).then((s) => s.firstOrNull);
                                  if (functions
                                      .filterBillList(FFAppState().selBill,
                                          FFAppState().allBillsList.toList())
                                      .isNotEmpty) {
                                    if (_model.outletDOc?.merchantId != null &&
                                        _model.outletDOc?.merchantId != '') {
                                      if (getJsonField(
                                        widget!.shiftdetails,
                                        r'''$.shiftExists''',
                                      )) {}
                                      FFAppState().orderId =
                                          FFAppState().orderId + 10;
                                      FFAppState().paytmOrderId =
                                          valueOrDefault<String>(
                                        'ORD-${getCurrentTimestamp.millisecondsSinceEpoch.toString()}',
                                        '0',
                                      );
                                      FFAppState().outletId =
                                          _model.outletDOc!.id;
                                      safeSetState(() {});
                                      _model.paymentQrResponse =
                                          await CreateQRCall.call(
                                        mid: _model.outletDOc?.merchantId,
                                        orderId: FFAppState().paytmOrderId,
                                        amount: functions
                                            .toDecimal(FFAppState().finalAmt),
                                        businessType: 'UPI_QR_CODE',
                                        posId: _model.outletDOc?.id,
                                        mKey: _model.outletDOc?.merchantKey,
                                        isProd: _model.outletDOc?.isProd,
                                      );

                                      context.goNamed(
                                        KioskPaymentWidget.routeName,
                                        queryParameters: {
                                          'doc': serializeParam(
                                            widget!.doc,
                                            ParamType.DocumentReference,
                                          ),
                                          'shiftdetails': serializeParam(
                                            widget!.shiftdetails,
                                            ParamType.JSON,
                                          ),
                                          'qrJson': serializeParam(
                                            (_model.paymentQrResponse
                                                    ?.jsonBody ??
                                                ''),
                                            ParamType.JSON,
                                          ),
                                          'paytmOrderId': serializeParam(
                                            FFAppState().paytmOrderId,
                                            ParamType.String,
                                          ),
                                          'isPaytm': serializeParam(
                                            true,
                                            ParamType.bool,
                                          ),
                                          'appsettings': serializeParam(
                                            widget!.appSettings,
                                            ParamType.Document,
                                          ),
                                          'taxcollection': serializeParam(
                                            widget!.taxcollection,
                                            ParamType.Document,
                                            isList: true,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'appsettings': widget!.appSettings,
                                          'taxcollection':
                                              widget!.taxcollection,
                                        },
                                      );
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            content: Text(
                                                'Merchant Id  Is Not Available Contact Support!'),
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
                                          content: Text('Cart Is Empty !'),
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

                                    context.goNamed(
                                      KioskBillScreenWidget.routeName,
                                      queryParameters: {
                                        'doc': serializeParam(
                                          widget!.doc,
                                          ParamType.DocumentReference,
                                        ),
                                        'shiftdoc': serializeParam(
                                          widget!.shiftdetails,
                                          ParamType.JSON,
                                        ),
                                        'appsetting': serializeParam(
                                          widget!.appSettings,
                                          ParamType.Document,
                                        ),
                                        'taxcollection': serializeParam(
                                          widget!.taxcollection,
                                          ParamType.Document,
                                          isList: true,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'appsetting': widget!.appSettings,
                                        'taxcollection': widget!.taxcollection,
                                      },
                                    );
                                  }

                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.6,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.15,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).info,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 12.0,
                                        color: Color(0x26000000),
                                        offset: Offset(
                                          9.0,
                                          9.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(30.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Icon(
                                            Icons.qr_code_scanner,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            size: 50.0,
                                          ).animateOnPageLoad(animationsMap[
                                              'iconOnPageLoadAnimation1']!),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'mviqs44r' /* UPI Payment */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .displayLarge
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displayLargeFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  fontSize: 36.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .displayLargeIsCustom,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            if (!valueOrDefault<bool>(
                              widget!.appSettings?.settingList
                                  ?.where(
                                      (e) => e.title == 'hideUpiPaymentMode')
                                  .toList()
                                  ?.firstOrNull
                                  ?.value,
                              false,
                            ))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 25.0, 0.0, 25.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'mryzsdaf' /* OR */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .displayLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .displayLargeFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 30.0,
                                        letterSpacing: 5.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .displayLargeIsCustom,
                                      ),
                                ),
                              ),
                            if (!valueOrDefault<bool>(
                              widget!.appSettings?.settingList
                                  ?.where(
                                      (e) => e.title == 'hideCashPaymentMode')
                                  .toList()
                                  ?.firstOrNull
                                  ?.value,
                              false,
                            ))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 50.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    FFAppState().PayMode = 'CASH';
                                    safeSetState(() {});
                                    _model.outletDOc2 =
                                        await queryOutletRecordOnce(
                                      queryBuilder: (outletRecord) =>
                                          outletRecord.where(
                                        'id',
                                        isEqualTo: FFAppState().outletIdRef?.id,
                                      ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    if (functions
                                        .filterBillList(FFAppState().selBill,
                                            FFAppState().allBillsList.toList())
                                        .isNotEmpty) {
                                      if (_model.outletDOc2?.merchantId !=
                                              null &&
                                          _model.outletDOc2?.merchantId != '') {
                                        if (getJsonField(
                                          widget!.shiftdetails,
                                          r'''$.shiftExists''',
                                        )) {}
                                        FFAppState().orderId =
                                            FFAppState().orderId + 10;
                                        FFAppState().paytmOrderId =
                                            valueOrDefault<String>(
                                          'ORD-${getCurrentTimestamp.millisecondsSinceEpoch.toString()}',
                                          '0',
                                        );
                                        FFAppState().outletId =
                                            _model.outletDOc2!.id;
                                        safeSetState(() {});
                                        _model.paymentQrResponsecash =
                                            await CreateQRCall.call(
                                          mid: _model.outletDOc2?.merchantId,
                                          orderId: FFAppState().paytmOrderId,
                                          amount: functions
                                              .toDecimal(FFAppState().finalAmt),
                                          businessType: 'UPI_QR_CODE',
                                          posId: _model.outletDOc2?.id,
                                          mKey: _model.outletDOc2?.merchantKey,
                                          isProd: _model.outletDOc2?.isProd,
                                        );

                                        context.goNamed(
                                          CashResponsePageWidget.routeName,
                                          queryParameters: {
                                            'shiftdetails': serializeParam(
                                              widget!.shiftdetails,
                                              ParamType.JSON,
                                            ),
                                            'appsetting': serializeParam(
                                              widget!.appSettings,
                                              ParamType.Document,
                                            ),
                                            'taxcoollectipon': serializeParam(
                                              widget!.taxcollection,
                                              ParamType.Document,
                                              isList: true,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'appsetting': widget!.appSettings,
                                            'taxcoollectipon':
                                                widget!.taxcollection,
                                          },
                                        );
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              content: Text(
                                                  'Merchant Id  Is Not Available Contact Support!'),
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
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            content: Text('Cart Is Empty !'),
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

                                      context.goNamed(
                                        KioskBillScreenWidget.routeName,
                                        queryParameters: {
                                          'doc': serializeParam(
                                            widget!.doc,
                                            ParamType.DocumentReference,
                                          ),
                                          'shiftdoc': serializeParam(
                                            widget!.shiftdetails,
                                            ParamType.JSON,
                                          ),
                                          'appsetting': serializeParam(
                                            widget!.appSettings,
                                            ParamType.Document,
                                          ),
                                          'taxcollection': serializeParam(
                                            widget!.taxcollection,
                                            ParamType.Document,
                                            isList: true,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'appsetting': widget!.appSettings,
                                          'taxcollection':
                                              widget!.taxcollection,
                                        },
                                      );
                                    }

                                    safeSetState(() {});
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.6,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.15,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).info,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 12.0,
                                          color: Color(0x27000000),
                                          offset: Offset(
                                            9.0,
                                            9.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(30.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: FaIcon(
                                                FontAwesomeIcons
                                                    .moneyBillWaveAlt,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                size: 45.0,
                                              ).animateOnPageLoad(animationsMap[
                                                  'iconOnPageLoadAnimation2']!),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'xdnyt0ej' /* Pay at Counter */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .displayLarge
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .displayLargeFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBtnText,
                                                    fontSize: 36.0,
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .displayLargeIsCustom,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if (!valueOrDefault<bool>(
                              widget!.appSettings?.settingList
                                  ?.where(
                                      (e) => e.title == 'hideUpiPaymentMode')
                                  .toList()
                                  ?.firstOrNull
                                  ?.value,
                              false,
                            ))
                              FFButtonWidget(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: FFLocalizations.of(context).getText(
                                  '0yxoolqe' /* UPI Payment */,
                                ),
                                icon: Icon(
                                  Icons.qr_code_scanner,
                                  size: 50.0,
                                ),
                                options: FFButtonOptions(
                                  width: 500.0,
                                  height: 200.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  color: FlutterFlowTheme.of(context).info,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: Colors.white,
                                        fontSize: 50.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .titleSmallIsCustom,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            if (!valueOrDefault<bool>(
                              widget!.appSettings?.settingList
                                  ?.where(
                                      (e) => e.title == 'hideCashPaymentMode')
                                  .toList()
                                  ?.firstOrNull
                                  ?.value,
                              false,
                            ))
                              FFButtonWidget(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: FFLocalizations.of(context).getText(
                                  'tqfejg1j' /* UPI Payment */,
                                ),
                                icon: Icon(
                                  Icons.qr_code_scanner,
                                  size: 50.0,
                                ),
                                options: FFButtonOptions(
                                  width: 500.0,
                                  height: 200.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  color: FlutterFlowTheme.of(context).info,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: Colors.white,
                                        fontSize: 50.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .titleSmallIsCustom,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
