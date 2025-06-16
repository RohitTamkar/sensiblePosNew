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
import 'dine_inparcelkds_model.dart';
export 'dine_inparcelkds_model.dart';

class DineInparcelkdsWidget extends StatefulWidget {
  const DineInparcelkdsWidget({
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
  State<DineInparcelkdsWidget> createState() => _DineInparcelkdsWidgetState();
}

class _DineInparcelkdsWidgetState extends State<DineInparcelkdsWidget> {
  late DineInparcelkdsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DineInparcelkdsModel());

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
          '28wvidem' /* DINE IN */,
        )),
        ChipData(FFLocalizations.of(context).getText(
          'bd6c6j0v' /* PARCEL */,
        ))
      ],
      onChanged: (val) async {
        safeSetState(() => _model.choiceChipsValue = val?.firstOrNull);
        if ('PARCEL' == _model.choiceChipsValue) {
          FFAppState().delCharges = widget!.parameter5!;
          _model.updatePage(() {});
          await actions.dineinparcelparcel(
            FFAppState().selBill.toString(),
            FFAppState().allBillsList.toList(),
            functions.enabletaxinclusive(widget!.parameter2!),
            widget!.parameter3!,
            _model.choiceChipsValue!,
            getJsonField(
              widget!.parameter4,
              r'''$''',
            ),
          );
        } else {
          await actions.dineinparcelparcel(
            FFAppState().selBill.toString(),
            FFAppState().allBillsList.toList(),
            functions.enabletaxinclusive(widget!.parameter2!),
            widget!.parameter3!,
            _model.choiceChipsValue!,
            getJsonField(
              widget!.parameter4,
              r'''$''',
            ),
          );
        }

        _model.updatePage(() {});
      },
      selectedChipStyle: ChipStyle(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        textStyle: FlutterFlowTheme.of(context).labelLarge.override(
              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
              color: FlutterFlowTheme.of(context).secondaryBackground,
              fontSize: 12.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w600,
              useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
            ),
        iconColor: FlutterFlowTheme.of(context).secondaryBackground,
        iconSize: 12.0,
        elevation: 0.0,
        borderRadius: BorderRadius.circular(8.0),
      ),
      unselectedChipStyle: ChipStyle(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        textStyle: FlutterFlowTheme.of(context).labelSmall.override(
              fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
              letterSpacing: 0.0,
              useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
            ),
        iconColor: FlutterFlowTheme.of(context).primaryText,
        iconSize: 12.0,
        elevation: 0.0,
        borderColor: FlutterFlowTheme.of(context).accent2,
        borderWidth: 0.5,
        borderRadius: BorderRadius.circular(8.0),
      ),
      chipSpacing: 7.0,
      rowSpacing: 7.0,
      multiselect: false,
      initialized: _model.choiceChipsValue != null,
      alignment: WrapAlignment.start,
      controller: _model.choiceChipsValueController ??=
          FormFieldController<List<String>>(
        [
          getJsonField(
            widget!.parameter4,
            r'''$.ordertype''',
          ).toString()
        ],
      ),
      wrapped: true,
    );
  }
}
