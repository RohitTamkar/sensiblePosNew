import '/backend/backend.dart';
import '/components/exit_confirm/exit_confirm_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'grocery_header_model.dart';
export 'grocery_header_model.dart';

class GroceryHeaderWidget extends StatefulWidget {
  const GroceryHeaderWidget({
    super.key,
    this.shiftdetails,
    this.userref,
    this.taxdetails,
    this.appsettings,
    this.paymentmode,
  });

  final dynamic shiftdetails;
  final DocumentReference? userref;
  final List<TaxMasterRecord>? taxdetails;
  final AppSettingsRecord? appsettings;
  final List<PaymentModeRecord>? paymentmode;

  @override
  State<GroceryHeaderWidget> createState() => _GroceryHeaderWidgetState();
}

class _GroceryHeaderWidgetState extends State<GroceryHeaderWidget> {
  late GroceryHeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GroceryHeaderModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).customColor2,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: FFButtonWidget(
              onPressed: () {
                print('Button pressed ...');
              },
              text: FFLocalizations.of(context).getText(
                '9uyrkgzp' /* Masters */,
              ),
              icon: Icon(
                Icons.content_paste,
                size: 18,
              ),
              options: FFButtonOptions(
                height: 35,
                padding: EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                color: FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).labelLargeFamily),
                    ),
                elevation: 0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
            ),
          ),
          Expanded(
            child: FFButtonWidget(
              onPressed: () {
                print('Button pressed ...');
              },
              text: FFLocalizations.of(context).getText(
                'r94pmace' /* Purchase */,
              ),
              icon: Icon(
                Icons.shopping_cart,
                size: 18,
              ),
              options: FFButtonOptions(
                height: 35,
                padding: EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                color: FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).labelLargeFamily),
                    ),
                elevation: 0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
            ),
          ),
          Expanded(
            child: FFButtonWidget(
              onPressed: () async {
                context.pushNamed(
                  'BillingGroceryNew',
                  queryParameters: {
                    'shiftdetail': serializeParam(
                      widget!.shiftdetails,
                      ParamType.JSON,
                    ),
                    'taxDetails': serializeParam(
                      widget!.taxdetails,
                      ParamType.Document,
                      isList: true,
                    ),
                    'userref': serializeParam(
                      widget!.userref,
                      ParamType.DocumentReference,
                    ),
                    'paymentMode': serializeParam(
                      widget!.paymentmode,
                      ParamType.Document,
                      isList: true,
                    ),
                  }.withoutNulls,
                  extra: <String, dynamic>{
                    'taxDetails': widget!.taxdetails,
                    'paymentMode': widget!.paymentmode,
                  },
                );
              },
              text: FFLocalizations.of(context).getText(
                'qbrchsco' /* Sales */,
              ),
              icon: Icon(
                Icons.receipt_long_sharp,
                size: 18,
              ),
              options: FFButtonOptions(
                height: 35,
                padding: EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                color: FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).labelLargeFamily),
                    ),
                elevation: 0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
            ),
          ),
          Expanded(
            child: FFButtonWidget(
              onPressed: () async {
                context.pushNamed('CreditPaymentPage');
              },
              text: FFLocalizations.of(context).getText(
                'uirfxvxn' /* Payment */,
              ),
              icon: Icon(
                Icons.bar_chart,
                size: 18,
              ),
              options: FFButtonOptions(
                height: 35,
                padding: EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                color: FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).labelLargeFamily),
                    ),
                elevation: 0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
            ),
          ),
          Expanded(
            child: FFButtonWidget(
              onPressed: () {
                print('Button pressed ...');
              },
              text: FFLocalizations.of(context).getText(
                'jeup6rze' /* Shift */,
              ),
              icon: Icon(
                Icons.lock_clock,
                size: 18,
              ),
              options: FFButtonOptions(
                height: 35,
                padding: EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                color: FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).labelLargeFamily),
                    ),
                elevation: 0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
            ),
          ),
          Expanded(
            child: FFButtonWidget(
              onPressed: () async {
                context.pushNamed('printSettingkiosk');
              },
              text: FFLocalizations.of(context).getText(
                'u7ti7eko' /* Print Settings */,
              ),
              icon: Icon(
                Icons.print_rounded,
                size: 18,
              ),
              options: FFButtonOptions(
                height: 35,
                padding: EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                color: FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).labelLargeFamily),
                    ),
                elevation: 0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
            ),
          ),
          Expanded(
            child: FFButtonWidget(
              onPressed: () async {
                context.pushNamed('AppSettingNewPos');
              },
              text: FFLocalizations.of(context).getText(
                'h6cu660m' /* Settings */,
              ),
              icon: Icon(
                Icons.settings_sharp,
                size: 18,
              ),
              options: FFButtonOptions(
                height: 35,
                padding: EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                color: FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).labelLargeFamily),
                    ),
                elevation: 0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
            ),
          ),
          Expanded(
            child: FFButtonWidget(
              onPressed: () {
                print('Button pressed ...');
              },
              text: FFLocalizations.of(context).getText(
                'ptjuu1rn' /* Edit Bill */,
              ),
              icon: Icon(
                Icons.edit_square,
                size: 18,
              ),
              options: FFButtonOptions(
                height: 35,
                padding: EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                color: FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).labelLargeFamily),
                    ),
                elevation: 0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
            ),
          ),
          Expanded(
            child: FFButtonWidget(
              onPressed: () async {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  barrierColor: Color(0x00000000),
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: Container(
                        height: double.infinity,
                        child: ExitConfirmWidget(),
                      ),
                    );
                  },
                ).then((value) => safeSetState(() {}));
              },
              text: FFLocalizations.of(context).getText(
                'h66bkli9' /* Logout */,
              ),
              icon: Icon(
                Icons.power_settings_new,
                size: 18,
              ),
              options: FFButtonOptions(
                height: 35,
                padding: EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                color: FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).labelLargeFamily),
                    ),
                elevation: 0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
            ),
          ),
        ].divide(SizedBox(width: 2)),
      ),
    );
  }
}
