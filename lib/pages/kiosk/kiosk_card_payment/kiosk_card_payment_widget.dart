import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/pages/kiosk/kiosk_header/kiosk_header_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'kiosk_card_payment_model.dart';
export 'kiosk_card_payment_model.dart';

class KioskCardPaymentWidget extends StatefulWidget {
  const KioskCardPaymentWidget({
    super.key,
    this.doc,
    this.shiftdetails,
    this.qrJson,
    this.paytmOrderId,
    this.isPaytm,
    this.appsettings,
    this.taxcollection,
  });

  final DocumentReference? doc;
  final dynamic shiftdetails;
  final dynamic qrJson;
  final String? paytmOrderId;
  final bool? isPaytm;
  final AppSettingsRecord? appsettings;
  final List<TaxMasterRecord>? taxcollection;

  static String routeName = 'KioskCardPayment';
  static String routePath = 'kioskCardPayment';

  @override
  State<KioskCardPaymentWidget> createState() => _KioskCardPaymentWidgetState();
}

class _KioskCardPaymentWidgetState extends State<KioskCardPaymentWidget> {
  late KioskCardPaymentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KioskCardPaymentModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();
      await actions.hideStatusBar();
      FFAppState().shiftDetailsNEw = widget!.shiftdetails!;
      safeSetState(() {});
      FFAppState().shiftDetailsJson = widget!.shiftdetails!;
      FFAppState().kioskAmt = FFAppState().finalAmt;
      safeSetState(() {});
      _model.outlet2 = await queryOutletRecordOnce(
        queryBuilder: (outletRecord) => outletRecord.where(
          'id',
          isEqualTo: FFAppState().outletIdRef?.id,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 5000),
        callback: (timer) async {
          _model.apiResultf9m = await CardSaleStatusCall.call(
            isProd: _model.outlet2?.isProd,
            mkey: _model.outlet2?.paytmCardmkey,
            channelId: _model.outlet2?.channelId,
            paytmMid: _model.outlet2?.paytmMid,
            paytmTid: _model.outlet2?.paytmTid,
            transactionDateTime: FFAppState().transactionDateTimeCard,
            merchantTransactionId: FFAppState().paytmOrderId,
            outletId: FFAppState().outletIdRef?.id,
          );

          if ((_model.apiResultf9m?.succeeded ?? true)) {}
        },
        startImmediately: true,
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

    return Title(
        title: 'KioskCardPayment',
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
              body: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    alignment: AlignmentDirectional(0.0, -1.0),
                    image: Image.asset(
                      'assets/images/Top_img_4.png',
                    ).image,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            30.0, 0.0, 30.0, 15.0),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 0.13,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onLongPress: () async {
                                  context.pushNamed(KioskLoginWidget.routeName);
                                },
                                child: wrapWithModel(
                                  model: _model.kioskHeaderModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: KioskHeaderWidget(),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (false)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 20.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            borderRadius: 15.0,
                                            borderWidth: 0.5,
                                            buttonSize: 75.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            icon: Icon(
                                              Icons.keyboard_backspace_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 40.0,
                                            ),
                                            onPressed: () async {
                                              context.pushNamed(
                                                  KioskCartWidget.routeName);
                                            },
                                          ),
                                        ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'juo8jcfp' /* Payment */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 30.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .headlineSmallIsCustom,
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 60.0)),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      var confirmDialogResponse =
                                          await showDialog<bool>(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    content: Text(
                                                        'Are You Sure To Cancel Order ?'),
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
                                                        child: Text('Confirm'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ) ??
                                              false;
                                      if (confirmDialogResponse) {
                                        _model.timerController.onStopTimer();
                                        _model.instantTimer?.cancel();
                                        _model.outletCancel =
                                            await queryOutletRecordOnce(
                                          queryBuilder: (outletRecord) =>
                                              outletRecord.where(
                                            'id',
                                            isEqualTo:
                                                FFAppState().outletIdRef?.id,
                                          ),
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);
                                        _model.apiResultf9m2Cancel =
                                            await CardSaleStatusCall.call(
                                          isProd: _model.outletCancel?.isProd,
                                          mkey: _model
                                              .outletCancel?.paytmCardmkey,
                                          channelId:
                                              _model.outletCancel?.channelId,
                                          paytmMid:
                                              _model.outletCancel?.paytmMid,
                                          paytmTid:
                                              _model.outletCancel?.paytmTid,
                                          transactionDateTime: FFAppState()
                                              .transactionDateTimeCard,
                                          merchantTransactionId:
                                              FFAppState().paytmOrderId,
                                          outletId:
                                              _model.outletCancel?.reference.id,
                                        );

                                        _model.qrdocCancel =
                                            await queryQrTransactionsRecordOnce(
                                          parent: FFAppState().outletIdRef,
                                          queryBuilder:
                                              (qrTransactionsRecord) =>
                                                  qrTransactionsRecord.where(
                                            'orderId',
                                            isEqualTo:
                                                FFAppState().paytmOrderId,
                                          ),
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);

                                        await _model.qrdocCancel!.reference
                                            .update(
                                                createQrTransactionsRecordData(
                                          resultStatus: 'TXN_FAILURE',
                                          msg:
                                              'Order Is Canceled  By Customer !',
                                        ));
                                      }

                                      safeSetState(() {});
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      '9b8jmurm' /* Cancel Order ! */,
                                    ),
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  Stack(
                                    children: [
                                      if (FFAppState().orderType == 'DINE IN')
                                        FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'ae04zi59' /* Dine In */,
                                          ),
                                          icon: Icon(
                                            Icons.dinner_dining_rounded,
                                            size: 30.0,
                                          ),
                                          options: FFButtonOptions(
                                            height: 65.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            color: Color(0x00B6001A),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      fontSize: 24.0,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallIsCustom,
                                                    ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      if (FFAppState().orderType == 'PARCEL')
                                        FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'g6bveuh7' /* Parcel */,
                                          ),
                                          icon: Icon(
                                            Icons.takeout_dining_rounded,
                                            size: 30.0,
                                          ),
                                          options: FFButtonOptions(
                                            height: 65.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            color: Color(0x00B6001A),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      fontSize: 24.0,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallIsCustom,
                                                    ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 100.0,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 0.0, 30.0, 20.0),
                            child: Container(
                              height: double.infinity,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 20.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                        border: Border.all(
                                          color: Color(0xFF61D36B),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            25.0, 10.0, 25.0, 25.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: StreamBuilder<
                                                  List<HeaderRecord>>(
                                                stream: queryHeaderRecord(
                                                  parent:
                                                      FFAppState().outletIdRef,
                                                  singleRecord: true,
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 40.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<HeaderRecord>
                                                      imageHeaderRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the item does not exist.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final imageHeaderRecord =
                                                      imageHeaderRecordList
                                                              .isNotEmpty
                                                          ? imageHeaderRecordList
                                                              .first
                                                          : null;

                                                  return ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      valueOrDefault<String>(
                                                        functions.imageurltostring(
                                                            imageHeaderRecord
                                                                ?.logoImageUrl),
                                                        'https://as1.ftcdn.net/v2/jpg/04/34/72/82/1000_F_434728286_OWQQvAFoXZLdGHlObozsolNeuSxhpr84.jpg',
                                                      ),
                                                      width: 200.0,
                                                      height: 200.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: Text(
                                                'Orderid  : ${FFAppState().paytmOrderId}',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelLarge
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLargeFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      fontSize: 18.0,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLargeIsCustom,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 20.0),
                                              child: FlutterFlowTimer(
                                                initialTime:
                                                    _model.timerInitialTimeMs,
                                                getDisplayTime: (value) =>
                                                    StopWatchTimer
                                                        .getDisplayTime(
                                                  value,
                                                  hours: false,
                                                  milliSecond: false,
                                                ),
                                                controller:
                                                    _model.timerController,
                                                updateStateInterval: Duration(
                                                    milliseconds: 1000),
                                                onChanged: (value, displayTime,
                                                    shouldUpdate) {
                                                  _model.timerMilliseconds =
                                                      value;
                                                  _model.timerValue =
                                                      displayTime;
                                                  if (shouldUpdate)
                                                    safeSetState(() {});
                                                },
                                                onEnded: () async {
                                                  _model.outlet =
                                                      await queryOutletRecordOnce(
                                                    queryBuilder:
                                                        (outletRecord) =>
                                                            outletRecord.where(
                                                      'id',
                                                      isEqualTo: FFAppState()
                                                          .outletIdRef
                                                          ?.id,
                                                    ),
                                                    singleRecord: true,
                                                  ).then((s) => s.firstOrNull);
                                                  _model.apiResultf9m2 =
                                                      await CardSaleStatusCall
                                                          .call(
                                                    isProd:
                                                        _model.outlet?.isProd,
                                                    mkey: _model
                                                        .outlet?.paytmCardmkey,
                                                    channelId: _model
                                                        .outlet?.channelId,
                                                    paytmMid:
                                                        _model.outlet?.paytmMid,
                                                    paytmTid:
                                                        _model.outlet?.paytmTid,
                                                    transactionDateTime:
                                                        FFAppState()
                                                            .transactionDateTimeCard,
                                                    merchantTransactionId:
                                                        FFAppState()
                                                            .paytmOrderId,
                                                    outletId: _model
                                                        .outlet?.reference.id,
                                                  );

                                                  _model.qrdoc =
                                                      await queryQrTransactionsRecordOnce(
                                                    parent: FFAppState()
                                                        .outletIdRef,
                                                    queryBuilder:
                                                        (qrTransactionsRecord) =>
                                                            qrTransactionsRecord
                                                                .where(
                                                      'orderId',
                                                      isEqualTo: FFAppState()
                                                          .paytmOrderId,
                                                    ),
                                                    singleRecord: true,
                                                  ).then((s) => s.firstOrNull);
                                                  _model.instantTimer?.cancel();

                                                  await _model.qrdoc!.reference
                                                      .update(
                                                          createQrTransactionsRecordData(
                                                    resultStatus: 'TXN_FAILURE',
                                                    msg: 'QR CODE IS EXPIRED !',
                                                  ));

                                                  safeSetState(() {});
                                                },
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineLargeFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          fontSize: 50.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineLargeIsCustom,
                                                        ),
                                              ),
                                            ),
                                            Stack(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/pos-payment-animation-download-in-lottie-json-gif-static-svg-file-formats--card-device-invoice-tool-receipt-e-commerce-shopping-animations-4204136-ezgif.com-video-to-gif-converter.gif',
                                                    width: 500.0,
                                                    height: 500.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            StreamBuilder<
                                                List<QrTransactionsRecord>>(
                                              stream: queryQrTransactionsRecord(
                                                parent:
                                                    FFAppState().outletIdRef,
                                                queryBuilder:
                                                    (qrTransactionsRecord) =>
                                                        qrTransactionsRecord
                                                            .where(
                                                  'orderId',
                                                  isEqualTo:
                                                      widget!.paytmOrderId,
                                                ),
                                                singleRecord: true,
                                              )..listen((snapshot) {
                                                  List<QrTransactionsRecord>
                                                      listViewQrTransactionsRecordList =
                                                      snapshot;
                                                  final listViewQrTransactionsRecord =
                                                      listViewQrTransactionsRecordList
                                                              .isNotEmpty
                                                          ? listViewQrTransactionsRecordList
                                                              .first
                                                          : null;
                                                  if (_model.listViewPreviousSnapshot !=
                                                          null &&
                                                      !const ListEquality(
                                                              QrTransactionsRecordDocumentEquality())
                                                          .equals(
                                                              listViewQrTransactionsRecordList,
                                                              _model
                                                                  .listViewPreviousSnapshot)) {
                                                    () async {
                                                      if (listViewQrTransactionsRecord
                                                              ?.resultStatus ==
                                                          'SUCCESS') {
                                                        _model.timerController
                                                            .onStopTimer();
                                                        _model.instantTimer
                                                            ?.cancel();

                                                        context.pushNamed(
                                                          ResponsePageWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'doc':
                                                                serializeParam(
                                                              listViewQrTransactionsRecord,
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                            'shiftdetails':
                                                                serializeParam(
                                                              widget!
                                                                  .shiftdetails,
                                                              ParamType.JSON,
                                                            ),
                                                            'appsetting':
                                                                serializeParam(
                                                              widget!
                                                                  .appsettings,
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                            'taxcoollectipon':
                                                                serializeParam(
                                                              widget!
                                                                  .taxcollection,
                                                              ParamType
                                                                  .Document,
                                                              isList: true,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'doc':
                                                                listViewQrTransactionsRecord,
                                                            'appsetting': widget!
                                                                .appsettings,
                                                            'taxcoollectipon':
                                                                widget!
                                                                    .taxcollection,
                                                          },
                                                        );
                                                      } else {
                                                        if (listViewQrTransactionsRecord
                                                                ?.resultStatus ==
                                                            'FAIL') {
                                                          context.pushNamed(
                                                            ResponsePageWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'doc':
                                                                  serializeParam(
                                                                listViewQrTransactionsRecord,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                              'shiftdetails':
                                                                  serializeParam(
                                                                widget!
                                                                    .shiftdetails,
                                                                ParamType.JSON,
                                                              ),
                                                              'appsetting':
                                                                  serializeParam(
                                                                widget!
                                                                    .appsettings,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                              'taxcoollectipon':
                                                                  serializeParam(
                                                                widget!
                                                                    .taxcollection,
                                                                ParamType
                                                                    .Document,
                                                                isList: true,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'doc':
                                                                  listViewQrTransactionsRecord,
                                                              'appsetting': widget!
                                                                  .appsettings,
                                                              'taxcoollectipon':
                                                                  widget!
                                                                      .taxcollection,
                                                            },
                                                          );
                                                        }
                                                      }

                                                      safeSetState(() {});
                                                    }();
                                                  }
                                                  _model.listViewPreviousSnapshot =
                                                      snapshot;
                                                }),
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
                                                List<QrTransactionsRecord>
                                                    listViewQrTransactionsRecordList =
                                                    snapshot.data!;
                                                final listViewQrTransactionsRecord =
                                                    listViewQrTransactionsRecordList
                                                            .isNotEmpty
                                                        ? listViewQrTransactionsRecordList
                                                            .first
                                                        : null;

                                                return ListView(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  children: [],
                                                );
                                              },
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 25.0, 0.0, 0.0),
                                              child: StreamBuilder<
                                                  List<OutletRecord>>(
                                                stream: queryOutletRecord(
                                                  queryBuilder:
                                                      (outletRecord) =>
                                                          outletRecord.where(
                                                    'id',
                                                    isEqualTo: FFAppState()
                                                        .outletIdRef
                                                        ?.id,
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
                                                  List<OutletRecord>
                                                      textOutletRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the item does not exist.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final textOutletRecord =
                                                      textOutletRecordList
                                                              .isNotEmpty
                                                          ? textOutletRecordList
                                                              .first
                                                          : null;

                                                  return Text(
                                                    valueOrDefault<String>(
                                                      textOutletRecord?.name,
                                                      '-',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .displayLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .displayLargeFamily,
                                                          fontSize: 30.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .displayLargeIsCustom,
                                                        ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                border: Border.all(
                                                  color: Color(0xFF033BE8),
                                                  width: 0.5,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        25.0, 15.0, 25.0, 15.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'rwur8fzi' /* Grand Total : */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .headlineLarge
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLargeFamily,
                                                              color: Color(
                                                                  0xFF033BE8),
                                                              fontSize: 25.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLargeIsCustom,
                                                            ),
                                                      ),
                                                    ),
                                                    RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              '3z8igta0' /* ₹  */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily,
                                                                  color: Color(
                                                                      0xFF0046D3),
                                                                  fontSize:
                                                                      30.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmallIsCustom,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text: FFAppState()
                                                                .finalAmt
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily,
                                                                  color: Color(
                                                                      0xFF0046D3),
                                                                  fontSize:
                                                                      40.0,
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
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily,
                                                                  color: Color(
                                                                      0xFF0046D3),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmallIsCustom,
                                                                ),
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ],
                                                ),
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
