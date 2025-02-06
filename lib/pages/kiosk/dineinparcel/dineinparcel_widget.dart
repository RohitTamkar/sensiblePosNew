import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dineinparcel_model.dart';
export 'dineinparcel_model.dart';

class DineinparcelWidget extends StatefulWidget {
  const DineinparcelWidget({
    super.key,
    this.ordertype,
    this.inclusivetax,
    this.qtywiseparcel,
    this.parcelcharges,
  });

  final dynamic ordertype;
  final bool? inclusivetax;
  final bool? qtywiseparcel;
  final double? parcelcharges;

  @override
  State<DineinparcelWidget> createState() => _DineinparcelWidgetState();
}

class _DineinparcelWidgetState extends State<DineinparcelWidget> {
  late DineinparcelModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DineinparcelModel());

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

    return Visibility(
      visible: widget!.ordertype != null,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            FlutterFlowChoiceChips(
              options: [
                ChipData(FFLocalizations.of(context).getText(
                  'tx0so1hb' /* DINE IN */,
                )),
                ChipData(FFLocalizations.of(context).getText(
                  '5sxaj5ub' /* PARCEL */,
                ))
              ],
              onChanged: (val) async {
                safeSetState(() => _model.choiceChipsValue = val?.firstOrNull);
                FFAppState().orderType = _model.choiceChipsValue!;
                safeSetState(() {});
                if ('PARCEL' == widget!.ordertype?.toString()) {
                  FFAppState().delCharges = widget!.parcelcharges!;
                  safeSetState(() {});
                  _model.ddr4orde = await actions.calSubTotalForHoldListkiosk2(
                    FFAppState().selBill.toString(),
                    FFAppState().allBillsList.toList(),
                    functions.enabletaxinclusive(widget!.inclusivetax!),
                    widget!.qtywiseparcel!,
                  );
                  _model.reusltddrorder = await actions.calBillAmt2(
                    valueOrDefault<double>(
                      FFAppState().disAmt,
                      0.0,
                    ),
                    FFAppState().delCharges,
                    widget!.qtywiseparcel!,
                  );
                } else {
                  FFAppState().orderType = _model.choiceChipsValue!;
                  FFAppState().delCharges = 0.0;
                  safeSetState(() {});
                  _model.ddr45order =
                      await actions.calSubTotalForHoldListkiosk2(
                    FFAppState().selBill.toString(),
                    FFAppState().allBillsList.toList(),
                    functions.enabletaxinclusive(widget!.inclusivetax!),
                    widget!.qtywiseparcel!,
                  );
                  _model.reusltddr67orde = await actions.calBillAmt2(
                    valueOrDefault<double>(
                      FFAppState().disAmt,
                      0.0,
                    ),
                    FFAppState().delCharges,
                    widget!.qtywiseparcel!,
                  );
                }

                safeSetState(() {});
              },
              selectedChipStyle: ChipStyle(
                backgroundColor: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      fontSize: 30.0,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
                iconColor: FlutterFlowTheme.of(context).info,
                iconSize: 16.0,
                elevation: 0.0,
                borderRadius: BorderRadius.circular(8.0),
              ),
              unselectedChipStyle: ChipStyle(
                backgroundColor: Color(0xFFD7D4E8),
                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
                iconColor: FlutterFlowTheme.of(context).secondaryText,
                iconSize: 16.0,
                elevation: 0.0,
                borderRadius: BorderRadius.circular(8.0),
              ),
              chipSpacing: 20.0,
              rowSpacing: 8.0,
              multiselect: false,
              initialized: _model.choiceChipsValue != null,
              alignment: WrapAlignment.start,
              controller: _model.choiceChipsValueController ??=
                  FormFieldController<List<String>>(
                [widget!.ordertype!.toString()],
              ),
              wrapped: false,
            ),
          ],
        ),
      ),
    );
  }
}
