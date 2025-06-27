import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'kotremark_model.dart';
export 'kotremark_model.dart';

class KotremarkWidget extends StatefulWidget {
  const KotremarkWidget({
    super.key,
    this.parameter1,
  });

  final dynamic parameter1;

  @override
  State<KotremarkWidget> createState() => _KotremarkWidgetState();
}

class _KotremarkWidgetState extends State<KotremarkWidget> {
  late KotremarkModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KotremarkModel());

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

    return FlutterFlowDropDown<String>(
      multiSelectController: _model.dropDownValueController ??=
          FormListFieldController<String>(
              _model.dropDownValue ??= List<String>.from(
        widget!.parameter1 ?? [],
      )),
      options: [
        FFLocalizations.of(context).getText(
          'v0zmkqql' /* Spicy  */,
        ),
        FFLocalizations.of(context).getText(
          'ro61i71w' /* Extra Spicy */,
        ),
        FFLocalizations.of(context).getText(
          'snpp58w5' /* Less Spicy */,
        ),
        FFLocalizations.of(context).getText(
          'ffwoyo2a' /* No Spice */,
        ),
        FFLocalizations.of(context).getText(
          '2nj2zpjf' /* Medium Spice */,
        ),
        FFLocalizations.of(context).getText(
          'adpjkb59' /* Cheesy */,
        ),
        FFLocalizations.of(context).getText(
          'd76farzo' /* Extra Cheese */,
        ),
        FFLocalizations.of(context).getText(
          '46589gik' /* Butter */,
        ),
        FFLocalizations.of(context).getText(
          'ac24onun' /* Extra Butter */,
        ),
        FFLocalizations.of(context).getText(
          'd8f1vb6g' /* Garlic */,
        ),
        FFLocalizations.of(context).getText(
          'nfhv1d0e' /* Extra Garlic */,
        ),
        FFLocalizations.of(context).getText(
          'ic95jwdv' /* Extra Onion */,
        ),
        FFLocalizations.of(context).getText(
          'mlzbjs0w' /* Crispy */,
        ),
        FFLocalizations.of(context).getText(
          '9n63m5c0' /* Soft */,
        ),
        FFLocalizations.of(context).getText(
          'xkhg1sqv' /* Less Oil */,
        ),
        FFLocalizations.of(context).getText(
          'b7tvul4k' /* No Oil */,
        ),
        FFLocalizations.of(context).getText(
          '598r49tk' /* Less Salt */,
        ),
        FFLocalizations.of(context).getText(
          'hhbxyyew' /* No Sugar */,
        )
      ],
      width: 150.0,
      height: 35.0,
      searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
            fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
            letterSpacing: 0.0,
            useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
          ),
      searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
            letterSpacing: 0.0,
            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
          ),
      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
            color: FlutterFlowTheme.of(context).primaryText,
            fontSize: 14.0,
            letterSpacing: 0.0,
            fontWeight: FontWeight.w600,
            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
          ),
      hintText: FFLocalizations.of(context).getText(
        '6au3cfpt' /* Select... */,
      ),
      searchHintText: FFLocalizations.of(context).getText(
        'ai1pk02g' /* Search... */,
      ),
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: FlutterFlowTheme.of(context).primaryText,
        size: 24.0,
      ),
      fillColor: Color(0xFBCEE7E9),
      elevation: 2.0,
      borderColor: FlutterFlowTheme.of(context).primary,
      borderWidth: 0.0,
      borderRadius: 8.0,
      margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
      hidesUnderline: true,
      isOverButton: false,
      isSearchable: true,
      isMultiSelect: true,
      onMultiSelectChanged: (val) async {
        safeSetState(() => _model.dropDownValue = val);
        await actions.updateItemTablekot(
          widget!.parameter1!,
          FFAppState().selBill,
          _model.dropDownValue!.toList(),
        );
      },
    );
  }
}
