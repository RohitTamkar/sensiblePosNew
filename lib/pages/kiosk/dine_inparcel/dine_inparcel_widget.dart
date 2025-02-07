import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dine_inparcel_model.dart';
export 'dine_inparcel_model.dart';

class DineInparcelWidget extends StatefulWidget {
  const DineInparcelWidget({
    super.key,
    this.parameter2,
    this.parameter3,
    this.parameter4,
    this.parameter5,
  });

  final bool? parameter2;
  final bool? parameter3;
  final dynamic parameter4;
  final double? parameter5;

  @override
  State<DineInparcelWidget> createState() => _DineInparcelWidgetState();
}

class _DineInparcelWidgetState extends State<DineInparcelWidget> {
  late DineInparcelModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DineInparcelModel());

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

    return FlutterFlowChoiceChips(
      options: [
        ChipData(FFLocalizations.of(context).getText(
          '2xviwxya' /* DINE IN */,
        )),
        ChipData(FFLocalizations.of(context).getText(
          'cw9x8dee' /* PARCEL */,
        ))
      ],
      onChanged: (val) async {
        safeSetState(() => _model.choiceChipsValue = val?.firstOrNull);
        FFAppState().orderType = _model.choiceChipsValue!;
        safeSetState(() {});
        if ('PARCEL' == widget!.parameter4?.toString()) {
          FFAppState().delCharges = widget!.parameter5!;
          safeSetState(() {});
          _model.ddr4Copy = await actions.calSubTotalForHoldListkiosk2(
            FFAppState().selBill.toString(),
            FFAppState().allBillsList.toList(),
            functions.enabletaxinclusive(widget!.parameter2!),
            widget!.parameter3!,
          );
          _model.reusltddrCopy = await actions.calBillAmt2(
            valueOrDefault<double>(
              FFAppState().disAmt,
              0.0,
            ),
            FFAppState().delCharges,
            widget!.parameter3!,
          );
        } else {
          FFAppState().orderType = _model.choiceChipsValue!;
          FFAppState().delCharges = 0.0;
          safeSetState(() {});
          _model.ddr45Copy = await actions.calSubTotalForHoldListkiosk2(
            FFAppState().selBill.toString(),
            FFAppState().allBillsList.toList(),
            functions.enabletaxinclusive(widget!.parameter2!),
            widget!.parameter3!,
          );
          _model.reusltddr67Copy = await actions.calBillAmt2(
            valueOrDefault<double>(
              FFAppState().disAmt,
              0.0,
            ),
            FFAppState().delCharges,
            widget!.parameter3!,
          );
        }

        safeSetState(() {});
      },
      selectedChipStyle: ChipStyle(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
              color: FlutterFlowTheme.of(context).primaryBackground,
              letterSpacing: 0.0,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
            ),
        iconColor: FlutterFlowTheme.of(context).secondaryBackground,
        iconSize: 16.0,
        elevation: 0.0,
        borderRadius: BorderRadius.circular(8.0),
      ),
      unselectedChipStyle: ChipStyle(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
              color: FlutterFlowTheme.of(context).secondaryText,
              letterSpacing: 0.0,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
            ),
        iconColor: FlutterFlowTheme.of(context).primaryText,
        iconSize: 16.0,
        elevation: 0.0,
        borderRadius: BorderRadius.circular(8.0),
      ),
      chipSpacing: 8.0,
      rowSpacing: 8.0,
      multiselect: false,
      initialized: _model.choiceChipsValue != null,
      alignment: WrapAlignment.start,
      controller: _model.choiceChipsValueController ??=
          FormFieldController<List<String>>(
        [
          getJsonField(
            widget!.parameter4,
            r'''$''',
          ).toString()
        ],
      ),
      wrapped: true,
    );
  }
}
