import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'raw_material_model.dart';
export 'raw_material_model.dart';

class RawMaterialWidget extends StatefulWidget {
  const RawMaterialWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.index,
    this.listrawmaterial,
  });

  final List<String>? parameter1;
  final RecipeItemListStruct? parameter2;
  final int? index;
  final List<String>? listrawmaterial;

  @override
  State<RawMaterialWidget> createState() => _RawMaterialWidgetState();
}

class _RawMaterialWidgetState extends State<RawMaterialWidget> {
  late RawMaterialModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RawMaterialModel());

    _model.textController1 ??=
        TextEditingController(text: widget!.parameter2?.quantity?.toString());
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??=
        TextEditingController(text: widget!.parameter2?.note);
    _model.textFieldFocusNode2 ??= FocusNode();

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
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 5,
              child: FlutterFlowDropDown<String>(
                controller: _model.dropDownValueController1 ??=
                    FormFieldController<String>(
                  _model.dropDownValue1 ??= widget!.parameter2?.name,
                ),
                options: widget!.listrawmaterial!,
                onChanged: (val) async {
                  safeSetState(() => _model.dropDownValue1 = val);
                  _model.prodoc = await queryProductRecordOnce(
                    parent: FFAppState().outletIdRef,
                    queryBuilder: (productRecord) => productRecord.where(
                      'name',
                      isEqualTo: _model.dropDownValue1,
                    ),
                    singleRecord: true,
                  ).then((s) => s.firstOrNull);
                  FFAppState().updateRecipeItemListAtIndex(
                    widget!.index!,
                    (e) => e
                      ..name = _model.dropDownValue1
                      ..quantity = double.tryParse(_model.textController1.text)
                      ..id = _model.prodoc?.id
                      ..catId = _model.prodoc?.categoryRef?.id
                      ..currentStock = _model.prodoc?.currentStock,
                  );
                  FFAppState().update(() {});

                  safeSetState(() {});
                },
                width: 200.0,
                height: 45.0,
                searchHintTextStyle:
                    FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).labelMediumFamily),
                        ),
                searchTextStyle: FlutterFlowTheme.of(context)
                    .bodyMedium
                    .override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
                textStyle: FlutterFlowTheme.of(context).labelSmall.override(
                      fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).labelSmallFamily),
                    ),
                hintText: FFLocalizations.of(context).getText(
                  'rng3om3v' /* Select... */,
                ),
                searchHintText: FFLocalizations.of(context).getText(
                  'lsio1b6n' /* Search... */,
                ),
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                elevation: 2.0,
                borderColor: Colors.transparent,
                borderWidth: 0.0,
                borderRadius: 8.0,
                margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                hidesUnderline: true,
                isOverButton: false,
                isSearchable: true,
                isMultiSelect: false,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: 200.0,
                child: TextFormField(
                  controller: _model.textController1,
                  focusNode: _model.textFieldFocusNode1,
                  onChanged: (_) => EasyDebounce.debounce(
                    '_model.textController1',
                    Duration(milliseconds: 2000),
                    () async {
                      FFAppState().updateRecipeItemListAtIndex(
                        widget!.index!,
                        (e) => e
                          ..name = _model.dropDownValue1
                          ..price = widget!.parameter2?.price
                          ..quantity =
                              double.tryParse(_model.textController1.text),
                      );
                      FFAppState().update(() {});
                    },
                  ),
                  onFieldSubmitted: (_) async {
                    FFAppState().updateRecipeItemListAtIndex(
                      widget!.index!,
                      (e) => e
                        ..name = _model.dropDownValue1
                        ..price = widget!.parameter2?.price
                        ..quantity =
                            double.tryParse(_model.textController1.text),
                    );
                    FFAppState().update(() {});
                  },
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    isDense: true,
                    labelStyle: FlutterFlowTheme.of(context)
                        .labelSmall
                        .override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelSmallFamily,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).labelSmallFamily),
                        ),
                    hintText: FFLocalizations.of(context).getText(
                      'j21owfob' /* TextField */,
                    ),
                    hintStyle: FlutterFlowTheme.of(context).labelSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelSmallFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).labelSmallFamily),
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).customColor2,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).labelSmallFamily,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).labelSmallFamily),
                      ),
                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                  validator:
                      _model.textController1Validator.asValidator(context),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: FlutterFlowDropDown<String>(
                controller: _model.dropDownValueController2 ??=
                    FormFieldController<String>(
                  _model.dropDownValue2 ??= widget!.parameter2?.unit,
                ),
                options: widget!.parameter1!,
                onChanged: (val) async {
                  safeSetState(() => _model.dropDownValue2 = val);
                  FFAppState().updateRecipeItemListAtIndex(
                    widget!.index!,
                    (e) => e
                      ..name = _model.dropDownValue1
                      ..price = widget!.parameter2?.price
                      ..quantity = double.tryParse(_model.textController1.text)
                      ..unit = _model.dropDownValue2,
                  );
                  FFAppState().update(() {});
                },
                width: 200.0,
                height: 45.0,
                searchHintTextStyle:
                    FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).labelMediumFamily),
                        ),
                searchTextStyle: FlutterFlowTheme.of(context)
                    .bodyMedium
                    .override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
                textStyle: FlutterFlowTheme.of(context).labelSmall.override(
                      fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).labelSmallFamily),
                    ),
                hintText: FFLocalizations.of(context).getText(
                  'ymr652kj' /* Select... */,
                ),
                searchHintText: FFLocalizations.of(context).getText(
                  'su7q7p5w' /* Search... */,
                ),
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                elevation: 2.0,
                borderColor: Colors.transparent,
                borderWidth: 0.0,
                borderRadius: 8.0,
                margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                hidesUnderline: true,
                isOverButton: false,
                isSearchable: true,
                isMultiSelect: false,
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                width: 200.0,
                child: TextFormField(
                  controller: _model.textController2,
                  focusNode: _model.textFieldFocusNode2,
                  onChanged: (_) => EasyDebounce.debounce(
                    '_model.textController2',
                    Duration(milliseconds: 2000),
                    () async {
                      FFAppState().updateRecipeItemListAtIndex(
                        widget!.index!,
                        (e) => e
                          ..name = _model.dropDownValue1
                          ..price = widget!.parameter2?.price
                          ..quantity =
                              double.tryParse(_model.textController1.text),
                      );
                      FFAppState().update(() {});
                    },
                  ),
                  onFieldSubmitted: (_) async {
                    FFAppState().updateRecipeItemListAtIndex(
                      widget!.index!,
                      (e) => e
                        ..name = _model.dropDownValue1
                        ..price = widget!.parameter2?.price
                        ..quantity =
                            double.tryParse(_model.textController1.text),
                    );
                    FFAppState().update(() {});
                  },
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    isDense: true,
                    labelStyle: FlutterFlowTheme.of(context)
                        .labelSmall
                        .override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelSmallFamily,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).labelSmallFamily),
                        ),
                    hintText: FFLocalizations.of(context).getText(
                      'igxfr4ar' /* TextField */,
                    ),
                    hintStyle: FlutterFlowTheme.of(context)
                        .labelMedium
                        .override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).labelMediumFamily),
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).customColor2,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).labelSmallFamily,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).labelSmallFamily),
                      ),
                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                  validator:
                      _model.textController2Validator.asValidator(context),
                ),
              ),
            ),
          ].divide(SizedBox(width: 10.0)),
        ),
      ),
    );
  }
}
