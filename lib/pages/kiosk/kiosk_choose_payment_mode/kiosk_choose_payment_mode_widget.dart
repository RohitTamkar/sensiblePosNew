import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/alert_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/kiosk/kiosk_header/kiosk_header_widget.dart';
import 'dart:convert';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'kiosk_choose_payment_mode_model.dart';
export 'kiosk_choose_payment_mode_model.dart';

class KioskChoosePaymentModeWidget extends StatefulWidget {
  const KioskChoosePaymentModeWidget({
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

  static String routeName = 'KioskChoosePaymentMode';
  static String routePath = 'kioskChoosePaymentMode';

  @override
  State<KioskChoosePaymentModeWidget> createState() =>
      _KioskChoosePaymentModeWidgetState();
}

class _KioskChoosePaymentModeWidgetState
    extends State<KioskChoosePaymentModeWidget> {
  late KioskChoosePaymentModeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KioskChoosePaymentModeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.footer = await queryFooterRecordOnce(
        parent: FFAppState().outletIdRef,
        singleRecord: true,
      ).then((s) => s.firstOrNull);
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
    context.watch<confetti_modualo_library_b75kfy_app_state.FFAppState>();

    return Title(
        title: 'KioskChoosePaymentMode',
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
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 20.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).primary,
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
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
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
                                FFAppState().finalAmt.toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                              ),
                              if (valueOrDefault<bool>(
                                widget!.appSettings?.settingList
                                    ?.where((e) => e.title == 'applyCouponCode')
                                    .toList()
                                    ?.firstOrNull
                                    ?.value,
                                false,
                              ))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      25.0, 0.0, 0.0, 10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: 200.0,
                                          child: TextFormField(
                                            controller: _model.textController,
                                            focusNode:
                                                _model.textFieldFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMediumIsCustom,
                                                      ),
                                              hintText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                '6pjr7fhs' /* COUPON CODE */,
                                              ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMediumIsCustom,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            style: FlutterFlowTheme.of(context)
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
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            validator: _model
                                                .textControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            if (_model.textController.text !=
                                                    null &&
                                                _model.textController.text !=
                                                    '') {
                                              _model.coupDoc =
                                                  await queryCouponsCodeRecordOnce(
                                                parent:
                                                    FFAppState().outletIdRef,
                                                queryBuilder:
                                                    (couponsCodeRecord) =>
                                                        couponsCodeRecord
                                                            .where(
                                                              'couponCode',
                                                              isEqualTo: _model
                                                                  .textController
                                                                  .text,
                                                            )
                                                            .where(
                                                              'isActive',
                                                              isEqualTo: true,
                                                            ),
                                                singleRecord: true,
                                              ).then((s) => s.firstOrNull);
                                              if (_model.coupDoc != null) {
                                                _model.disAmount = await actions
                                                    .applyCouponCode(
                                                  FFAppState().finalAmt,
                                                  _model.coupDoc,
                                                );
                                                FFAppState().disAmt =
                                                    _model.disAmount!;
                                                safeSetState(() {});
                                                _model.res23456 = await actions
                                                    .calSubTotalForHoldListkiosk2(
                                                  valueOrDefault<String>(
                                                    FFAppState()
                                                        .selBill
                                                        .toString(),
                                                    '1',
                                                  ),
                                                  FFAppState()
                                                      .allBillsList
                                                      .toList(),
                                                  functions.enabletaxinclusive(
                                                      widget!.appSettings!
                                                          .settingList
                                                          .where((e) =>
                                                              e.title ==
                                                              'enableInclusiveTax')
                                                          .toList()
                                                          .firstOrNull!
                                                          .value),
                                                  widget!
                                                      .appSettings!.settingList
                                                      .where((e) =>
                                                          e.title ==
                                                          'qtyWiseParcelCharges')
                                                      .toList()
                                                      .firstOrNull!
                                                      .value,
                                                );
                                                _model.reuslt123 =
                                                    await actions.calBillAmt2(
                                                  valueOrDefault<double>(
                                                    FFAppState().disAmt,
                                                    0.0,
                                                  ),
                                                  FFAppState().delCharges,
                                                  widget!
                                                      .appSettings!.settingList
                                                      .where((e) =>
                                                          e.title ==
                                                          'qtyWiseParcelCharges')
                                                      .toList()
                                                      .firstOrNull!
                                                      .value,
                                                );
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
                                                        child: Container(
                                                          height: 200.0,
                                                          child: AlertWidget(),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text('Invalid'),
                                                      content: Text(
                                                          'Coupon Code Invalid or Expired'),
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
                                                    title: Text('Error'),
                                                    content: Text(
                                                        'Input Coupon Code...'),
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

                                            safeSetState(() {});
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '8hhr58l4' /* Apply */,
                                          ),
                                          icon: Icon(
                                            Icons.confirmation_num,
                                            size: 15.0,
                                          ),
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
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
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallIsCustom,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 15.0)),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'sw0ojh01' /* Choose Payment Type  */,
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
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .displayLargeIsCustom,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 80.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '8bm0y3wk' /* Please Collect Your Token & Bi... */,
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
                                ?.where((e) => e.title == 'hideUpiPaymentMode')
                                .toList()
                                ?.firstOrNull
                                ?.value,
                            false,
                          ))
                            FFButtonWidget(
                              onPressed: () async {
                                FFAppState().PayMode = 'UPI QR';
                                safeSetState(() {});
                                _model.outletDOc = await queryOutletRecordOnce(
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
                                    if (FFAppState().isRazorPay) {
                                      _model.apiResultplq =
                                          await RazorPaycreateQRCall.call(
                                        mid: _model.outletDOc?.merchantId,
                                        orderId: FFAppState().paytmOrderId,
                                        amount:
                                            FFAppState().finalAmt.toString(),
                                        posId: _model.outletDOc?.id,
                                        mKey: _model.outletDOc?.merchantKey,
                                        businessType: 'UPI_QR_CODE',
                                        isProd: _model.outletDOc?.isProd,
                                      );

                                      if ((_model.apiResultplq?.succeeded ??
                                          true)) {
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
                                              (_model.apiResultplq?.jsonBody ??
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
                                      }
                                    } else {
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
                                    }
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
                              text: FFLocalizations.of(context).getText(
                                'zsxrmuif' /* UPI Payment */,
                              ),
                              icon: Icon(
                                Icons.qr_code_scanner,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                size: 50.0,
                              ),
                              options: FFButtonOptions(
                                width: 550.0,
                                height: 200.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                color: FlutterFlowTheme.of(context).info,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: Colors.white,
                                      fontSize: 35.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .titleSmallIsCustom,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          if (valueOrDefault<bool>(
                            widget!.appSettings?.settingList
                                ?.where(
                                    (e) => e.title == 'showCardPaymentOption')
                                .toList()
                                ?.firstOrNull
                                ?.value,
                            false,
                          ))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 25.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'b4zgkn34' /* OR */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .displayLarge
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .displayLargeFamily,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 30.0,
                                      letterSpacing: 5.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .displayLargeIsCustom,
                                    ),
                              ),
                            ),
                          if (valueOrDefault<bool>(
                            widget!.appSettings?.settingList
                                ?.where(
                                    (e) => e.title == 'showCardPaymentOption')
                                .toList()
                                ?.firstOrNull
                                ?.value,
                            false,
                          ))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 50.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  FFAppState().PayMode = 'CARD';
                                  safeSetState(() {});
                                  _model.outletDOccard =
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
                                    if (_model.outletDOccard?.paytmTid !=
                                            null &&
                                        _model.outletDOccard?.paytmTid != '') {
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
                                          _model.outletDOccard!.id;
                                      FFAppState().transactionDateTimeCard =
                                          dateTimeFormat(
                                        "y-MM-d H:mm:s",
                                        getCurrentTimestamp,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      );
                                      safeSetState(() {});
                                      _model.cardPaymentApiResponse =
                                          await CardSwipeSaleCall.call(
                                        isProd: _model.outletDOccard?.isProd,
                                        mkey:
                                            _model.outletDOccard?.paytmCardmkey,
                                        channelId:
                                            _model.outletDOccard?.channelId,
                                        paytmMid:
                                            _model.outletDOccard?.paytmMid,
                                        paytmTid:
                                            _model.outletDOccard?.paytmTid,
                                        merchantTransactionId:
                                            FFAppState().paytmOrderId,
                                        transactionAmount:
                                            FFAppState().finalAmt * 100,
                                        transactionDateTime: FFAppState()
                                            .transactionDateTimeCard,
                                      );

                                      if ((_model.cardPaymentApiResponse
                                              ?.succeeded ??
                                          true)) {
                                        if ('ACCEPTED_SUCCESS' ==
                                            getJsonField(
                                              (_model.cardPaymentApiResponse
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.body.resultInfo.resultStatus''',
                                            ).toString()) {
                                          context.pushNamed(
                                            KioskCardPaymentWidget.routeName,
                                            queryParameters: {
                                              'doc': serializeParam(
                                                widget!.doc,
                                                ParamType.DocumentReference,
                                              ),
                                              'shiftdetails': serializeParam(
                                                widget!.shiftdetails,
                                                ParamType.JSON,
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
                                              'paytmOrderId': serializeParam(
                                                FFAppState().paytmOrderId,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'appsettings':
                                                  widget!.appSettings,
                                              'taxcollection':
                                                  widget!.taxcollection,
                                            },
                                          );
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Error'),
                                                content: Text(getJsonField(
                                                  (_model.cardPaymentApiResponse
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.body.resultInfo.resultMsg''',
                                                ).toString()),
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
                                              title: Text('Error'),
                                              content: Text('Api Failed'),
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
                                text: FFLocalizations.of(context).getText(
                                  '920v2xki' /* Card payment */,
                                ),
                                icon: Icon(
                                  Icons.credit_card,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 50.0,
                                ),
                                options: FFButtonOptions(
                                  width: 550.0,
                                  height: 200.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  color: FlutterFlowTheme.of(context).info,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: Colors.white,
                                        fontSize: 35.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .titleSmallIsCustom,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                          if (!valueOrDefault<bool>(
                            widget!.appSettings?.settingList
                                ?.where((e) => e.title == 'hideUpiPaymentMode')
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
                                  'bi488f0w' /* OR */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .displayLarge
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .displayLargeFamily,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                ?.where((e) => e.title == 'hideCashPaymentMode')
                                .toList()
                                ?.firstOrNull
                                ?.value,
                            false,
                          ))
                            FFButtonWidget(
                              onPressed: () async {
                                FFAppState().PayMode = 'CASH';
                                safeSetState(() {});
                                _model.outletDOc2 = await queryOutletRecordOnce(
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
                                  if (_model.outletDOc2?.merchantId != null &&
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
                              text: FFLocalizations.of(context).getText(
                                'fwj35smm' /* Pay at Counter */,
                              ),
                              icon: FaIcon(
                                FontAwesomeIcons.moneyBillWaveAlt,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                size: 50.0,
                              ),
                              options: FFButtonOptions(
                                width: 550.0,
                                height: 200.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                color: FlutterFlowTheme.of(context).info,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: Colors.white,
                                      fontSize: 35.0,
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
