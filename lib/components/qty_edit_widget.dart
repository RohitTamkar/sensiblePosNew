import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'qty_edit_model.dart';
export 'qty_edit_model.dart';

class QtyEditWidget extends StatefulWidget {
  const QtyEditWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
    this.parameter4,
    this.parameter5,
    required this.parameter6,
    this.parameter7,
  });

  final dynamic parameter1;
  final bool? parameter2;
  final dynamic parameter3;
  final dynamic parameter4;
  final ProductStructStruct? parameter5;
  final List<TaxMasterRecord>? parameter6;
  final bool? parameter7;

  @override
  State<QtyEditWidget> createState() => _QtyEditWidgetState();
}

class _QtyEditWidgetState extends State<QtyEditWidget> {
  late QtyEditModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QtyEditModel());

    _model.textFieldqty2TextController ??=
        TextEditingController(text: widget!.parameter1?.toString());
    _model.textFieldqty2FocusNode ??= FocusNode();

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

    return Stack(
      children: [
        if (!FFAppState().groceryshow)
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              safeSetState(() {
                _model.textFieldqty2TextController?.text =
                    widget!.parameter1!.toString();
              });
              FFAppState().groceryshow = true;
              safeSetState(() {});
            },
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget!.parameter1!.toString(),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodySmallFamily,
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 13.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).bodySmallIsCustom,
                      ),
                ),
              ],
            ),
          ),
        if (FFAppState().groceryshow)
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250.0,
                child: TextFormField(
                  controller: _model.textFieldqty2TextController,
                  focusNode: _model.textFieldqty2FocusNode,
                  onChanged: (_) => EasyDebounce.debounce(
                    '_model.textFieldqty2TextController',
                    Duration(milliseconds: 2000),
                    () async {
                      var _shouldSetState = false;
                      if (widget!.parameter3!) {
                        if (!functions.greatethanlesskiosk(
                            functions.jsontoint(widget!.parameter4),
                            valueOrDefault<int>(
                              int.tryParse(
                                  _model.textFieldqty2TextController.text),
                              0,
                            ))) {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                content: Text('Item Out Of Stock !'),
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
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        }
                      }
                      _model.resultqtyCopy = await actions.editCustomQty(
                        widget!.parameter5!,
                        FFAppState().selBill,
                        widget!.parameter6!.toList(),
                        functions.enabletaxinclusive(widget!.parameter7!),
                        double.tryParse(
                            _model.textFieldqty2TextController.text),
                        _model.textFieldqty2TextController.text,
                      );
                      _shouldSetState = true;
                      await actions.calSubTotalForHoldListkiosk(
                        FFAppState().selBill.toString(),
                        _model.resultqtyCopy!.toList(),
                        functions.enabletaxinclusive(widget!.parameter7!),
                      );
                      _model.reuslt1223Copy = await actions.calBillAmt(
                        valueOrDefault<double>(
                          FFAppState().disAmt,
                          0.0,
                        ),
                        FFAppState().delCharges,
                      );
                      _shouldSetState = true;
                      if (_shouldSetState) safeSetState(() {});
                    },
                  ),
                  onFieldSubmitted: (_) async {
                    var _shouldSetState = false;
                    if (widget!.parameter3!) {
                      if (!functions.greatethanlesskiosk(
                          functions.jsontoint(widget!.parameter4),
                          valueOrDefault<int>(
                            int.tryParse(
                                _model.textFieldqty2TextController.text),
                            0,
                          ))) {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              content: Text('Item Out Of Stock !'),
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
                        if (_shouldSetState) safeSetState(() {});
                        return;
                      }
                    }
                    _model.resultqty = await actions.editCustomQty(
                      widget!.parameter5!,
                      FFAppState().selBill,
                      widget!.parameter6!.toList(),
                      functions.enabletaxinclusive(widget!.parameter7!),
                      double.tryParse(_model.textFieldqty2TextController.text),
                      _model.textFieldqty2TextController.text,
                    );
                    _shouldSetState = true;
                    await actions.calSubTotalForHoldListkiosk(
                      FFAppState().selBill.toString(),
                      _model.resultqty!.toList(),
                      functions.enabletaxinclusive(widget!.parameter7!),
                    );
                    _model.reuslt1223 = await actions.calBillAmt(
                      valueOrDefault<double>(
                        FFAppState().disAmt,
                        0.0,
                      ),
                      FFAppState().delCharges,
                    );
                    _shouldSetState = true;
                    if (_shouldSetState) safeSetState(() {});
                  },
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    isDense: true,
                    labelStyle: FlutterFlowTheme.of(context)
                        .labelMedium
                        .override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).labelMediumIsCustom,
                        ),
                    hintText: FFLocalizations.of(context).getText(
                      'm2b1ibmn' /* Qty */,
                    ),
                    hintStyle: FlutterFlowTheme.of(context)
                        .labelMedium
                        .override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).labelMediumIsCustom,
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                      ),
                  textAlign: TextAlign.center,
                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                  validator: _model.textFieldqty2TextControllerValidator
                      .asValidator(context),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
