import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'kot_remark_model.dart';
export 'kot_remark_model.dart';

class KotRemarkWidget extends StatefulWidget {
  const KotRemarkWidget({
    super.key,
    required this.jsonObj,
  });

  final dynamic jsonObj;

  @override
  State<KotRemarkWidget> createState() => _KotRemarkWidgetState();
}

class _KotRemarkWidgetState extends State<KotRemarkWidget> {
  late KotRemarkModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KotRemarkModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 300.0,
          height: 200.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderWidth: 1.0,
                      icon: Icon(
                        Icons.close,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 20.0,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'pkelusir' /* Kot Remark */,
                        ),
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: FlutterFlowTheme.of(context)
                                  .headlineMediumFamily,
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .headlineMediumIsCustom,
                            ),
                      ),
                    ),
                    Icon(
                      Icons.dinner_dining_sharp,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await actions.updateItemTablekot(
                            widget!.jsonObj!,
                            FFAppState().selBill,
                            _model.dropDownValue!.toList(),
                          );
                          Navigator.pop(context);
                        },
                        text: FFLocalizations.of(context).getText(
                          '6hhdes1m' /* Add */,
                        ),
                        options: FFButtonOptions(
                          width: 120.0,
                          height: 30.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: Colors.white,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .titleSmallIsCustom,
                              ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlutterFlowDropDown<String>(
                      multiSelectController: _model.dropDownValueController ??=
                          FormListFieldController<String>(
                              _model.dropDownValue ??= List<String>.from(
                        (getJsonField(
                              widget!.jsonObj,
                              r'''$.kotRemark''',
                              true,
                            ) as List)
                                .map<String>((s) => s.toString())
                                .toList() ??
                            [],
                      )),
                      options: [
                        FFLocalizations.of(context).getText(
                          'dcc82gj6' /* Spicy  */,
                        ),
                        FFLocalizations.of(context).getText(
                          '4tpvee1g' /* Extra Spicy */,
                        ),
                        FFLocalizations.of(context).getText(
                          'zlulgumx' /* Less Spicy */,
                        ),
                        FFLocalizations.of(context).getText(
                          'amvzbq3r' /* No Spice */,
                        ),
                        FFLocalizations.of(context).getText(
                          'bab931xi' /* Medium Spice */,
                        ),
                        FFLocalizations.of(context).getText(
                          '708ms00n' /* Cheesy */,
                        ),
                        FFLocalizations.of(context).getText(
                          '6k008bxp' /* Extra Cheese */,
                        ),
                        FFLocalizations.of(context).getText(
                          'rkttagv2' /* Butter */,
                        ),
                        FFLocalizations.of(context).getText(
                          '5vu9vejo' /* Extra Butter */,
                        ),
                        FFLocalizations.of(context).getText(
                          'n04bb81q' /* Garlic */,
                        ),
                        FFLocalizations.of(context).getText(
                          'tf0kli32' /* Extra Garlic */,
                        ),
                        FFLocalizations.of(context).getText(
                          'v8ivjhcb' /* Extra Onion */,
                        ),
                        FFLocalizations.of(context).getText(
                          'vzuesy0p' /* Crispy */,
                        ),
                        FFLocalizations.of(context).getText(
                          'ktjdibp9' /* Soft */,
                        ),
                        FFLocalizations.of(context).getText(
                          'oj32in9l' /* Less Oil */,
                        ),
                        FFLocalizations.of(context).getText(
                          'w9jbhrzz' /* No Oil */,
                        ),
                        FFLocalizations.of(context).getText(
                          'mth7cbxn' /* Less Salt */,
                        ),
                        FFLocalizations.of(context).getText(
                          '31ilbjhp' /* No Sugar */,
                        )
                      ],
                      width: 250.0,
                      height: 40.0,
                      searchHintTextStyle: FlutterFlowTheme.of(context)
                          .labelMedium
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).labelMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .labelMediumIsCustom,
                          ),
                      searchTextStyle: FlutterFlowTheme.of(context)
                          .bodyMedium
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                      textStyle: FlutterFlowTheme.of(context)
                          .bodyMedium
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 17.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                      hintText: FFLocalizations.of(context).getText(
                        'clhb1dzf' /* Select... */,
                      ),
                      searchHintText: FFLocalizations.of(context).getText(
                        'sjmu0teh' /* Search... */,
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
                      margin:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      hidesUnderline: true,
                      isOverButton: false,
                      isSearchable: true,
                      isMultiSelect: true,
                      onMultiSelectChanged: (val) =>
                          safeSetState(() => _model.dropDownValue = val),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
