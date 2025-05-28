import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'alert_model.dart';
export 'alert_model.dart';

class AlertWidget extends StatefulWidget {
  const AlertWidget({super.key});

  @override
  State<AlertWidget> createState() => _AlertWidgetState();
}

class _AlertWidgetState extends State<AlertWidget> {
  late AlertModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AlertModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 3000));
      Navigator.pop(context);
    });

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
      width: 270.0,
      height: 200.0,
      decoration: BoxDecoration(
        color: Color(0xFFCBE5FF),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  'assets/images/Animation_-_1748409342500_(1).gif',
                  width: 130.0,
                  height: 130.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      '4gdislex' /* Coupon Code Applied Successful... */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).displayLarge.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).displayLargeFamily,
                          color: Color(0xFF000241),
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: !FlutterFlowTheme.of(context)
                              .displayLargeIsCustom,
                        ),
                  ),
                  Text(
                    'You Save ₹${FFAppState().disAmt.toString()}!',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).displayLarge.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).displayLargeFamily,
                          color: Color(0xFF000241),
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: !FlutterFlowTheme.of(context)
                              .displayLargeIsCustom,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
