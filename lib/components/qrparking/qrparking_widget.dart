import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'qrparking_model.dart';
export 'qrparking_model.dart';

class QrparkingWidget extends StatefulWidget {
  const QrparkingWidget({
    super.key,
    this.usrref,
    this.invdoc,
    required this.shiftdoc,
  });

  final DocumentReference? usrref;
  final InvoiceRecord? invdoc;
  final dynamic shiftdoc;

  @override
  State<QrparkingWidget> createState() => _QrparkingWidgetState();
}

class _QrparkingWidgetState extends State<QrparkingWidget> {
  late QrparkingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QrparkingModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 500.0,
            height: 250.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(
                color: FlutterFlowTheme.of(context).customColor2,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 440.0,
                  height: 210.0,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              2.0, 5.0, 2.0, 0.0),
                          child: Container(
                            width: 480.0,
                            height: 200.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(
                                        Icons.close,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 35.0,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          7.0, 0.0, 0.0, 0.0),
                                      child: Container(
                                        width: 250.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 3.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              widget!.invdoc?.vechicleNo,
                                              '0000',
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmallFamily,
                                                  fontSize: 30.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(FlutterFlowTheme
                                                              .of(context)
                                                          .headlineSmallFamily),
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          7.0, 0.0, 0.0, 0.0),
                                      child: Container(
                                        width: 250.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 3.0, 0.0),
                                          child: Text(
                                            '${functions.calculateHour(widget!.invdoc?.checkInTime, getCurrentTimestamp.millisecondsSinceEpoch).toString()}Mins',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmallFamily,
                                                  fontSize: 30.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(FlutterFlowTheme
                                                              .of(context)
                                                          .headlineSmallFamily),
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          7.0, 0.0, 0.0, 0.0),
                                      child: Container(
                                        width: 250.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 3.0, 0.0),
                                          child: Text(
                                            '₹ ${valueOrDefault<String>(
                                              widget!.invdoc?.finalBillAmt
                                                  ?.toString(),
                                              '0000',
                                            )}',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmallFamily,
                                                  fontSize: 30.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(FlutterFlowTheme
                                                              .of(context)
                                                          .headlineSmallFamily),
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      30.0, 0.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () async {
                                          var _shouldSetState = false;

                                          await widget!.invdoc!.reference
                                              .update(createInvoiceRecordData(
                                            checkOutTime: getCurrentTimestamp
                                                .millisecondsSinceEpoch,
                                            billAmt: valueOrDefault<double>(
                                              functions.calculateParkingCharges(
                                                  widget!.invdoc?.billAmt,
                                                  widget!.invdoc?.checkInTime,
                                                  getCurrentTimestamp
                                                      .millisecondsSinceEpoch),
                                              0.0,
                                            ),
                                            finalBillAmt:
                                                valueOrDefault<double>(
                                              functions.calculateParkingCharges(
                                                  widget!.invdoc?.billAmt,
                                                  widget!.invdoc?.checkInTime,
                                                  getCurrentTimestamp
                                                      .millisecondsSinceEpoch),
                                              0.0,
                                            ),
                                            duration: valueOrDefault<double>(
                                              functions.calculateHour(
                                                  widget!.invdoc?.checkInTime,
                                                  getCurrentTimestamp
                                                      .millisecondsSinceEpoch),
                                              0.0,
                                            ),
                                          ));
                                          _model.docinvqr =
                                              await queryInvoiceRecordOnce(
                                            parent: FFAppState().outletIdRef,
                                            queryBuilder: (invoiceRecord) =>
                                                invoiceRecord.where(
                                              'id',
                                              isEqualTo: widget!.invdoc?.id,
                                            ),
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);
                                          _shouldSetState = true;
                                          if (!functions.isPrinterSelected(
                                              FFAppState().printerDevice)!) {
                                            _model.resDevice2qr =
                                                await actions.scanPrinter(
                                              FFAppState().posMode,
                                            );
                                            _shouldSetState = true;
                                          }
                                          _model.connectdeviceqr =
                                              await actions.connectDevice(
                                            FFAppState().printerDevice,
                                            FFAppState().printerIndex,
                                          );
                                          _shouldSetState = true;
                                          if (FFAppState().printerName !=
                                                  null &&
                                              FFAppState().printerName != '') {
                                            _model.returnedList2qr2 =
                                                await actions.selectBillPrint(
                                              FFAppState().selBill.toString(),
                                              FFAppState()
                                                  .allBillsList
                                                  .toList(),
                                            );
                                            _shouldSetState = true;
                                            _model.deviceqr =
                                                await actions.newCustomAction(
                                              FFAppState().printerIndex,
                                            );
                                            _shouldSetState = true;
                                            _model.outletdocqr =
                                                await queryOutletRecordOnce(
                                              queryBuilder: (outletRecord) =>
                                                  outletRecord.where(
                                                'id',
                                                isEqualTo: FFAppState()
                                                    .outletIdRef
                                                    ?.id,
                                              ),
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);
                                            _shouldSetState = true;
                                            await actions.printBillParking(
                                              _model.deviceqr!.toList(),
                                              FFAppState().isPrinterConnected,
                                              FFAppState().printerName,
                                              getJsonField(
                                                functions.outletDocToJson(
                                                    _model.outletdocqr!),
                                                r'''$''',
                                              ),
                                              _model.docinvqr!,
                                              FFAppState().paperSize,
                                            );
                                            await actions.removeFromAllBillList(
                                              FFAppState().selBill,
                                            );
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  content: Text(
                                                      'Check Out SuccessFull!'),
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
                                            Navigator.pop(context);

                                            context.pushNamed(
                                              'ParkingCustomers',
                                              queryParameters: {
                                                'shiftDoc': serializeParam(
                                                  widget!.shiftdoc,
                                                  ParamType.JSON,
                                                ),
                                                'userRef': serializeParam(
                                                  widget!.usrref,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );

                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text(
                                                      'printer connection'),
                                                  content: Text(
                                                      'printer not connected'),
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

                                          if (_shouldSetState) setState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'z8r7uzgt' /* Print */,
                                        ),
                                        icon: Icon(
                                          Icons.print_outlined,
                                          size: 18.0,
                                        ),
                                        options: FFButtonOptions(
                                          height: 36.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .parkingPrimary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                              ),
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          await widget!.invdoc!.reference
                                              .update(createInvoiceRecordData(
                                            checkOutTime: getCurrentTimestamp
                                                .millisecondsSinceEpoch,
                                            billAmt: valueOrDefault<double>(
                                              functions.calculateParkingCharges(
                                                  widget!.invdoc?.billAmt,
                                                  widget!.invdoc?.checkInTime,
                                                  getCurrentTimestamp
                                                      .millisecondsSinceEpoch),
                                              0.0,
                                            ),
                                            finalBillAmt:
                                                valueOrDefault<double>(
                                              functions.calculateParkingCharges(
                                                  widget!.invdoc?.billAmt,
                                                  widget!.invdoc?.checkInTime,
                                                  getCurrentTimestamp
                                                      .millisecondsSinceEpoch),
                                              0.0,
                                            ),
                                            duration: valueOrDefault<double>(
                                              functions.calculateHour(
                                                  widget!.invdoc?.checkInTime,
                                                  getCurrentTimestamp
                                                      .millisecondsSinceEpoch),
                                              0.0,
                                            ),
                                          ));
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                content: Text(
                                                    'Check Out SuccessFull!'),
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
                                          Navigator.pop(context);

                                          context.pushNamed(
                                            'ParkingCustomers',
                                            queryParameters: {
                                              'shiftDoc': serializeParam(
                                                widget!.shiftdoc,
                                                ParamType.JSON,
                                              ),
                                              'userRef': serializeParam(
                                                widget!.usrref,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'euhj94bh' /* CheckOut & Save */,
                                        ),
                                        options: FFButtonOptions(
                                          height: 36.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .parkingSecondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                              ),
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
