import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'transaction_status_model.dart';
export 'transaction_status_model.dart';

class TransactionStatusWidget extends StatefulWidget {
  const TransactionStatusWidget({
    super.key,
    this.char,
    this.doc,
  });

  final String? char;
  final QrTransactionsRecord? doc;

  @override
  State<TransactionStatusWidget> createState() =>
      _TransactionStatusWidgetState();
}

class _TransactionStatusWidgetState extends State<TransactionStatusWidget> {
  late TransactionStatusModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransactionStatusModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {});

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

    return Container(
      width: 450,
      height: 550,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).success,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        border: Border.all(
          color: FlutterFlowTheme.of(context).primaryBackground,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '1mz7d1fs' /* Receipt  */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineLarge.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).headlineLargeFamily,
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).headlineLargeFamily),
                      ),
                ),
              ),
              Text(
                valueOrDefault<String>(
                  widget!.doc?.orderId,
                  '-',
                ),
                style: FlutterFlowTheme.of(context).headlineLarge.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).headlineLargeFamily,
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).headlineLargeFamily),
                    ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: Image.asset(
                    'assets/images/TwitterVerifiedIconGIF-TwitterVerifiedIcon-DiscoverShareGIFs-ezgif.com-gif-maker.gif',
                    width: 300,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  '5ydnc68n' /* Payment 
Successful */
                  ,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).displayMedium.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).displayMediumFamily,
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      fontSize: 27,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).displayMediumFamily),
                    ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                ' ₹ ${valueOrDefault<String>(
                  FFAppState().kioskAmt.toString(),
                  '0',
                )}',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).headlineMediumFamily,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      fontSize: 30,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).headlineMediumFamily),
                    ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                valueOrDefault<String>(
                  widget!.char,
                  '-',
                ),
                style: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      fontSize: 24,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).labelLargeFamily),
                    ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  'fe19kwg5' /* Redirects Automatically */,
                ),
                style: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                      color: FlutterFlowTheme.of(context).primary,
                      fontSize: 16,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).labelLargeFamily),
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
