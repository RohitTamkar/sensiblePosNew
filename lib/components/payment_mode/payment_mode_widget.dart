import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_mode_model.dart';
export 'payment_mode_model.dart';

class PaymentModeWidget extends StatefulWidget {
  const PaymentModeWidget({super.key});

  @override
  State<PaymentModeWidget> createState() => _PaymentModeWidgetState();
}

class _PaymentModeWidgetState extends State<PaymentModeWidget> {
  late PaymentModeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentModeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<PaymentModeRecord>>(
      stream: queryPaymentModeRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: SpinKitFadingCircle(
                color: FlutterFlowTheme.of(context).primary,
                size: 40,
              ),
            ),
          );
        }
        List<PaymentModeRecord> dropDownPaymentModeRecordList = snapshot.data!;

        return FlutterFlowDropDown<String>(
          controller: _model.dropDownValueController ??=
              FormFieldController<String>(null),
          options: dropDownPaymentModeRecordList.map((e) => e.name).toList(),
          onChanged: (val) => safeSetState(() => _model.dropDownValue = val),
          width: 300,
          textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                color: FlutterFlowTheme.of(context).primaryBtnText,
                fontSize: 14,
                letterSpacing: 0.0,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
              ),
          hintText: FFLocalizations.of(context).getText(
            'itmkmxu3' /* Payment Mode */,
          ),
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: FlutterFlowTheme.of(context).primaryBtnText,
            size: 20,
          ),
          fillColor: Color(0xFF274287),
          elevation: 2,
          borderColor: Colors.transparent,
          borderWidth: 0,
          borderRadius: 8,
          margin: EdgeInsetsDirectional.fromSTEB(10, 0, 5, 0),
          hidesUnderline: true,
          isOverButton: true,
          isSearchable: false,
          isMultiSelect: false,
        );
      },
    );
  }
}
