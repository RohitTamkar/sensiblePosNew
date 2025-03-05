import '';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/selectlabel/selectlabel_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_mode_purches_model.dart';
export 'payment_mode_purches_model.dart';

class PaymentModePurchesWidget extends StatefulWidget {
  const PaymentModePurchesWidget({
    super.key,
    this.shiftdetail,
    this.taxDetails,
    this.userref,
    this.paymentMode,
    String? suppplierbillno,
    String? supplierbilldate,
    String? note,
  })  : this.suppplierbillno = suppplierbillno ?? '0',
        this.supplierbilldate = supplierbilldate ?? '0',
        this.note = note ?? '0';

  final dynamic shiftdetail;
  final List<TaxMasterRecord>? taxDetails;
  final DocumentReference? userref;
  final List<PaymentModeRecord>? paymentMode;
  final String suppplierbillno;
  final String supplierbilldate;
  final String note;

  @override
  State<PaymentModePurchesWidget> createState() =>
      _PaymentModePurchesWidgetState();
}

class _PaymentModePurchesWidgetState extends State<PaymentModePurchesWidget> {
  late PaymentModePurchesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentModePurchesModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.listOfOrdersAdmin = await queryPurchaseRecordOnce(
        parent: FFAppState().outletIdRef,
      );
      FFAppState().orderDetails = _model.listOfOrdersAdmin!
          .map((e) => e.productList.firstOrNull)
          .withoutNulls
          .toList()
          .toList()
          .cast<PurchaseSaleItemListStruct>();
      FFAppState().selectedDate = getCurrentTimestamp;
      safeSetState(() {});
      _model.amount = FFAppState().finalAmt.toString();
      safeSetState(() {});
      safeSetState(() {
        _model.textController1?.text = _model.amount!;
      });
    });

    _model.textController1 ??= TextEditingController(text: _model.amount);
    _model.textFieldFocusNode ??= FocusNode();

    _model.textFielddisperTextController ??= TextEditingController();
    _model.textFielddisperFocusNode ??= FocusNode();

    _model.textFielddisamtTextController ??= TextEditingController();
    _model.textFielddisamtFocusNode ??= FocusNode();

    _model.textFieldgstperTextController ??= TextEditingController();
    _model.textFieldgstperFocusNode ??= FocusNode();

    _model.textFieldextraTextController ??= TextEditingController();
    _model.textFieldextraFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.textFielddisperTextController?.text =
              FFLocalizations.of(context).getText(
            '3i2oxei6' /* 0 */,
          );
          _model.textFielddisamtTextController?.text =
              FFLocalizations.of(context).getText(
            'nz8wecah' /* 0 */,
          );
          _model.textFieldgstperTextController?.text =
              FFLocalizations.of(context).getText(
            '8gyhjds4' /* 0 */,
          );
          _model.textFieldextraTextController?.text =
              FFLocalizations.of(context).getText(
            'xu8mzj7b' /* 0 */,
          );
        }));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        decoration: BoxDecoration(),
        child: StreamBuilder<List<AppSettingsRecord>>(
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
            List<AppSettingsRecord> containerAppSettingsRecordList =
                snapshot.data!;
            // Return an empty Container when the item does not exist.
            if (snapshot.data!.isEmpty) {
              return Container();
            }
            final containerAppSettingsRecord =
                containerAppSettingsRecordList.isNotEmpty
                    ? containerAppSettingsRecordList.first
                    : null;

            return Container(
              width: 800.0,
              height: 700.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              '8vowm53s' /* Payment Mode */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            buttonSize: 40.0,
                            fillColor: FlutterFlowTheme.of(context).primary,
                            icon: Icon(
                              Icons.close_sharp,
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: StreamBuilder<List<PaymentModeRecord>>(
                        stream: queryPaymentModeRecord(),
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
                          List<PaymentModeRecord>
                              containerPaymentModeRecordList = snapshot.data!;

                          return Container(
                            width: double.infinity,
                            height: 550.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:
                                    FlutterFlowTheme.of(context).customColor1,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 20.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                            width: 250.0,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor3,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final paymentMode =
                                                      containerPaymentModeRecordList
                                                          .toList();

                                                  return GridView.builder(
                                                    padding: EdgeInsets.zero,
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                      crossAxisSpacing: 5.0,
                                                      mainAxisSpacing: 10.0,
                                                      childAspectRatio: 1.75,
                                                    ),
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        paymentMode.length,
                                                    itemBuilder: (context,
                                                        paymentModeIndex) {
                                                      final paymentModeItem =
                                                          paymentMode[
                                                              paymentModeIndex];
                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: paymentModeItem
                                                                      .name ==
                                                                  FFAppState()
                                                                      .PayMode
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .alternate
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
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
                                                                    .PayMode =
                                                                paymentModeItem
                                                                    .name;
                                                            safeSetState(() {});
                                                          },
                                                          child: Column(
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
                                                                paymentModeItem
                                                                    .name,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineSmallFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Flexible(
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              FFAppState()
                                                                  .PayMode,
                                                              'Cash',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineSmallFamily),
                                                                ),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: Text(
                                                            'Grand Total:${FFAppState().finalAmt.toString()}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineSmallFamily),
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    TextFormField(
                                                      controller: _model
                                                          .textController1,
                                                      focusNode: _model
                                                          .textFieldFocusNode,
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'a2dqnhhk' /* Amount */,
                                                        ),
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily),
                                                                ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily),
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                        ),
                                                        filled: true,
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 22.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleMediumFamily),
                                                              ),
                                                      validator: _model
                                                          .textController1Validator
                                                          .asValidator(context),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              _model.amount =
                                                                  '${_model.textController1.text}1';
                                                              safeSetState(
                                                                  () {});
                                                              safeSetState(() {
                                                                _model.textController1
                                                                        ?.text =
                                                                    _model
                                                                        .amount!;
                                                              });
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'mwgsgdaq' /* 1 */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
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
                                                                  .customColor2,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            19.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              elevation: 3.0,
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
                                                        ),
                                                        Expanded(
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              _model.amount =
                                                                  '${_model.textController1.text}2';
                                                              safeSetState(
                                                                  () {});
                                                              safeSetState(() {
                                                                _model.textController1
                                                                        ?.text =
                                                                    _model
                                                                        .amount!;
                                                              });
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              '3wcdhcyp' /* 2 */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
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
                                                                  .customColor2,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            19.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              elevation: 3.0,
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
                                                        ),
                                                        Expanded(
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              _model.amount =
                                                                  '${_model.textController1.text}3';
                                                              safeSetState(
                                                                  () {});
                                                              safeSetState(() {
                                                                _model.textController1
                                                                        ?.text =
                                                                    _model
                                                                        .amount!;
                                                              });
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'a06a5ifm' /* 3 */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
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
                                                                  .customColor2,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            19.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              elevation: 3.0,
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
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 15.0)),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              _model.amount =
                                                                  '${_model.textController1.text}4';
                                                              safeSetState(
                                                                  () {});
                                                              safeSetState(() {
                                                                _model.textController1
                                                                        ?.text =
                                                                    _model
                                                                        .amount!;
                                                              });
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'r3bqw8p9' /* 4 */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
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
                                                                  .customColor2,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            19.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              elevation: 3.0,
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
                                                        ),
                                                        Expanded(
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              _model.amount =
                                                                  '${_model.textController1.text}5';
                                                              safeSetState(
                                                                  () {});
                                                              safeSetState(() {
                                                                _model.textController1
                                                                        ?.text =
                                                                    _model
                                                                        .amount!;
                                                              });
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'shtxseea' /* 5 */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
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
                                                                  .customColor2,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            19.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              elevation: 3.0,
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
                                                        ),
                                                        Expanded(
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              _model.amount =
                                                                  '${_model.textController1.text}6';
                                                              safeSetState(
                                                                  () {});
                                                              safeSetState(() {
                                                                _model.textController1
                                                                        ?.text =
                                                                    _model
                                                                        .amount!;
                                                              });
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'odvpkbyt' /* 6 */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
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
                                                                  .customColor2,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            19.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              elevation: 3.0,
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
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 15.0)),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              _model.amount =
                                                                  '${_model.textController1.text}7';
                                                              safeSetState(
                                                                  () {});
                                                              safeSetState(() {
                                                                _model.textController1
                                                                        ?.text =
                                                                    _model
                                                                        .amount!;
                                                              });
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              '9qt239oq' /* 7 */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
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
                                                                  .customColor2,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            19.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              elevation: 3.0,
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
                                                        ),
                                                        Expanded(
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              _model.amount =
                                                                  '${_model.textController1.text}8';
                                                              safeSetState(
                                                                  () {});
                                                              safeSetState(() {
                                                                _model.textController1
                                                                        ?.text =
                                                                    _model
                                                                        .amount!;
                                                              });
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'h9s07hk1' /* 8 */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
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
                                                                  .customColor2,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            19.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              elevation: 3.0,
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
                                                        ),
                                                        Expanded(
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              _model.amount =
                                                                  '${_model.textController1.text}9';
                                                              safeSetState(
                                                                  () {});
                                                              safeSetState(() {
                                                                _model.textController1
                                                                        ?.text =
                                                                    _model
                                                                        .amount!;
                                                              });
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'slc3d0nw' /* 9 */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
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
                                                                  .customColor2,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            19.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              elevation: 3.0,
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
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 15.0)),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              _model.amount =
                                                                  '${_model.textController1.text}.';
                                                              safeSetState(
                                                                  () {});
                                                              safeSetState(() {
                                                                _model.textController1
                                                                        ?.text =
                                                                    _model
                                                                        .amount!;
                                                              });
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'qsv40s33' /* . */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
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
                                                                  .customColor2,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            28.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              elevation: 3.0,
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
                                                        ),
                                                        Expanded(
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              _model.amount =
                                                                  '${_model.textController1.text}0';
                                                              safeSetState(
                                                                  () {});
                                                              safeSetState(() {
                                                                _model.textController1
                                                                        ?.text =
                                                                    _model
                                                                        .amount!;
                                                              });
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'xd0zp830' /* 0 */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
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
                                                                  .customColor2,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            19.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              elevation: 3.0,
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
                                                        ),
                                                        Expanded(
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              FFAppState()
                                                                      .groceryJson =
                                                                  null;
                                                              FFAppState()
                                                                      .disAmtPay =
                                                                  0.0;
                                                              FFAppState()
                                                                      .taxAmtPay =
                                                                  0.0;
                                                              FFAppState()
                                                                      .delCharges =
                                                                  0.0;
                                                              safeSetState(
                                                                  () {});
                                                              safeSetState(() {
                                                                _model
                                                                    .textFielddisamtTextController
                                                                    ?.clear();
                                                                _model
                                                                    .textFieldgstperTextController
                                                                    ?.clear();
                                                                _model
                                                                    .textFieldextraTextController
                                                                    ?.clear();
                                                                _model
                                                                    .textFielddisperTextController
                                                                    ?.clear();
                                                              });
                                                              _model.ret =
                                                                  await actions
                                                                      .calSubTotalForGrocery(
                                                                FFAppState()
                                                                    .selBill
                                                                    .toString(),
                                                                FFAppState()
                                                                    .allBillsList
                                                                    .toList(),
                                                              );
                                                              _model.add =
                                                                  await actions
                                                                      .calBillAmtGroceryPay(
                                                                FFAppState()
                                                                    .disAmtPay,
                                                                valueOrDefault<
                                                                    double>(
                                                                  FFAppState()
                                                                      .delCharges,
                                                                  0.0,
                                                                ),
                                                                0.0,
                                                                containerAppSettingsRecord!
                                                                    .settingList
                                                                    .where((e) =>
                                                                        e.title ==
                                                                        'enableInclusiveTax')
                                                                    .toList()
                                                                    .firstOrNull!
                                                                    .value
                                                                    .toString(),
                                                              );

                                                              FFAppState()
                                                                  .update(
                                                                      () {});

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'bk6t0nbp' /* Reset */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
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
                                                                  .customColor2,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            10.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              elevation: 3.0,
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
                                                            showLoadingIndicator:
                                                                false,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              _model.amount =
                                                                  '';
                                                              safeSetState(
                                                                  () {});
                                                              safeSetState(() {
                                                                _model.textController1
                                                                        ?.text =
                                                                    _model
                                                                        .amount!;
                                                              });
                                                            },
                                                            text: '',
                                                            icon: Icon(
                                                              Icons
                                                                  .backspace_rounded,
                                                              size: 15.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
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
                                                                  .customColor2,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            19.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              elevation: 3.0,
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
                                                            showLoadingIndicator:
                                                                false,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              _model.result233 =
                                                                  await actions
                                                                      .calculateGroceryAmtaction(
                                                                FFAppState()
                                                                    .PayMode,
                                                                valueOrDefault<
                                                                    double>(
                                                                  FFAppState()
                                                                      .finalAmt,
                                                                  0.0,
                                                                ),
                                                                double.parse(_model
                                                                    .textController1
                                                                    .text),
                                                              );
                                                              FFAppState()
                                                                      .groceryJson =
                                                                  _model
                                                                      .result233!;
                                                              safeSetState(
                                                                  () {});
                                                              _model.amount =
                                                                  '';
                                                              safeSetState(
                                                                  () {});
                                                              safeSetState(() {
                                                                _model.textController1
                                                                        ?.text =
                                                                    _model
                                                                        .amount!;
                                                              });

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            text: '',
                                                            icon: Icon(
                                                              Icons.done_sharp,
                                                              size: 25.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
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
                                                                  .customColor2,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            19.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              elevation: 3.0,
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
                                                            showLoadingIndicator:
                                                                false,
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 15.0)),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 15.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 10.0)),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  flex: 7,
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 31.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor1,
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'crvm8zsa' /* Advance */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  fontSize:
                                                                      17.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelLargeFamily),
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 4,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                5.0, 0.0),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 31.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor1,
                                                        ),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            getJsonField(
                                                              FFAppState()
                                                                  .groceryJson,
                                                              r'''$.advanceAmt''',
                                                            )?.toString(),
                                                            '0',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                fontSize: 17.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelLargeFamily),
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 7,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 31.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor1,
                                                        ),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'cxwh0t17' /* Paid */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 17.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelLargeFamily),
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 4,
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 31.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor1,
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                            FFAppState()
                                                                .groceryJson,
                                                            r'''$.paidAmt''',
                                                          )?.toString(),
                                                          '0',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  fontSize:
                                                                      17.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelLargeFamily),
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  flex: 7,
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 31.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor1,
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'tbfz0vpw' /* Balance */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      17.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelLargeFamily),
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 4,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                5.0, 0.0),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 31.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor1,
                                                        ),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            getJsonField(
                                                              FFAppState()
                                                                  .groceryJson,
                                                              r'''$.balanceAmt''',
                                                            )?.toString(),
                                                            '0',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                fontSize: 17.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelLargeFamily),
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 7,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 31.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor1,
                                                        ),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'm9nlmnrb' /* Return */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                fontSize: 17.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelLargeFamily),
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 4,
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 31.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor1,
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                            FFAppState()
                                                                .groceryJson,
                                                            r'''$.returnAmt''',
                                                          )?.toString(),
                                                          '0',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  fontSize:
                                                                      17.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelLargeFamily),
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  flex: 7,
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 31.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor1,
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'a4ctuuaj' /* Discount(%) */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      17.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelLargeFamily),
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 4,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                5.0, 0.0),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 31.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor1,
                                                        ),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: TextFormField(
                                                            controller: _model
                                                                .textFielddisperTextController,
                                                            focusNode: _model
                                                                .textFielddisperFocusNode,
                                                            onFieldSubmitted:
                                                                (_) async {
                                                              FFAppState()
                                                                      .disAmtPay =
                                                                  functions.disAmtPer(
                                                                      double.tryParse(_model
                                                                          .textFielddisperTextController
                                                                          .text),
                                                                      FFAppState()
                                                                          .subTotal);
                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                              await actions
                                                                  .calBillAmtGroceryPay(
                                                                FFAppState()
                                                                    .disAmtPay,
                                                                FFAppState()
                                                                    .delCharges,
                                                                double.parse(_model
                                                                    .textFieldgstperTextController
                                                                    .text),
                                                                containerAppSettingsRecord!
                                                                    .settingList
                                                                    .where((e) =>
                                                                        e.title ==
                                                                        'enableInclusiveTax')
                                                                    .toList()
                                                                    .firstOrNull!
                                                                    .value
                                                                    .toString(),
                                                              );
                                                              safeSetState(() {
                                                                _model.textFielddisamtTextController
                                                                        ?.text =
                                                                    FFAppState()
                                                                        .disAmtPay
                                                                        .toString();
                                                              });
                                                            },
                                                            autofocus: false,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: false,
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelLargeFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        fontSize:
                                                                            17.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                      ),
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'imct5ysk' /* 0 */,
                                                              ),
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                      ),
                                                              enabledBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                              ),
                                                              focusedBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                              ),
                                                              errorBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                              ),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      17.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                            textAlign: TextAlign
                                                                .center,
                                                            validator: _model
                                                                .textFielddisperTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 7,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 31.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor1,
                                                        ),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'uebux13u' /* Discount Amt */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                fontSize: 17.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelLargeFamily),
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 4,
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 31.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor1,
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: TextFormField(
                                                          controller: _model
                                                              .textFielddisamtTextController,
                                                          focusNode: _model
                                                              .textFielddisamtFocusNode,
                                                          onFieldSubmitted:
                                                              (_) async {
                                                            FFAppState()
                                                                    .delCharges =
                                                                double.parse(_model
                                                                    .textFieldextraTextController
                                                                    .text);
                                                            FFAppState()
                                                                    .disAmtPay =
                                                                double.parse(_model
                                                                    .textFielddisamtTextController
                                                                    .text);
                                                            FFAppState()
                                                                .update(() {});
                                                            FFAppState()
                                                                    .disPer =
                                                                functions.discountAmount(
                                                                    FFAppState()
                                                                        .subTotal,
                                                                    double.tryParse(_model
                                                                        .textFielddisamtTextController
                                                                        .text));
                                                            FFAppState()
                                                                .update(() {});
                                                            await actions
                                                                .calBillAmtGroceryPay(
                                                              FFAppState()
                                                                  .disAmtPay,
                                                              FFAppState()
                                                                  .delCharges,
                                                              double.parse(_model
                                                                  .textFieldgstperTextController
                                                                  .text),
                                                              containerAppSettingsRecord!
                                                                  .settingList
                                                                  .where((e) =>
                                                                      e.title ==
                                                                      'enableInclusiveTax')
                                                                  .toList()
                                                                  .firstOrNull!
                                                                  .value
                                                                  .toString(),
                                                            );
                                                            safeSetState(() {
                                                              _model.textFielddisperTextController
                                                                      ?.text =
                                                                  FFAppState()
                                                                      .disPer
                                                                      .toString();
                                                            });
                                                          },
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelLargeFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      fontSize:
                                                                          17.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).labelLargeFamily),
                                                                    ),
                                                            hintText:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              'a69w5wrt' /* 0 */,
                                                            ),
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).labelMediumFamily),
                                                                    ),
                                                            enabledBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        4.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        4.0),
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        4.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        4.0),
                                                              ),
                                                            ),
                                                            errorBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        4.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        4.0),
                                                              ),
                                                            ),
                                                            focusedErrorBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        4.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        4.0),
                                                              ),
                                                            ),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 17.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          validator: _model
                                                              .textFielddisamtTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  flex: 7,
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 31.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor1,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'dchbycmz' /* GST(%) */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      17.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelLargeFamily),
                                                                ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            '(${valueOrDefault<String>(
                                                              FFAppState()
                                                                  .taxAmtPay
                                                                  .toString(),
                                                              '0',
                                                            )})',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      17.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelLargeFamily),
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 4,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                5.0, 0.0),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 31.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor1,
                                                        ),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: TextFormField(
                                                            controller: _model
                                                                .textFieldgstperTextController,
                                                            focusNode: _model
                                                                .textFieldgstperFocusNode,
                                                            onFieldSubmitted:
                                                                (_) async {
                                                              await actions
                                                                  .calBillAmtGroceryPay(
                                                                FFAppState()
                                                                    .disAmtPay,
                                                                FFAppState()
                                                                    .delCharges,
                                                                double.parse(_model
                                                                    .textFieldgstperTextController
                                                                    .text),
                                                                containerAppSettingsRecord!
                                                                    .settingList
                                                                    .where((e) =>
                                                                        e.title ==
                                                                        'enableInclusiveTax')
                                                                    .toList()
                                                                    .firstOrNull!
                                                                    .value
                                                                    .toString(),
                                                              );

                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                            },
                                                            autofocus: false,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelLargeFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        fontSize:
                                                                            17.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                      ),
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'vo93m881' /* 0 */,
                                                              ),
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                      ),
                                                              enabledBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          4.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          4.0),
                                                                ),
                                                              ),
                                                              focusedBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          4.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          4.0),
                                                                ),
                                                              ),
                                                              errorBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          4.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          4.0),
                                                                ),
                                                              ),
                                                              focusedErrorBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          4.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          4.0),
                                                                ),
                                                              ),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      17.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                            textAlign: TextAlign
                                                                .center,
                                                            validator: _model
                                                                .textFieldgstperTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 7,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 31.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor1,
                                                        ),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'alyb3fg7' /* Extra Charges */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                fontSize: 17.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelLargeFamily),
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 4,
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 31.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor1,
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: TextFormField(
                                                          controller: _model
                                                              .textFieldextraTextController,
                                                          focusNode: _model
                                                              .textFieldextraFocusNode,
                                                          onFieldSubmitted:
                                                              (_) async {
                                                            FFAppState()
                                                                    .delCharges =
                                                                double.parse(_model
                                                                    .textFieldextraTextController
                                                                    .text);
                                                            FFAppState()
                                                                    .disAmtPay =
                                                                double.parse(_model
                                                                    .textFielddisamtTextController
                                                                    .text);
                                                            FFAppState()
                                                                .update(() {});
                                                            await actions
                                                                .calBillAmtGroceryPay(
                                                              double.parse(_model
                                                                  .textFielddisamtTextController
                                                                  .text),
                                                              double.parse(_model
                                                                  .textFieldextraTextController
                                                                  .text),
                                                              double.parse(_model
                                                                  .textFieldgstperTextController
                                                                  .text),
                                                              containerAppSettingsRecord!
                                                                  .settingList
                                                                  .where((e) =>
                                                                      e.title ==
                                                                      'enableInclusiveTax')
                                                                  .toList()
                                                                  .firstOrNull!
                                                                  .value
                                                                  .toString(),
                                                            );
                                                          },
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelLargeFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      fontSize:
                                                                          17.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).labelLargeFamily),
                                                                    ),
                                                            hintText:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              'ubkhrrlp' /* 0 */,
                                                            ),
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).labelMediumFamily),
                                                                    ),
                                                            enabledBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        4.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        4.0),
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        4.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        4.0),
                                                              ),
                                                            ),
                                                            errorBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        4.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        4.0),
                                                              ),
                                                            ),
                                                            focusedErrorBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        4.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        4.0),
                                                              ),
                                                            ),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 17.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          validator: _model
                                                              .textFieldextraTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
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
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.safePop();
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '63rh4uxa' /* Cancel */,
                                        ),
                                        options: FFButtonOptions(
                                          width: 90.0,
                                          height: 50.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .customColor2,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .headlineLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLargeFamily,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(FlutterFlowTheme
                                                            .of(context)
                                                        .headlineLargeFamily),
                                              ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          var _shouldSetState = false;
                                          if (FFAppState().finalAmt ==
                                              getJsonField(
                                                FFAppState().groceryJson,
                                                r'''$.paidAmt''',
                                              )) {
                                            if (getJsonField(
                                              FFAppState().shiftDetailsJson,
                                              r'''$.shiftExists''',
                                            )) {
                                              FFAppState().count =
                                                  FFAppState().count + 1;
                                              safeSetState(() {});
                                            } else {
                                              FFAppState().count =
                                                  FFAppState().count + 1;
                                              safeSetState(() {});
                                            }

                                            _model.prdlinstnewtx = await actions
                                                .filterProductsPurches(
                                              FFAppState().selBill,
                                              FFAppState()
                                                  .allBillsList
                                                  .toList(),
                                            );
                                            _shouldSetState = true;
                                            _model.appsettingnew =
                                                await queryAppSettingsRecordOnce(
                                              parent: FFAppState().outletIdRef,
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);
                                            _shouldSetState = true;
                                            _model.outletdoc =
                                                await queryOutletRecordOnce(
                                              queryBuilder: (outletRecord) =>
                                                  outletRecord.where(
                                                'id',
                                                isEqualTo: FFAppState()
                                                    .outletIdRef
                                                    ?.id,
                                              ),
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);
                                            _shouldSetState = true;
                                            if ((double.parse(
                                                    valueOrDefault<String>(
                                                  getJsonField(
                                                    FFAppState().groceryJson,
                                                    r'''$.paymentMode.CREDIT''',
                                                  )?.toString(),
                                                  '0',
                                                ))) >
                                                0.0) {
                                              if (FFAppState().setCustRef?.id !=
                                                      null &&
                                                  FFAppState().setCustRef?.id !=
                                                      '') {
                                                if (FFAppState().oldBalance <
                                                    FFAppState().custCredit) {
                                                  _model.totalcredit =
                                                      await actions
                                                          .oldbalanceplusamt(
                                                    FFAppState().oldBalance,
                                                    valueOrDefault<double>(
                                                      getJsonField(
                                                        FFAppState()
                                                            .groceryJson,
                                                        r'''$.paymentMode.CREDIT''',
                                                      ),
                                                      0.0,
                                                    ),
                                                  );
                                                  _shouldSetState = true;

                                                  await FFAppState()
                                                      .setCustRef!
                                                      .update(
                                                          createPartyRecordData(
                                                        credit: true,
                                                        oldBalance:
                                                            _model.totalcredit,
                                                        lastVisit:
                                                            getCurrentTimestamp
                                                                .millisecondsSinceEpoch
                                                                .toString(),
                                                      ));

                                                  var paymentRecordReference =
                                                      PaymentRecord.createDoc(
                                                          FFAppState()
                                                              .outletIdRef!);
                                                  await paymentRecordReference
                                                      .set(
                                                          createPaymentRecordData(
                                                    amount:
                                                        valueOrDefault<double>(
                                                      getJsonField(
                                                        FFAppState()
                                                            .groceryJson,
                                                        r'''$.paymentMode.CREDIT''',
                                                      ),
                                                      0.0,
                                                    ),
                                                    paymentType: 'CREDIT',
                                                    createdBy:
                                                        FFAppState().userdoc,
                                                    createdDate: getCurrentTimestamp
                                                        .millisecondsSinceEpoch,
                                                    party:
                                                        FFAppState().setCustRef,
                                                    expenceType: 'Debit',
                                                    oldBalance:
                                                        _model.totalcredit,
                                                  ));
                                                  _model.paymentDoc22d = PaymentRecord
                                                      .getDocumentFromData(
                                                          createPaymentRecordData(
                                                            amount:
                                                                valueOrDefault<
                                                                    double>(
                                                              getJsonField(
                                                                FFAppState()
                                                                    .groceryJson,
                                                                r'''$.paymentMode.CREDIT''',
                                                              ),
                                                              0.0,
                                                            ),
                                                            paymentType:
                                                                'CREDIT',
                                                            createdBy:
                                                                FFAppState()
                                                                    .userdoc,
                                                            createdDate:
                                                                getCurrentTimestamp
                                                                    .millisecondsSinceEpoch,
                                                            party: FFAppState()
                                                                .setCustRef,
                                                            expenceType:
                                                                'Debit',
                                                            oldBalance: _model
                                                                .totalcredit,
                                                          ),
                                                          paymentRecordReference);
                                                  _shouldSetState = true;
                                                } else {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        content: Text(
                                                            'Credit Limit Exceeded !'),
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
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      content: Text(
                                                          'Select Customer '),
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
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              }
                                            }

                                            var purchaseRecordReference =
                                                PurchaseRecord.createDoc(
                                                    FFAppState().outletIdRef!);
                                            await purchaseRecordReference.set({
                                              ...createPurchaseRecordData(
                                                delliveryChrg:
                                                    FFAppState().delCharges,
                                                taxAmt: FFAppState().taxamt,
                                                billAmt: FFAppState().billAmt,
                                                discountAmt:
                                                    FFAppState().disAmt,
                                                dayId: functions.getDayId(),
                                                discountPer:
                                                    FFAppState().disPer,
                                                finalBillAmt:
                                                    FFAppState().finalAmt,
                                                orderDate:
                                                    functions.timestampToMili(
                                                        getCurrentTimestamp),
                                                paymentMode: getJsonField(
                                                  FFAppState().groceryJson,
                                                  r'''$.paymentMode''',
                                                ).toString(),
                                                roundOff: 0.0,
                                                party: valueOrDefault<String>(
                                                  FFAppState().setCustRef?.id,
                                                  '0',
                                                ),
                                                id: '',
                                                invoiceNo:
                                                    'PO-${random_data.randomInteger(1, 10000000).toString()}',
                                                invoiceDate:
                                                    functions.timestampToMili(
                                                        getCurrentTimestamp),
                                                mobile: valueOrDefault<String>(
                                                  FFAppState().setCustMobNo,
                                                  '0',
                                                ),
                                                orderTime: getCurrentTimestamp,
                                                createdBy:
                                                    FFAppState().userdoc?.id,
                                                order: 'PURCHASE',
                                                supplierBillNo:
                                                    widget!.suppplierbillno,
                                                supplierBillDate:
                                                    widget!.supplierbilldate,
                                                note: widget!.note,
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'productList':
                                                      getPurchaseSaleItemListListFirestoreData(
                                                    _model.prdlinstnewtx,
                                                  ),
                                                },
                                              ),
                                            });
                                            _model.purchaseordnew =
                                                PurchaseRecord
                                                    .getDocumentFromData({
                                              ...createPurchaseRecordData(
                                                delliveryChrg:
                                                    FFAppState().delCharges,
                                                taxAmt: FFAppState().taxamt,
                                                billAmt: FFAppState().billAmt,
                                                discountAmt:
                                                    FFAppState().disAmt,
                                                dayId: functions.getDayId(),
                                                discountPer:
                                                    FFAppState().disPer,
                                                finalBillAmt:
                                                    FFAppState().finalAmt,
                                                orderDate:
                                                    functions.timestampToMili(
                                                        getCurrentTimestamp),
                                                paymentMode: getJsonField(
                                                  FFAppState().groceryJson,
                                                  r'''$.paymentMode''',
                                                ).toString(),
                                                roundOff: 0.0,
                                                party: valueOrDefault<String>(
                                                  FFAppState().setCustRef?.id,
                                                  '0',
                                                ),
                                                id: '',
                                                invoiceNo:
                                                    'PO-${random_data.randomInteger(1, 10000000).toString()}',
                                                invoiceDate:
                                                    functions.timestampToMili(
                                                        getCurrentTimestamp),
                                                mobile: valueOrDefault<String>(
                                                  FFAppState().setCustMobNo,
                                                  '0',
                                                ),
                                                orderTime: getCurrentTimestamp,
                                                createdBy:
                                                    FFAppState().userdoc?.id,
                                                order: 'PURCHASE',
                                                supplierBillNo:
                                                    widget!.suppplierbillno,
                                                supplierBillDate:
                                                    widget!.supplierbilldate,
                                                note: widget!.note,
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'productList':
                                                      getPurchaseSaleItemListListFirestoreData(
                                                    _model.prdlinstnewtx,
                                                  ),
                                                },
                                              ),
                                            }, purchaseRecordReference);
                                            _shouldSetState = true;

                                            await _model
                                                .purchaseordnew!.reference
                                                .update(
                                                    createPurchaseRecordData(
                                              id: _model
                                                  .purchaseordnew?.reference.id,
                                            ));
                                            if (containerAppSettingsRecord!
                                                .settingList
                                                .where((e) =>
                                                    e.title == 'enableStock')
                                                .toList()
                                                .firstOrNull!
                                                .value) {
                                              FFAppState().startLoop = 0;
                                              safeSetState(() {});
                                              while (FFAppState().startLoop <
                                                  _model
                                                      .prdlinstnewtx!.length) {
                                                _model.stockupdateprdprt =
                                                    await queryProductRecordOnce(
                                                  parent:
                                                      FFAppState().outletIdRef,
                                                  queryBuilder:
                                                      (productRecord) =>
                                                          productRecord
                                                              .where(
                                                                'id',
                                                                isEqualTo: (_model
                                                                        .prdlinstnewtx
                                                                        ?.elementAtOrNull(
                                                                            FFAppState().startLoop))
                                                                    ?.id,
                                                              )
                                                              .where(
                                                                'stockable',
                                                                isEqualTo: true,
                                                              ),
                                                  singleRecord: true,
                                                ).then((s) => s.firstOrNull);
                                                _shouldSetState = true;
                                                if (_model.stockupdateprdprt !=
                                                    null) {
                                                  await _model
                                                      .stockupdateprdprt!
                                                      .reference
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'currentStock': FieldValue
                                                            .increment(functions
                                                                .doubleToInt(
                                                                    getJsonField(
                                                          (_model.prdlinstnewtx
                                                                  ?.elementAtOrNull(
                                                                      FFAppState()
                                                                          .startLoop))
                                                              ?.toMap(),
                                                          r'''$.quantity''',
                                                        ))!),
                                                      },
                                                    ),
                                                  });
                                                  _model.itemprd2 =
                                                      await actions
                                                          .hivegetproductbyId2(
                                                    _model
                                                        .stockupdateprdprt?.id,
                                                    _model.prdlinstnewtx
                                                        ?.elementAtOrNull(
                                                            FFAppState()
                                                                .startLoop),
                                                    'get',
                                                  );
                                                  _shouldSetState = true;
                                                  FFAppState()
                                                      .updateProductHiveputStruct(
                                                    (e) => e
                                                      ..id = _model.itemprd2?.id
                                                      ..price =
                                                          _model.itemprd2?.price
                                                      ..category = _model
                                                          .itemprd2?.category
                                                      ..code =
                                                          _model.itemprd2?.code
                                                      ..name =
                                                          _model.itemprd2?.name
                                                      ..sellingPrice = _model
                                                          .itemprd2
                                                          ?.sellingPrice
                                                      ..mrpPrice = _model
                                                          .itemprd2?.mrpPrice
                                                      ..purchasePrice = _model
                                                          .itemprd2
                                                          ?.purchasePrice
                                                      ..categoryId = _model
                                                          .itemprd2?.categoryId
                                                      ..taxId =
                                                          _model.itemprd2?.taxId
                                                      ..unitId = _model
                                                          .itemprd2?.unitId
                                                      ..regionalName = _model
                                                          .itemprd2
                                                          ?.regionalName
                                                      ..barcode = _model
                                                          .itemprd2?.barcode
                                                      ..hsncode = _model
                                                          .itemprd2?.hsncode
                                                      ..reorderLevel = _model
                                                          .itemprd2
                                                          ?.reorderLevel
                                                      ..searchcode = _model
                                                          .itemprd2?.searchcode
                                                      ..shortName = _model
                                                          .itemprd2?.shortName
                                                      ..weightable = _model
                                                          .itemprd2?.weightable
                                                      ..stockable = _model
                                                          .itemprd2?.stockable
                                                      ..discountPer = _model
                                                          .itemprd2?.discountPer
                                                      ..discountAmt = _model
                                                          .itemprd2?.discountAmt
                                                      ..productMasterId = _model
                                                          .itemprd2
                                                          ?.productMasterId
                                                      ..recipeRefId = _model
                                                          .itemprd2?.recipeRefId
                                                      ..imageUrl = _model
                                                          .itemprd2?.imageUrl
                                                      ..serviceOutletId = _model
                                                          .itemprd2
                                                          ?.serviceOutletId
                                                      ..type =
                                                          _model.itemprd2?.type
                                                      ..recipeId = _model
                                                          .itemprd2?.recipeId
                                                      ..stock = _model
                                                              .itemprd2!.stock +
                                                          (functions.doubleToInt((_model
                                                                  .prdlinstnewtx
                                                                  ?.elementAtOrNull(
                                                                      FFAppState()
                                                                          .startLoop))
                                                              ?.quantity)!)
                                                      ..isDeleted = _model
                                                          .itemprd2?.isDeleted
                                                      ..keywords = _model
                                                          .itemprd2!.keywords
                                                          .toList()
                                                      ..synC =
                                                          _model.itemprd2?.synC
                                                      ..hivekey = _model
                                                          .itemprd2?.hivekey
                                                      ..version = _model
                                                          .itemprd2?.version,
                                                  );
                                                  safeSetState(() {});
                                                  _model.productupdated2 =
                                                      await actions
                                                          .hiveProductCrud(
                                                    FFAppState()
                                                        .productHiveput
                                                        .hivekey,
                                                    FFAppState().productHiveput,
                                                    'update',
                                                  );
                                                  _shouldSetState = true;
                                                  FFAppState().productHive = [];
                                                  FFAppState().productHiveput =
                                                      ProductStructStruct();
                                                  safeSetState(() {});
                                                  _model.newupdatedproductlist22 =
                                                      await actions
                                                          .getProductlistHive();
                                                  _shouldSetState = true;
                                                  FFAppState().productHive = _model
                                                      .newupdatedproductlist22!
                                                      .toList()
                                                      .cast<
                                                          ProductStructStruct>();
                                                  safeSetState(() {});
                                                }
                                                FFAppState().startLoop =
                                                    FFAppState().startLoop + 1;
                                                safeSetState(() {});
                                              }
                                              _model.partydetails =
                                                  await queryPartyRecordOnce(
                                                parent:
                                                    FFAppState().outletIdRef,
                                                queryBuilder: (partyRecord) =>
                                                    partyRecord.where(
                                                  'id',
                                                  isEqualTo: _model
                                                      .purchaseordnew?.party,
                                                ),
                                                singleRecord: true,
                                              ).then((s) => s.firstOrNull);
                                              _shouldSetState = true;
                                              if (isAndroid) {
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              content: Text(
                                                                  'Do You Want To Print Label ?'),
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
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: Container(
                                                          height: 300.0,
                                                          child:
                                                              SelectlabelWidget(),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));

                                                  await actions.labelPrint(
                                                    _model.prdlinstnewtx!
                                                        .toList(),
                                                    FFAppState().laelsize,
                                                  );
                                                }
                                              }
                                              if (!isAndroid) {
                                                _model.returnurl2 =
                                                    await actions
                                                        .generateInvoice(
                                                  _model.purchaseordnew
                                                      ?.invoiceNo,
                                                  _model.purchaseordnew
                                                      ?.productList
                                                      ?.toList(),
                                                  _model.purchaseordnew
                                                      ?.finalBillAmt
                                                      ?.toString(),
                                                  _model.purchaseordnew,
                                                  _model.partydetails,
                                                );
                                                _shouldSetState = true;
                                              }
                                              await actions
                                                  .removeFromAllBillList(
                                                FFAppState().selBill,
                                              );
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
                                              FFAppState().taxAmtPay = 0.0;
                                              FFAppState().taxamt = 0.0;
                                              FFAppState().disAmtPay = 0.0;
                                              FFAppState().disPer = 0.0;
                                              FFAppState().disAmt = 0.0;
                                              FFAppState().update(() {});
                                              FFAppState().finalAmt = 0.0;
                                              FFAppState().billAmt = 0.0;
                                              FFAppState().groceryJson = null;
                                              FFAppState().update(() {});
                                              Navigator.pop(context);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Bill Saved',
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
                                                      Color(0x00000000),
                                                ),
                                              );
                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            }
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Pay All Amount  !',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 1900),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                            );
                                          }

                                          if (_shouldSetState)
                                            safeSetState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '5tk9oj87' /* Submit */,
                                        ),
                                        options: FFButtonOptions(
                                          width: 90.0,
                                          height: 50.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .headlineLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLargeFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(FlutterFlowTheme
                                                            .of(context)
                                                        .headlineLargeFamily),
                                              ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 10.0)),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
