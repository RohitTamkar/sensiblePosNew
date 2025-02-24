import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
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
              _model.resreplist23text = await actions.comboAddToHoldListprd(
                widget!.parameter1!,
                FFAppState().selBill,
                widget!.parameter2!.toList(),
                functions.enabletaxinclusive(widget!.parameter3!),
                valueOrDefault<double>(
                  double.tryParse(_model.textController.text),
                  0.0,
                ),
              );
              _model.calculateResultresctext =
                  await actions.laundrycalSubTotalForHoldList(
                FFAppState().selBill.toString(),
                _model.resreplist23text!.toList(),
              );
              _model.calbillAmt334text = await actions.calBillAmt(
                FFAppState().disAmt,
                FFAppState().delCharges,
              );

              safeSetState(() {});
            },
          ),
          autofocus: false,
          obscureText: false,
          decoration: InputDecoration(
            isDense: true,
            labelText: FFLocalizations.of(context).getText(
              'w6zqa6q2' /* Qty */,
            ),
            labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodyMediumFamily),
                ),
            hintText: FFLocalizations.of(context).getText(
              'pshrganl' /* Enter Manually */,
            ),
            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 10.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).labelMediumFamily),
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
                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
              ),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          cursorColor: FlutterFlowTheme.of(context).primaryText,
          validator: _model.textControllerValidator.asValidator(context),
        ),
      ),
    );
  }
}
