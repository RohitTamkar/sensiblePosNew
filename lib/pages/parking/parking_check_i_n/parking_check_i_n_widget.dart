import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'parking_check_i_n_model.dart';
export 'parking_check_i_n_model.dart';

class ParkingCheckINWidget extends StatefulWidget {
  const ParkingCheckINWidget({
    super.key,
    this.shiftDoc,
    this.userRef,
  });

  final dynamic shiftDoc;
  final DocumentReference? userRef;

  @override
  State<ParkingCheckINWidget> createState() => _ParkingCheckINWidgetState();
}

class _ParkingCheckINWidgetState extends State<ParkingCheckINWidget> {
  late ParkingCheckINModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ParkingCheckINModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.advanceAmtTextController ??= TextEditingController();
    _model.advanceAmtFocusNode ??= FocusNode();

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
        title: 'ParkingCheckIN',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0x2712191C),
            body: Align(
              alignment: AlignmentDirectional(0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      safeSetState(() {});
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.85,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            color: Color(0x33000000),
                            offset: Offset(
                              3,
                              6,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FlutterFlowIconButton(
                                    borderRadius: 5,
                                    buttonSize: 40,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    icon: Icon(
                                      Icons.settings_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .parkingPrimary,
                                      size: 20,
                                    ),
                                    onPressed: () async {
                                      context.pushNamed(
                                        'PrintersettingCar',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.rightToLeft,
                                          ),
                                        },
                                      );
                                    },
                                  ),
                                  FlutterFlowIconButton(
                                    borderRadius: 5,
                                    buttonSize: 40,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    icon: Icon(
                                      Icons.clear,
                                      color: Color(0xFFFF5963),
                                      size: 24,
                                    ),
                                    onPressed: () async {
                                      context.pushNamed(
                                        'ParkingCustomers',
                                        queryParameters: {
                                          'shiftDoc': serializeParam(
                                            widget!.shiftDoc,
                                            ParamType.JSON,
                                          ),
                                          'userRef': serializeParam(
                                            currentUserReference,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.rightToLeft,
                                          ),
                                        },
                                      );
                                    },
                                  ),
                                ].divide(SizedBox(width: 10)),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: StreamBuilder<List<ProductRecord>>(
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
                                              width: 40,
                                              height: 40,
                                              child: SpinKitFadingCircle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 40,
                                              ),
                                            ),
                                          );
                                        }
                                        List<ProductRecord>
                                            dropDownvechicleProductRecordList =
                                            snapshot.data!;

                                        return FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .dropDownvechicleValueController ??=
                                              FormFieldController<String>(null),
                                          options:
                                              dropDownvechicleProductRecordList
                                                  .map((e) => e.name)
                                                  .toList(),
                                          onChanged: (val) async {
                                            safeSetState(() => _model
                                                .dropDownvechicleValue = val);
                                            _model.prd =
                                                await queryProductRecordOnce(
                                              parent: FFAppState().outletIdRef,
                                              queryBuilder: (productRecord) =>
                                                  productRecord.where(
                                                'name',
                                                isEqualTo: _model
                                                    .dropDownvechicleValue,
                                              ),
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);
                                            FFAppState().parkingCharges = 0.0;
                                            safeSetState(() {});
                                            FFAppState().parkingCharges =
                                                valueOrDefault<double>(
                                              _model.prd?.sellingPrice,
                                              0.0,
                                            );
                                            safeSetState(() {});

                                            safeSetState(() {});
                                          },
                                          width: 300,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMediumFamily),
                                              ),
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'l1ttn0ej' /* Vehicle Type */,
                                          ),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent3,
                                          borderWidth: 2,
                                          borderRadius: 8,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 4, 16, 4),
                                          hidesUnderline: true,
                                          isOverButton: true,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: TextFormField(
                                controller: _model.textController1,
                                focusNode: _model.textFieldFocusNode,
                                autofocus: false,
                                textCapitalization: TextCapitalization.words,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'q3yyeudm' /* Vehicle Number */,
                                  ),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .headlineSmallFamily,
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmallFamily),
                                    ),
                                textAlign: TextAlign.center,
                                validator: _model.textController1Validator
                                    .asValidator(context),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      '₹ ${valueOrDefault<String>(
                                        FFAppState().parkingCharges.toString(),
                                        '0',
                                      )}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 16,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: StreamBuilder<
                                          List<PaymentModeRecord>>(
                                        stream: queryPaymentModeRecord(),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 40,
                                                height: 40,
                                                child: SpinKitFadingCircle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 40,
                                                ),
                                              ),
                                            );
                                          }
                                          List<PaymentModeRecord>
                                              dropDownPaymentModeRecordList =
                                              snapshot.data!;

                                          return FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownValueController ??=
                                                FormFieldController<String>(
                                                    null),
                                            options:
                                                dropDownPaymentModeRecordList
                                                    .map((e) => e.name)
                                                    .toList(),
                                            onChanged: (val) => safeSetState(
                                                () =>
                                                    _model.dropDownValue = val),
                                            width: 300,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLargeFamily,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLargeFamily),
                                                    ),
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'de60ftkt' /* Payment Mode */,
                                            ),
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent3,
                                            borderWidth: 2,
                                            borderRadius: 8,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 4, 5, 4),
                                            hidesUnderline: true,
                                            isOverButton: true,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 30),
                                    child: TextFormField(
                                      controller:
                                          _model.advanceAmtTextController,
                                      focusNode: _model.advanceAmtFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          'z7m4anjt' /* Advance Amount */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily),
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily),
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .accent3,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily,
                                            letterSpacing: 1.5,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily),
                                          ),
                                      textAlign: TextAlign.center,
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                              decimal: true),
                                      validator: _model
                                          .advanceAmtTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    var _shouldSetState = false;
                                    if ((_model.textController1.text != null &&
                                            _model.textController1.text !=
                                                '') &&
                                        (_model.advanceAmtTextController.text !=
                                                null &&
                                            _model.advanceAmtTextController
                                                    .text !=
                                                '')) {
                                      _model.countdatagetPRINT =
                                          await queryInvoiceRecordOnce(
                                        parent: FFAppState().outletIdRef,
                                        queryBuilder: (invoiceRecord) =>
                                            invoiceRecord
                                                .where(
                                                  'invoiceDate',
                                                  isLessThanOrEqualTo:
                                                      getCurrentTimestamp
                                                          .millisecondsSinceEpoch,
                                                )
                                                .orderBy('invoiceDate',
                                                    descending: true),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      _shouldSetState = true;
                                      FFAppState().count = valueOrDefault<int>(
                                        _model.countdatagetPRINT?.count,
                                        1,
                                      );
                                      safeSetState(() {});
                                      if (getJsonField(
                                        widget!.shiftDoc,
                                        r'''$.shiftExists''',
                                      )) {
                                        FFAppState().count =
                                            FFAppState().count + 1;
                                        safeSetState(() {});
                                      } else {
                                        FFAppState().count =
                                            FFAppState().count + 1;
                                        safeSetState(() {});
                                      }

                                      FFAppState()
                                          .addToListCars(SelItemListStruct(
                                        name: functions.toCapitalLetter(
                                            _model.textController1.text),
                                        price: FFAppState().parkingCharges,
                                        categoryP: _model.dropDownvechicleValue,
                                      ));
                                      safeSetState(() {});

                                      var invoiceRecordReference =
                                          InvoiceRecord.createDoc(
                                              FFAppState().outletIdRef!);
                                      await invoiceRecordReference.set({
                                        ...createInvoiceRecordData(
                                          invoice: functions.genInvoiceNum(
                                              FFAppState().count,
                                              FFAppState().shiftCount),
                                          invoiceDate:
                                              functions.timestampToMili(
                                                  getCurrentTimestamp),
                                          dayId: functions.getDayId(),
                                          paymentMode: _model.dropDownValue,
                                          discountAmt: valueOrDefault<double>(
                                            FFAppState().disAmt,
                                            0.0,
                                          ),
                                          discountPer: valueOrDefault<double>(
                                            FFAppState().disPer,
                                            0.0,
                                          ),
                                          taxAmt: 0.0,
                                          billAmt: valueOrDefault<double>(
                                            FFAppState().parkingCharges,
                                            0.0,
                                          ),
                                          finalBillAmt: valueOrDefault<double>(
                                            FFAppState().parkingCharges,
                                            0.0,
                                          ),
                                          roundOff: 0.0,
                                          shiftId: getJsonField(
                                            FFAppState().shiftDetailsJson,
                                            r'''$.shiftId''',
                                          ).toString(),
                                          vechicleNo: functions.toCapitalLetter(
                                              _model.textController1.text),
                                          checkInTime: valueOrDefault<int>(
                                            getCurrentTimestamp
                                                .millisecondsSinceEpoch,
                                            0,
                                          ),
                                          advancePaid: double.tryParse(_model
                                              .advanceAmtTextController.text),
                                          vechicleType:
                                              _model.dropDownvechicleValue,
                                          count: FFAppState().count,
                                          checkOutTime: 0,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'productList':
                                                getSelItemListListFirestoreData(
                                              FFAppState().listCars,
                                            ),
                                          },
                                        ),
                                      });
                                      _model.docInvoicecars =
                                          InvoiceRecord.getDocumentFromData({
                                        ...createInvoiceRecordData(
                                          invoice: functions.genInvoiceNum(
                                              FFAppState().count,
                                              FFAppState().shiftCount),
                                          invoiceDate:
                                              functions.timestampToMili(
                                                  getCurrentTimestamp),
                                          dayId: functions.getDayId(),
                                          paymentMode: _model.dropDownValue,
                                          discountAmt: valueOrDefault<double>(
                                            FFAppState().disAmt,
                                            0.0,
                                          ),
                                          discountPer: valueOrDefault<double>(
                                            FFAppState().disPer,
                                            0.0,
                                          ),
                                          taxAmt: 0.0,
                                          billAmt: valueOrDefault<double>(
                                            FFAppState().parkingCharges,
                                            0.0,
                                          ),
                                          finalBillAmt: valueOrDefault<double>(
                                            FFAppState().parkingCharges,
                                            0.0,
                                          ),
                                          roundOff: 0.0,
                                          shiftId: getJsonField(
                                            FFAppState().shiftDetailsJson,
                                            r'''$.shiftId''',
                                          ).toString(),
                                          vechicleNo: functions.toCapitalLetter(
                                              _model.textController1.text),
                                          checkInTime: valueOrDefault<int>(
                                            getCurrentTimestamp
                                                .millisecondsSinceEpoch,
                                            0,
                                          ),
                                          advancePaid: double.tryParse(_model
                                              .advanceAmtTextController.text),
                                          vechicleType:
                                              _model.dropDownvechicleValue,
                                          count: FFAppState().count,
                                          checkOutTime: 0,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'productList':
                                                getSelItemListListFirestoreData(
                                              FFAppState().listCars,
                                            ),
                                          },
                                        ),
                                      }, invoiceRecordReference);
                                      _shouldSetState = true;

                                      await _model.docInvoicecars!.reference
                                          .update(createInvoiceRecordData(
                                        id: _model.docInvoicecars?.reference.id,
                                      ));
                                      if (getJsonField(
                                        widget!.shiftDoc,
                                        r'''$.shiftExists''',
                                      )) {
                                        _model.shiftSummarRkiosk =
                                            await actions.calShiftSummary(
                                          _model.docInvoicecars!,
                                          widget!.shiftDoc!,
                                        );
                                        _shouldSetState = true;
                                        _model.shiftref =
                                            await queryShiftRecordOnce(
                                          parent: FFAppState().outletIdRef,
                                          queryBuilder: (shiftRecord) =>
                                              shiftRecord.where(
                                            'shiftId',
                                            isEqualTo: valueOrDefault<String>(
                                              getJsonField(
                                                _model.shiftSummarRkiosk,
                                                r'''$.shiftId''',
                                              )?.toString(),
                                              '0',
                                            ),
                                          ),
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);
                                        _shouldSetState = true;

                                        await _model.shiftref!.reference
                                            .update(createShiftRecordData(
                                          billCount: valueOrDefault<int>(
                                            FFAppState().count,
                                            0,
                                          ),
                                          totalSale: valueOrDefault<double>(
                                            getJsonField(
                                              _model.shiftSummarRkiosk,
                                              r'''$.totalSale''',
                                            ),
                                            0.0,
                                          ),
                                          deliveryCharges:
                                              valueOrDefault<double>(
                                            getJsonField(
                                              _model.shiftSummarRkiosk,
                                              r'''$.deliveryCharges''',
                                            ),
                                            0.0,
                                          ),
                                          lastBillNo: valueOrDefault<String>(
                                            getJsonField(
                                              _model.shiftSummarRkiosk,
                                              r'''$.lastBillNo''',
                                            )?.toString(),
                                            '0',
                                          ),
                                          discount: getJsonField(
                                            _model.shiftSummarRkiosk,
                                            r'''$.discount''',
                                          ),
                                          lastBillTime:
                                              functions.timestampToMili(
                                                  getCurrentTimestamp),
                                          cashSale: valueOrDefault<double>(
                                            getJsonField(
                                              _model.shiftSummarRkiosk,
                                              r'''$.cashSale''',
                                            ),
                                            0.0,
                                          ),
                                          paymentJson: valueOrDefault<String>(
                                            getJsonField(
                                              _model.shiftSummarRkiosk,
                                              r'''$.paymentJson''',
                                            )?.toString(),
                                            '0',
                                          ),
                                        ));
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Alert'),
                                              content: Text(
                                                  'Check In Successfull !'),
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
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Login again to start Shift ',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor: Color(0x00000000),
                                          ),
                                        );
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }

                                      if (!functions.isPrinterSelected(
                                          FFAppState().printerDevice)!) {
                                        _model.resDevice2 =
                                            await actions.scanPrinter(
                                          FFAppState().posMode,
                                        );
                                        _shouldSetState = true;
                                      }
                                      await actions.connectDevice(
                                        FFAppState().printerDevice,
                                        FFAppState().printerIndex,
                                      );
                                      if (FFAppState().printerName != null &&
                                          FFAppState().printerName != '') {
                                        FFAppState().lastBill =
                                            FFAppState().finalAmt;
                                        FFAppState().update(() {});
                                        _model.returnedList2kiosk =
                                            await actions.selectBillPrint(
                                          FFAppState().selBill.toString(),
                                          FFAppState().allBillsList.toList(),
                                        );
                                        _shouldSetState = true;
                                        _model.device =
                                            await actions.newCustomAction(
                                          FFAppState().printerIndex,
                                        );
                                        _shouldSetState = true;
                                        _model.outletdoc =
                                            await queryOutletRecordOnce(
                                          queryBuilder: (outletRecord) =>
                                              outletRecord.where(
                                            'id',
                                            isEqualTo:
                                                FFAppState().outletIdRef?.id,
                                          ),
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);
                                        _shouldSetState = true;
                                        await actions.printBillParking(
                                          _model.device!.toList(),
                                          FFAppState().isPrinterConnected,
                                          FFAppState().printerName,
                                          getJsonField(
                                            functions.outletDocToJson(
                                                _model.outletdoc!),
                                            r'''$''',
                                          ),
                                          _model.docInvoicecars!,
                                          FFAppState().paperSize,
                                        );
                                        await actions.removeFromAllBillList(
                                          FFAppState().selBill,
                                        );
                                        await actions.clearValue();
                                        FFAppState().subTotal = 0.0;
                                        FFAppState().listCars = [];
                                        FFAppState().update(() {});
                                        FFAppState().finalAmt = 0.0;
                                        FFAppState().billAmt = 0.0;
                                        FFAppState().count = FFAppState().count;
                                        FFAppState().cartItem = [];
                                        FFAppState().update(() {});

                                        context.pushNamed(
                                          'ParkingCustomers',
                                          queryParameters: {
                                            'shiftDoc': serializeParam(
                                              _model.shiftSummarRkiosk,
                                              ParamType.JSON,
                                            ),
                                            'userRef': serializeParam(
                                              widget!.userRef,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );

                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('printer connection'),
                                              content:
                                                  Text('printer not connected'),
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
                                      }
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            content: Text(
                                                'Add Vechicle No. & Advance Amount'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }

                                    if (_shouldSetState) safeSetState(() {});
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'vwt3qvjt' /* PRINT */,
                                  ),
                                  icon: Icon(
                                    Icons.print_outlined,
                                    size: 18,
                                  ),
                                  options: FFButtonOptions(
                                    height: 45,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24, 0, 24, 0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    color: FlutterFlowTheme.of(context)
                                        .parkingSecondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 3,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    var _shouldSetState = false;
                                    if ((_model.textController1.text != null &&
                                            _model.textController1.text !=
                                                '') &&
                                        (_model.advanceAmtTextController.text !=
                                                null &&
                                            _model.advanceAmtTextController
                                                    .text !=
                                                '')) {
                                      _model.countdataget =
                                          await queryInvoiceRecordOnce(
                                        parent: FFAppState().outletIdRef,
                                        queryBuilder: (invoiceRecord) =>
                                            invoiceRecord
                                                .where(
                                                  'invoiceDate',
                                                  isLessThanOrEqualTo:
                                                      getCurrentTimestamp
                                                          .millisecondsSinceEpoch,
                                                )
                                                .orderBy('invoiceDate',
                                                    descending: true),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      _shouldSetState = true;
                                      FFAppState().count =
                                          _model.countdataget!.count;
                                      safeSetState(() {});
                                      if (getJsonField(
                                        widget!.shiftDoc,
                                        r'''$.shiftExists''',
                                      )) {
                                        FFAppState().count =
                                            FFAppState().count + 1;
                                        safeSetState(() {});
                                      } else {
                                        FFAppState().count =
                                            FFAppState().count + 1;
                                        safeSetState(() {});
                                      }

                                      FFAppState()
                                          .addToListCars(SelItemListStruct(
                                        name: functions.toCapitalLetter(
                                            _model.textController1.text),
                                        price: FFAppState().parkingCharges,
                                        categoryP: _model.dropDownvechicleValue,
                                      ));
                                      safeSetState(() {});

                                      var invoiceRecordReference =
                                          InvoiceRecord.createDoc(
                                              FFAppState().outletIdRef!);
                                      await invoiceRecordReference.set({
                                        ...createInvoiceRecordData(
                                          invoice: functions.genInvoiceNum(
                                              FFAppState().count,
                                              FFAppState().shiftCount),
                                          invoiceDate:
                                              functions.timestampToMili(
                                                  getCurrentTimestamp),
                                          dayId: functions.getDayId(),
                                          paymentMode: _model.dropDownValue,
                                          discountAmt: valueOrDefault<double>(
                                            FFAppState().disAmt,
                                            0.0,
                                          ),
                                          discountPer: valueOrDefault<double>(
                                            FFAppState().disPer,
                                            0.0,
                                          ),
                                          taxAmt: 0.0,
                                          billAmt: valueOrDefault<double>(
                                            FFAppState().parkingCharges,
                                            0.0,
                                          ),
                                          finalBillAmt: valueOrDefault<double>(
                                            FFAppState().parkingCharges,
                                            0.0,
                                          ),
                                          roundOff: 0.0,
                                          shiftId: getJsonField(
                                            FFAppState().shiftDetailsJson,
                                            r'''$.shiftId''',
                                          ).toString(),
                                          vechicleNo: functions.toCapitalLetter(
                                              _model.textController1.text),
                                          checkInTime: valueOrDefault<int>(
                                            getCurrentTimestamp
                                                .millisecondsSinceEpoch,
                                            0,
                                          ),
                                          advancePaid: double.tryParse(_model
                                              .advanceAmtTextController.text),
                                          vechicleType:
                                              _model.dropDownvechicleValue,
                                          count: FFAppState().count,
                                          checkOutTime: 0,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'productList':
                                                getSelItemListListFirestoreData(
                                              FFAppState().listCars,
                                            ),
                                          },
                                        ),
                                      });
                                      _model.docInvoicecars2 =
                                          InvoiceRecord.getDocumentFromData({
                                        ...createInvoiceRecordData(
                                          invoice: functions.genInvoiceNum(
                                              FFAppState().count,
                                              FFAppState().shiftCount),
                                          invoiceDate:
                                              functions.timestampToMili(
                                                  getCurrentTimestamp),
                                          dayId: functions.getDayId(),
                                          paymentMode: _model.dropDownValue,
                                          discountAmt: valueOrDefault<double>(
                                            FFAppState().disAmt,
                                            0.0,
                                          ),
                                          discountPer: valueOrDefault<double>(
                                            FFAppState().disPer,
                                            0.0,
                                          ),
                                          taxAmt: 0.0,
                                          billAmt: valueOrDefault<double>(
                                            FFAppState().parkingCharges,
                                            0.0,
                                          ),
                                          finalBillAmt: valueOrDefault<double>(
                                            FFAppState().parkingCharges,
                                            0.0,
                                          ),
                                          roundOff: 0.0,
                                          shiftId: getJsonField(
                                            FFAppState().shiftDetailsJson,
                                            r'''$.shiftId''',
                                          ).toString(),
                                          vechicleNo: functions.toCapitalLetter(
                                              _model.textController1.text),
                                          checkInTime: valueOrDefault<int>(
                                            getCurrentTimestamp
                                                .millisecondsSinceEpoch,
                                            0,
                                          ),
                                          advancePaid: double.tryParse(_model
                                              .advanceAmtTextController.text),
                                          vechicleType:
                                              _model.dropDownvechicleValue,
                                          count: FFAppState().count,
                                          checkOutTime: 0,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'productList':
                                                getSelItemListListFirestoreData(
                                              FFAppState().listCars,
                                            ),
                                          },
                                        ),
                                      }, invoiceRecordReference);
                                      _shouldSetState = true;

                                      await _model.docInvoicecars2!.reference
                                          .update(createInvoiceRecordData(
                                        id: _model
                                            .docInvoicecars2?.reference.id,
                                      ));
                                      if (getJsonField(
                                        widget!.shiftDoc,
                                        r'''$.shiftExists''',
                                      )) {
                                        _model.shiftSummarRkiosk2 =
                                            await actions.calShiftSummary(
                                          _model.docInvoicecars2!,
                                          widget!.shiftDoc!,
                                        );
                                        _shouldSetState = true;
                                        _model.shiftref2 =
                                            await queryShiftRecordOnce(
                                          parent: FFAppState().outletIdRef,
                                          queryBuilder: (shiftRecord) =>
                                              shiftRecord.where(
                                            'shiftId',
                                            isEqualTo: getJsonField(
                                              _model.shiftSummarRkiosk2,
                                              r'''$.shiftId''',
                                            ).toString(),
                                          ),
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);
                                        _shouldSetState = true;

                                        await _model.shiftref2!.reference
                                            .update(createShiftRecordData(
                                          billCount: valueOrDefault<int>(
                                            FFAppState().count,
                                            0,
                                          ),
                                          totalSale: getJsonField(
                                            _model.shiftSummarRkiosk2,
                                            r'''$.totalSale''',
                                          ),
                                          deliveryCharges: getJsonField(
                                            _model.shiftSummarRkiosk2,
                                            r'''$.deliveryCharges''',
                                          ),
                                          lastBillNo: getJsonField(
                                            _model.shiftSummarRkiosk2,
                                            r'''$.lastBillNo''',
                                          ).toString(),
                                          discount: getJsonField(
                                            _model.shiftSummarRkiosk,
                                            r'''$.discount''',
                                          ),
                                          lastBillTime:
                                              functions.timestampToMili(
                                                  getCurrentTimestamp),
                                          cashSale: getJsonField(
                                            _model.shiftSummarRkiosk2,
                                            r'''$.cashSale''',
                                          ),
                                          paymentJson: getJsonField(
                                            _model.shiftSummarRkiosk2,
                                            r'''$.paymentJson''',
                                          ).toString(),
                                        ));
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Alert'),
                                              content: Text(
                                                  'Check In Successfull !'),
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
                                        await actions.removeFromAllBillList(
                                          FFAppState().selBill,
                                        );
                                        await actions.clearValue();
                                        FFAppState().subTotal = 0.0;
                                        FFAppState().listCars = [];
                                        FFAppState().update(() {});
                                        FFAppState().finalAmt = 0.0;
                                        FFAppState().billAmt = 0.0;
                                        FFAppState().count = FFAppState().count;
                                        FFAppState().cartItem = [];
                                        FFAppState().update(() {});

                                        context.pushNamed(
                                          'ParkingCustomers',
                                          queryParameters: {
                                            'shiftDoc': serializeParam(
                                              _model.shiftSummarRkiosk2,
                                              ParamType.JSON,
                                            ),
                                            'userRef': serializeParam(
                                              widget!.userRef,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );

                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Login again to start Shift ',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor: Color(0x00000000),
                                          ),
                                        );
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            content: Text(
                                                'Add Vechicle No. & Advance Amount'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }

                                    if (_shouldSetState) safeSetState(() {});
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'f34rpgfl' /* SAVE */,
                                  ),
                                  options: FFButtonOptions(
                                    height: 45,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24, 0, 24, 0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    color: FlutterFlowTheme.of(context).info,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 3,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ].divide(SizedBox(width: 6)),
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
