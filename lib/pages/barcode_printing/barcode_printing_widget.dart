import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'barcode_printing_model.dart';
export 'barcode_printing_model.dart';

class BarcodePrintingWidget extends StatefulWidget {
  const BarcodePrintingWidget({super.key});

  static String routeName = 'BarcodePrinting';
  static String routePath = 'barcodePrinting';

  @override
  State<BarcodePrintingWidget> createState() => _BarcodePrintingWidgetState();
}

class _BarcodePrintingWidgetState extends State<BarcodePrintingWidget> {
  late BarcodePrintingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BarcodePrintingModel());

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
        title: 'BarcodePrinting',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Padding(
              padding: EdgeInsets.all(3.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.12,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    borderWidth: 1.0,
                                    buttonSize: 60.0,
                                    icon: Icon(
                                      Icons.chevron_left_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      size: 26.0,
                                    ),
                                    onPressed: () async {
                                      context.safePop();
                                    },
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'p5ee26mp' /*  Barcode Printing */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .headlineMediumIsCustom,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: wrapWithModel(
                              model: _model.headerModel,
                              updateCallback: () => safeSetState(() {}),
                              child: HeaderWidget(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 13,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 100.0,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    3.0, 0.0, 0.0, 0.0),
                                child: Container(
                                  width: 100.0,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            3.0, 5.0, 3.0, 3.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.1,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  _model.resultDevic =
                                                      await actions.scanPrinter(
                                                    'USB',
                                                  );

                                                  safeSetState(() {});

                                                  safeSetState(() {});
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '5pkat5re' /* Scan Printer */,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallIsCustom,
                                                          ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            3.0, 5.0, 3.0, 3.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.207,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          ),
                                          child: Visibility(
                                            visible:
                                                FFAppState().posMode != null &&
                                                    FFAppState().posMode != '',
                                            child: Builder(
                                              builder: (context) {
                                                final printerList = FFAppState()
                                                    .printerDevice
                                                    .toList();

                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: printerList.length,
                                                  itemBuilder: (context,
                                                      printerListIndex) {
                                                    final printerListItem =
                                                        printerList[
                                                            printerListIndex];
                                                    return Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              FFAppState()
                                                                      .setHoldListColor =
                                                                  getJsonField(
                                                                printerListItem,
                                                                r'''$.address''',
                                                              );
                                                              safeSetState(
                                                                  () {});
                                                              FFAppState()
                                                                      .printerIndex =
                                                                  getJsonField(
                                                                printerListItem,
                                                                r'''$.address''',
                                                              ).toString();
                                                              FFAppState()
                                                                      .labelindex =
                                                                  printerListIndex;
                                                              FFAppState()
                                                                      .printerName =
                                                                  getJsonField(
                                                                printerListItem,
                                                                r'''$.deviceName''',
                                                              ).toString();
                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                              _model.con2 =
                                                                  await actions
                                                                      .connectDevice(
                                                                printerListItem,
                                                                getJsonField(
                                                                  printerListItem,
                                                                  r'''$.address''',
                                                                ).toString(),
                                                              );
                                                              if (_model
                                                                  .con2!) {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Device connected',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        Color(
                                                                            0x00000000),
                                                                  ),
                                                                );
                                                                _model.selected2 =
                                                                    await actions
                                                                        .newCustomAction(
                                                                  FFAppState()
                                                                      .printerIndex,
                                                                );
                                                              } else {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Device not connected',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        Color(
                                                                            0x00000000),
                                                                  ),
                                                                );
                                                              }

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.3,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.065,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        6.0,
                                                                        10.0,
                                                                        8.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.print_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                16.0,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          getJsonField(
                                                                            printerListItem,
                                                                            r'''$.deviceName''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .headlineSmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).headlineSmallIsCustom,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                5.0,
                                                                                0.0),
                                                                            child:
                                                                                Icon(
                                                                              Icons.location_on,
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              size: 15.0,
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            printerListIndex.toString(),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 10.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        if (FFAppState()
                                                                .labelindex ==
                                                            printerListIndex)
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 60.0,
                                                            icon: Icon(
                                                              Icons
                                                                  .check_circle,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiary,
                                                              size: 30.0,
                                                            ),
                                                            onPressed: () {
                                                              print(
                                                                  'IconButton pressed ...');
                                                            },
                                                          ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            3.0, 5.0, 3.0, 3.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.05,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          ),
                                          child: FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownValueController1 ??=
                                                FormFieldController<String>(
                                              _model.dropDownValue1 ??=
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                '8iwc05jj' /* 35mm*25mm */,
                                              ),
                                            ),
                                            options: [
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'vuozrhc9' /* 35mm*25mm */,
                                              )
                                            ],
                                            onChanged: (val) async {
                                              safeSetState(() =>
                                                  _model.dropDownValue1 = val);
                                              _model.labelSize =
                                                  _model.dropDownValue1!;
                                              safeSetState(() {});
                                            },
                                            width: 180.0,
                                            height: 28.13,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .override(
                                                      fontFamily: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineSmallFamily,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmallIsCustom,
                                                    ),
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              't4cy3uv0' /* Select your label size */,
                                            ),
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            borderWidth: 0.0,
                                            borderRadius: 0.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 4.0, 12.0, 4.0),
                                            hidesUnderline: true,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  3.0, 5.0, 3.0, 3.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 500.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: double.infinity,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.03,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor2,
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          flex: 28,
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.12,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'wolvbcoj' /* Item Name */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodySmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 14,
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.08,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'z7ui1z2v' /* Qty */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            width: 100.0,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Icon(
                                                              Icons
                                                                  .delete_forever_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Builder(
                                                      builder: (context) {
                                                        final bill = _model
                                                            .productlist
                                                            .toList();

                                                        return ListView
                                                            .separated(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              bill.length,
                                                          separatorBuilder: (_,
                                                                  __) =>
                                                              SizedBox(
                                                                  height: 3.0),
                                                          itemBuilder: (context,
                                                              billIndex) {
                                                            final billItem =
                                                                bill[billIndex];
                                                            return Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  flex: 28,
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.265,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          2.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                5.0),
                                                                            child:
                                                                                Text(
                                                                              billItem.name.maybeHandleOverflow(
                                                                                maxChars: 15,
                                                                                replacement: '…',
                                                                              ),
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '37f6cvrx' /* ₹  */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                billItem.price.toString(),
                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                billItem.barcode,
                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 10,
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.07,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              1.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Expanded(
                                                                            flex:
                                                                                7,
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                if (billItem.quantity > 0.0) {
                                                                                  _model.updateProductlistAtIndex(
                                                                                    billIndex,
                                                                                    (e) => e..incrementQuantity(1.0),
                                                                                  );
                                                                                  safeSetState(() {});
                                                                                }
                                                                              },
                                                                              child: Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.02,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 5.0,
                                                                                      color: Color(0x27000000),
                                                                                      offset: Offset(
                                                                                        -4.0,
                                                                                        1.0,
                                                                                      ),
                                                                                      spreadRadius: 1.0,
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(5.0),
                                                                                    bottomRight: Radius.circular(0.0),
                                                                                    topLeft: Radius.circular(5.0),
                                                                                    topRight: Radius.circular(0.0),
                                                                                  ),
                                                                                ),
                                                                                child: Icon(
                                                                                  Icons.remove,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 20.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Text(
                                                                              valueOrDefault<String>(
                                                                                billItem.quantity.toString(),
                                                                                '0',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).headlineSmallIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                7,
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                _model.updateProductlistAtIndex(
                                                                                  billIndex,
                                                                                  (e) => e..incrementQuantity(1.0),
                                                                                );
                                                                                safeSetState(() {});
                                                                              },
                                                                              child: Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.03,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 5.0,
                                                                                      color: Color(0x25000000),
                                                                                      offset: Offset(
                                                                                        4.0,
                                                                                        1.0,
                                                                                      ),
                                                                                      spreadRadius: 1.0,
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(0.0),
                                                                                    bottomRight: Radius.circular(5.0),
                                                                                    topLeft: Radius.circular(0.0),
                                                                                    topRight: Radius.circular(5.0),
                                                                                  ),
                                                                                ),
                                                                                child: Icon(
                                                                                  Icons.add,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 20.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 5,
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        FlutterFlowIconButton(
                                                                      borderRadius:
                                                                          8.0,
                                                                      buttonSize:
                                                                          45.0,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .delete_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        _model.removeFromProductlist(
                                                                            billItem);
                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      },
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
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    3.0, 0.0, 0.0, 0.0),
                                child: Container(
                                  width: 100.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(3.0),
                                        child:
                                            StreamBuilder<List<ProductRecord>>(
                                          stream: queryProductRecord(
                                            parent: FFAppState().outletIdRef,
                                            queryBuilder: (productRecord) =>
                                                productRecord.where(
                                              'isDeleted',
                                              isEqualTo: false,
                                            ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 40.0,
                                                  height: 40.0,
                                                  child: SpinKitFadingCircle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 40.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<ProductRecord>
                                                containerProductRecordList =
                                                snapshot.data!;

                                            return Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.1,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .customColor2,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  2.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child:
                                                          FlutterFlowDropDown<
                                                              String>(
                                                        controller: _model
                                                                .dropDownValueController2 ??=
                                                            FormFieldController<
                                                                String>(
                                                          _model.dropDownValue2 ??=
                                                              '',
                                                        ),
                                                        options: List<
                                                                String>.from(
                                                            containerProductRecordList
                                                                .map(
                                                                    (e) => e.id)
                                                                .toList()),
                                                        optionLabels:
                                                            containerProductRecordList
                                                                .map((e) =>
                                                                    e.name)
                                                                .toList(),
                                                        onChanged: (val) async {
                                                          safeSetState(() =>
                                                              _model.dropDownValue2 =
                                                                  val);
                                                          if (containerProductRecordList
                                                                  .where((e) =>
                                                                      e.id ==
                                                                      _model
                                                                          .dropDownValue2)
                                                                  .toList()
                                                                  .firstOrNull
                                                                  ?.id ==
                                                              _model.productlist
                                                                  .where((e) =>
                                                                      containerProductRecordList
                                                                          .where((e) =>
                                                                              e.id ==
                                                                              _model.dropDownValue2)
                                                                          .toList()
                                                                          .firstOrNull
                                                                          ?.id ==
                                                                      e.id)
                                                                  .toList()
                                                                  .firstOrNull
                                                                  ?.id) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  content: Text(
                                                                      'Already Exists!'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          } else {
                                                            _model.addToProductDoclist(
                                                                containerProductRecordList
                                                                    .where((e) =>
                                                                        e.id ==
                                                                        _model
                                                                            .dropDownValue2)
                                                                    .toList()
                                                                    .firstOrNull!);
                                                            _model
                                                                .updateProductStruct(
                                                              (e) => e
                                                                ..name = containerProductRecordList
                                                                    .where((e) =>
                                                                        e.id ==
                                                                        _model
                                                                            .dropDownValue2)
                                                                    .toList()
                                                                    .firstOrNull
                                                                    ?.name
                                                                ..quantity = 1.0
                                                                ..price = containerProductRecordList
                                                                    .where((e) =>
                                                                        e.id ==
                                                                        _model
                                                                            .dropDownValue2)
                                                                    .toList()
                                                                    .firstOrNull
                                                                    ?.sellingPrice
                                                                ..barcode = containerProductRecordList
                                                                    .where((e) =>
                                                                        e.id ==
                                                                        _model
                                                                            .dropDownValue2)
                                                                    .toList()
                                                                    .firstOrNull
                                                                    ?.barcode
                                                                ..id = containerProductRecordList
                                                                    .where((e) =>
                                                                        e.id ==
                                                                        _model
                                                                            .dropDownValue2)
                                                                    .toList()
                                                                    .firstOrNull
                                                                    ?.barcode,
                                                            );
                                                            _model.addToProductlist(
                                                                _model
                                                                    .product!);
                                                            safeSetState(() {});
                                                          }
                                                        },
                                                        width: 200.0,
                                                        height: 40.0,
                                                        searchHintTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMediumIsCustom,
                                                                ),
                                                        searchTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        hintText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '1swwmub9' /* Select... */,
                                                        ),
                                                        searchHintText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'hatwmpoz' /* Search... */,
                                                        ),
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderWidth: 0.0,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        hidesUnderline: true,
                                                        isOverButton: false,
                                                        isSearchable: true,
                                                        isMultiSelect: false,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.06,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.1,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderWidth: 1.0,
                                                      buttonSize: 50.0,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      icon: Icon(
                                                        Icons.search,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .lineColor,
                                                        size: 20.0,
                                                      ),
                                                      onPressed: () {
                                                        print(
                                                            'IconButton pressed ...');
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          if (!functions.isPrinterSelected(
                                              FFAppState().printerDevice)!) {
                                            _model.resDevice2Copy =
                                                await actions.scanPrinter(
                                              FFAppState().posMode,
                                            );
                                          }
                                          _model.connectdevice =
                                              await actions.connectDevice(
                                            FFAppState().printerDevice,
                                            FFAppState().printerIndex,
                                          );
                                          _model.selected =
                                              await actions.newCustomAction(
                                            FFAppState().printerIndex,
                                          );
                                          await actions.printBillPreviewLabel(
                                            _model.selected!.toList(),
                                            FFAppState().isPrinterConnected,
                                            FFAppState().printerName,
                                            _model.labelSize,
                                            _model.productlist.toList(),
                                          );

                                          safeSetState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'wt4pfla6' /* Print Label */,
                                        ),
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmallIsCustom,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
