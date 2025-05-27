import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'xyzproduct_cart_model.dart';
export 'xyzproduct_cart_model.dart';

class XyzproductCartWidget extends StatefulWidget {
  const XyzproductCartWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
    this.parameter4,
    required this.parameter5,
    this.parameter6,
    this.parameter7,
    this.parameter8,
    this.parameter9,
    this.parameter10,
    this.parameter11,
    this.parameter12,
  });

  final dynamic parameter1;
  final dynamic parameter2;
  final dynamic parameter3;
  final ProductStructStruct? parameter4;
  final List<TaxMasterRecord>? parameter5;
  final bool? parameter6;
  final bool? parameter7;
  final dynamic parameter8;
  final dynamic parameter9;
  final dynamic parameter10;
  final dynamic parameter11;
  final dynamic parameter12;

  @override
  State<XyzproductCartWidget> createState() => _XyzproductCartWidgetState();
}

class _XyzproductCartWidgetState extends State<XyzproductCartWidget> {
  late XyzproductCartModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => XyzproductCartModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() {
        _model.productQtyTextController?.text = widget!.parameter8!.toString();
      });

      _model.updatePage(() {});
    });

    _model.productQtyTextController ??= TextEditingController();
    _model.productQtyFocusNode ??= FocusNode();

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
    context.watch<confetti_modualo_library_b75kfy_app_state.FFAppState>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 28,
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.265,
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                        child: Text(
                          widget!.parameter1!.toString().maybeHandleOverflow(
                                maxChars: 15,
                                replacement: '…',
                              ),
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .titleMediumIsCustom,
                              ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              '5gtk9t8c' /* ₹  */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelSmallFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .labelSmallIsCustom,
                                ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget!.parameter2?.toString(),
                              '0',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelSmallFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .labelSmallIsCustom,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 14,
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (false)
                        Expanded(
                          flex: 7,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.resultminus =
                                  await actions.addToHoldListprdminus(
                                widget!.parameter4!,
                                FFAppState().selBill,
                                widget!.parameter5!.toList(),
                                functions
                                    .enabletaxinclusive(widget!.parameter7!),
                              );
                              _model.resultmi =
                                  await actions.calSubTotalForHoldListminus(
                                FFAppState().selBill.toString(),
                                _model.resultminus!.toList(),
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
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
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
                        child: Stack(
                          children: [
                            if (_model.show)
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width: 200.0,
                                  child: TextFormField(
                                    controller: _model.productQtyTextController,
                                    focusNode: _model.productQtyFocusNode,
                                    onFieldSubmitted: (_) async {
                                      _model.custqty =
                                          await actions.laudryAddCustomQty(
                                        widget!.parameter4!,
                                        FFAppState().selBill,
                                        widget!.parameter5!.toList(),
                                        functions.enabletaxinclusive(
                                            widget!.parameter7!),
                                        double.tryParse(_model
                                            .productQtyTextController.text),
                                      );
                                      _model.calSubtotal = await actions
                                          .laundrycalSubTotalForHoldList(
                                        FFAppState().selBill.toString(),
                                        _model.custqty!.toList(),
                                      );
                                      _model.reuslt12CopyCopyCopy =
                                          await actions.calBillAmt(
                                        valueOrDefault<double>(
                                          FFAppState().disAmt,
                                          0.0,
                                        ),
                                        FFAppState().delCharges,
                                      );

                                      safeSetState(() {});
                                    },
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodySmallIsCustom,
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .labelMediumIsCustom,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .accent3,
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
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmallFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .headlineSmallIsCustom,
                                        ),
                                    textAlign: TextAlign.center,
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            decimal: true),
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    validator: _model
                                        .productQtyTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            if (!_model.show)
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    safeSetState(() {
                                      _model.productQtyTextController?.text =
                                          valueOrDefault<String>(
                                        widget!.parameter8?.toString(),
                                        '0',
                                      );
                                    });
                                    _model.show = true;
                                    safeSetState(() {});
                                  },
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget!.parameter8?.toString(),
                                      '0',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmallFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .headlineSmallIsCustom,
                                        ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      if (false)
                        Expanded(
                          flex: 7,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              var _shouldSetState = false;
                              if (widget!.parameter9!) {
                                if (!functions.greatethanlesskiosk(
                                    functions.jsontoint(widget!.parameter10),
                                    functions.jsontoint(widget!.parameter8))) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        content: Text('Item Out Of Stock !'),
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
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              }
                              _model.resultplus =
                                  await actions.addToHoldListprdplus(
                                widget!.parameter4!,
                                FFAppState().selBill,
                                widget!.parameter5!.toList(),
                                functions
                                    .enabletaxinclusive(widget!.parameter7!),
                              );
                              _shouldSetState = true;
                              _model.res13 =
                                  await actions.calSubTotalForHoldList(
                                FFAppState().selBill.toString(),
                                _model.resultplus!.toList(),
                              );
                              _shouldSetState = true;
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
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
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
            Expanded(
              flex: 9,
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.042,
                decoration: BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    functions
                        .getTotal(widget!.parameter11, widget!.parameter12)
                        .toString(),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelLargeFamily,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).labelLargeIsCustom,
                        ),
                  ),
                ),
              ),
            ),
          ].divide(SizedBox(width: 3.0)),
        ),
      ),
    );
  }
}
