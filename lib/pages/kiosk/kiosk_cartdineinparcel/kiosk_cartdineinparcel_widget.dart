import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/dine_inparcel_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/kiosk/kiosk_header/kiosk_header_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'kiosk_cartdineinparcel_model.dart';
export 'kiosk_cartdineinparcel_model.dart';

class KioskCartdineinparcelWidget extends StatefulWidget {
  const KioskCartdineinparcelWidget({
    super.key,
    this.doc,
    this.shiftdetails,
    this.appsetting,
    this.taxcollection,
  });

  final DocumentReference? doc;
  final dynamic shiftdetails;
  final AppSettingsRecord? appsetting;
  final List<TaxMasterRecord>? taxcollection;

  @override
  State<KioskCartdineinparcelWidget> createState() =>
      _KioskCartdineinparcelWidgetState();
}

class _KioskCartdineinparcelWidgetState
    extends State<KioskCartdineinparcelWidget> {
  late KioskCartdineinparcelModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KioskCartdineinparcelModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.btnPressed = false;
      safeSetState(() {});
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

    return StreamBuilder<List<FooterRecord>>(
      stream: queryFooterRecord(
        parent: FFAppState().outletIdRef,
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitFadingCircle(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 40.0,
                ),
              ),
            ),
          );
        }
        List<FooterRecord> kioskCartdineinparcelFooterRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final kioskCartdineinparcelFooterRecord =
            kioskCartdineinparcelFooterRecordList.isNotEmpty
                ? kioskCartdineinparcelFooterRecordList.first
                : null;

        return Title(
            title: 'KioskCartdineinparcel',
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
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  body: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        alignment: AlignmentDirectional(0.0, -1.0),
                        image: Image.asset(
                          'assets/images/Top_img_4.png',
                        ).image,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0, 0.0, 30.0, 15.0),
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 0.14,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: wrapWithModel(
                                      model: _model.kioskHeaderModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: KioskHeaderWidget(),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 20.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          borderRadius: 15.0,
                                          borderWidth: 0.5,
                                          buttonSize: 65.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          icon: Icon(
                                            Icons.keyboard_backspace_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 40.0,
                                          ),
                                          onPressed: () async {
                                            context.goNamed(
                                              'KioskBillScreen',
                                              queryParameters: {
                                                'doc': serializeParam(
                                                  widget!.doc,
                                                  ParamType.DocumentReference,
                                                ),
                                                'shiftdoc': serializeParam(
                                                  widget!.shiftdetails,
                                                  ParamType.JSON,
                                                ),
                                                'appsetting': serializeParam(
                                                  widget!.appsetting,
                                                  ParamType.Document,
                                                ),
                                                'taxcollection': serializeParam(
                                                  widget!.taxcollection,
                                                  ParamType.Document,
                                                  isList: true,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'appsetting':
                                                    widget!.appsetting,
                                                'taxcollection':
                                                    widget!.taxcollection,
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '56q92wzw' /* Confirm Your Order */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 30.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmallFamily),
                                            ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: FlutterFlowChoiceChips(
                                              options: [
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'nl10icnc' /* DINE IN */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'o4la9hrp' /* PARCEL */,
                                                ))
                                              ],
                                              onChanged: (val) async {
                                                safeSetState(() =>
                                                    _model.choiceChipsValue =
                                                        val?.firstOrNull);
                                                FFAppState().orderType =
                                                    _model.choiceChipsValue!;
                                                safeSetState(() {});
                                                if (FFAppState().orderType ==
                                                    'PARCEL') {
                                                  FFAppState().delCharges =
                                                      kioskCartdineinparcelFooterRecord!
                                                          .parcelCharges;
                                                  safeSetState(() {});
                                                  _model.ddr4 = await actions
                                                      .calSubTotalForHoldListkiosk2(
                                                    FFAppState()
                                                        .selBill
                                                        .toString(),
                                                    FFAppState()
                                                        .allBillsList
                                                        .toList(),
                                                    functions
                                                        .enabletaxinclusive(
                                                            valueOrDefault<
                                                                bool>(
                                                      widget!.appsetting
                                                          ?.settingList
                                                          ?.where((e) =>
                                                              e.title ==
                                                              'enableInclusiveTax')
                                                          .toList()
                                                          ?.firstOrNull
                                                          ?.value,
                                                      false,
                                                    )),
                                                    widget!
                                                        .appsetting!.settingList
                                                        .where((e) =>
                                                            e.title ==
                                                            'qtyWiseParcelCharges')
                                                        .toList()
                                                        .firstOrNull!
                                                        .value,
                                                  );
                                                  _model.reusltddr =
                                                      await actions.calBillAmt2(
                                                    valueOrDefault<double>(
                                                      FFAppState().disAmt,
                                                      0.0,
                                                    ),
                                                    FFAppState().delCharges,
                                                    widget!
                                                        .appsetting!.settingList
                                                        .where((e) =>
                                                            e.title ==
                                                            'qtyWiseParcelCharges')
                                                        .toList()
                                                        .firstOrNull!
                                                        .value,
                                                  );
                                                } else {
                                                  FFAppState().orderType =
                                                      _model.choiceChipsValue!;
                                                  FFAppState().delCharges = 0.0;
                                                  safeSetState(() {});
                                                  _model.ddr45 = await actions
                                                      .calSubTotalForHoldListkiosk2(
                                                    FFAppState()
                                                        .selBill
                                                        .toString(),
                                                    FFAppState()
                                                        .allBillsList
                                                        .toList(),
                                                    functions
                                                        .enabletaxinclusive(
                                                            valueOrDefault<
                                                                bool>(
                                                      widget!.appsetting
                                                          ?.settingList
                                                          ?.where((e) =>
                                                              e.title ==
                                                              'enableInclusiveTax')
                                                          .toList()
                                                          ?.firstOrNull
                                                          ?.value,
                                                      false,
                                                    )),
                                                    widget!
                                                        .appsetting!.settingList
                                                        .where((e) =>
                                                            e.title ==
                                                            'qtyWiseParcelCharges')
                                                        .toList()
                                                        .firstOrNull!
                                                        .value,
                                                  );
                                                  _model.reusltddr67 =
                                                      await actions.calBillAmt2(
                                                    valueOrDefault<double>(
                                                      FFAppState().disAmt,
                                                      0.0,
                                                    ),
                                                    FFAppState().delCharges,
                                                    widget!
                                                        .appsetting!.settingList
                                                        .where((e) =>
                                                            e.title ==
                                                            'qtyWiseParcelCharges')
                                                        .toList()
                                                        .firstOrNull!
                                                        .value,
                                                  );
                                                }

                                                safeSetState(() {});
                                              },
                                              selectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 30.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                iconSize: 16.0,
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              unselectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    Color(0xFFD7D4E8),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                iconSize: 16.0,
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              chipSpacing: 20.0,
                                              rowSpacing: 8.0,
                                              multiselect: false,
                                              initialized:
                                                  _model.choiceChipsValue !=
                                                      null,
                                              alignment: WrapAlignment.start,
                                              controller: _model
                                                      .choiceChipsValueController ??=
                                                  FormFieldController<
                                                      List<String>>(
                                                [FFAppState().orderType],
                                              ),
                                              wrapped: false,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 100.0,
                            decoration: BoxDecoration(),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      25.0, 0.0, 25.0, 20.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF0FFF0),
                                      borderRadius: BorderRadius.circular(40.0),
                                      border: Border.all(
                                        color: Color(0xFF61D36B),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    25.0, 25.0, 25.0, 75.0),
                                            child: Builder(
                                              builder: (context) {
                                                final listview = functions
                                                    .filterBillList(
                                                        FFAppState().selBill,
                                                        FFAppState()
                                                            .allBillsList
                                                            .toList())
                                                    .toList();

                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: listview.length,
                                                  itemBuilder:
                                                      (context, listviewIndex) {
                                                    final listviewItem =
                                                        listview[listviewIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: Container(
                                                        width: 100.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 7.0,
                                                              color: Color(
                                                                  0x25000000),
                                                              offset: Offset(
                                                                3.0,
                                                                5.0,
                                                              ),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  15.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                flex: 2,
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child:
                                                                      CachedNetworkImage(
                                                                    fadeInDuration:
                                                                        Duration(
                                                                            milliseconds:
                                                                                500),
                                                                    fadeOutDuration:
                                                                        Duration(
                                                                            milliseconds:
                                                                                500),
                                                                    imageUrl:
                                                                        valueOrDefault<
                                                                            String>(
                                                                      getJsonField(
                                                                        listviewItem,
                                                                        r'''$.imageUrl''',
                                                                      )?.toString(),
                                                                      'https://as1.ftcdn.net/v2/jpg/04/34/72/82/1000_F_434728286_OWQQvAFoXZLdGHlObozsolNeuSxhpr84.jpg',
                                                                    ),
                                                                    width:
                                                                        300.0,
                                                                    height:
                                                                        110.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 8,
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                15.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          functions.returnTitlecase(getJsonField(
                                                                                            listviewItem,
                                                                                            r'''$.name''',
                                                                                          ).toString()),
                                                                                          '0',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                                              color: Color(0xFF033BE8),
                                                                                              fontSize: 18.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineLargeFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    if (!valueOrDefault<bool>(
                                                                                      widget!.appsetting?.settingList?.where((e) => e.title == 'hideRegionalLanguage').toList()?.firstOrNull?.value,
                                                                                      false,
                                                                                    ))
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                        child: Text(
                                                                                          getJsonField(
                                                                                            listviewItem,
                                                                                            r'''$.regionalName''',
                                                                                          ).toString(),
                                                                                          style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                color: Color(0xFF033BE8),
                                                                                                fontSize: 14.0,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                                RichText(
                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                  text: TextSpan(
                                                                                    children: [
                                                                                      TextSpan(
                                                                                        text: FFLocalizations.of(context).getText(
                                                                                          '5jpzrnln' /* ₹  */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                              color: Color(0xFF0046D3),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                            ),
                                                                                      ),
                                                                                      TextSpan(
                                                                                        text: getJsonField(
                                                                                          listviewItem,
                                                                                          r'''$.price''',
                                                                                        ).toString(),
                                                                                        style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                              color: Color(0xFF0046D3),
                                                                                              fontSize: 14.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                            ),
                                                                                      )
                                                                                    ],
                                                                                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                          color: Color(0xFF0046D3),
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                        ),
                                                                                  ),
                                                                                  textAlign: TextAlign.start,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.end,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
                                                                              child: Container(
                                                                                width: 170.0,
                                                                                height: MediaQuery.sizeOf(context).height * 0.033,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFFC6E88C),
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(12.0),
                                                                                    bottomRight: Radius.circular(12.0),
                                                                                    topLeft: Radius.circular(12.0),
                                                                                    topRight: Radius.circular(12.0),
                                                                                  ),
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: FlutterFlowIconButton(
                                                                                        borderColor: Colors.transparent,
                                                                                        borderRadius: 12.0,
                                                                                        buttonSize: double.infinity,
                                                                                        fillColor: Color(0xFFA7D348),
                                                                                        icon: Icon(
                                                                                          Icons.remove_sharp,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 20.0,
                                                                                        ),
                                                                                        onPressed: () async {
                                                                                          _model.res2cart = await actions.reduceQuantityHoldListkiosk(
                                                                                            listviewItem,
                                                                                            FFAppState().selBill,
                                                                                            widget!.taxcollection!.toList(),
                                                                                            functions.enabletaxinclusive(valueOrDefault<bool>(
                                                                                              widget!.appsetting?.settingList?.where((e) => e.title == 'enableInclusiveTax').toList()?.firstOrNull?.value,
                                                                                              false,
                                                                                            )),
                                                                                          );
                                                                                          _model.res2345 = await actions.calSubTotalForHoldListkiosk2(
                                                                                            valueOrDefault<String>(
                                                                                              FFAppState().selBill.toString(),
                                                                                              '1',
                                                                                            ),
                                                                                            FFAppState().allBillsList.toList(),
                                                                                            functions.enabletaxinclusive(valueOrDefault<bool>(
                                                                                              widget!.appsetting?.settingList?.where((e) => e.title == 'enableInclusiveTax').toList()?.firstOrNull?.value,
                                                                                              false,
                                                                                            )),
                                                                                            widget!.appsetting!.settingList.where((e) => e.title == 'qtyWiseParcelCharges').toList().firstOrNull!.value,
                                                                                          );
                                                                                          _model.reu34 = await actions.calBillAmt2(
                                                                                            valueOrDefault<double>(
                                                                                              FFAppState().disAmt,
                                                                                              0.0,
                                                                                            ),
                                                                                            FFAppState().delCharges,
                                                                                            widget!.appsetting!.settingList.where((e) => e.title == 'qtyWiseParcelCharges').toList().firstOrNull!.value,
                                                                                          );

                                                                                          safeSetState(() {});
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Text(
                                                                                          getJsonField(
                                                                                            listviewItem,
                                                                                            r'''$.quantity''',
                                                                                          ).toString(),
                                                                                          textAlign: TextAlign.center,
                                                                                          style: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                                                fontSize: 15.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineLargeFamily),
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: FlutterFlowIconButton(
                                                                                        borderColor: Colors.transparent,
                                                                                        borderRadius: 12.0,
                                                                                        buttonSize: double.infinity,
                                                                                        fillColor: Color(0xFFA7D348),
                                                                                        icon: Icon(
                                                                                          Icons.add,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 20.0,
                                                                                        ),
                                                                                        onPressed: () async {
                                                                                          var _shouldSetState = false;
                                                                                          if (getJsonField(
                                                                                            listviewItem,
                                                                                            r'''$.stockable''',
                                                                                          )) {
                                                                                            if (!functions.greatethanlesskiosk(
                                                                                                functions.jsontoint(getJsonField(
                                                                                                  listviewItem,
                                                                                                  r'''$.currentStock''',
                                                                                                )),
                                                                                                functions.jsontoint(getJsonField(
                                                                                                  listviewItem,
                                                                                                  r'''$.quantity''',
                                                                                                )))) {
                                                                                              await showDialog(
                                                                                                context: context,
                                                                                                builder: (alertDialogContext) {
                                                                                                  return AlertDialog(
                                                                                                    content: Text('Item Out Of Stock.'),
                                                                                                    actions: [
                                                                                                      TextButton(
                                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                        child: Text('Ok'),
                                                                                                      ),
                                                                                                    ],
                                                                                                  );
                                                                                                },
                                                                                              );
                                                                                              if (_shouldSetState) safeSetState(() {});
                                                                                              return;
                                                                                            }
                                                                                          }
                                                                                          _model.resultkioskcart = await actions.plusQuantityHoldListkiosk(
                                                                                            getJsonField(
                                                                                              listviewItem,
                                                                                              r'''$''',
                                                                                            ),
                                                                                            FFAppState().selBill,
                                                                                            widget!.taxcollection!.toList(),
                                                                                            functions.enabletaxinclusive(valueOrDefault<bool>(
                                                                                              widget!.appsetting?.settingList?.where((e) => e.title == 'enableInclusiveTax').toList()?.firstOrNull?.value,
                                                                                              false,
                                                                                            )),
                                                                                          );
                                                                                          _shouldSetState = true;
                                                                                          _model.res23456 = await actions.calSubTotalForHoldListkiosk2(
                                                                                            valueOrDefault<String>(
                                                                                              FFAppState().selBill.toString(),
                                                                                              '1',
                                                                                            ),
                                                                                            FFAppState().allBillsList.toList(),
                                                                                            functions.enabletaxinclusive(valueOrDefault<bool>(
                                                                                              widget!.appsetting?.settingList?.where((e) => e.title == 'enableInclusiveTax').toList()?.firstOrNull?.value,
                                                                                              false,
                                                                                            )),
                                                                                            widget!.appsetting!.settingList.where((e) => e.title == 'qtyWiseParcelCharges').toList().firstOrNull!.value,
                                                                                          );
                                                                                          _shouldSetState = true;
                                                                                          _model.reuslt123 = await actions.calBillAmt2(
                                                                                            valueOrDefault<double>(
                                                                                              FFAppState().disAmt,
                                                                                              0.0,
                                                                                            ),
                                                                                            FFAppState().delCharges,
                                                                                            widget!.appsetting!.settingList.where((e) => e.title == 'qtyWiseParcelCharges').toList().firstOrNull!.value,
                                                                                          );
                                                                                          _shouldSetState = true;
                                                                                          if (_shouldSetState) safeSetState(() {});
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'nsx9qh4i' /* Sub Total : */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                color: Color(0xFF00A03F),
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      RichText(
                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                        text: TextSpan(
                                                                                          children: [
                                                                                            TextSpan(
                                                                                              text: FFLocalizations.of(context).getText(
                                                                                                'tuv50kbd' /* ₹  */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                    color: Color(0xFF00A03F),
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                                  ),
                                                                                            ),
                                                                                            TextSpan(
                                                                                              text: functions
                                                                                                  .getTotal(
                                                                                                      getJsonField(
                                                                                                        listviewItem,
                                                                                                        r'''$.quantity''',
                                                                                                      ),
                                                                                                      getJsonField(
                                                                                                        listviewItem,
                                                                                                        r'''$.price''',
                                                                                                      ))
                                                                                                  .toString(),
                                                                                              style: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                                                    color: Color(0xFF00A03F),
                                                                                                    fontSize: 15.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineLargeFamily),
                                                                                                  ),
                                                                                            )
                                                                                          ],
                                                                                          style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                                color: Color(0xFF0046D3),
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                              ),
                                                                                        ),
                                                                                        textAlign: TextAlign.center,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                FlutterFlowIconButton(
                                                                                  borderColor: FlutterFlowTheme.of(context).primary,
                                                                                  borderRadius: 12.0,
                                                                                  borderWidth: 0.5,
                                                                                  buttonSize: 40.0,
                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  icon: Icon(
                                                                                    Icons.delete_rounded,
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    size: 18.0,
                                                                                  ),
                                                                                  onPressed: () async {
                                                                                    _model.res20Copy = await actions.removeHoldListItem(
                                                                                      listviewItem,
                                                                                      FFAppState().selBill,
                                                                                    );
                                                                                    await actions.calSubTotalForHoldListkiosk2(
                                                                                      FFAppState().selBill.toString(),
                                                                                      FFAppState().allBillsList.toList(),
                                                                                      functions.enabletaxinclusive(valueOrDefault<bool>(
                                                                                        widget!.appsetting?.settingList?.where((e) => e.title == 'enableInclusiveTax').toList()?.firstOrNull?.value,
                                                                                        false,
                                                                                      )),
                                                                                      widget!.appsetting!.settingList.where((e) => e.title == 'qtyWiseParcelCharges').toList().firstOrNull!.value,
                                                                                    );
                                                                                    _model.reuslt22Copy = await actions.calBillAmt2(
                                                                                      valueOrDefault<double>(
                                                                                        FFAppState().disAmt,
                                                                                        0.0,
                                                                                      ),
                                                                                      valueOrDefault<double>(
                                                                                        FFAppState().delCharges,
                                                                                        0.0,
                                                                                      ),
                                                                                      widget!.appsetting!.settingList.where((e) => e.title == 'qtyWiseParcelCharges').toList().firstOrNull!.value,
                                                                                    );
                                                                                    FFAppState().removeFromCartItem(functions.returnidRef(
                                                                                        getJsonField(
                                                                                          listviewItem,
                                                                                          r'''$.id''',
                                                                                        ).toString(),
                                                                                        FFAppState().outletIdRef!.id)!);
                                                                                    safeSetState(() {});

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: DineInparcelWidget(
                                                                                    key: Key('Keyw3i_${listviewIndex}_of_${listview.length}'),
                                                                                    parameter2: valueOrDefault<bool>(
                                                                                      widget!.appsetting?.settingList?.where((e) => e.title == 'enableInclusiveTax').toList()?.firstOrNull?.value,
                                                                                      false,
                                                                                    ),
                                                                                    parameter3: widget!.appsetting?.settingList?.where((e) => e.title == 'qtyWiseParcelCharges').toList()?.firstOrNull?.value,
                                                                                    parameter4: getJsonField(
                                                                                      listviewItem,
                                                                                      r'''$.ordertype''',
                                                                                    ),
                                                                                    parameter5: kioskCartdineinparcelFooterRecord?.parcelCharges,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
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
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, 1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 100.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        if (false)
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 10.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  FFAppState().orderId =
                                                      FFAppState().orderId + 10;
                                                  FFAppState().paytmOrderId =
                                                      'ORD-${FFAppState().orderId.toString()}${getCurrentTimestamp.millisecondsSinceEpoch.toString()}';
                                                  safeSetState(() {});
                                                  _model.closeUnixTime =
                                                      await actions
                                                          .setCloseUnixTime(
                                                    getCurrentTimestamp,
                                                    10,
                                                  );
                                                  _model.qrResp =
                                                      await RazorpayQRCreationCall
                                                          .call(
                                                    type: 'upi_qr',
                                                    name: 'Mrunaal Nerlikar',
                                                    paymentAmount:
                                                        FFAppState().finalAmt,
                                                    description: 'Bill',
                                                    closeBy: _model
                                                        .closeUnixTime
                                                        ?.secondsSinceEpoch,
                                                    isProd: true,
                                                    purpose: 'Bill',
                                                    fixedAmount: true,
                                                    orderId: FFAppState()
                                                        .paytmOrderId,
                                                    posId:
                                                        FFAppState().outletId,
                                                  );

                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text('Response'),
                                                        content: Text((_model
                                                                    .qrResp
                                                                    ?.jsonBody ??
                                                                '')
                                                            .toString()),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );

                                                  context.pushNamed(
                                                    'KioskPayment',
                                                    queryParameters: {
                                                      'doc': serializeParam(
                                                        widget!.doc,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                      'shiftdetails':
                                                          serializeParam(
                                                        widget!.shiftdetails,
                                                        ParamType.JSON,
                                                      ),
                                                      'qrJson': serializeParam(
                                                        (_model.qrResp
                                                                ?.jsonBody ??
                                                            ''),
                                                        ParamType.JSON,
                                                      ),
                                                      'paytmOrderId':
                                                          serializeParam(
                                                        FFAppState()
                                                            .paytmOrderId,
                                                        ParamType.String,
                                                      ),
                                                      'isPaytm': serializeParam(
                                                        false,
                                                        ParamType.bool,
                                                      ),
                                                      'appsettings':
                                                          serializeParam(
                                                        widget!.appsetting,
                                                        ParamType.Document,
                                                      ),
                                                      'taxcollection':
                                                          serializeParam(
                                                        widget!.taxcollection,
                                                        ParamType.Document,
                                                        isList: true,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'appsettings':
                                                          widget!.appsetting,
                                                      'taxcollection':
                                                          widget!.taxcollection,
                                                    },
                                                  );

                                                  safeSetState(() {});
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'mp73i02j' /* Proceed to Razorpay for paymen... */,
                                                ),
                                                icon: Icon(
                                                  Icons.chevron_right,
                                                  size: 25.0,
                                                ),
                                                options: FFButtonOptions(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.4,
                                                  height: 65.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLargeFamily,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts: GoogleFonts
                                                                    .asMap()
                                                                .containsKey(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLargeFamily),
                                                          ),
                                                  elevation: 3.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 95.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          content: Text(
                                                              'Are You Sure You Want To Cancel This Order ?'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text(
                                                                  'Cancel'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child: Text(
                                                                  'Confirm'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (confirmDialogResponse) {
                                              await actions
                                                  .removeFromAllBillList(
                                                FFAppState().selBill,
                                              );
                                              await actions.clearValue();
                                              FFAppState().subTotal = 0.0;
                                              FFAppState().update(() {});
                                              FFAppState().finalAmt = 0.0;
                                              FFAppState().billAmt = 0.0;
                                              FFAppState().count =
                                                  FFAppState().count;
                                              FFAppState().cartItem = [];
                                              FFAppState().isBillPrinted = true;
                                              FFAppState().noOfItems = 0;
                                              FFAppState().update(() {});

                                              context.pushNamed(
                                                'KioskBillScreen',
                                                queryParameters: {
                                                  'doc': serializeParam(
                                                    widget!.doc,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'shiftdoc': serializeParam(
                                                    widget!.shiftdetails,
                                                    ParamType.JSON,
                                                  ),
                                                  'appsetting': serializeParam(
                                                    widget!.appsetting,
                                                    ParamType.Document,
                                                  ),
                                                  'taxcollection':
                                                      serializeParam(
                                                    widget!.taxcollection,
                                                    ParamType.Document,
                                                    isList: true,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'appsetting':
                                                      widget!.appsetting,
                                                  'taxcollection':
                                                      widget!.taxcollection,
                                                },
                                              );
                                            }
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'zmg9b5ie' /* Cancel Order */,
                                          ),
                                          icon: Icon(
                                            Icons.close,
                                            size: 24.0,
                                          ),
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.25,
                                            height: 95.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0x00B6001A),
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily),
                                                ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 5.0, 0.0),
                                                  child: Icon(
                                                    Icons.shopping_cart_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    FFAppState()
                                                        .noOfItems
                                                        .toString(),
                                                    '0',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displayLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .displayLargeFamily,
                                                        fontSize: 24.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .displayLargeFamily),
                                                      ),
                                                ),
                                              ],
                                            ),
                                            if (FFAppState().delCharges > 0.0)
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      't2xpr04x' /* Parcel Charges:₹  */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .displayLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .displayLargeFamily,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .displayLargeFamily),
                                                        ),
                                                  ),
                                                  Text(
                                                    (FFAppState().delCharges *
                                                            FFAppState()
                                                                .noOfItems)
                                                        .toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .displayLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .displayLargeFamily,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .displayLargeFamily),
                                                        ),
                                                  ),
                                                ],
                                              ),
                                          ],
                                        ),
                                        RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'e6mvt3qa' /* ₹  */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily),
                                                        ),
                                              ),
                                              TextSpan(
                                                text: FFAppState()
                                                    .finalAmt
                                                    .toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 24.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily),
                                                        ),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmallFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(FlutterFlowTheme
                                                              .of(context)
                                                          .headlineSmallFamily),
                                                ),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: FFButtonWidget(
                                            onPressed: _model.btnPressed
                                                ? null
                                                : () async {
                                                    _model.btnPressed = true;
                                                    safeSetState(() {});
                                                    if (FFAppState()
                                                        .isPrinterConnected) {
                                                      if (functions
                                                          .filterBillList(
                                                              FFAppState()
                                                                  .selBill,
                                                              FFAppState()
                                                                  .allBillsList
                                                                  .toList())
                                                          .isNotEmpty) {
                                                        context.goNamed(
                                                          'KioskChoosePaymentMode',
                                                          queryParameters: {
                                                            'doc':
                                                                serializeParam(
                                                              widget!.doc,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                            'shiftdetails':
                                                                serializeParam(
                                                              widget!
                                                                  .shiftdetails,
                                                              ParamType.JSON,
                                                            ),
                                                            'appSettings':
                                                                serializeParam(
                                                              widget!
                                                                  .appsetting,
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                            'taxcollection':
                                                                serializeParam(
                                                              widget!
                                                                  .taxcollection,
                                                              ParamType
                                                                  .Document,
                                                              isList: true,
                                                            ),
                                                            'paytmOrderId':
                                                                serializeParam(
                                                              FFAppState()
                                                                  .paytmOrderId,
                                                              ParamType.String,
                                                            ),
                                                            'isPaytm':
                                                                serializeParam(
                                                              true,
                                                              ParamType.bool,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'appSettings':
                                                                widget!
                                                                    .appsetting,
                                                            'taxcollection':
                                                                widget!
                                                                    .taxcollection,
                                                          },
                                                        );
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              content: Text(
                                                                  'Cart Is Empty !'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );

                                                        context.goNamed(
                                                          'KioskBillScreen',
                                                          queryParameters: {
                                                            'doc':
                                                                serializeParam(
                                                              widget!.doc,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                            'shiftdoc':
                                                                serializeParam(
                                                              widget!
                                                                  .shiftdetails,
                                                              ParamType.JSON,
                                                            ),
                                                            'appsetting':
                                                                serializeParam(
                                                              widget!
                                                                  .appsetting,
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                            'taxcollection':
                                                                serializeParam(
                                                              widget!
                                                                  .taxcollection,
                                                              ParamType
                                                                  .Document,
                                                              isList: true,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'appsetting':
                                                                widget!
                                                                    .appsetting,
                                                            'taxcollection':
                                                                widget!
                                                                    .taxcollection,
                                                          },
                                                        );
                                                      }
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            content: Text(
                                                                'Printer Not Connected !'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                      _model.connectdeviceCOPY23 =
                                                          await actions
                                                              .connectDevice(
                                                        FFAppState()
                                                            .printerDevice,
                                                        FFAppState()
                                                            .printerIndex,
                                                      );
                                                    }

                                                    safeSetState(() {});
                                                  },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'vt3u56og' /* Proceed to Payment */,
                                            ),
                                            icon: Icon(
                                              Icons.chevron_right,
                                              size: 25.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.35,
                                              height: 95.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0xFF00A03F),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmallFamily,
                                                        color: Colors.white,
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily),
                                                      ),
                                              elevation: 3.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
