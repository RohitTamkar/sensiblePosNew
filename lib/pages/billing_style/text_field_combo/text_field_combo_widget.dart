import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/stock_confirm/stock_confirm_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'text_field_combo_model.dart';
export 'text_field_combo_model.dart';

class TextFieldComboWidget extends StatefulWidget {
  const TextFieldComboWidget({
    super.key,
    this.parameter1,
    required this.parameter2,
    this.parameter3,
  });

  final ProductStructStruct? parameter1;
  final List<TaxMasterRecord>? parameter2;
  final bool? parameter3;

  @override
  State<TextFieldComboWidget> createState() => _TextFieldComboWidgetState();
}

class _TextFieldComboWidgetState extends State<TextFieldComboWidget> {
  late TextFieldComboModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextFieldComboModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(
      () async {},
    );
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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
      child: Container(
        width: 200.0,
        child: TextFormField(
          controller: _model.textController,
          focusNode: _model.textFieldFocusNode,
          onChanged: (_) => EasyDebounce.debounce(
            '_model.textController',
            Duration(milliseconds: 2000),
            () async {
              var _shouldSetState = false;
              if (widget!.parameter1!.stockable) {
                if (widget!.parameter1!.stock > 0) {
                  if (widget!.parameter1!.stock >=
                      valueOrDefault<int>(
                        functions.doubleToInt(
                            double.parse(_model.textController.text) +
                                valueOrDefault<double>(
                                  getJsonField(
                                    functions
                                        .filterBillList(FFAppState().selBill,
                                            FFAppState().allBillsList.toList())
                                        .where((e) =>
                                            widget!.parameter1?.id ==
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
                                )),
                        0,
                      )) {
                    if (FFAppState().holdBillCount == 0) {
                      FFAppState().holdBillCount =
                          FFAppState().holdBillCount + 1;
                      FFAppState().addToAllBillsList(
                          functions.generateBillDetailsJson(
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
                      FFAppState().selBill = 1;
                      safeSetState(() {});
                    }
                    _model.resreplist23textstock6 =
                        await actions.comboAddToHoldListprd(
                      widget!.parameter1!,
                      FFAppState().selBill,
                      widget!.parameter2!.toList(),
                      functions.enabletaxinclusive(widget!.parameter3!),
                      valueOrDefault<double>(
                        double.tryParse(_model.textController.text),
                        0.0,
                      ),
                    );
                    _shouldSetState = true;
                    _model.resrepliststock16 =
                        await actions.laundrycalSubTotalForHoldList(
                      FFAppState().selBill.toString(),
                      _model.resreplist23textstock6!.toList(),
                    );
                    _shouldSetState = true;
                    _model.calbillAmt33stock6 = await actions.calBillAmt(
                      FFAppState().disAmt,
                      FFAppState().delCharges,
                    );
                    _shouldSetState = true;

                    FFAppState().update(() {});
                    safeSetState(() {
                      _model.textController?.clear();
                    });
                  } else {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: StockConfirmWidget(),
                        );
                      },
                    ).then((value) => safeSetState(() {}));

                    if (_shouldSetState) safeSetState(() {});
                    return;
                  }
                } else {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: StockConfirmWidget(),
                      );
                    },
                  ).then((value) => safeSetState(() {}));

                  if (_shouldSetState) safeSetState(() {});
                  return;
                }
              } else {
                if (_model.textController.text != null &&
                    _model.textController.text != '') {
                  if (FFAppState().holdBillCount == 0) {
                    FFAppState().holdBillCount = FFAppState().holdBillCount + 1;
                    FFAppState().addToAllBillsList(
                        functions.generateBillDetailsJson(
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
                    FFAppState().selBill = 1;
                    safeSetState(() {});
                  }
                  _model.resreplist23textstock7 =
                      await actions.comboAddToHoldListprd(
                    widget!.parameter1!,
                    FFAppState().selBill,
                    widget!.parameter2!.toList(),
                    functions.enabletaxinclusive(widget!.parameter3!),
                    valueOrDefault<double>(
                      double.tryParse(_model.textController.text),
                      0.0,
                    ),
                  );
                  _shouldSetState = true;
                  _model.resrepliststock7 =
                      await actions.laundrycalSubTotalForHoldList(
                    FFAppState().selBill.toString(),
                    _model.resreplist23textstock7!.toList(),
                  );
                  _shouldSetState = true;
                  _model.calbillAmt33stock7 = await actions.calBillAmt(
                    FFAppState().disAmt,
                    FFAppState().delCharges,
                  );
                  _shouldSetState = true;

                  FFAppState().update(() {});
                  safeSetState(() {
                    _model.textController?.clear();
                  });
                }
              }

              if (_shouldSetState) safeSetState(() {});
            },
          ),
          onFieldSubmitted: (_) async {
            var _shouldSetState = false;
            if (widget!.parameter1!.stockable) {
              if (widget!.parameter1!.stock > 0) {
                if (widget!.parameter1!.stock >=
                    valueOrDefault<int>(
                      functions.doubleToInt(
                          double.parse(_model.textController.text) +
                              valueOrDefault<double>(
                                getJsonField(
                                  functions
                                      .filterBillList(FFAppState().selBill,
                                          FFAppState().allBillsList.toList())
                                      .where((e) =>
                                          widget!.parameter1?.id ==
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
                              )),
                      0,
                    )) {
                  if (FFAppState().holdBillCount == 0) {
                    FFAppState().holdBillCount = FFAppState().holdBillCount + 1;
                    FFAppState().addToAllBillsList(
                        functions.generateBillDetailsJson(
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
                    FFAppState().selBill = 1;
                    safeSetState(() {});
                  }
                  _model.resreplist23textstock1 =
                      await actions.comboAddToHoldListprd(
                    widget!.parameter1!,
                    FFAppState().selBill,
                    widget!.parameter2!.toList(),
                    functions.enabletaxinclusive(widget!.parameter3!),
                    valueOrDefault<double>(
                      double.tryParse(_model.textController.text),
                      0.0,
                    ),
                  );
                  _shouldSetState = true;
                  _model.resrepliststock1 =
                      await actions.laundrycalSubTotalForHoldList(
                    FFAppState().selBill.toString(),
                    _model.resreplist23textstock1!.toList(),
                  );
                  _shouldSetState = true;
                  _model.calbillAmt33stock1 = await actions.calBillAmt(
                    FFAppState().disAmt,
                    FFAppState().delCharges,
                  );
                  _shouldSetState = true;

                  FFAppState().update(() {});
                  safeSetState(() {
                    _model.textController?.clear();
                  });
                } else {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: StockConfirmWidget(),
                      );
                    },
                  ).then((value) => safeSetState(() {}));

                  if (_shouldSetState) safeSetState(() {});
                  return;
                }
              } else {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: StockConfirmWidget(),
                    );
                  },
                ).then((value) => safeSetState(() {}));

                if (_shouldSetState) safeSetState(() {});
                return;
              }
            } else {
              if (_model.textController.text != null &&
                  _model.textController.text != '') {
                if (FFAppState().holdBillCount == 0) {
                  FFAppState().holdBillCount = FFAppState().holdBillCount + 1;
                  FFAppState().addToAllBillsList(
                      functions.generateBillDetailsJson(
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
                  FFAppState().selBill = 1;
                  safeSetState(() {});
                }
                _model.resreplist23textstock2 =
                    await actions.comboAddToHoldListprd(
                  widget!.parameter1!,
                  FFAppState().selBill,
                  widget!.parameter2!.toList(),
                  functions.enabletaxinclusive(widget!.parameter3!),
                  valueOrDefault<double>(
                    double.tryParse(_model.textController.text),
                    0.0,
                  ),
                );
                _shouldSetState = true;
                _model.resrepliststock2 =
                    await actions.laundrycalSubTotalForHoldList(
                  FFAppState().selBill.toString(),
                  _model.resreplist23textstock2!.toList(),
                );
                _shouldSetState = true;
                _model.calbillAmt33stock2 = await actions.calBillAmt(
                  FFAppState().disAmt,
                  FFAppState().delCharges,
                );
                _shouldSetState = true;

                FFAppState().update(() {});
                safeSetState(() {
                  _model.textController?.clear();
                });
              }
            }

            if (_shouldSetState) safeSetState(() {});
          },
          autofocus: false,
          obscureText: false,
          decoration: InputDecoration(
            isDense: true,
            labelText: FFLocalizations.of(context).getText(
              'w6zqa6q2' /* Qty */,
            ),
            labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: FlutterFlowTheme.of(context).bodyMedium,
                  letterSpacing: 0.0,
                ),
            hintText: FFLocalizations.of(context).getText(
              'pshrganl' /* Enter Manually */,
            ),
            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                  font: FlutterFlowTheme.of(context).labelMedium,
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 10.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).primary,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0x00000000),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            fillColor: FlutterFlowTheme.of(context).primaryBackground,
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: FlutterFlowTheme.of(context).bodyMedium,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
              ),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          cursorColor: FlutterFlowTheme.of(context).primaryText,
          validator: _model.textControllerValidator.asValidator(context),
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
        ),
      ),
    );
  }
}
