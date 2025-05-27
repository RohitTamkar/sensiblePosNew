import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'barcodefield_model.dart';
export 'barcodefield_model.dart';

class BarcodefieldWidget extends StatefulWidget {
  const BarcodefieldWidget({
    super.key,
    this.parameter2,
    this.parameter3,
    this.parameter4,
    this.unitList,
    this.jsonitem,
  });

  final ProductStructStruct? parameter2;
  final List<TaxMasterRecord>? parameter3;
  final bool? parameter4;
  final List<UnitTypeRecord>? unitList;
  final dynamic jsonitem;

  @override
  State<BarcodefieldWidget> createState() => _BarcodefieldWidgetState();
}

class _BarcodefieldWidgetState extends State<BarcodefieldWidget> {
  late BarcodefieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BarcodefieldModel());

    _model.textFieldqtTextController ??= TextEditingController(
        text: getJsonField(
      widget!.jsonitem,
      r'''$.quantity''',
    ).toString().toString());
    _model.textFieldqtFocusNode ??= FocusNode();
    _model.textFieldqtFocusNode!.addListener(() => safeSetState(() {}));
    _model.textFieldunitTextController ??= TextEditingController(
        text: getJsonField(
      widget!.jsonitem,
      r'''$.unit''',
    ).toString().toString());
    _model.textFieldunitFocusNode ??= FocusNode();

    _model.textFieldrateTextController ??= TextEditingController(
        text: getJsonField(
      widget!.jsonitem,
      r'''$.price''',
    ).toString().toString());
    _model.textFieldrateFocusNode ??= FocusNode();

    _model.textFieldmrprateTextController ??= TextEditingController(
        text: getJsonField(
      widget!.jsonitem,
      r'''$.mrpPrice''',
    ).toString().toString());
    _model.textFieldmrprateFocusNode ??= FocusNode();

    _model.textFieldmfgdateTextController ??= TextEditingController(
        text: getJsonField(
      widget!.jsonitem,
      r'''$.mfgDate''',
    ).toString().toString());
    _model.textFieldmfgdateFocusNode ??= FocusNode();

    _model.textFieldexpdateTextController ??= TextEditingController(
        text: getJsonField(
      widget!.jsonitem,
      r'''$.expDate''',
    ).toString().toString());
    _model.textFieldexpdateFocusNode ??= FocusNode();

    _model.textFieldbarchNoTextController ??= TextEditingController(
        text: getJsonField(
      widget!.jsonitem,
      r'''$.batchNo''',
    ).toString().toString());
    _model.textFieldbarchNoFocusNode ??= FocusNode();

    _model.textFieldnetWtTextController ??= TextEditingController(
        text: getJsonField(
      widget!.jsonitem,
      r'''$.netWt''',
    ).toString().toString());
    _model.textFieldnetWtFocusNode ??= FocusNode();

    _model.textFieldingrdTextController ??= TextEditingController(
        text: getJsonField(
      widget!.jsonitem,
      r'''$.ingredient''',
    ).toString().toString());
    _model.textFieldingrdFocusNode ??= FocusNode();

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

    return Stack(
      children: [
        if (FFAppState().groceryshow)
          Container(
            width: 1440.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  getJsonField(
                                    widget!.jsonitem,
                                    r'''$.srno''',
                                  ).toString(),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelSmallFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .labelSmallIsCustom,
                                      ),
                                ),
                              ),
                              SizedBox(
                                height: 50.0,
                                child: VerticalDivider(
                                  width: 20.0,
                                  thickness: 0.5,
                                  color: FlutterFlowTheme.of(context).accent2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: SelectionArea(
                                    child: Text(
                                  getJsonField(
                                    widget!.jsonitem,
                                    r'''$.barcode''',
                                  ).toString(),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelSmallFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .labelSmallIsCustom,
                                      ),
                                )),
                              ),
                              SizedBox(
                                height: 50.0,
                                child: VerticalDivider(
                                  width: 20.0,
                                  thickness: 0.5,
                                  color: FlutterFlowTheme.of(context).accent2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 10,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  getJsonField(
                                    widget!.jsonitem,
                                    r'''$.name''',
                                  ).toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelSmallFamily,
                                        color: Color(0xFF446AFE),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .labelSmallIsCustom,
                                      ),
                                ),
                              ),
                              SizedBox(
                                height: 50.0,
                                child: VerticalDivider(
                                  width: 20.0,
                                  thickness: 0.5,
                                  color: FlutterFlowTheme.of(context).accent2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                borderRadius: 10.0,
                                borderWidth: 1.0,
                                buttonSize: 30.0,
                                fillColor:
                                    FlutterFlowTheme.of(context).customColor2,
                                icon: Icon(
                                  Icons.remove,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 10.0,
                                ),
                                onPressed: () async {
                                  if (_model.textFieldqtTextController.text !=
                                      '1.0') {
                                    safeSetState(() {
                                      _model.textFieldqtTextController?.text =
                                          (double.parse(_model
                                                      .textFieldqtTextController
                                                      .text) -
                                                  1)
                                              .toString();
                                    });
                                    _model.allbillistplusCopy = await actions
                                        .addToHoldListGrCalculationqty(
                                      widget!.parameter2!,
                                      FFAppState().selBill,
                                      widget!.parameter3!.toList(),
                                      functions.enabletaxinclusive(
                                          widget!.parameter4!),
                                      widget!.unitList!.toList(),
                                      0.0,
                                      0.0,
                                      double.parse(_model
                                          .textFieldrateTextController.text),
                                      double.parse(_model
                                          .textFieldqtTextController.text),
                                      0.0,
                                      0.0,
                                      _model.textFieldqtTextController.text,
                                    );
                                    _model.output1Copy =
                                        await actions.calSubTotalForGrocery(
                                      FFAppState().selBill.toString(),
                                      FFAppState().allBillsList.toList(),
                                    );
                                    _model.reuslt121Copy =
                                        await actions.calBillAmtGrocery(
                                      valueOrDefault<double>(
                                        FFAppState().disAmt,
                                        0.0,
                                      ),
                                      FFAppState().delCharges,
                                    );
                                    FFAppState().finalAmt =
                                        FFAppState().finalAmt;
                                    FFAppState().update(() {});
                                  } else {
                                    safeSetState(() {
                                      _model.textFieldqtTextController?.text =
                                          '1.0';
                                    });
                                  }

                                  safeSetState(() {});
                                },
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: _model.textFieldqtTextController,
                                  focusNode: _model.textFieldqtFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textFieldqtTextController',
                                    Duration(milliseconds: 2000),
                                    () async {
                                      _model.allbillistChange = await actions
                                          .addToHoldListGrCalculationqty(
                                        widget!.parameter2!,
                                        FFAppState().selBill,
                                        widget!.parameter3!.toList(),
                                        functions.enabletaxinclusive(
                                            widget!.parameter4!),
                                        widget!.unitList!.toList(),
                                        0.0,
                                        0.0,
                                        double.parse(_model
                                            .textFieldrateTextController.text),
                                        double.parse(_model
                                            .textFieldqtTextController.text),
                                        0.0,
                                        0.0,
                                        _model.textFieldqtTextController.text,
                                      );
                                      _model.outputCopy =
                                          await actions.calSubTotalForGrocery(
                                        FFAppState().selBill.toString(),
                                        FFAppState().allBillsList.toList(),
                                      );
                                      _model.reuslt12Copy =
                                          await actions.calBillAmtGrocery(
                                        valueOrDefault<double>(
                                          FFAppState().disAmt,
                                          0.0,
                                        ),
                                        FFAppState().delCharges,
                                      );

                                      safeSetState(() {});
                                    },
                                  ),
                                  onFieldSubmitted: (_) async {
                                    _model.allbillist = await actions
                                        .addToHoldListGrCalculationqty(
                                      widget!.parameter2!,
                                      FFAppState().selBill,
                                      widget!.parameter3!.toList(),
                                      functions.enabletaxinclusive(
                                          widget!.parameter4!),
                                      widget!.unitList!.toList(),
                                      0.0,
                                      0.0,
                                      double.parse(_model
                                          .textFieldrateTextController.text),
                                      double.parse(_model
                                          .textFieldqtTextController.text),
                                      double.parse(_model
                                          .textFieldbarchNoTextController.text),
                                      double.parse(_model
                                          .textFieldnetWtTextController.text),
                                      _model.textFieldqtTextController.text,
                                    );
                                    safeSetState(() {
                                      _model.textFieldnetWtTextController
                                          ?.text = valueOrDefault<String>(
                                        getJsonField(
                                          _model.allbillist
                                              ?.where((e) =>
                                                  getJsonField(
                                                    widget!.jsonitem,
                                                    r'''$.id''',
                                                  ) ==
                                                  getJsonField(
                                                    e,
                                                    r'''$.id''',
                                                  ))
                                              .toList()
                                              ?.firstOrNull,
                                          r'''$.taxAmt''',
                                        )?.toString(),
                                        '0',
                                      );
                                    });
                                    _model.output =
                                        await actions.calSubTotalForGrocery(
                                      FFAppState().selBill.toString(),
                                      FFAppState().allBillsList.toList(),
                                    );
                                    _model.reuslt12 =
                                        await actions.calBillAmtGrocery(
                                      valueOrDefault<double>(
                                        FFAppState().disAmt,
                                        0.0,
                                      ),
                                      FFAppState().delCharges,
                                    );

                                    safeSetState(() {});
                                  },
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelMediumIsCustom,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelMediumIsCustom,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .customColor2,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFF5F6FB),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 10.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelSmallFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .labelSmallIsCustom,
                                      ),
                                  textAlign: TextAlign.center,
                                  validator: _model
                                      .textFieldqtTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                borderRadius: 10.0,
                                borderWidth: 1.0,
                                buttonSize: 30.0,
                                fillColor:
                                    FlutterFlowTheme.of(context).customColor2,
                                icon: Icon(
                                  Icons.add,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 10.0,
                                ),
                                onPressed: () async {
                                  safeSetState(() {
                                    _model.textFieldqtTextController?.text =
                                        (double.parse(_model
                                                    .textFieldqtTextController
                                                    .text) +
                                                1)
                                            .toString();
                                  });
                                  _model.all = await actions
                                      .addToHoldListGrCalculationqty(
                                    widget!.parameter2!,
                                    FFAppState().selBill,
                                    widget!.parameter3!.toList(),
                                    functions.enabletaxinclusive(
                                        widget!.parameter4!),
                                    widget!.unitList!.toList(),
                                    0.0,
                                    0.0,
                                    double.parse(_model
                                        .textFieldrateTextController.text),
                                    double.parse(
                                        _model.textFieldqtTextController.text),
                                    00.0,
                                    0.0,
                                    _model.textFieldqtTextController.text,
                                  );
                                  _model.output1 =
                                      await actions.calSubTotalForGrocery(
                                    FFAppState().selBill.toString(),
                                    FFAppState().allBillsList.toList(),
                                  );
                                  _model.reuslt121 =
                                      await actions.calBillAmtGrocery(
                                    valueOrDefault<double>(
                                      FFAppState().disAmt,
                                      0.0,
                                    ),
                                    FFAppState().delCharges,
                                  );
                                  FFAppState().finalAmt = FFAppState().finalAmt;
                                  FFAppState().update(() {});

                                  safeSetState(() {});
                                },
                              ),
                              SizedBox(
                                height: 50.0,
                                child: VerticalDivider(
                                  width: 20.0,
                                  thickness: 0.5,
                                  color: FlutterFlowTheme.of(context).accent2,
                                ),
                              ),
                            ].divide(SizedBox(width: 5.0)),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller:
                                      _model.textFieldunitTextController,
                                  focusNode: _model.textFieldunitFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textFieldunitTextController',
                                    Duration(milliseconds: 2000),
                                    () async {
                                      await actions.addToHoldListbarcodevalue(
                                        widget!.parameter2!,
                                        FFAppState().selBill,
                                        widget!.parameter3!.toList(),
                                        functions.enabletaxinclusive(
                                            widget!.parameter4!),
                                        widget!.unitList!.toList(),
                                        _model.textFieldmfgdateTextController
                                            .text,
                                        _model.textFieldexpdateTextController
                                            .text,
                                        _model
                                            .textFieldnetWtTextController.text,
                                        _model.textFieldbarchNoTextController
                                            .text,
                                        _model.textFieldunitTextController.text,
                                        _model
                                            .textFieldingrdTextController.text,
                                      );
                                    },
                                  ),
                                  onFieldSubmitted: (_) async {
                                    await actions.addToHoldListbarcodevalue(
                                      widget!.parameter2!,
                                      FFAppState().selBill,
                                      widget!.parameter3!.toList(),
                                      functions.enabletaxinclusive(
                                          widget!.parameter4!),
                                      widget!.unitList!.toList(),
                                      _model
                                          .textFieldmfgdateTextController.text,
                                      _model
                                          .textFieldexpdateTextController.text,
                                      _model.textFieldnetWtTextController.text,
                                      _model
                                          .textFieldbarchNoTextController.text,
                                      _model.textFieldunitTextController.text,
                                      _model.textFieldingrdTextController.text,
                                    );
                                  },
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelMediumIsCustom,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelMediumIsCustom,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .customColor2,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFF5F6FB),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 10.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelSmallFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .labelSmallIsCustom,
                                      ),
                                  textAlign: TextAlign.center,
                                  validator: _model
                                      .textFieldunitTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              SizedBox(
                                height: 50.0,
                                child: VerticalDivider(
                                  width: 20.0,
                                  thickness: 0.5,
                                  color: FlutterFlowTheme.of(context).accent2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller:
                                      _model.textFieldrateTextController,
                                  focusNode: _model.textFieldrateFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textFieldrateTextController',
                                    Duration(milliseconds: 2000),
                                    () async {
                                      _model.ratechangedCopy = await actions
                                          .ratePriceChangedFunctiongrocery(
                                        widget!.parameter2!,
                                        FFAppState().selBill,
                                        widget!.parameter3!.toList(),
                                        functions.enabletaxinclusive(
                                            widget!.parameter4!),
                                        widget!.unitList!.toList(),
                                        0.0,
                                        0.0,
                                        double.parse(_model
                                            .textFieldrateTextController.text),
                                        double.parse(_model
                                            .textFieldqtTextController.text),
                                        0.0,
                                        0.0,
                                      );
                                      _model.outputr2Copy =
                                          await actions.calSubTotalForGrocery(
                                        FFAppState().selBill.toString(),
                                        FFAppState().allBillsList.toList(),
                                      );
                                      _model.reuslt122Copy =
                                          await actions.calBillAmtGrocery(
                                        valueOrDefault<double>(
                                          FFAppState().disAmt,
                                          0.0,
                                        ),
                                        FFAppState().delCharges,
                                      );

                                      safeSetState(() {});
                                    },
                                  ),
                                  onFieldSubmitted: (_) async {
                                    _model.ratechanged = await actions
                                        .ratePriceChangedFunctiongrocery(
                                      widget!.parameter2!,
                                      FFAppState().selBill,
                                      widget!.parameter3!.toList(),
                                      functions.enabletaxinclusive(
                                          widget!.parameter4!),
                                      widget!.unitList!.toList(),
                                      0.0,
                                      0.0,
                                      double.parse(_model
                                          .textFieldrateTextController.text),
                                      double.parse(_model
                                          .textFieldqtTextController.text),
                                      0.0,
                                      0.0,
                                    );
                                    _model.outputr2 =
                                        await actions.calSubTotalForGrocery(
                                      FFAppState().selBill.toString(),
                                      FFAppState().allBillsList.toList(),
                                    );
                                    _model.reuslt122 =
                                        await actions.calBillAmtGrocery(
                                      valueOrDefault<double>(
                                        FFAppState().disAmt,
                                        0.0,
                                      ),
                                      FFAppState().delCharges,
                                    );

                                    safeSetState(() {});
                                  },
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelMediumIsCustom,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelMediumIsCustom,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .customColor2,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFF5F6FB),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 10.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelSmallFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .labelSmallIsCustom,
                                      ),
                                  textAlign: TextAlign.center,
                                  validator: _model
                                      .textFieldrateTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              SizedBox(
                                height: 50.0,
                                child: VerticalDivider(
                                  width: 20.0,
                                  thickness: 0.5,
                                  color: FlutterFlowTheme.of(context).accent2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller:
                                      _model.textFieldmrprateTextController,
                                  focusNode: _model.textFieldmrprateFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textFieldmrprateTextController',
                                    Duration(milliseconds: 2000),
                                    () async {
                                      _model.ratechanged2Copy = await actions
                                          .ratePriceChangedFunctiongrocery(
                                        widget!.parameter2!,
                                        FFAppState().selBill,
                                        widget!.parameter3!.toList(),
                                        functions.enabletaxinclusive(
                                            widget!.parameter4!),
                                        widget!.unitList!.toList(),
                                        0.0,
                                        0.0,
                                        double.parse(_model
                                            .textFieldmrprateTextController
                                            .text),
                                        double.parse(_model
                                            .textFieldqtTextController.text),
                                        0.0,
                                        0.0,
                                      );
                                      _model.outputr22Copy =
                                          await actions.calSubTotalForGrocery(
                                        FFAppState().selBill.toString(),
                                        FFAppState().allBillsList.toList(),
                                      );
                                      _model.reuslt1222Copy =
                                          await actions.calBillAmtGrocery(
                                        valueOrDefault<double>(
                                          FFAppState().disAmt,
                                          0.0,
                                        ),
                                        FFAppState().delCharges,
                                      );

                                      safeSetState(() {});
                                    },
                                  ),
                                  onFieldSubmitted: (_) async {
                                    _model.ratechanged2 = await actions
                                        .ratePriceChangedFunctiongrocery(
                                      widget!.parameter2!,
                                      FFAppState().selBill,
                                      widget!.parameter3!.toList(),
                                      functions.enabletaxinclusive(
                                          widget!.parameter4!),
                                      widget!.unitList!.toList(),
                                      0.0,
                                      0.0,
                                      double.parse(_model
                                          .textFieldmrprateTextController.text),
                                      double.parse(_model
                                          .textFieldqtTextController.text),
                                      0.0,
                                      0.0,
                                    );
                                    _model.outputr22 =
                                        await actions.calSubTotalForGrocery(
                                      FFAppState().selBill.toString(),
                                      FFAppState().allBillsList.toList(),
                                    );
                                    _model.reuslt1222 =
                                        await actions.calBillAmtGrocery(
                                      valueOrDefault<double>(
                                        FFAppState().disAmt,
                                        0.0,
                                      ),
                                      FFAppState().delCharges,
                                    );

                                    safeSetState(() {});
                                  },
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelMediumIsCustom,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelMediumIsCustom,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .customColor2,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFF5F6FB),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 10.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelSmallFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .labelSmallIsCustom,
                                      ),
                                  textAlign: TextAlign.center,
                                  validator: _model
                                      .textFieldmrprateTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              SizedBox(
                                height: 50.0,
                                child: VerticalDivider(
                                  width: 20.0,
                                  thickness: 0.5,
                                  color: FlutterFlowTheme.of(context).accent2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller:
                                      _model.textFieldmfgdateTextController,
                                  focusNode: _model.textFieldmfgdateFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textFieldmfgdateTextController',
                                    Duration(milliseconds: 2000),
                                    () async {
                                      _model.listCopy =
                                          await actions.addToHoldListGrmfgdate(
                                        widget!.parameter2!,
                                        FFAppState().selBill,
                                        widget!.parameter3!.toList(),
                                        functions.enabletaxinclusive(
                                            widget!.parameter4!),
                                        widget!.unitList!.toList(),
                                        _model.textFieldmfgdateTextController
                                            .text,
                                        _model.textFieldexpdateTextController
                                            .text,
                                      );

                                      safeSetState(() {});
                                    },
                                  ),
                                  onFieldSubmitted: (_) async {
                                    _model.list =
                                        await actions.addToHoldListGrmfgdate(
                                      widget!.parameter2!,
                                      FFAppState().selBill,
                                      widget!.parameter3!.toList(),
                                      functions.enabletaxinclusive(
                                          widget!.parameter4!),
                                      widget!.unitList!.toList(),
                                      _model
                                          .textFieldmfgdateTextController.text,
                                      _model
                                          .textFieldexpdateTextController.text,
                                    );

                                    safeSetState(() {});
                                  },
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelMediumIsCustom,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelMediumIsCustom,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .customColor2,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFF5F6FB),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 10.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelSmallFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .labelSmallIsCustom,
                                      ),
                                  textAlign: TextAlign.center,
                                  validator: _model
                                      .textFieldmfgdateTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  final _datePicked1Date = await showDatePicker(
                                    context: context,
                                    initialDate: getCurrentTimestamp,
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2050),
                                    builder: (context, child) {
                                      return wrapInMaterialDatePickerTheme(
                                        context,
                                        child!,
                                        headerBackgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        headerForegroundColor:
                                            FlutterFlowTheme.of(context).info,
                                        headerTextStyle: FlutterFlowTheme.of(
                                                context)
                                            .headlineLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLargeFamily,
                                              fontSize: 32.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .headlineLargeIsCustom,
                                            ),
                                        pickerBackgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        pickerForegroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        selectedDateTimeBackgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        selectedDateTimeForegroundColor:
                                            FlutterFlowTheme.of(context).info,
                                        actionButtonForegroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        iconSize: 24.0,
                                      );
                                    },
                                  );

                                  if (_datePicked1Date != null) {
                                    safeSetState(() {
                                      _model.datePicked1 = DateTime(
                                        _datePicked1Date.year,
                                        _datePicked1Date.month,
                                        _datePicked1Date.day,
                                      );
                                    });
                                  } else if (_model.datePicked1 != null) {
                                    safeSetState(() {
                                      _model.datePicked1 = getCurrentTimestamp;
                                    });
                                  }
                                  safeSetState(() {
                                    _model.textFieldmfgdateTextController
                                        ?.text = dateTimeFormat(
                                      "dd-MMM-yyyy",
                                      _model.datePicked1,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    );
                                  });
                                  _model.listCopyCopy =
                                      await actions.addToHoldListGrmfgdate(
                                    widget!.parameter2!,
                                    FFAppState().selBill,
                                    widget!.parameter3!.toList(),
                                    functions.enabletaxinclusive(
                                        widget!.parameter4!),
                                    widget!.unitList!.toList(),
                                    _model.textFieldmfgdateTextController.text,
                                    _model.textFieldexpdateTextController.text,
                                  );

                                  safeSetState(() {});
                                },
                                child: Icon(
                                  Icons.calendar_month,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                              SizedBox(
                                height: 50.0,
                                child: VerticalDivider(
                                  width: 20.0,
                                  thickness: 0.5,
                                  color: FlutterFlowTheme.of(context).accent2,
                                ),
                              ),
                            ].divide(SizedBox(width: 5.0)),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller:
                                      _model.textFieldexpdateTextController,
                                  focusNode: _model.textFieldexpdateFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textFieldexpdateTextController',
                                    Duration(milliseconds: 2000),
                                    () async {
                                      await actions.addToHoldListbarcodevalue(
                                        widget!.parameter2!,
                                        FFAppState().selBill,
                                        widget!.parameter3!.toList(),
                                        functions.enabletaxinclusive(
                                            widget!.parameter4!),
                                        widget!.unitList!.toList(),
                                        _model.textFieldmfgdateTextController
                                            .text,
                                        _model.textFieldexpdateTextController
                                            .text,
                                        _model
                                            .textFieldnetWtTextController.text,
                                        _model.textFieldbarchNoTextController
                                            .text,
                                        _model.textFieldunitTextController.text,
                                        _model
                                            .textFieldingrdTextController.text,
                                      );
                                    },
                                  ),
                                  onFieldSubmitted: (_) async {
                                    await actions.addToHoldListbarcodevalue(
                                      widget!.parameter2!,
                                      FFAppState().selBill,
                                      widget!.parameter3!.toList(),
                                      functions.enabletaxinclusive(
                                          widget!.parameter4!),
                                      widget!.unitList!.toList(),
                                      _model
                                          .textFieldmfgdateTextController.text,
                                      _model
                                          .textFieldexpdateTextController.text,
                                      _model.textFieldnetWtTextController.text,
                                      _model
                                          .textFieldbarchNoTextController.text,
                                      _model.textFieldunitTextController.text,
                                      _model.textFieldingrdTextController.text,
                                    );
                                  },
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelMediumIsCustom,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelMediumIsCustom,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .customColor2,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFF5F6FB),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 10.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelSmallFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .labelSmallIsCustom,
                                      ),
                                  textAlign: TextAlign.center,
                                  validator: _model
                                      .textFieldexpdateTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  final _datePicked2Date = await showDatePicker(
                                    context: context,
                                    initialDate: getCurrentTimestamp,
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2050),
                                    builder: (context, child) {
                                      return wrapInMaterialDatePickerTheme(
                                        context,
                                        child!,
                                        headerBackgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        headerForegroundColor:
                                            FlutterFlowTheme.of(context).info,
                                        headerTextStyle: FlutterFlowTheme.of(
                                                context)
                                            .headlineLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLargeFamily,
                                              fontSize: 32.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .headlineLargeIsCustom,
                                            ),
                                        pickerBackgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        pickerForegroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        selectedDateTimeBackgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        selectedDateTimeForegroundColor:
                                            FlutterFlowTheme.of(context).info,
                                        actionButtonForegroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        iconSize: 24.0,
                                      );
                                    },
                                  );

                                  if (_datePicked2Date != null) {
                                    safeSetState(() {
                                      _model.datePicked2 = DateTime(
                                        _datePicked2Date.year,
                                        _datePicked2Date.month,
                                        _datePicked2Date.day,
                                      );
                                    });
                                  } else if (_model.datePicked2 != null) {
                                    safeSetState(() {
                                      _model.datePicked2 = getCurrentTimestamp;
                                    });
                                  }
                                  safeSetState(() {
                                    _model.textFieldexpdateTextController
                                        ?.text = dateTimeFormat(
                                      "dd-MMM-yyyy",
                                      _model.datePicked2,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    );
                                  });
                                  await actions.addToHoldListbarcodevalue(
                                    widget!.parameter2!,
                                    FFAppState().selBill,
                                    widget!.parameter3!.toList(),
                                    functions.enabletaxinclusive(
                                        widget!.parameter4!),
                                    widget!.unitList!.toList(),
                                    _model.textFieldmfgdateTextController.text,
                                    _model.textFieldexpdateTextController.text,
                                    _model.textFieldnetWtTextController.text,
                                    _model.textFieldbarchNoTextController.text,
                                    _model.textFieldunitTextController.text,
                                    _model.textFieldingrdTextController.text,
                                  );
                                },
                                child: Icon(
                                  Icons.calendar_month,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                              SizedBox(
                                height: 50.0,
                                child: VerticalDivider(
                                  width: 20.0,
                                  thickness: 0.5,
                                  color: FlutterFlowTheme.of(context).accent2,
                                ),
                              ),
                            ].divide(SizedBox(width: 5.0)),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller:
                                      _model.textFieldbarchNoTextController,
                                  focusNode: _model.textFieldbarchNoFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textFieldbarchNoTextController',
                                    Duration(milliseconds: 2000),
                                    () async {
                                      await actions.addToHoldListbarcodevalue(
                                        widget!.parameter2!,
                                        FFAppState().selBill,
                                        widget!.parameter3!.toList(),
                                        functions.enabletaxinclusive(
                                            widget!.parameter4!),
                                        widget!.unitList!.toList(),
                                        _model.textFieldmfgdateTextController
                                            .text,
                                        _model.textFieldexpdateTextController
                                            .text,
                                        _model
                                            .textFieldnetWtTextController.text,
                                        _model.textFieldbarchNoTextController
                                            .text,
                                        _model.textFieldunitTextController.text,
                                        _model
                                            .textFieldingrdTextController.text,
                                      );
                                    },
                                  ),
                                  onFieldSubmitted: (_) async {
                                    await actions.addToHoldListbarcodevalue(
                                      widget!.parameter2!,
                                      FFAppState().selBill,
                                      widget!.parameter3!.toList(),
                                      functions.enabletaxinclusive(
                                          widget!.parameter4!),
                                      widget!.unitList!.toList(),
                                      _model
                                          .textFieldmfgdateTextController.text,
                                      _model
                                          .textFieldexpdateTextController.text,
                                      _model.textFieldnetWtTextController.text,
                                      _model
                                          .textFieldbarchNoTextController.text,
                                      _model.textFieldunitTextController.text,
                                      _model.textFieldingrdTextController.text,
                                    );
                                  },
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelMediumIsCustom,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelMediumIsCustom,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .customColor2,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFF5F6FB),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 10.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelSmallFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .labelSmallIsCustom,
                                      ),
                                  textAlign: TextAlign.center,
                                  validator: _model
                                      .textFieldbarchNoTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              SizedBox(
                                height: 50.0,
                                child: VerticalDivider(
                                  width: 20.0,
                                  thickness: 0.5,
                                  color: FlutterFlowTheme.of(context).accent2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller:
                                      _model.textFieldnetWtTextController,
                                  focusNode: _model.textFieldnetWtFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textFieldnetWtTextController',
                                    Duration(milliseconds: 2000),
                                    () async {
                                      await actions.addToHoldListbarcodevalue(
                                        widget!.parameter2!,
                                        FFAppState().selBill,
                                        widget!.parameter3!.toList(),
                                        functions.enabletaxinclusive(
                                            widget!.parameter4!),
                                        widget!.unitList!.toList(),
                                        _model.textFieldmfgdateTextController
                                            .text,
                                        _model.textFieldexpdateTextController
                                            .text,
                                        _model
                                            .textFieldnetWtTextController.text,
                                        _model.textFieldbarchNoTextController
                                            .text,
                                        _model.textFieldunitTextController.text,
                                        _model
                                            .textFieldingrdTextController.text,
                                      );
                                    },
                                  ),
                                  onFieldSubmitted: (_) async {
                                    await actions.addToHoldListbarcodevalue(
                                      widget!.parameter2!,
                                      FFAppState().selBill,
                                      widget!.parameter3!.toList(),
                                      functions.enabletaxinclusive(
                                          widget!.parameter4!),
                                      widget!.unitList!.toList(),
                                      _model
                                          .textFieldmfgdateTextController.text,
                                      _model
                                          .textFieldexpdateTextController.text,
                                      _model.textFieldnetWtTextController.text,
                                      _model
                                          .textFieldbarchNoTextController.text,
                                      _model.textFieldunitTextController.text,
                                      _model.textFieldingrdTextController.text,
                                    );
                                  },
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelMediumIsCustom,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelMediumIsCustom,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .customColor2,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFF5F6FB),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 10.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelSmallFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .labelSmallIsCustom,
                                      ),
                                  textAlign: TextAlign.center,
                                  validator: _model
                                      .textFieldnetWtTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            '541pyo07' /* INGREDIENT   */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .bodyMediumIsCustom,
                              ),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _model.textFieldingrdTextController,
                            focusNode: _model.textFieldingrdFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textFieldingrdTextController',
                              Duration(milliseconds: 2000),
                              () async {
                                await actions.addToHoldListbarcodevalue(
                                  widget!.parameter2!,
                                  FFAppState().selBill,
                                  widget!.parameter3!.toList(),
                                  functions
                                      .enabletaxinclusive(widget!.parameter4!),
                                  widget!.unitList!.toList(),
                                  _model.textFieldmfgdateTextController.text,
                                  _model.textFieldexpdateTextController.text,
                                  _model.textFieldnetWtTextController.text,
                                  _model.textFieldbarchNoTextController.text,
                                  _model.textFieldunitTextController.text,
                                  _model.textFieldingrdTextController.text,
                                );
                              },
                            ),
                            onFieldSubmitted: (_) async {
                              await actions.addToHoldListbarcodevalue(
                                widget!.parameter2!,
                                FFAppState().selBill,
                                widget!.parameter3!.toList(),
                                functions
                                    .enabletaxinclusive(widget!.parameter4!),
                                widget!.unitList!.toList(),
                                _model.textFieldmfgdateTextController.text,
                                _model.textFieldexpdateTextController.text,
                                _model.textFieldingrdTextController.text,
                                _model.textFieldbarchNoTextController.text,
                                _model.textFieldunitTextController.text,
                                _model.textFieldingrdTextController.text,
                              );
                            },
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .labelMediumIsCustom,
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .labelMediumIsCustom,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).customColor2,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).info,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              filled: true,
                              fillColor: Color(0xFFF5F6FB),
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 10.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelSmallFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .labelSmallIsCustom,
                                ),
                            textAlign: TextAlign.center,
                            validator: _model
                                .textFieldingrdTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ].divide(SizedBox(height: 10.0)),
              ),
            ),
          ),
        if (!FFAppState().groceryshow)
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              FFAppState().groceryshow = true;
              safeSetState(() {});
              safeSetState(() {
                _model.textFieldqtTextController?.text = valueOrDefault<String>(
                  getJsonField(
                    widget!.jsonitem,
                    r'''$.quantity''',
                  )?.toString(),
                  '0',
                );
              });
              safeSetState(() {
                _model.textFieldrateTextController?.text =
                    valueOrDefault<String>(
                  getJsonField(
                    widget!.jsonitem,
                    r'''$.price''',
                  )?.toString(),
                  '0',
                );
              });
              safeSetState(() {
                _model.textFieldexpdateTextController?.text =
                    valueOrDefault<String>(
                  getJsonField(
                    widget!.jsonitem,
                    r'''$.expDate''',
                  )?.toString(),
                  '0',
                );
              });
              safeSetState(() {
                _model.textFieldnetWtTextController?.text =
                    valueOrDefault<String>(
                  getJsonField(
                    widget!.jsonitem,
                    r'''$.netWt''',
                  )?.toString(),
                  '0',
                );
              });
              safeSetState(() {
                _model.textFieldmfgdateTextController?.text =
                    valueOrDefault<String>(
                  getJsonField(
                    widget!.jsonitem,
                    r'''$.mfgDate''',
                  )?.toString(),
                  '0',
                );
              });
              safeSetState(() {
                _model.textFieldbarchNoTextController?.text =
                    valueOrDefault<String>(
                  getJsonField(
                    widget!.jsonitem,
                    r'''$.batchNo''',
                  )?.toString(),
                  '0',
                );
              });
              safeSetState(() {
                _model.textFieldunitTextController?.text = getJsonField(
                  widget!.jsonitem,
                  r'''$.unit''',
                ).toString();
              });
            },
            child: Container(
              width: 1440.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    getJsonField(
                                      widget!.jsonitem,
                                      r'''$.srno''',
                                    ).toString(),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmallFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelSmallIsCustom,
                                        ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50.0,
                                  child: VerticalDivider(
                                    width: 20.0,
                                    thickness: 0.5,
                                    color: FlutterFlowTheme.of(context).accent2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: SelectionArea(
                                      child: Text(
                                    getJsonField(
                                      widget!.jsonitem,
                                      r'''$.barcode''',
                                    ).toString(),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmallFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelSmallIsCustom,
                                        ),
                                  )),
                                ),
                                SizedBox(
                                  height: 50.0,
                                  child: VerticalDivider(
                                    width: 20.0,
                                    thickness: 0.5,
                                    color: FlutterFlowTheme.of(context).accent2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    getJsonField(
                                      widget!.jsonitem,
                                      r'''$.name''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmallFamily,
                                          color: Color(0xFF446AFE),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelSmallIsCustom,
                                        ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50.0,
                                  child: VerticalDivider(
                                    width: 20.0,
                                    thickness: 0.5,
                                    color: FlutterFlowTheme.of(context).accent2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    valueOrDefault<String>(
                                      getJsonField(
                                        widget!.jsonitem,
                                        r'''$.quantity''',
                                      )?.toString(),
                                      '0',
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmallFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelSmallIsCustom,
                                        ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50.0,
                                  child: VerticalDivider(
                                    width: 20.0,
                                    thickness: 0.5,
                                    color: FlutterFlowTheme.of(context).accent2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    getJsonField(
                                      widget!.jsonitem,
                                      r'''$.unit''',
                                    ).toString(),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmallFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelSmallIsCustom,
                                        ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50.0,
                                  child: VerticalDivider(
                                    width: 20.0,
                                    thickness: 0.5,
                                    color: FlutterFlowTheme.of(context).accent2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    getJsonField(
                                      widget!.jsonitem,
                                      r'''$.price''',
                                    ).toString(),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmallFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelSmallIsCustom,
                                        ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50.0,
                                  child: VerticalDivider(
                                    width: 20.0,
                                    thickness: 0.5,
                                    color: FlutterFlowTheme.of(context).accent2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    getJsonField(
                                      widget!.jsonitem,
                                      r'''$.mrpPrice''',
                                    ).toString(),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmallFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelSmallIsCustom,
                                        ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50.0,
                                  child: VerticalDivider(
                                    width: 20.0,
                                    thickness: 0.5,
                                    color: FlutterFlowTheme.of(context).accent2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    getJsonField(
                                      widget!.jsonitem,
                                      r'''$.mfgDate''',
                                    ).toString(),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmallFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelSmallIsCustom,
                                        ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    final _datePicked3Date =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: getCurrentTimestamp,
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2050),
                                      builder: (context, child) {
                                        return wrapInMaterialDatePickerTheme(
                                          context,
                                          child!,
                                          headerBackgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          headerForegroundColor:
                                              FlutterFlowTheme.of(context).info,
                                          headerTextStyle: FlutterFlowTheme.of(
                                                  context)
                                              .headlineLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLargeFamily,
                                                fontSize: 32.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .headlineLargeIsCustom,
                                              ),
                                          pickerBackgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          pickerForegroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          selectedDateTimeBackgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          selectedDateTimeForegroundColor:
                                              FlutterFlowTheme.of(context).info,
                                          actionButtonForegroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          iconSize: 24.0,
                                        );
                                      },
                                    );

                                    if (_datePicked3Date != null) {
                                      safeSetState(() {
                                        _model.datePicked3 = DateTime(
                                          _datePicked3Date.year,
                                          _datePicked3Date.month,
                                          _datePicked3Date.day,
                                        );
                                      });
                                    } else if (_model.datePicked3 != null) {
                                      safeSetState(() {
                                        _model.datePicked3 =
                                            getCurrentTimestamp;
                                      });
                                    }
                                    _model.listicon2 =
                                        await actions.addToHoldListGrmfgdate(
                                      widget!.parameter2!,
                                      FFAppState().selBill,
                                      widget!.parameter3!.toList(),
                                      functions.enabletaxinclusive(
                                          widget!.parameter4!),
                                      widget!.unitList!.toList(),
                                      dateTimeFormat(
                                        "dd-MMM-yyyy",
                                        _model.datePicked3,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      _model
                                          .textFieldexpdateTextController.text,
                                    );

                                    safeSetState(() {});
                                  },
                                  child: Icon(
                                    Icons.calendar_month,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 50.0,
                                  child: VerticalDivider(
                                    width: 20.0,
                                    thickness: 0.5,
                                    color: FlutterFlowTheme.of(context).accent2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    getJsonField(
                                      widget!.jsonitem,
                                      r'''$.expDate''',
                                    ).toString(),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmallFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelSmallIsCustom,
                                        ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    final _datePicked4Date =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: getCurrentTimestamp,
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2050),
                                      builder: (context, child) {
                                        return wrapInMaterialDatePickerTheme(
                                          context,
                                          child!,
                                          headerBackgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          headerForegroundColor:
                                              FlutterFlowTheme.of(context).info,
                                          headerTextStyle: FlutterFlowTheme.of(
                                                  context)
                                              .headlineLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLargeFamily,
                                                fontSize: 32.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .headlineLargeIsCustom,
                                              ),
                                          pickerBackgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          pickerForegroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          selectedDateTimeBackgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          selectedDateTimeForegroundColor:
                                              FlutterFlowTheme.of(context).info,
                                          actionButtonForegroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          iconSize: 24.0,
                                        );
                                      },
                                    );

                                    if (_datePicked4Date != null) {
                                      safeSetState(() {
                                        _model.datePicked4 = DateTime(
                                          _datePicked4Date.year,
                                          _datePicked4Date.month,
                                          _datePicked4Date.day,
                                        );
                                      });
                                    } else if (_model.datePicked4 != null) {
                                      safeSetState(() {
                                        _model.datePicked4 =
                                            getCurrentTimestamp;
                                      });
                                    }
                                    _model.listicon =
                                        await actions.addToHoldListGrmfgdate(
                                      widget!.parameter2!,
                                      FFAppState().selBill,
                                      widget!.parameter3!.toList(),
                                      functions.enabletaxinclusive(
                                          widget!.parameter4!),
                                      widget!.unitList!.toList(),
                                      _model
                                          .textFieldmfgdateTextController.text,
                                      dateTimeFormat(
                                        "dd-MMM-yyyy",
                                        _model.datePicked4,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                    );

                                    safeSetState(() {});
                                  },
                                  child: Icon(
                                    Icons.calendar_month,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 50.0,
                                  child: VerticalDivider(
                                    width: 20.0,
                                    thickness: 0.5,
                                    color: FlutterFlowTheme.of(context).accent2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    getJsonField(
                                      widget!.jsonitem,
                                      r'''$.batchNo''',
                                    ).toString(),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmallFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelSmallIsCustom,
                                        ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50.0,
                                  child: VerticalDivider(
                                    width: 20.0,
                                    thickness: 0.5,
                                    color: FlutterFlowTheme.of(context).accent2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    getJsonField(
                                      widget!.jsonitem,
                                      r'''$.netWt''',
                                    ).toString(),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmallFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelSmallIsCustom,
                                        ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50.0,
                                  child: VerticalDivider(
                                    width: 20.0,
                                    thickness: 0.5,
                                    color: FlutterFlowTheme.of(context).accent2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              '92ixzs6s' /* INGREDIENT   */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          ),
                          Expanded(
                            child: Text(
                              getJsonField(
                                widget!.jsonitem,
                                r'''$.ingredient''',
                              ).toString(),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelSmallFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .labelSmallIsCustom,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ].divide(SizedBox(height: 10.0)),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
