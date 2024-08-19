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

    _model.textController ??= TextEditingController(text: _model.amount);
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
        width: 700.0,
        height: 600.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'yjpkp26k' /* Payment Mode */,
                      ),
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleMediumFamily,
                            color: FlutterFlowTheme.of(context).primary,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleMediumFamily),
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      width: 250.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
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
                                              scrollDirection: Axis.vertical,
                                              itemCount: paymentMode.length,
                                              itemBuilder:
                                                  (context, paymentModeIndex) {
                                                final paymentModeItem =
                                                    paymentMode[
                                                        paymentModeIndex];
                                                return Container(
                                                  decoration: BoxDecoration(
                                                    color: paymentModeItem
                                                                .name ==
                                                            FFAppState().PayMode
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .alternate
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
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
                                                          paymentModeItem.name;
                                                      setState(() {});
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
                                                          paymentModeItem.name,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineSmallFamily),
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
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                FFAppState().PayMode,
                                                'Cash',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmallFamily,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallFamily),
                                                      ),
                                            ),
                                            TextFormField(
                                              controller: _model.textController,
                                              focusNode:
                                                  _model.textFieldFocusNode,
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '9khzcdrf' /* Amount */,
                                                ),
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
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
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
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
                                                    color: FlutterFlowTheme.of(
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 22.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                        .containsKey(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMediumFamily),
                                                  ),
                                              validator: _model
                                                  .textControllerValidator
                                                  .asValidator(context),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      _model.amount =
                                                          '${_model.textController.text}1';
                                                      setState(() {});
                                                      setState(() {
                                                        _model.textController
                                                                ?.text =
                                                            _model.amount!;
                                                        _model.textController
                                                                ?.selection =
                                                            TextSelection.collapsed(
                                                                offset: _model
                                                                    .textController!
                                                                    .text
                                                                    .length);
                                                      });
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      '0wr1nxem' /* 1 */,
                                                    ),
                                                    options: FFButtonOptions(
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor2,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 19.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      _model.amount =
                                                          '${_model.textController.text}2';
                                                      setState(() {});
                                                      setState(() {
                                                        _model.textController
                                                                ?.text =
                                                            _model.amount!;
                                                        _model.textController
                                                                ?.selection =
                                                            TextSelection.collapsed(
                                                                offset: _model
                                                                    .textController!
                                                                    .text
                                                                    .length);
                                                      });
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'p2ckw0dp' /* 2 */,
                                                    ),
                                                    options: FFButtonOptions(
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor2,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 19.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      _model.amount =
                                                          '${_model.textController.text}3';
                                                      setState(() {});
                                                      setState(() {
                                                        _model.textController
                                                                ?.text =
                                                            _model.amount!;
                                                        _model.textController
                                                                ?.selection =
                                                            TextSelection.collapsed(
                                                                offset: _model
                                                                    .textController!
                                                                    .text
                                                                    .length);
                                                      });
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'dcu8290r' /* 3 */,
                                                    ),
                                                    options: FFButtonOptions(
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor2,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 19.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 15.0)),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      _model.amount =
                                                          '${_model.textController.text}4';
                                                      setState(() {});
                                                      setState(() {
                                                        _model.textController
                                                                ?.text =
                                                            _model.amount!;
                                                        _model.textController
                                                                ?.selection =
                                                            TextSelection.collapsed(
                                                                offset: _model
                                                                    .textController!
                                                                    .text
                                                                    .length);
                                                      });
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'kdeaxyp3' /* 4 */,
                                                    ),
                                                    options: FFButtonOptions(
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor2,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 19.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      _model.amount =
                                                          '${_model.textController.text}5';
                                                      setState(() {});
                                                      setState(() {
                                                        _model.textController
                                                                ?.text =
                                                            _model.amount!;
                                                        _model.textController
                                                                ?.selection =
                                                            TextSelection.collapsed(
                                                                offset: _model
                                                                    .textController!
                                                                    .text
                                                                    .length);
                                                      });
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'xvmr7omx' /* 5 */,
                                                    ),
                                                    options: FFButtonOptions(
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor2,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 19.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      _model.amount =
                                                          '${_model.textController.text}6';
                                                      setState(() {});
                                                      setState(() {
                                                        _model.textController
                                                                ?.text =
                                                            _model.amount!;
                                                        _model.textController
                                                                ?.selection =
                                                            TextSelection.collapsed(
                                                                offset: _model
                                                                    .textController!
                                                                    .text
                                                                    .length);
                                                      });
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'djwsrz43' /* 6 */,
                                                    ),
                                                    options: FFButtonOptions(
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor2,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 19.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 15.0)),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      _model.amount =
                                                          '${_model.textController.text}7';
                                                      setState(() {});
                                                      setState(() {
                                                        _model.textController
                                                                ?.text =
                                                            _model.amount!;
                                                        _model.textController
                                                                ?.selection =
                                                            TextSelection.collapsed(
                                                                offset: _model
                                                                    .textController!
                                                                    .text
                                                                    .length);
                                                      });
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'nwv5ddw4' /* 7 */,
                                                    ),
                                                    options: FFButtonOptions(
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor2,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 19.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      _model.amount =
                                                          '${_model.textController.text}8';
                                                      setState(() {});
                                                      setState(() {
                                                        _model.textController
                                                                ?.text =
                                                            _model.amount!;
                                                        _model.textController
                                                                ?.selection =
                                                            TextSelection.collapsed(
                                                                offset: _model
                                                                    .textController!
                                                                    .text
                                                                    .length);
                                                      });
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      '8srzukga' /* 8 */,
                                                    ),
                                                    options: FFButtonOptions(
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor2,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 19.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      _model.amount =
                                                          '${_model.textController.text}9';
                                                      setState(() {});
                                                      setState(() {
                                                        _model.textController
                                                                ?.text =
                                                            _model.amount!;
                                                        _model.textController
                                                                ?.selection =
                                                            TextSelection.collapsed(
                                                                offset: _model
                                                                    .textController!
                                                                    .text
                                                                    .length);
                                                      });
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'mgkvfhmb' /* 9 */,
                                                    ),
                                                    options: FFButtonOptions(
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor2,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 19.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 15.0)),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      _model.amount =
                                                          '${_model.textController.text}.';
                                                      setState(() {});
                                                      setState(() {
                                                        _model.textController
                                                                ?.text =
                                                            _model.amount!;
                                                        _model.textController
                                                                ?.selection =
                                                            TextSelection.collapsed(
                                                                offset: _model
                                                                    .textController!
                                                                    .text
                                                                    .length);
                                                      });
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'ngwrzo40' /* . */,
                                                    ),
                                                    options: FFButtonOptions(
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor2,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 28.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      _model.amount =
                                                          '${_model.textController.text}0';
                                                      setState(() {});
                                                      setState(() {
                                                        _model.textController
                                                                ?.text =
                                                            _model.amount!;
                                                        _model.textController
                                                                ?.selection =
                                                            TextSelection.collapsed(
                                                                offset: _model
                                                                    .textController!
                                                                    .text
                                                                    .length);
                                                      });
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      '5z3tx4m3' /* 0 */,
                                                    ),
                                                    options: FFButtonOptions(
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor2,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 19.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      _model.amount = '';
                                                      setState(() {});
                                                      setState(() {
                                                        _model.textController
                                                                ?.text =
                                                            _model.amount!;
                                                        _model.textController
                                                                ?.selection =
                                                            TextSelection.collapsed(
                                                                offset: _model
                                                                    .textController!
                                                                    .text
                                                                    .length);
                                                      });
                                                    },
                                                    text: '',
                                                    icon: Icon(
                                                      Icons.backspace_rounded,
                                                      size: 15.0,
                                                    ),
                                                    options: FFButtonOptions(
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor2,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 19.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    showLoadingIndicator: false,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      _model.result233 =
                                                          await actions
                                                              .calculateGroceryAmtaction(
                                                        FFAppState().PayMode,
                                                        valueOrDefault<double>(
                                                          FFAppState().finalAmt,
                                                          0.0,
                                                        ),
                                                        double.parse(_model
                                                            .textController
                                                            .text),
                                                      );
                                                      FFAppState().groceryJson =
                                                          _model.result233!;
                                                      setState(() {});
                                                      _model.amount = '';
                                                      setState(() {});

                                                      setState(() {});
                                                    },
                                                    text: '',
                                                    icon: Icon(
                                                      Icons.done_sharp,
                                                      size: 25.0,
                                                    ),
                                                    options: FFButtonOptions(
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor2,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 19.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    showLoadingIndicator: false,
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 15.0)),
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
                                            child: Container(
                                              width: 100.0,
                                              height: 31.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .customColor1,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'vb6x4obo' /* Advance */,
                                                  ),
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
                                                                .error,
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily),
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              width: 100.0,
                                              height: 31.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .customColor1,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    getJsonField(
                                                      FFAppState().groceryJson,
                                                      r'''$.advanceAmt''',
                                                    )?.toString(),
                                                    '0',
                                                  ),
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
                                                                .error,
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily),
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              width: 100.0,
                                              height: 31.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .customColor1,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'q00niyll' /* Paid */,
                                                  ),
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
                                                                .primaryText,
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily),
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 100.0,
                                            height: 31.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor1,
                                              ),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  getJsonField(
                                                    FFAppState().groceryJson,
                                                    r'''$.paidAmt''',
                                                  )?.toString(),
                                                  '0',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLargeFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          fontSize: 17.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily),
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
                                            child: Container(
                                              width: 100.0,
                                              height: 31.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .customColor1,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'wqkk5ub3' /* Balance */,
                                                  ),
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
                                                                .primaryText,
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily),
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              width: 100.0,
                                              height: 31.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .customColor1,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    getJsonField(
                                                      FFAppState().groceryJson,
                                                      r'''$.balanceAmt''',
                                                    )?.toString(),
                                                    '0',
                                                  ),
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
                                                                .error,
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily),
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              width: 100.0,
                                              height: 31.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .customColor1,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '2uke28cn' /* Return */,
                                                  ),
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
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily),
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 100.0,
                                            height: 31.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor1,
                                              ),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  getJsonField(
                                                    FFAppState().groceryJson,
                                                    r'''$.returnAmt''',
                                                  )?.toString(),
                                                  '0',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLargeFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          fontSize: 17.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily),
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
                                    if (functions
                                            .filterBillList(
                                                FFAppState().selBill,
                                                FFAppState()
                                                    .allBillsList
                                                    .toList())
                                            .length >
                                        0) {
                                      if (!getJsonField(
                                        FFAppState().shiftDetailsJson,
                                        r'''$.shiftExists''',
                                      )) {
                                        FFAppState().count =
                                            FFAppState().count + 1;
                                        setState(() {});
                                      }
                                      _model.prdlistsavebill =
                                          await actions.filterProducts2(
                                        FFAppState().selBill,
                                        FFAppState().allBillsList.toList(),
                                      );
                                      _shouldSetState = true;
                                      if (FFAppState().setCustRef != null) {
                                        if (FFAppState().PayMode == 'CREDIT') {
                                          if (FFAppState().oldBalance <
                                              FFAppState().custCredit) {
                                            _model.totalcredit2 =
                                                await actions.oldbalanceplusamt(
                                              FFAppState().oldBalance,
                                              FFAppState().finalAmt,
                                            );
                                            _shouldSetState = true;

                                            await FFAppState()
                                                .setCustRef!
                                                .update(createPartyRecordData(
                                                  credit: true,
                                                  oldBalance:
                                                      _model.totalcredit2,
                                                  lastVisit: getCurrentTimestamp
                                                      .millisecondsSinceEpoch
                                                      .toString(),
                                                ));
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
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
                                              setState(() {});
                                            return;
                                          }
                                        }
                                      }
                                      _model.hiveInvoiceDataCopyCopy =
                                          await actions.addInvoiceBillhive(
                                        '',
                                        functions.genInvoiceNum(
                                            FFAppState().count,
                                            FFAppState().shiftCount),
                                        FFAppState().setCustName,
                                        functions.timestampToMili(
                                            getCurrentTimestamp),
                                        functions.getDayId(),
                                        FFAppState().PayMode,
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
                                            await actions.calShiftSummaryNew(
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
                                        FFAppState().updateShiftDetailsStruct(
                                          (e) => e
                                            ..billCount =
                                                functions.lastBillCount(_model
                                                    .getOfflineShiftdetails!
                                                    .billCount)
                                            ..totalSale = getJsonField(
                                              _model.shiftSummarResultsNew2,
                                              r'''$.totalSale''',
                                            )
                                            ..deliveryCharges = getJsonField(
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
                                            ..code =
                                                FFAppState().shiftDetails.code
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
                                            ..expensesAmtTotal = FFAppState()
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
                                            ..userId =
                                                FFAppState().shiftDetails.userId
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
                                            ..synC =
                                                FFAppState().shiftDetails.synC
                                            ..newIDShift = FFAppState()
                                                .shiftDetails
                                                .newIDShift
                                            ..hivekey = FFAppState()
                                                .shiftDetails
                                                .hivekey
                                            ..id = FFAppState().shiftDetails.id,
                                        );
                                        setState(() {});
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
                                        FFAppState().delCharges = 0.0;
                                        FFAppState().update(() {});
                                        FFAppState().oldBalance = 0;
                                        FFAppState().custCredit = 0;
                                        FFAppState().custNameRef = null;
                                        FFAppState().setCustRef = null;
                                        FFAppState().setCustName = '';
                                        FFAppState().setCustMobNo = '';
                                        FFAppState().update(() {});
                                        FFAppState().finalAmt = 0.0;
                                        FFAppState().billAmt = 0.0;
                                        FFAppState().groceryJson = null;
                                        FFAppState().update(() {});
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Login again to start Shift ',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor: Color(0x00000000),
                                          ),
                                        );
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      }
                                    } else {
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }

                                    if (_shouldSetState) setState(() {});
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '93l6u4so' /* Save */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 90.0,
                                    height: 50.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
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
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLargeFamily),
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    var _shouldSetState = false;
                                    if (getJsonField(
                                      FFAppState().shiftDetailsJson,
                                      r'''$.shiftExists''',
                                    )) {
                                      FFAppState().count =
                                          FFAppState().count + 1;
                                      setState(() {});
                                    } else {
                                      FFAppState().count =
                                          FFAppState().count + 1;
                                      setState(() {});
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
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    _shouldSetState = true;
                                    _model.outletdoc =
                                        await queryOutletRecordOnce(
                                      queryBuilder: (outletRecord) =>
                                          outletRecord.where(
                                        'id',
                                        isEqualTo: FFAppState().outletIdRef?.id,
                                      ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    _shouldSetState = true;
                                    if (FFAppState().PayMode == 'CREDIT') {
                                      if (FFAppState().setCustRef?.id != null &&
                                          FFAppState().setCustRef?.id != '') {
                                        if (FFAppState().oldBalance <
                                            FFAppState().custCredit) {
                                          _model.totalcredit =
                                              await actions.oldbalanceplusamt(
                                            FFAppState().oldBalance,
                                            FFAppState().finalAmt,
                                          );
                                          _shouldSetState = true;

                                          await FFAppState()
                                              .setCustRef!
                                              .update(createPartyRecordData(
                                                credit: true,
                                                oldBalance: 0,
                                                lastVisit: getCurrentTimestamp
                                                    .millisecondsSinceEpoch
                                                    .toString(),
                                              ));
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
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
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              content: Text('Select Customer '),
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
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      }
                                    }
                                    _model.hiveInvoiceData =
                                        await actions.addInvoiceBillhive(
                                      '',
                                      functions.genInvoiceNum(
                                          FFAppState().count,
                                          FFAppState().shiftCount),
                                      valueOrDefault<String>(
                                        FFAppState().setCustRef?.id,
                                        '0',
                                      ),
                                      functions
                                          .timestampToMili(getCurrentTimestamp),
                                      functions.getDayId(),
                                      'cash',
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
                                          await actions.calShiftSummaryNew(
                                        _model.hiveInvoiceData!,
                                        FFAppState().shiftDetailsJson,
                                      );
                                      _shouldSetState = true;
                                      FFAppState().updateShiftDetailsStruct(
                                        (e) => e
                                          ..billCount = valueOrDefault<int>(
                                            functions.lastBillCount(FFAppState()
                                                .shiftDetails
                                                .billCount),
                                            0,
                                          )
                                          ..totalSale = getJsonField(
                                            _model.shiftSummarResultsNew,
                                            r'''$.totalSale''',
                                          )
                                          ..deliveryCharges = getJsonField(
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
                                          ..hivekey =
                                              FFAppState().shiftDetails.hivekey
                                          ..newIDShift = FFAppState()
                                              .shiftDetails
                                              .newIDShift
                                          ..code =
                                              FFAppState().shiftDetails.code
                                          ..endTime =
                                              FFAppState().shiftDetails.endTime
                                          ..advanceAmtTotal = FFAppState()
                                              .shiftDetails
                                              .advanceAmtTotal
                                          ..customerReciveAmtTotal =
                                              FFAppState()
                                                  .shiftDetails
                                                  .customerReciveAmtTotal
                                          ..expensesAmtTotal = FFAppState()
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
                                          ..roundOff =
                                              FFAppState().shiftDetails.roundOff
                                          ..cashInHand = FFAppState()
                                              .shiftDetails
                                              .cashInHand
                                          ..startTime = FFAppState()
                                              .shiftDetails
                                              .startTime
                                          ..inActive =
                                              FFAppState().shiftDetails.inActive
                                          ..shiftNo =
                                              FFAppState().shiftDetails.shiftNo
                                          ..subTotalBill = FFAppState()
                                              .shiftDetails
                                              .subTotalBill
                                          ..version =
                                              FFAppState().shiftDetails.version
                                          ..userId =
                                              FFAppState().shiftDetails.userId
                                          ..deviceId =
                                              FFAppState().shiftDetails.deviceId
                                          ..synC =
                                              FFAppState().shiftDetails.synC
                                          ..id = FFAppState().shiftDetails.id,
                                      );
                                      setState(() {});
                                      _model.updatedShiftDetails =
                                          await actions.hiveShiftCrud(
                                        FFAppState().shiftDetails.newIDShift,
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor: Color(0x00000000),
                                        ),
                                      );
                                      if (_shouldSetState) setState(() {});
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
                                        FFAppState().allBillsList.toList(),
                                      );
                                      _shouldSetState = true;
                                      _model.device =
                                          await actions.newCustomAction(
                                        FFAppState().printerIndex,
                                      );
                                      _shouldSetState = true;
                                      await actions.printBillnewhive(
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
                                      FFAppState().update(() {});
                                      FFAppState().finalAmt = 0.0;
                                      FFAppState().billAmt = 0.0;
                                      FFAppState().count =
                                          _model.updatedShiftDetails!.billCount;
                                      FFAppState().groceryJson = null;
                                      FFAppState().update(() {});
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('printer connection'),
                                            content:
                                                Text('printer not connected'),
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
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }

                                    if (_shouldSetState) setState(() {});
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'yftp2ms2' /* Print */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 90.0,
                                    height: 50.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .headlineLargeFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLargeFamily),
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
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
      ),
    );
  }
}
