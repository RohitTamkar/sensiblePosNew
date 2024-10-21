import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_mode_grocery_model.dart';
export 'payment_mode_grocery_model.dart';

class PaymentModeGroceryWidget extends StatefulWidget {
  const PaymentModeGroceryWidget({
    super.key,
    this.paymentMode,
  });

  final List<PaymentModeRecord>? paymentMode;

  @override
  State<PaymentModeGroceryWidget> createState() =>
      _PaymentModeGroceryWidgetState();
}

class _PaymentModeGroceryWidgetState extends State<PaymentModeGroceryWidget> {
  late PaymentModeGroceryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentModeGroceryModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.amount = FFAppState().finalAmt.toString();
      safeSetState(() {});
      safeSetState(() {
        _model.textController1?.text = _model.amount!;
        _model.textController1?.selection = TextSelection.collapsed(
            offset: _model.textController1!.text.length);
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
            'afq50yu0' /* 0 */,
          );
          _model.textFielddisamtTextController?.text =
              FFLocalizations.of(context).getText(
            'w3da44b1' /* 0 */,
          );
          _model.textFieldgstperTextController?.text =
              FFLocalizations.of(context).getText(
            'f1t3ahui' /* 0 */,
          );
          _model.textFieldextraTextController?.text =
              FFLocalizations.of(context).getText(
            'hf76irji' /* 0 */,
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
                            'yjpkp26k' /* Payment Mode */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleMediumFamily,
                                color: FlutterFlowTheme.of(context).primary,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
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
                            color: FlutterFlowTheme.of(context).primaryBtnText,
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
                        List<PaymentModeRecord> containerPaymentModeRecordList =
                            snapshot.data!;

                        return Container(
                          width: double.infinity,
                          height: 550.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).customColor1,
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
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                                  itemCount: paymentMode.length,
                                                  itemBuilder: (context,
                                                      paymentModeIndex) {
                                                    final paymentModeItem =
                                                        paymentMode[
                                                            paymentModeIndex];
                                                    return Container(
                                                      decoration: BoxDecoration(
                                                        color: paymentModeItem
                                                                    .name ==
                                                                FFAppState()
                                                                    .PayMode
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          FFAppState().PayMode =
                                                              paymentModeItem
                                                                  .name;
                                                          safeSetState(() {});
                                                        },
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
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
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
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
                                                        valueOrDefault<String>(
                                                          FFAppState().PayMode,
                                                          'Cash',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                  controller:
                                                      _model.textController1,
                                                  focusNode:
                                                      _model.textFieldFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      '9khzcdrf' /* Amount */,
                                                    ),
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily),
                                                        ),
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily),
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    ),
                                                    filled: true,
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 22.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
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
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          _model.amount =
                                                              '${_model.textController1.text}1';
                                                          safeSetState(() {});
                                                          safeSetState(() {
                                                            _model.textController1
                                                                    ?.text =
                                                                _model.amount!;
                                                            _model.textController1
                                                                    ?.selection =
                                                                TextSelection.collapsed(
                                                                    offset: _model
                                                                        .textController1!
                                                                        .text
                                                                        .length);
                                                          });
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '0wr1nxem' /* 1 */,
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
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        19.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleSmallFamily),
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
                                                        onPressed: () async {
                                                          _model.amount =
                                                              '${_model.textController1.text}2';
                                                          safeSetState(() {});
                                                          safeSetState(() {
                                                            _model.textController1
                                                                    ?.text =
                                                                _model.amount!;
                                                            _model.textController1
                                                                    ?.selection =
                                                                TextSelection.collapsed(
                                                                    offset: _model
                                                                        .textController1!
                                                                        .text
                                                                        .length);
                                                          });
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'p2ckw0dp' /* 2 */,
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
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        19.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleSmallFamily),
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
                                                        onPressed: () async {
                                                          _model.amount =
                                                              '${_model.textController1.text}3';
                                                          safeSetState(() {});
                                                          safeSetState(() {
                                                            _model.textController1
                                                                    ?.text =
                                                                _model.amount!;
                                                            _model.textController1
                                                                    ?.selection =
                                                                TextSelection.collapsed(
                                                                    offset: _model
                                                                        .textController1!
                                                                        .text
                                                                        .length);
                                                          });
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'dcu8290r' /* 3 */,
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
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        19.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleSmallFamily),
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
                                                  ].divide(
                                                      SizedBox(width: 15.0)),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          _model.amount =
                                                              '${_model.textController1.text}4';
                                                          safeSetState(() {});
                                                          safeSetState(() {
                                                            _model.textController1
                                                                    ?.text =
                                                                _model.amount!;
                                                            _model.textController1
                                                                    ?.selection =
                                                                TextSelection.collapsed(
                                                                    offset: _model
                                                                        .textController1!
                                                                        .text
                                                                        .length);
                                                          });
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'kdeaxyp3' /* 4 */,
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
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        19.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleSmallFamily),
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
                                                        onPressed: () async {
                                                          _model.amount =
                                                              '${_model.textController1.text}5';
                                                          safeSetState(() {});
                                                          safeSetState(() {
                                                            _model.textController1
                                                                    ?.text =
                                                                _model.amount!;
                                                            _model.textController1
                                                                    ?.selection =
                                                                TextSelection.collapsed(
                                                                    offset: _model
                                                                        .textController1!
                                                                        .text
                                                                        .length);
                                                          });
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'xvmr7omx' /* 5 */,
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
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        19.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleSmallFamily),
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
                                                        onPressed: () async {
                                                          _model.amount =
                                                              '${_model.textController1.text}6';
                                                          safeSetState(() {});
                                                          safeSetState(() {
                                                            _model.textController1
                                                                    ?.text =
                                                                _model.amount!;
                                                            _model.textController1
                                                                    ?.selection =
                                                                TextSelection.collapsed(
                                                                    offset: _model
                                                                        .textController1!
                                                                        .text
                                                                        .length);
                                                          });
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'djwsrz43' /* 6 */,
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
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        19.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleSmallFamily),
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
                                                  ].divide(
                                                      SizedBox(width: 15.0)),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          _model.amount =
                                                              '${_model.textController1.text}7';
                                                          safeSetState(() {});
                                                          safeSetState(() {
                                                            _model.textController1
                                                                    ?.text =
                                                                _model.amount!;
                                                            _model.textController1
                                                                    ?.selection =
                                                                TextSelection.collapsed(
                                                                    offset: _model
                                                                        .textController1!
                                                                        .text
                                                                        .length);
                                                          });
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'nwv5ddw4' /* 7 */,
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
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        19.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleSmallFamily),
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
                                                        onPressed: () async {
                                                          _model.amount =
                                                              '${_model.textController1.text}8';
                                                          safeSetState(() {});
                                                          safeSetState(() {
                                                            _model.textController1
                                                                    ?.text =
                                                                _model.amount!;
                                                            _model.textController1
                                                                    ?.selection =
                                                                TextSelection.collapsed(
                                                                    offset: _model
                                                                        .textController1!
                                                                        .text
                                                                        .length);
                                                          });
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '8srzukga' /* 8 */,
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
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        19.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleSmallFamily),
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
                                                        onPressed: () async {
                                                          _model.amount =
                                                              '${_model.textController1.text}9';
                                                          safeSetState(() {});
                                                          safeSetState(() {
                                                            _model.textController1
                                                                    ?.text =
                                                                _model.amount!;
                                                            _model.textController1
                                                                    ?.selection =
                                                                TextSelection.collapsed(
                                                                    offset: _model
                                                                        .textController1!
                                                                        .text
                                                                        .length);
                                                          });
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'mgkvfhmb' /* 9 */,
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
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        19.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleSmallFamily),
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
                                                  ].divide(
                                                      SizedBox(width: 15.0)),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          _model.amount =
                                                              '${_model.textController1.text}.';
                                                          safeSetState(() {});
                                                          safeSetState(() {
                                                            _model.textController1
                                                                    ?.text =
                                                                _model.amount!;
                                                            _model.textController1
                                                                    ?.selection =
                                                                TextSelection.collapsed(
                                                                    offset: _model
                                                                        .textController1!
                                                                        .text
                                                                        .length);
                                                          });
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'ngwrzo40' /* . */,
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
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        28.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleSmallFamily),
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
                                                        onPressed: () async {
                                                          _model.amount =
                                                              '${_model.textController1.text}0';
                                                          safeSetState(() {});
                                                          safeSetState(() {
                                                            _model.textController1
                                                                    ?.text =
                                                                _model.amount!;
                                                            _model.textController1
                                                                    ?.selection =
                                                                TextSelection.collapsed(
                                                                    offset: _model
                                                                        .textController1!
                                                                        .text
                                                                        .length);
                                                          });
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '5z3tx4m3' /* 0 */,
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
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        19.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleSmallFamily),
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
                                                        onPressed: () async {
                                                          FFAppState()
                                                                  .groceryJson =
                                                              null;
                                                          FFAppState()
                                                              .disAmtPay = 0.0;
                                                          FFAppState()
                                                              .taxAmtPay = 0.0;
                                                          FFAppState()
                                                              .delCharges = 0.0;
                                                          safeSetState(() {});
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
                                                          _model.ret = await actions
                                                              .calSubTotalForGrocery(
                                                            FFAppState()
                                                                .selBill
                                                                .toString(),
                                                            FFAppState()
                                                                .allBillsList
                                                                .toList(),
                                                          );
                                                          _model.add = await actions
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
                                                                .first
                                                                .value
                                                                .toString(),
                                                          );

                                                          FFAppState()
                                                              .update(() {});

                                                          safeSetState(() {});
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'gov9ckqz' /* Reset */,
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
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        10.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleSmallFamily),
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
                                                        onPressed: () async {
                                                          _model.amount = '';
                                                          safeSetState(() {});
                                                          safeSetState(() {
                                                            _model.textController1
                                                                    ?.text =
                                                                _model.amount!;
                                                            _model.textController1
                                                                    ?.selection =
                                                                TextSelection.collapsed(
                                                                    offset: _model
                                                                        .textController1!
                                                                        .text
                                                                        .length);
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
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        19.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleSmallFamily),
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
                                                        onPressed: () async {
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
                                                              _model.result233!;
                                                          safeSetState(() {});
                                                          _model.amount = '';
                                                          safeSetState(() {});
                                                          safeSetState(() {
                                                            _model.textController1
                                                                    ?.text =
                                                                _model.amount!;
                                                            _model.textController1
                                                                    ?.selection =
                                                                TextSelection.collapsed(
                                                                    offset: _model
                                                                        .textController1!
                                                                        .text
                                                                        .length);
                                                          });

                                                          safeSetState(() {});
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
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        19.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleSmallFamily),
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
                                                  ].divide(
                                                      SizedBox(width: 15.0)),
                                                ),
                                              ].divide(SizedBox(height: 15.0)),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                                        'vb6x4obo' /* Advance */,
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
                                              Expanded(
                                                flex: 4,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 5.0, 0.0),
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
                                                            r'''$.advanceAmt''',
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
                                              ),
                                              Expanded(
                                                flex: 7,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
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
                                                          'q00niyll' /* Paid */,
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
                                              ),
                                              Expanded(
                                                flex: 4,
                                                child: Container(
                                                  width: 100.0,
                                                  height: 31.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                                        'wqkk5ub3' /* Balance */,
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
                                              Expanded(
                                                flex: 4,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 5.0, 0.0),
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
                                                            r'''$.balanceAmt''',
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
                                              ),
                                              Expanded(
                                                flex: 7,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
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
                                                          '2uke28cn' /* Return */,
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
                                                                      .info,
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
                                              ),
                                              Expanded(
                                                flex: 4,
                                                child: Container(
                                                  width: 100.0,
                                                  height: 31.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                                        '4x0m2q81' /* Discount(%) */,
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
                                              Expanded(
                                                flex: 4,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 5.0, 0.0),
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
                                                                  .first
                                                                  .value
                                                                  .toString(),
                                                            );
                                                            safeSetState(() {
                                                              _model.textFielddisamtTextController
                                                                      ?.text =
                                                                  FFAppState()
                                                                      .disAmtPay
                                                                      .toString();
                                                              _model.textFielddisamtTextController
                                                                      ?.selection =
                                                                  TextSelection.collapsed(
                                                                      offset: _model
                                                                          .textFielddisamtTextController!
                                                                          .text
                                                                          .length);
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
                                                              '6zvvuwtd' /* 0 */,
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
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
                                                          'm8y90rcl' /* Discount Amt */,
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
                                                                      .info,
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
                                              ),
                                              Expanded(
                                                flex: 4,
                                                child: Container(
                                                  width: 100.0,
                                                  height: 31.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                                          FFAppState().disPer =
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
                                                                .first
                                                                .value
                                                                .toString(),
                                                          );
                                                          safeSetState(() {
                                                            _model.textFielddisperTextController
                                                                    ?.text =
                                                                FFAppState()
                                                                    .disPer
                                                                    .toString();
                                                            _model.textFielddisperTextController
                                                                    ?.selection =
                                                                TextSelection.collapsed(
                                                                    offset: _model
                                                                        .textFielddisperTextController!
                                                                        .text
                                                                        .length);
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
                                                            '3mquz9t6' /* 0 */,
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                                            '44z24rq4' /* GST(%) */,
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
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 4,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 5.0, 0.0),
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
                                                                  .first
                                                                  .value
                                                                  .toString(),
                                                            );

                                                            FFAppState()
                                                                .update(() {});
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
                                                              'pj94dp4c' /* 0 */,
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
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
                                                          'e3va5cye' /* Extra Charges */,
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
                                                                      .info,
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
                                              ),
                                              Expanded(
                                                flex: 4,
                                                child: Container(
                                                  width: 100.0,
                                                  height: 31.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                                                .first
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
                                                            'n28pwzbw' /* 0 */,
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                        var _shouldSetState = false;
                                        if (FFAppState().finalAmt ==
                                            getJsonField(
                                              FFAppState().groceryJson,
                                              r'''$.paidAmt''',
                                            )) {
                                          if (!getJsonField(
                                            FFAppState().shiftDetailsJson,
                                            r'''$.shiftExists''',
                                          )) {
                                            FFAppState().count =
                                                FFAppState().count + 1;
                                            FFAppState().newcount =
                                                FFAppState().newcount + 1;
                                            safeSetState(() {});
                                          }
                                          _model.prdlistsavebill =
                                              await actions.filterProducts2(
                                            FFAppState().selBill,
                                            FFAppState().allBillsList.toList(),
                                          );
                                          _shouldSetState = true;
                                          if (FFAppState().setCustRef != null) {
                                            if (FFAppState().PayMode ==
                                                'CREDIT') {
                                              if (FFAppState().oldBalance <
                                                  FFAppState().custCredit) {
                                                _model.totalcredit2 =
                                                    await actions
                                                        .oldbalanceplusamt(
                                                  FFAppState().oldBalance,
                                                  valueOrDefault<double>(
                                                    getJsonField(
                                                      FFAppState().groceryJson,
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
                                                          _model.totalcredit2,
                                                      lastVisit: getCurrentTimestamp
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
                                                      FFAppState().groceryJson,
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
                                                      _model.totalcredit2,
                                                ));
                                                _model.paymentDoc2 = PaymentRecord
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
                                                          paymentType: 'CREDIT',
                                                          createdBy:
                                                              FFAppState()
                                                                  .userdoc,
                                                          createdDate:
                                                              getCurrentTimestamp
                                                                  .millisecondsSinceEpoch,
                                                          party: FFAppState()
                                                              .setCustRef,
                                                          expenceType: 'Debit',
                                                          oldBalance: _model
                                                              .totalcredit2,
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
                                            }
                                          }

                                          var invoiceRecordReference =
                                              InvoiceRecord.createDoc(
                                                  FFAppState().outletIdRef!);
                                          await invoiceRecordReference.set({
                                            ...createInvoiceRecordData(
                                              invoice:
                                                  functions.genInvoiceNumyear(
                                                      FFAppState().newcount),
                                              party: valueOrDefault<String>(
                                                FFAppState().setCustRef?.id,
                                                'NA',
                                              ),
                                              products: '',
                                              invoiceDate:
                                                  functions.timestampToMili(
                                                      getCurrentTimestamp),
                                              paymentMode: getJsonField(
                                                FFAppState().groceryJson,
                                                r'''$.paymentMode''',
                                              ).toString(),
                                              dayId: functions.getDayId(),
                                              discountAmt:
                                                  valueOrDefault<double>(
                                                FFAppState().disAmt,
                                                0.0,
                                              ),
                                              discountPer:
                                                  valueOrDefault<double>(
                                                FFAppState().disPer,
                                                0.0,
                                              ),
                                              delliveryChrg:
                                                  valueOrDefault<double>(
                                                FFAppState().delCharges,
                                                0.0,
                                              ),
                                              taxAmt: FFAppState().taxamt,
                                              billAmt: valueOrDefault<double>(
                                                FFAppState().billAmt,
                                                0.0,
                                              ),
                                              finalBillAmt:
                                                  valueOrDefault<double>(
                                                FFAppState().finalAmt,
                                                0.0,
                                              ),
                                              shiftId: '',
                                              createdBy: FFAppState().userdoc,
                                              code: FFAppState().newcount,
                                              partyMobNo:
                                                  valueOrDefault<String>(
                                                FFAppState().currentMobile,
                                                '0',
                                              ),
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'productList':
                                                    getSelItemListListFirestoreData(
                                                  _model.prdlistsavebill,
                                                ),
                                              },
                                            ),
                                          });
                                          _model.invonline = InvoiceRecord
                                              .getDocumentFromData({
                                            ...createInvoiceRecordData(
                                              invoice:
                                                  functions.genInvoiceNumyear(
                                                      FFAppState().newcount),
                                              party: valueOrDefault<String>(
                                                FFAppState().setCustRef?.id,
                                                'NA',
                                              ),
                                              products: '',
                                              invoiceDate:
                                                  functions.timestampToMili(
                                                      getCurrentTimestamp),
                                              paymentMode: getJsonField(
                                                FFAppState().groceryJson,
                                                r'''$.paymentMode''',
                                              ).toString(),
                                              dayId: functions.getDayId(),
                                              discountAmt:
                                                  valueOrDefault<double>(
                                                FFAppState().disAmt,
                                                0.0,
                                              ),
                                              discountPer:
                                                  valueOrDefault<double>(
                                                FFAppState().disPer,
                                                0.0,
                                              ),
                                              delliveryChrg:
                                                  valueOrDefault<double>(
                                                FFAppState().delCharges,
                                                0.0,
                                              ),
                                              taxAmt: FFAppState().taxamt,
                                              billAmt: valueOrDefault<double>(
                                                FFAppState().billAmt,
                                                0.0,
                                              ),
                                              finalBillAmt:
                                                  valueOrDefault<double>(
                                                FFAppState().finalAmt,
                                                0.0,
                                              ),
                                              shiftId: '',
                                              createdBy: FFAppState().userdoc,
                                              code: FFAppState().newcount,
                                              partyMobNo:
                                                  valueOrDefault<String>(
                                                FFAppState().currentMobile,
                                                '0',
                                              ),
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'productList':
                                                    getSelItemListListFirestoreData(
                                                  _model.prdlistsavebill,
                                                ),
                                              },
                                            ),
                                          }, invoiceRecordReference);
                                          _shouldSetState = true;

                                          await _model.invonline!.reference
                                              .update(createInvoiceRecordData(
                                            id: _model.invonline?.reference.id,
                                          ));
                                          _model.hiveInvoiceDataCopyCopy =
                                              await actions.addInvoiceBillhive(
                                            _model.invonline!.reference.id,
                                            functions.genInvoiceNumyear(
                                                FFAppState().newcount),
                                            FFAppState().setCustName,
                                            functions.timestampToMili(
                                                getCurrentTimestamp),
                                            functions.getDayId(),
                                            getJsonField(
                                              FFAppState().groceryJson,
                                              r'''$.paymentMode''',
                                            ).toString(),
                                            valueOrDefault<double>(
                                              FFAppState().disAmt,
                                              0.0,
                                            ),
                                            valueOrDefault<double>(
                                              FFAppState().disPer,
                                              0.0,
                                            ),
                                            valueOrDefault<double>(
                                              FFAppState().delCharges,
                                              0.0,
                                            ),
                                            FFAppState().taxamt,
                                            valueOrDefault<double>(
                                              FFAppState().billAmt,
                                              0.0,
                                            ),
                                            valueOrDefault<double>(
                                              FFAppState().finalAmt,
                                              0.0,
                                            ),
                                            0.0,
                                            _model.prdlistsavebill?.toList(),
                                            getJsonField(
                                              FFAppState().shiftDetailsJson,
                                              r'''$.shiftId''',
                                            ).toString(),
                                            false,
                                            FFAppState().invoiceStructVersion,
                                          );
                                          _shouldSetState = true;
                                          if (getJsonField(
                                            FFAppState().shiftDetailsJson,
                                            r'''$.shiftExists''',
                                          )) {
                                            _model.shiftSummarResultsNew2 =
                                                await actions
                                                    .calShiftSummaryNewgrocery(
                                              _model.hiveInvoiceDataCopyCopy!,
                                              FFAppState().shiftDetailsJson,
                                            );
                                            _shouldSetState = true;
                                            _model.shiftidhive2 =
                                                await actions.shiftIdtoInt(
                                              getJsonField(
                                                FFAppState().shiftDetailsJson,
                                                r'''$.shiftId''',
                                              ).toString(),
                                            );
                                            _shouldSetState = true;
                                            _model.getOfflineShiftdetails =
                                                await actions.hiveShiftCrud(
                                              _model.shiftidhive2,
                                              FFAppState().shiftDetails,
                                              'get',
                                            );
                                            _shouldSetState = true;
                                            FFAppState()
                                                .updateShiftDetailsStruct(
                                              (e) => e
                                                ..billCount = functions
                                                    .lastBillCount(_model
                                                        .getOfflineShiftdetails!
                                                        .billCount)
                                                ..totalSale = getJsonField(
                                                  _model.shiftSummarResultsNew2,
                                                  r'''$.totalSale''',
                                                )
                                                ..deliveryCharges =
                                                    getJsonField(
                                                  _model.shiftSummarResultsNew2,
                                                  r'''$.deliveryCharges''',
                                                )
                                                ..tax = getJsonField(
                                                  _model.shiftSummarResultsNew2,
                                                  r'''$.tax''',
                                                )
                                                ..lastBillNo = getJsonField(
                                                  _model.shiftSummarResultsNew2,
                                                  r'''$.lastBillNo''',
                                                ).toString()
                                                ..discount = getJsonField(
                                                  _model.shiftSummarResultsNew2,
                                                  r'''$.discount''',
                                                )
                                                ..lastBillTime =
                                                    functions.timestampToMili(
                                                        getCurrentTimestamp)
                                                ..cashSale = getJsonField(
                                                  _model.shiftSummarResultsNew2,
                                                  r'''$.cashSale''',
                                                )
                                                ..paymentJson = getJsonField(
                                                  _model.shiftSummarResultsNew2,
                                                  r'''$.paymentJson''',
                                                ).toString()
                                                ..dayId = getJsonField(
                                                  _model.shiftSummarResultsNew2,
                                                  r'''$.dayId''',
                                                ).toString()
                                                ..code = FFAppState()
                                                    .shiftDetails
                                                    .code
                                                ..endTime = FFAppState()
                                                    .shiftDetails
                                                    .endTime
                                                ..advanceAmtTotal = FFAppState()
                                                    .shiftDetails
                                                    .advanceAmtTotal
                                                ..customerReciveAmtTotal =
                                                    FFAppState()
                                                        .shiftDetails
                                                        .customerReciveAmtTotal
                                                ..expensesAmtTotal =
                                                    FFAppState()
                                                        .shiftDetails
                                                        .expensesAmtTotal
                                                ..openingAmt = FFAppState()
                                                    .shiftDetails
                                                    .openingAmt
                                                ..receiveAmtTotal = FFAppState()
                                                    .shiftDetails
                                                    .receiveAmtTotal
                                                ..refoundAmount = FFAppState()
                                                    .shiftDetails
                                                    .refoundAmount
                                                ..roundOff = FFAppState()
                                                    .shiftDetails
                                                    .roundOff
                                                ..cashInHand = FFAppState()
                                                    .shiftDetails
                                                    .cashInHand
                                                ..startTime = FFAppState()
                                                    .shiftDetails
                                                    .startTime
                                                ..inActive = FFAppState()
                                                    .shiftDetails
                                                    .inActive
                                                ..shiftNo = FFAppState()
                                                    .shiftDetails
                                                    .shiftNo
                                                ..subTotalBill = FFAppState()
                                                    .shiftDetails
                                                    .subTotalBill
                                                ..userId = FFAppState()
                                                    .shiftDetails
                                                    .userId
                                                ..deviceId = FFAppState()
                                                    .shiftDetails
                                                    .deviceId
                                                ..version = FFAppState()
                                                    .shiftDetails
                                                    .version
                                                ..shiftId = getJsonField(
                                                  _model.shiftSummarResultsNew2,
                                                  r'''$.shiftId''',
                                                ).toString()
                                                ..synC = FFAppState()
                                                    .shiftDetails
                                                    .synC
                                                ..newIDShift = FFAppState()
                                                    .shiftDetails
                                                    .newIDShift
                                                ..hivekey = FFAppState()
                                                    .shiftDetails
                                                    .hivekey
                                                ..id = FFAppState()
                                                    .shiftDetails
                                                    .id,
                                            );
                                            safeSetState(() {});
                                            _model.shiftondata =
                                                await queryShiftRecordOnce(
                                              parent: FFAppState().outletIdRef,
                                              queryBuilder: (shiftRecord) =>
                                                  shiftRecord.where(
                                                'id',
                                                isEqualTo:
                                                    valueOrDefault<String>(
                                                  getJsonField(
                                                    FFAppState()
                                                        .shiftDetailsJson,
                                                    r'''$.ref''',
                                                  )?.toString(),
                                                  'NA',
                                                ),
                                              ),
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);
                                            _shouldSetState = true;

                                            await _model.shiftondata!.reference
                                                .update(createShiftRecordData(
                                              billCount:
                                                  functions.lastBillCount(_model
                                                      .getOfflineShiftdetails!
                                                      .billCount),
                                              dayId: getJsonField(
                                                _model.shiftSummarResultsNew2,
                                                r'''$.dayId''',
                                              ).toString(),
                                              lastBillNo: getJsonField(
                                                _model.shiftSummarResultsNew2,
                                                r'''$.lastBillNo''',
                                              ).toString(),
                                              lastBillTime:
                                                  functions.timestampToMili(
                                                      getCurrentTimestamp),
                                              tax: getJsonField(
                                                _model.shiftSummarResultsNew2,
                                                r'''$.tax''',
                                              ),
                                              deliveryCharges: getJsonField(
                                                _model.shiftSummarResultsNew2,
                                                r'''$.deliveryCharges''',
                                              ),
                                              discount: getJsonField(
                                                _model.shiftSummarResultsNew2,
                                                r'''$.discount''',
                                              ),
                                              totalSale: getJsonField(
                                                _model.shiftSummarResultsNew2,
                                                r'''$.totalSale''',
                                              ),
                                              cashSale: getJsonField(
                                                _model.shiftSummarResultsNew2,
                                                r'''$.cashSale''',
                                              ),
                                              paymentJson: getJsonField(
                                                _model.shiftSummarResultsNew2,
                                                r'''$.paymentJson''',
                                              ).toString(),
                                              code: FFAppState()
                                                  .shiftDetails
                                                  .code,
                                              endTime: FFAppState()
                                                  .shiftDetails
                                                  .endTime,
                                              advanceAmtTotal: FFAppState()
                                                  .shiftDetails
                                                  .advanceAmtTotal,
                                              customerReciveAmtTotal:
                                                  FFAppState()
                                                      .shiftDetails
                                                      .customerReciveAmtTotal,
                                              expensesAmtTotal: FFAppState()
                                                  .shiftDetails
                                                  .expensesAmtTotal,
                                              openingAmt: FFAppState()
                                                  .shiftDetails
                                                  .openingAmt,
                                              receiveAmtTotal: FFAppState()
                                                  .shiftDetails
                                                  .receiveAmtTotal,
                                              refoundAmount: FFAppState()
                                                  .shiftDetails
                                                  .refoundAmount,
                                              roundOff: FFAppState()
                                                  .shiftDetails
                                                  .roundOff,
                                              cashInHand: FFAppState()
                                                  .shiftDetails
                                                  .cashInHand,
                                              startTime: FFAppState()
                                                  .shiftDetails
                                                  .startTime,
                                              inActive: FFAppState()
                                                  .shiftDetails
                                                  .inActive,
                                              shiftNo: FFAppState()
                                                  .shiftDetails
                                                  .shiftNo,
                                              shiftId: getJsonField(
                                                _model.shiftSummarResultsNew2,
                                                r'''$.shiftId''',
                                              ).toString(),
                                            ));
                                            _model.updatedShift =
                                                await actions.hiveShiftCrud(
                                              _model.shiftidhive2,
                                              FFAppState().shiftDetails,
                                              'update',
                                            );
                                            _shouldSetState = true;
                                            await actions.removeFromAllBillList(
                                              FFAppState().selBill,
                                            );
                                            FFAppState().lastBill =
                                                FFAppState().finalAmt;
                                            FFAppState().update(() {});
                                            await actions.clearValue();
                                            FFAppState().noOfItems = 0;
                                            FFAppState().subTotal = 0.0;
                                            FFAppState().count =
                                                _model.updatedShift!.billCount;
                                            FFAppState().update(() {});
                                            FFAppState().oldBalance = 0;
                                            FFAppState().custCredit = 0;
                                            FFAppState().custNameRef = null;
                                            FFAppState().setCustRef = null;
                                            FFAppState().setCustName = '';
                                            FFAppState().setCustMobNo = '';
                                            FFAppState().taxamt = 0.0;
                                            FFAppState().taxAmtPay = 0.0;
                                            FFAppState().disPer = 0.0;
                                            FFAppState().disAmtPay = 0.0;
                                            FFAppState().disAmt = 0.0;
                                            FFAppState().update(() {});
                                            FFAppState().finalAmt = 0.0;
                                            FFAppState().billAmt = 0.0;
                                            FFAppState().groceryJson = null;
                                            FFAppState().delCharges = 0.0;
                                            FFAppState().disAmtPay = 0.0;
                                            FFAppState().taxAmtPay = 0.0;
                                            FFAppState().update(() {});
                                            Navigator.pop(context);
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Login again to start Shift ',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
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
                                              duration:
                                                  Duration(milliseconds: 1900),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }

                                        if (_shouldSetState)
                                          safeSetState(() {});
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        '93l6u4so' /* Save */,
                                      ),
                                      options: FFButtonOptions(
                                        width: 90.0,
                                        height: 50.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .customColor2,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLargeFamily,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                            FFAppState().newcount =
                                                FFAppState().newcount + 1;
                                            safeSetState(() {});
                                          } else {
                                            FFAppState().count =
                                                FFAppState().count + 1;
                                            FFAppState().newcount =
                                                FFAppState().newcount + 1;
                                            safeSetState(() {});
                                          }

                                          _model.prdlinstnewtx =
                                              await actions.filterProducts2(
                                            FFAppState().selBill,
                                            FFAppState().allBillsList.toList(),
                                          );
                                          _shouldSetState = true;
                                          _model.appsettingnew =
                                              await queryAppSettingsRecordOnce(
                                            parent: FFAppState().outletIdRef,
                                            queryBuilder: (appSettingsRecord) =>
                                                appSettingsRecord.where(
                                              'deviceId',
                                              isEqualTo: FFAppState().dId,
                                            ),
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);
                                          _shouldSetState = true;
                                          _model.outletdoc =
                                              await queryOutletRecordOnce(
                                            queryBuilder: (outletRecord) =>
                                                outletRecord.where(
                                              'id',
                                              isEqualTo:
                                                  FFAppState().outletIdRef?.id,
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
                                                      FFAppState().groceryJson,
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
                                                      lastVisit: getCurrentTimestamp
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
                                                      FFAppState().groceryJson,
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
                                                          paymentType: 'CREDIT',
                                                          createdBy:
                                                              FFAppState()
                                                                  .userdoc,
                                                          createdDate:
                                                              getCurrentTimestamp
                                                                  .millisecondsSinceEpoch,
                                                          party: FFAppState()
                                                              .setCustRef,
                                                          expenceType: 'Debit',
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
                                                builder: (alertDialogContext) {
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

                                          var invoiceRecordReference =
                                              InvoiceRecord.createDoc(
                                                  FFAppState().outletIdRef!);
                                          await invoiceRecordReference.set({
                                            ...createInvoiceRecordData(
                                              invoice:
                                                  functions.genInvoiceNumyear(
                                                      FFAppState().newcount),
                                              party: valueOrDefault<String>(
                                                FFAppState().setCustRef?.id,
                                                'NA',
                                              ),
                                              products: '',
                                              invoiceDate:
                                                  functions.timestampToMili(
                                                      getCurrentTimestamp),
                                              paymentMode: getJsonField(
                                                FFAppState().groceryJson,
                                                r'''$.paymentMode''',
                                              ).toString(),
                                              dayId: functions.getDayId(),
                                              discountAmt:
                                                  valueOrDefault<double>(
                                                FFAppState().disAmt,
                                                0.0,
                                              ),
                                              discountPer:
                                                  valueOrDefault<double>(
                                                FFAppState().disPer,
                                                0.0,
                                              ),
                                              delliveryChrg:
                                                  valueOrDefault<double>(
                                                FFAppState().delCharges,
                                                0.0,
                                              ),
                                              taxAmt: FFAppState().taxamt,
                                              billAmt: valueOrDefault<double>(
                                                FFAppState().billAmt,
                                                0.0,
                                              ),
                                              finalBillAmt:
                                                  valueOrDefault<double>(
                                                FFAppState().finalAmt,
                                                0.0,
                                              ),
                                              shiftId: getJsonField(
                                                FFAppState().shiftDetailsJson,
                                                r'''$.shiftId''',
                                              ).toString(),
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'productList':
                                                    getSelItemListListFirestoreData(
                                                  _model.prdlinstnewtx,
                                                ),
                                              },
                                            ),
                                          });
                                          _model.invonlineprt = InvoiceRecord
                                              .getDocumentFromData({
                                            ...createInvoiceRecordData(
                                              invoice:
                                                  functions.genInvoiceNumyear(
                                                      FFAppState().newcount),
                                              party: valueOrDefault<String>(
                                                FFAppState().setCustRef?.id,
                                                'NA',
                                              ),
                                              products: '',
                                              invoiceDate:
                                                  functions.timestampToMili(
                                                      getCurrentTimestamp),
                                              paymentMode: getJsonField(
                                                FFAppState().groceryJson,
                                                r'''$.paymentMode''',
                                              ).toString(),
                                              dayId: functions.getDayId(),
                                              discountAmt:
                                                  valueOrDefault<double>(
                                                FFAppState().disAmt,
                                                0.0,
                                              ),
                                              discountPer:
                                                  valueOrDefault<double>(
                                                FFAppState().disPer,
                                                0.0,
                                              ),
                                              delliveryChrg:
                                                  valueOrDefault<double>(
                                                FFAppState().delCharges,
                                                0.0,
                                              ),
                                              taxAmt: FFAppState().taxamt,
                                              billAmt: valueOrDefault<double>(
                                                FFAppState().billAmt,
                                                0.0,
                                              ),
                                              finalBillAmt:
                                                  valueOrDefault<double>(
                                                FFAppState().finalAmt,
                                                0.0,
                                              ),
                                              shiftId: getJsonField(
                                                FFAppState().shiftDetailsJson,
                                                r'''$.shiftId''',
                                              ).toString(),
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'productList':
                                                    getSelItemListListFirestoreData(
                                                  _model.prdlinstnewtx,
                                                ),
                                              },
                                            ),
                                          }, invoiceRecordReference);
                                          _shouldSetState = true;

                                          await _model.invonlineprt!.reference
                                              .update(createInvoiceRecordData(
                                            id: _model
                                                .invonlineprt?.reference.id,
                                          ));
                                          _model.hiveInvoiceData =
                                              await actions.addInvoiceBillhive(
                                            _model.invonlineprt!.reference.id,
                                            functions.genInvoiceNumyear(
                                                FFAppState().newcount),
                                            valueOrDefault<String>(
                                              FFAppState().setCustRef?.id,
                                              '0',
                                            ),
                                            functions.timestampToMili(
                                                getCurrentTimestamp),
                                            functions.getDayId(),
                                            getJsonField(
                                              FFAppState().groceryJson,
                                              r'''$.paymentMode''',
                                            ).toString(),
                                            valueOrDefault<double>(
                                              FFAppState().disAmt,
                                              0.0,
                                            ),
                                            valueOrDefault<double>(
                                              FFAppState().disPer,
                                              0.0,
                                            ),
                                            valueOrDefault<double>(
                                              FFAppState().delCharges,
                                              0.0,
                                            ),
                                            FFAppState().taxamt,
                                            valueOrDefault<double>(
                                              FFAppState().billAmt,
                                              0.0,
                                            ),
                                            valueOrDefault<double>(
                                              FFAppState().finalAmt,
                                              0.0,
                                            ),
                                            0.0,
                                            _model.prdlinstnewtx?.toList(),
                                            getJsonField(
                                              FFAppState().shiftDetailsJson,
                                              r'''$.shiftId''',
                                            ).toString(),
                                            false,
                                            FFAppState().invoiceStructVersion,
                                          );
                                          _shouldSetState = true;
                                          if (getJsonField(
                                            FFAppState().shiftDetailsJson,
                                            r'''$.shiftExists''',
                                          )) {
                                            _model.shiftSummarResultsNew =
                                                await actions
                                                    .calShiftSummaryNewgrocery(
                                              _model.hiveInvoiceData!,
                                              FFAppState().shiftDetailsJson,
                                            );
                                            _shouldSetState = true;
                                            FFAppState()
                                                .updateShiftDetailsStruct(
                                              (e) => e
                                                ..billCount =
                                                    valueOrDefault<int>(
                                                  functions.lastBillCount(
                                                      FFAppState()
                                                          .shiftDetails
                                                          .billCount),
                                                  0,
                                                )
                                                ..totalSale = getJsonField(
                                                  _model.shiftSummarResultsNew,
                                                  r'''$.totalSale''',
                                                )
                                                ..deliveryCharges =
                                                    getJsonField(
                                                  _model.shiftSummarResultsNew,
                                                  r'''$.deliveryCharges''',
                                                )
                                                ..tax = getJsonField(
                                                  _model.shiftSummarResultsNew,
                                                  r'''$.tax''',
                                                )
                                                ..lastBillNo = getJsonField(
                                                  _model.shiftSummarResultsNew,
                                                  r'''$.lastBillno''',
                                                ).toString()
                                                ..discount = getJsonField(
                                                  _model.shiftSummarResultsNew,
                                                  r'''$.discount''',
                                                )
                                                ..lastBillTime =
                                                    functions.timestampToMili(
                                                        getCurrentTimestamp)
                                                ..cashSale = getJsonField(
                                                  _model.shiftSummarResultsNew,
                                                  r'''$.cashSale''',
                                                )
                                                ..paymentJson = getJsonField(
                                                  _model.shiftSummarResultsNew,
                                                  r'''$.paymentJson''',
                                                ).toString()
                                                ..dayId = getJsonField(
                                                  _model.shiftSummarResultsNew,
                                                  r'''$.dayId''',
                                                ).toString()
                                                ..shiftId = getJsonField(
                                                  _model.shiftSummarResultsNew,
                                                  r'''$.shiftId''',
                                                ).toString()
                                                ..hivekey = FFAppState()
                                                    .shiftDetails
                                                    .hivekey
                                                ..newIDShift = FFAppState()
                                                    .shiftDetails
                                                    .newIDShift
                                                ..code = FFAppState()
                                                    .shiftDetails
                                                    .code
                                                ..endTime = FFAppState()
                                                    .shiftDetails
                                                    .endTime
                                                ..advanceAmtTotal = FFAppState()
                                                    .shiftDetails
                                                    .advanceAmtTotal
                                                ..customerReciveAmtTotal =
                                                    FFAppState()
                                                        .shiftDetails
                                                        .customerReciveAmtTotal
                                                ..expensesAmtTotal =
                                                    FFAppState()
                                                        .shiftDetails
                                                        .expensesAmtTotal
                                                ..openingAmt = FFAppState()
                                                    .shiftDetails
                                                    .openingAmt
                                                ..receiveAmtTotal = FFAppState()
                                                    .shiftDetails
                                                    .receiveAmtTotal
                                                ..refoundAmount = FFAppState()
                                                    .shiftDetails
                                                    .refoundAmount
                                                ..roundOff = FFAppState()
                                                    .shiftDetails
                                                    .roundOff
                                                ..cashInHand = FFAppState()
                                                    .shiftDetails
                                                    .cashInHand
                                                ..startTime = FFAppState()
                                                    .shiftDetails
                                                    .startTime
                                                ..inActive = FFAppState()
                                                    .shiftDetails
                                                    .inActive
                                                ..shiftNo = FFAppState()
                                                    .shiftDetails
                                                    .shiftNo
                                                ..subTotalBill = FFAppState()
                                                    .shiftDetails
                                                    .subTotalBill
                                                ..version = FFAppState()
                                                    .shiftDetails
                                                    .version
                                                ..userId = FFAppState()
                                                    .shiftDetails
                                                    .userId
                                                ..deviceId = FFAppState()
                                                    .shiftDetails
                                                    .deviceId
                                                ..synC = FFAppState()
                                                    .shiftDetails
                                                    .synC
                                                ..id = FFAppState()
                                                    .shiftDetails
                                                    .id,
                                            );
                                            safeSetState(() {});
                                            _model.shiftondataprint =
                                                await queryShiftRecordOnce(
                                              parent: FFAppState().outletIdRef,
                                              queryBuilder: (shiftRecord) =>
                                                  shiftRecord.where(
                                                'id',
                                                isEqualTo:
                                                    valueOrDefault<String>(
                                                  getJsonField(
                                                    FFAppState()
                                                        .shiftDetailsJson,
                                                    r'''$.ref''',
                                                  )?.toString(),
                                                  'NA',
                                                ),
                                              ),
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);
                                            _shouldSetState = true;

                                            await _model
                                                .shiftondataprint!.reference
                                                .update(createShiftRecordData(
                                              billCount: valueOrDefault<int>(
                                                functions.lastBillCount(
                                                    FFAppState()
                                                        .shiftDetails
                                                        .billCount),
                                                0,
                                              ),
                                              dayId: getJsonField(
                                                _model.shiftSummarResultsNew,
                                                r'''$.dayId''',
                                              ).toString(),
                                              lastBillNo: getJsonField(
                                                _model.shiftSummarResultsNew,
                                                r'''$.lastBillNo''',
                                              ).toString(),
                                              lastBillTime:
                                                  functions.timestampToMili(
                                                      getCurrentTimestamp),
                                              tax: getJsonField(
                                                _model.shiftSummarResultsNew,
                                                r'''$.tax''',
                                              ),
                                              deliveryCharges: getJsonField(
                                                _model.shiftSummarResultsNew,
                                                r'''$.deliveryCharges''',
                                              ),
                                              discount: getJsonField(
                                                _model.shiftSummarResultsNew,
                                                r'''$.discount''',
                                              ),
                                              totalSale: getJsonField(
                                                _model.shiftSummarResultsNew,
                                                r'''$.totalSale''',
                                              ),
                                              cashSale: getJsonField(
                                                _model.shiftSummarResultsNew,
                                                r'''$.cashSale''',
                                              ),
                                              paymentJson: getJsonField(
                                                _model.shiftSummarResultsNew,
                                                r'''$.paymentJson''',
                                              ).toString(),
                                              code: FFAppState()
                                                  .shiftDetails
                                                  .code,
                                              endTime: FFAppState()
                                                  .shiftDetails
                                                  .endTime,
                                              advanceAmtTotal: FFAppState()
                                                  .shiftDetails
                                                  .advanceAmtTotal,
                                              customerReciveAmtTotal:
                                                  FFAppState()
                                                      .shiftDetails
                                                      .customerReciveAmtTotal,
                                              expensesAmtTotal: FFAppState()
                                                  .shiftDetails
                                                  .expensesAmtTotal,
                                              openingAmt: FFAppState()
                                                  .shiftDetails
                                                  .openingAmt,
                                              receiveAmtTotal: FFAppState()
                                                  .shiftDetails
                                                  .receiveAmtTotal,
                                              refoundAmount: FFAppState()
                                                  .shiftDetails
                                                  .refoundAmount,
                                              roundOff: FFAppState()
                                                  .shiftDetails
                                                  .roundOff,
                                              cashInHand: FFAppState()
                                                  .shiftDetails
                                                  .cashInHand,
                                              startTime: FFAppState()
                                                  .shiftDetails
                                                  .startTime,
                                              inActive: FFAppState()
                                                  .shiftDetails
                                                  .inActive,
                                              shiftNo: FFAppState()
                                                  .shiftDetails
                                                  .shiftNo,
                                              shiftId: getJsonField(
                                                _model.shiftSummarResultsNew,
                                                r'''$.shiftId''',
                                              ).toString(),
                                            ));
                                            _model.updatedShiftDetails =
                                                await actions.hiveShiftCrud(
                                              FFAppState()
                                                  .shiftDetails
                                                  .newIDShift,
                                              FFAppState().shiftDetails,
                                              'update',
                                            );
                                            _shouldSetState = true;
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Login again to start Shift ',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
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

                                          if (!functions.isPrinterSelected(
                                              FFAppState().printerDevice)!) {
                                            _model.resDevice2 =
                                                await actions.scanPrinter(
                                              FFAppState().posMode,
                                            );
                                            _shouldSetState = true;
                                          }
                                          _model.isconnected =
                                              await actions.connectDevice(
                                            FFAppState().printerDevice,
                                            FFAppState().printerIndex,
                                          );
                                          _shouldSetState = true;
                                          if (_model.isconnected!) {
                                            FFAppState().lastBill =
                                                FFAppState().finalAmt;
                                            FFAppState().update(() {});
                                            _model.returnedList2 =
                                                await actions.selectBillPrint(
                                              FFAppState().selBill.toString(),
                                              FFAppState()
                                                  .allBillsList
                                                  .toList(),
                                            );
                                            _shouldSetState = true;
                                            _model.device =
                                                await actions.newCustomAction(
                                              FFAppState().printerIndex,
                                            );
                                            _shouldSetState = true;
                                            await actions
                                                .printBillnewhivegrocery(
                                              _model.returnedList2!.toList(),
                                              _model.device!.toList(),
                                              FFAppState().isPrinterConnected,
                                              FFAppState().printerName,
                                              getJsonField(
                                                functions.outletDocToJson(
                                                    _model.outletdoc!),
                                                r'''$''',
                                              ),
                                              _model.hiveInvoiceData!,
                                              FFAppState().paperSize,
                                              _model.appsettingnew!,
                                            );
                                            await actions.removeFromAllBillList(
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
                                            FFAppState().count = _model
                                                .updatedShiftDetails!.billCount;
                                            FFAppState().groceryJson = null;
                                            FFAppState().update(() {});
                                            Navigator.pop(context);
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text(
                                                      'printer connection'),
                                                  content: Text(
                                                      'printer not connected'),
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
                                              duration:
                                                  Duration(milliseconds: 1900),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          );
                                        }

                                        if (_shouldSetState)
                                          safeSetState(() {});
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'yftp2ms2' /* Print */,
                                      ),
                                      options: FFButtonOptions(
                                        width: 90.0,
                                        height: 50.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
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
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
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
    );
  }
}
