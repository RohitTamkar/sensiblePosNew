import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'dart:math' as math;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'kiosk_dine_parcel_copy_model.dart';
export 'kiosk_dine_parcel_copy_model.dart';

class KioskDineParcelCopyWidget extends StatefulWidget {
  const KioskDineParcelCopyWidget({
    super.key,
    this.userdoc,
    this.shiftdoc,
    this.appSetting,
    this.taxcollection,
  });

  final DocumentReference? userdoc;
  final dynamic shiftdoc;
  final AppSettingsRecord? appSetting;
  final List<TaxMasterRecord>? taxcollection;

  static String routeName = 'KioskDineParcelCopy';
  static String routePath = 'kioskDineParcelCopy';

  @override
  State<KioskDineParcelCopyWidget> createState() =>
      _KioskDineParcelCopyWidgetState();
}

class _KioskDineParcelCopyWidgetState extends State<KioskDineParcelCopyWidget>
    with TickerProviderStateMixin {
  late KioskDineParcelCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KioskDineParcelCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.footer = await queryFooterRecordOnce(
        parent: FFAppState().outletIdRef,
        singleRecord: true,
      ).then((s) => s.firstOrNull);
    });

    animationsMap.addAll({
      'iconOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.35, 1.35),
          ),
          TintEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            color: Color(0xFFFFDD42),
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.35, 1.35),
          ),
          TintEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            color: Color(0xFFFFDD42),
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'KioskDineParcelCopy',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: Color(0xFFF4ECE5),
              body: Transform.rotate(
                angle: 90.0 * (math.pi / 180),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      alignment: AlignmentDirectional(1.0, 0.0),
                      image: Image.asset(
                        'assets/images/Top_img_3.png',
                      ).image,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'gxg9qi0w' /* Choose Order Type  */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .displayLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .displayLargeFamily,
                                color: FlutterFlowTheme.of(context).info,
                                fontSize: 40.0,
                                letterSpacing: 5.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .displayLargeIsCustom,
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            FFAppState().orderType = 'DINE IN';
                            FFAppState().delCharges = 0.0;
                            safeSetState(() {});

                            context.pushNamed(
                              KioskBillScreenWidget.routeName,
                              queryParameters: {
                                'doc': serializeParam(
                                  widget!.userdoc,
                                  ParamType.DocumentReference,
                                ),
                                'shiftdoc': serializeParam(
                                  widget!.shiftdoc,
                                  ParamType.JSON,
                                ),
                                'appsetting': serializeParam(
                                  widget!.appSetting,
                                  ParamType.Document,
                                ),
                                'taxcollection': serializeParam(
                                  widget!.taxcollection,
                                  ParamType.Document,
                                  isList: true,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'appsetting': widget!.appSetting,
                                'taxcollection': widget!.taxcollection,
                              },
                            );
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.6,
                            height: MediaQuery.sizeOf(context).height * 0.15,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 12.0,
                                  color: Color(0x26000000),
                                  offset: Offset(
                                    9.0,
                                    9.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(60.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Icon(
                                      Icons.dinner_dining,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      size: 50.0,
                                    ).animateOnPageLoad(animationsMap[
                                        'iconOnPageLoadAnimation1']!),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'q75z02ms' /* Dine In */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .displayLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .displayLargeFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            fontSize: 36.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .displayLargeIsCustom,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (!valueOrDefault<bool>(
                        widget!.appSetting?.settingList
                            ?.where((e) => e.title == 'hideParcelButton')
                            .toList()
                            ?.firstOrNull
                            ?.value,
                        false,
                      ))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 50.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              FFAppState().orderType = 'PARCEL';
                              FFAppState().delCharges = valueOrDefault<double>(
                                _model.footer?.parcelCharges,
                                0.0,
                              );
                              safeSetState(() {});

                              context.pushNamed(
                                KioskBillScreenWidget.routeName,
                                queryParameters: {
                                  'doc': serializeParam(
                                    widget!.userdoc,
                                    ParamType.DocumentReference,
                                  ),
                                  'shiftdoc': serializeParam(
                                    widget!.shiftdoc,
                                    ParamType.JSON,
                                  ),
                                  'appsetting': serializeParam(
                                    widget!.appSetting,
                                    ParamType.Document,
                                  ),
                                  'taxcollection': serializeParam(
                                    widget!.taxcollection,
                                    ParamType.Document,
                                    isList: true,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'appsetting': widget!.appSetting,
                                  'taxcollection': widget!.taxcollection,
                                },
                              );
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.6,
                              height: MediaQuery.sizeOf(context).height * 0.15,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 12.0,
                                    color: Color(0x27000000),
                                    offset: Offset(
                                      9.0,
                                      9.0,
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(60.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Icon(
                                        Icons.takeout_dining_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        size: 45.0,
                                      ).animateOnPageLoad(animationsMap[
                                          'iconOnPageLoadAnimation2']!),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'p643wp20' /* Parcel */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .displayLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .displayLargeFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              fontSize: 36.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .displayLargeIsCustom,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
