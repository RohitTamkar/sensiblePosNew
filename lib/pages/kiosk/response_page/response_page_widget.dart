import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/transaction_status/transaction_status_widget.dart';
import '/components/transaction_status_failed/transaction_status_failed_widget.dart';
import '/components/transaction_status_pending/transaction_status_pending_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'response_page_model.dart';
export 'response_page_model.dart';

class ResponsePageWidget extends StatefulWidget {
  const ResponsePageWidget({
    super.key,
    this.doc,
    this.shiftdetails,
    this.appsetting,
    this.taxcoollectipon,
  });

  final QrTransactionsRecord? doc;
  final dynamic shiftdetails;
  final AppSettingsRecord? appsetting;
  final List<TaxMasterRecord>? taxcoollectipon;

  static String routeName = 'responsePage';
  static String routePath = 'responsePage';

  @override
  State<ResponsePageWidget> createState() => _ResponsePageWidgetState();
}

class _ResponsePageWidgetState extends State<ResponsePageWidget>
    with TickerProviderStateMixin {
  late ResponsePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResponsePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.shiftDetailsneweb = await actions.shiftExists(
        functions.getDayId(),
        '0',
        FFAppState().outletIdRef!.id,
      );
      FFAppState().shiftDetailsNEw = _model.shiftDetailsneweb!;
      FFAppState().msg = widget!.doc!.msg;
      safeSetState(() {});
      FFAppState().shiftDetailsJson = _model.shiftDetailsneweb!;
      FFAppState().kioskAmt = FFAppState().finalAmt;
      safeSetState(() {});
      FFAppState().shiftexist = 'True';
      safeSetState(() {});
      if (!FFAppState().isBillPrinted) {
        if (widget!.doc!.status) {
          _model.invoicecount = await queryInvoiceRecordOnce(
            parent: FFAppState().outletIdRef,
            queryBuilder: (invoiceRecord) => invoiceRecord
                .where(
                  'source',
                  isEqualTo: 'KIOSK',
                )
                .orderBy('invoiceDate', descending: true),
            singleRecord: true,
          ).then((s) => s.firstOrNull);
          if (widget!.appsetting!.settingList
              .where((e) => e.title == 'resetserialNoDaily')
              .toList()
              .firstOrNull!
              .value) {
            if ((_model.invoicecount?.count != null) &&
                (_model.invoicecount?.shiftId ==
                    getJsonField(
                      _model.shiftDetailsneweb,
                      r'''$.shiftId''',
                    ).toString().toString())) {
              FFAppState().count = _model.invoicecount!.count;
              safeSetState(() {});
            } else {
              FFAppState().count = 500;
              safeSetState(() {});
            }
          } else {
            if (_model.invoicecount?.count != null) {
              FFAppState().count = _model.invoicecount!.count;
              safeSetState(() {});
            } else {
              FFAppState().count = 0;
              safeSetState(() {});
            }
          }

          _model.prdListkiosk = await actions.filterProducts(
            FFAppState().selBill,
            FFAppState().allBillsList.toList(),
          );
          FFAppState().count = FFAppState().count + 1;
          safeSetState(() {});

          var invoiceRecordReference =
              InvoiceRecord.createDoc(FFAppState().outletIdRef!);
          await invoiceRecordReference.set({
            ...createInvoiceRecordData(
              invoice: FFAppState().paytmOrderId,
              party: FFAppState().setCustName,
              invoiceDate: functions.timestampToMili(getCurrentTimestamp),
              dayId: functions.getDayId(),
              paymentMode: FFAppState().PayMode,
              discountAmt: valueOrDefault<double>(
                FFAppState().disAmt,
                0.0,
              ),
              discountPer: valueOrDefault<double>(
                FFAppState().disPer,
                0.0,
              ),
              delliveryChrg: widget!.appsetting!.settingList
                      .where((e) => e.title == 'qtyWiseParcelCharges')
                      .toList()
                      .firstOrNull!
                      .value
                  ? (FFAppState().delCharges * FFAppState().parcelqty)
                  : (FFAppState().delCharges * FFAppState().noOfItems),
              taxAmt: valueOrDefault<double>(
                FFAppState().taxamt,
                0.0,
              ),
              billAmt: valueOrDefault<double>(
                FFAppState().billAmt,
                0.0,
              ),
              finalBillAmt: valueOrDefault<double>(
                FFAppState().finalAmt,
                0.0,
              ),
              roundOff: 0.0,
              shiftId: getJsonField(
                FFAppState().shiftDetailsJson,
                r'''$.shiftId''',
              ).toString().toString(),
              orderType: FFAppState().orderType,
              kotStatus: 'PENDING',
              count: FFAppState().count,
              source: 'KIOSK',
              isDeleted: false,
            ),
            ...mapToFirestore(
              {
                'productList': getSelItemListListFirestoreData(
                  _model.prdListkiosk,
                ),
              },
            ),
          });
          _model.docInvoicekiosk = InvoiceRecord.getDocumentFromData({
            ...createInvoiceRecordData(
              invoice: FFAppState().paytmOrderId,
              party: FFAppState().setCustName,
              invoiceDate: functions.timestampToMili(getCurrentTimestamp),
              dayId: functions.getDayId(),
              paymentMode: FFAppState().PayMode,
              discountAmt: valueOrDefault<double>(
                FFAppState().disAmt,
                0.0,
              ),
              discountPer: valueOrDefault<double>(
                FFAppState().disPer,
                0.0,
              ),
              delliveryChrg: widget!.appsetting!.settingList
                      .where((e) => e.title == 'qtyWiseParcelCharges')
                      .toList()
                      .firstOrNull!
                      .value
                  ? (FFAppState().delCharges * FFAppState().parcelqty)
                  : (FFAppState().delCharges * FFAppState().noOfItems),
              taxAmt: valueOrDefault<double>(
                FFAppState().taxamt,
                0.0,
              ),
              billAmt: valueOrDefault<double>(
                FFAppState().billAmt,
                0.0,
              ),
              finalBillAmt: valueOrDefault<double>(
                FFAppState().finalAmt,
                0.0,
              ),
              roundOff: 0.0,
              shiftId: getJsonField(
                FFAppState().shiftDetailsJson,
                r'''$.shiftId''',
              ).toString().toString(),
              orderType: FFAppState().orderType,
              kotStatus: 'PENDING',
              count: FFAppState().count,
              source: 'KIOSK',
              isDeleted: false,
            ),
            ...mapToFirestore(
              {
                'productList': getSelItemListListFirestoreData(
                  _model.prdListkiosk,
                ),
              },
            ),
          }, invoiceRecordReference);

          await _model.docInvoicekiosk!.reference
              .update(createInvoiceRecordData(
            id: _model.docInvoicekiosk?.reference.id,
          ));
          if (getJsonField(
            FFAppState().shiftDetailsJson,
            r'''$.shiftExists''',
          )) {
            FFAppState().billcount = getJsonField(
              _model.shiftDetailsneweb,
              r'''$.billCount''',
            );
            safeSetState(() {});
            FFAppState().billcount = FFAppState().billcount + 1;
            safeSetState(() {});
            _model.shiftSummarRkiosk = await actions.calShiftSummary(
              _model.docInvoicekiosk!,
              FFAppState().shiftDetailsJson,
            );
            _model.shiftref = await queryShiftRecordOnce(
              parent: FFAppState().outletIdRef,
              queryBuilder: (shiftRecord) => shiftRecord.where(
                'shiftId',
                isEqualTo: getJsonField(
                  FFAppState().shiftDetailsJson,
                  r'''$.shiftId''',
                ).toString().toString(),
              ),
              singleRecord: true,
            ).then((s) => s.firstOrNull);

            await _model.shiftref!.reference.update(createShiftRecordData(
              billCount: FFAppState().billcount,
              totalSale: getJsonField(
                _model.shiftSummarRkiosk,
                r'''$.totalSale''',
              ),
              deliveryCharges: getJsonField(
                _model.shiftSummarRkiosk,
                r'''$.deliveryCharges''',
              ),
              tax: getJsonField(
                _model.shiftSummarRkiosk,
                r'''$.tax''',
              ),
              lastBillNo: getJsonField(
                _model.shiftSummarRkiosk,
                r'''$.lastBillNo''',
              ).toString().toString(),
              discount: getJsonField(
                _model.shiftSummarRkiosk,
                r'''$.discount''',
              ),
              lastBillTime: functions.timestampToMili(getCurrentTimestamp),
              cashSale: getJsonField(
                _model.shiftSummarRkiosk,
                r'''$.cashSale''',
              ),
              paymentJson: getJsonField(
                _model.shiftSummarRkiosk,
                r'''$.paymentJson''',
              ).toString().toString(),
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Login again to start Shift ',
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                duration: Duration(milliseconds: 4000),
                backgroundColor: Color(0x00000000),
              ),
            );
            return;
          }

          if (!functions.isPrinterSelected(FFAppState().printerDevice)!) {
            _model.resDevice2 = await actions.scanPrinter(
              FFAppState().posMode,
            );
          }
          _model.isConnected = await actions.connectDevice(
            FFAppState().printerDevice,
            FFAppState().printerIndex,
          );
          if (_model.isConnected!) {
            FFAppState().lastBill = FFAppState().finalAmt;
            FFAppState().update(() {});
            await Future.delayed(const Duration(milliseconds: 500));
            _model.returnedList2kiosk = await actions.selectBillPrint(
              FFAppState().selBill.toString(),
              FFAppState().allBillsList.toList(),
            );
            _model.device = await actions.newCustomAction(
              FFAppState().printerIndex,
            );
            _model.appsetting = await queryAppSettingsRecordOnce(
              parent: FFAppState().outletIdRef,
              queryBuilder: (appSettingsRecord) => appSettingsRecord.where(
                'deviceId',
                isEqualTo: FFAppState().dId,
              ),
              singleRecord: true,
            ).then((s) => s.firstOrNull);
            _model.outletdoc = await queryOutletRecordOnce(
              queryBuilder: (outletRecord) => outletRecord.where(
                'id',
                isEqualTo: FFAppState().outletIdRef?.id,
              ),
              singleRecord: true,
            ).then((s) => s.firstOrNull);
            if (_model.appsetting!.settingList
                .where((e) => e.title == 'printBillFormatTwo')
                .toList()
                .firstOrNull!
                .value) {
              await actions.printBillFormatTwo(
                _model.returnedList2kiosk!.toList(),
                _model.device!.toList(),
                FFAppState().isPrinterConnected,
                FFAppState().printerName,
                functions.outletDocToJson(_model.outletdoc!),
                _model.docInvoicekiosk!,
                FFAppState().paperSize,
                _model.appsetting!,
              );
            } else {
              await actions.printBill(
                _model.returnedList2kiosk!.toList(),
                _model.device!.toList(),
                FFAppState().isPrinterConnected,
                FFAppState().printerName,
                functions.outletDocToJson(_model.outletdoc!),
                _model.docInvoicekiosk!,
                FFAppState().paperSize,
                _model.appsetting!,
              );
            }

            _model.spoutlet = await queryServicePointOutletRecordOnce(
              parent: FFAppState().outletIdRef,
            );
            if (_model.appsetting!.settingList
                .where((e) => e.title == 'printKotWithBill')
                .toList()
                .firstOrNull!
                .value) {
              await actions.printKOTwithusbkiosk(
                _model.returnedList2kiosk!.toList(),
                _model.device!.toList(),
                FFAppState().isPrinterConnected,
                FFAppState().printerName,
                functions.outletDocToJson(_model.outletdoc!),
                _model.docInvoicekiosk!,
                FFAppState().paperSize,
                _model.appsetting!,
                FFAppState().port,
                FFAppState().ipAddresss,
                _model.spoutlet!.toList(),
              );
            }
            if (_model.appsetting!.settingList
                .where((e) => e.title == 'enableEthernetPrint')
                .toList()
                .firstOrNull!
                .value) {
              await actions.printEthernet(
                _model.returnedList2kiosk!.toList(),
                _model.device!.toList(),
                FFAppState().isPrinterConnected,
                FFAppState().printerName,
                functions.outletDocToJson(_model.outletdoc!),
                _model.docInvoicekiosk!,
                '3 inch',
                FFAppState().port,
                FFAppState().ipAddresss,
                _model.spoutlet!.toList(),
                _model.appsetting!,
              );
            }
            if (widget!.appsetting!.settingList
                .where((e) => e.title == 'enableStock')
                .toList()
                .firstOrNull!
                .value) {
              FFAppState().startLoop = 0;
              safeSetState(() {});
              while (FFAppState().startLoop < _model.prdListkiosk!.length) {
                _model.stockupdateprd = await queryProductRecordOnce(
                  parent: FFAppState().outletIdRef,
                  queryBuilder: (productRecord) => productRecord
                      .where(
                        'id',
                        isEqualTo: (_model.prdListkiosk
                                ?.elementAtOrNull(FFAppState().startLoop))
                            ?.id,
                      )
                      .where(
                        'stockable',
                        isEqualTo: true,
                      ),
                  singleRecord: true,
                ).then((s) => s.firstOrNull);
                if (_model.stockupdateprd != null) {
                  await _model.stockupdateprd!.reference.update({
                    ...mapToFirestore(
                      {
                        'currentStock': FieldValue.increment(
                            -(functions.doubleToInt((_model.prdListkiosk
                                    ?.elementAtOrNull(FFAppState().startLoop))
                                ?.quantity)!)),
                      },
                    ),
                  });
                }
                FFAppState().startLoop = FFAppState().startLoop + 1;
                safeSetState(() {});
              }
            }
            await actions.removeFromAllBillList(
              FFAppState().selBill,
            );
            await actions.clearValue();
            FFAppState().subTotal = 0.0;
            FFAppState().update(() {});
            FFAppState().finalAmt = 0.0;
            FFAppState().billAmt = 0.0;
            FFAppState().count = FFAppState().count;
            FFAppState().cartItem = [];
            FFAppState().isBillPrinted = true;
            FFAppState().noOfItems = 0;
            FFAppState().delCharges = 0.0;
            FFAppState().update(() {});
            _model.taxmaster = await queryTaxMasterRecordOnce();
            if (_model.appsetting!.settingList
                .where((e) => e.title == 'navigateMenuscreen')
                .toList()
                .firstOrNull!
                .value) {
              if (_model.appsetting!.settingList
                  .where((e) => e.title == 'hideDineInScreen')
                  .toList()
                  .firstOrNull!
                  .value) {
                context.goNamed(
                  KioskBillScreenWidget.routeName,
                  queryParameters: {
                    'doc': serializeParam(
                      _model.outletdoc?.userRef,
                      ParamType.DocumentReference,
                    ),
                    'shiftdoc': serializeParam(
                      _model.shiftSummarRkiosk,
                      ParamType.JSON,
                    ),
                    'appsetting': serializeParam(
                      _model.appsetting,
                      ParamType.Document,
                    ),
                    'taxcollection': serializeParam(
                      _model.taxmaster,
                      ParamType.Document,
                      isList: true,
                    ),
                  }.withoutNulls,
                  extra: <String, dynamic>{
                    'appsetting': _model.appsetting,
                    'taxcollection': _model.taxmaster,
                  },
                );
              } else {
                context.goNamed(
                  KioskDineParcelWidget.routeName,
                  queryParameters: {
                    'userdoc': serializeParam(
                      _model.outletdoc?.userRef,
                      ParamType.DocumentReference,
                    ),
                    'shiftdoc': serializeParam(
                      _model.shiftSummarRkiosk,
                      ParamType.JSON,
                    ),
                    'appSetting': serializeParam(
                      _model.appsetting,
                      ParamType.Document,
                    ),
                    'taxcollection': serializeParam(
                      _model.taxmaster,
                      ParamType.Document,
                      isList: true,
                    ),
                  }.withoutNulls,
                  extra: <String, dynamic>{
                    'appSetting': _model.appsetting,
                    'taxcollection': _model.taxmaster,
                  },
                );
              }
            } else {
              context.goNamed(
                KioskAdvertisingWidget.routeName,
                queryParameters: {
                  'userDoc': serializeParam(
                    _model.outletdoc?.userRef,
                    ParamType.DocumentReference,
                  ),
                  'shiftdoc': serializeParam(
                    _model.shiftSummarRkiosk,
                    ParamType.JSON,
                  ),
                  'appsetting': serializeParam(
                    _model.appsetting,
                    ParamType.Document,
                  ),
                  'taxcollection': serializeParam(
                    _model.taxmaster,
                    ParamType.Document,
                    isList: true,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  'appsetting': _model.appsetting,
                  'taxcollection': _model.taxmaster,
                },
              );
            }

            return;
          } else {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return AlertDialog(
                  title: Text('printer connection'),
                  content: Text('printer not connected'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: Text('Ok'),
                    ),
                  ],
                );
              },
            );

            context.pushNamed(PrintSettingkioskWidget.routeName);
          }
        } else {
          await Future.delayed(const Duration(milliseconds: 2000));
          _model.taxmaster2 = await queryTaxMasterRecordOnce();
          _model.outletdoc2 = await queryOutletRecordOnce(
            queryBuilder: (outletRecord) => outletRecord.where(
              'id',
              isEqualTo: FFAppState().outletIdRef?.id,
            ),
            singleRecord: true,
          ).then((s) => s.firstOrNull);
          _model.appsetting1 = await queryAppSettingsRecordOnce(
            parent: FFAppState().outletIdRef,
            queryBuilder: (appSettingsRecord) => appSettingsRecord.where(
              'deviceId',
              isEqualTo: FFAppState().dId,
            ),
            singleRecord: true,
          ).then((s) => s.firstOrNull);
          _model.rm = await actions.removeFromAllBillList(
            FFAppState().selBill,
          );
          await actions.clearValue();
          FFAppState().subTotal = 0.0;
          FFAppState().update(() {});
          FFAppState().finalAmt = 0.0;
          FFAppState().billAmt = 0.0;
          FFAppState().count = FFAppState().count;
          FFAppState().cartItem = [];
          FFAppState().isBillPrinted = true;
          FFAppState().noOfItems = 0;
          FFAppState().delCharges = 0.0;
          FFAppState().update(() {});
          if (_model.appsetting1!.settingList
              .where((e) => e.title == 'navigateMenuscreen')
              .toList()
              .firstOrNull!
              .value) {
            if (_model.appsetting1!.settingList
                .where((e) => e.title == 'hideDineInScreen')
                .toList()
                .firstOrNull!
                .value) {
              context.goNamed(
                KioskBillScreenWidget.routeName,
                queryParameters: {
                  'doc': serializeParam(
                    _model.outletdoc?.userRef,
                    ParamType.DocumentReference,
                  ),
                  'shiftdoc': serializeParam(
                    widget!.shiftdetails,
                    ParamType.JSON,
                  ),
                  'appsetting': serializeParam(
                    _model.appsetting1,
                    ParamType.Document,
                  ),
                  'taxcollection': serializeParam(
                    _model.taxmaster2,
                    ParamType.Document,
                    isList: true,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  'appsetting': _model.appsetting1,
                  'taxcollection': _model.taxmaster2,
                },
              );
            } else {
              context.goNamed(
                KioskDineParcelWidget.routeName,
                queryParameters: {
                  'userdoc': serializeParam(
                    _model.outletdoc?.userRef,
                    ParamType.DocumentReference,
                  ),
                  'shiftdoc': serializeParam(
                    widget!.shiftdetails,
                    ParamType.JSON,
                  ),
                  'appSetting': serializeParam(
                    _model.appsetting1,
                    ParamType.Document,
                  ),
                  'taxcollection': serializeParam(
                    _model.taxmaster2,
                    ParamType.Document,
                    isList: true,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  'appSetting': _model.appsetting1,
                  'taxcollection': _model.taxmaster2,
                },
              );
            }
          } else {
            context.goNamed(
              KioskAdvertisingWidget.routeName,
              queryParameters: {
                'userDoc': serializeParam(
                  _model.outletdoc?.userRef,
                  ParamType.DocumentReference,
                ),
                'shiftdoc': serializeParam(
                  widget!.shiftdetails,
                  ParamType.JSON,
                ),
                'appsetting': serializeParam(
                  _model.appsetting1,
                  ParamType.Document,
                ),
                'taxcollection': serializeParam(
                  _model.taxmaster2,
                  ParamType.Document,
                  isList: true,
                ),
              }.withoutNulls,
              extra: <String, dynamic>{
                'appsetting': _model.appsetting1,
                'taxcollection': _model.taxmaster2,
              },
            );
          }
        }
      } else {
        return;
      }
    });

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'transactionStatusOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'transactionStatusFailedOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'transactionStatusPendingOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
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
        title: 'responsePage',
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
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget!.doc?.status ?? true)
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            50.0, 50.0, 50.0, 50.0),
                        child: Container(
                          width: double.infinity,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(6.0),
                              bottomRight: Radius.circular(6.0),
                              topLeft: Radius.circular(6.0),
                              topRight: Radius.circular(6.0),
                            ),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).tertiary,
                              width: 2.0,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 75.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'y4rnysxj' /* Thank You ! */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .displayLarge
                                      .override(
                                        font: FlutterFlowTheme.of(context)
                                            .displayLarge,
                                        color: FlutterFlowTheme.of(context)
                                            .success,
                                        fontSize: 36.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.italic,
                                      ),
                                ).animateOnPageLoad(
                                    animationsMap['textOnPageLoadAnimation']!),
                              ),
                              wrapWithModel(
                                model: _model.transactionStatusModel,
                                updateCallback: () => safeSetState(() {}),
                                child: TransactionStatusWidget(
                                  doc: widget!.doc,
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'transactionStatusOnPageLoadAnimation']!),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  var _shouldSetState = false;
                                  if (!functions.isPrinterSelected(
                                      FFAppState().printerDevice)!) {
                                    _model.resDevice2Copy1 =
                                        await actions.scanPrinter(
                                      FFAppState().posMode,
                                    );
                                    _shouldSetState = true;
                                  }
                                  _model.isConnectedCopy =
                                      await actions.connectDevice(
                                    FFAppState().printerDevice,
                                    FFAppState().printerIndex,
                                  );
                                  _shouldSetState = true;
                                  if (_model.isConnectedCopy!) {
                                    FFAppState().lastBill =
                                        FFAppState().finalAmt;
                                    FFAppState().update(() {});
                                    _model.returnedList2kioskCopy =
                                        await actions.selectBillPrint(
                                      FFAppState().selBill.toString(),
                                      FFAppState().allBillsList.toList(),
                                    );
                                    _shouldSetState = true;
                                    _model.deviceCopy =
                                        await actions.newCustomAction(
                                      FFAppState().printerIndex,
                                    );
                                    _shouldSetState = true;
                                    _model.appsettingCopy =
                                        await queryAppSettingsRecordOnce(
                                      parent: FFAppState().outletIdRef,
                                      queryBuilder: (appSettingsRecord) =>
                                          appSettingsRecord.where(
                                        'deviceId',
                                        isEqualTo: FFAppState().dId,
                                      ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    _shouldSetState = true;
                                    _model.outletdocCopy =
                                        await queryOutletRecordOnce(
                                      queryBuilder: (outletRecord) =>
                                          outletRecord.where(
                                        'id',
                                        isEqualTo: FFAppState().outletIdRef?.id,
                                      ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    _shouldSetState = true;
                                    if (_model.appsetting!.settingList
                                        .where((e) =>
                                            e.title == 'printBillFormatTwo')
                                        .toList()
                                        .firstOrNull!
                                        .value) {
                                      await actions.printBillFormatTwo(
                                        _model.returnedList2kioskCopy!.toList(),
                                        _model.deviceCopy!.toList(),
                                        FFAppState().isPrinterConnected,
                                        FFAppState().printerName,
                                        functions.outletDocToJson(
                                            _model.outletdocCopy!),
                                        _model.docInvoicekiosk!,
                                        FFAppState().paperSize,
                                        _model.appsettingCopy!,
                                      );
                                    } else {
                                      await actions.printBill(
                                        _model.returnedList2kioskCopy!.toList(),
                                        _model.deviceCopy!.toList(),
                                        FFAppState().isPrinterConnected,
                                        FFAppState().printerName,
                                        functions.outletDocToJson(
                                            _model.outletdocCopy!),
                                        _model.docInvoicekiosk!,
                                        FFAppState().paperSize,
                                        _model.appsettingCopy!,
                                      );
                                    }

                                    _model.spoutletCopy =
                                        await queryServicePointOutletRecordOnce(
                                      parent: FFAppState().outletIdRef,
                                    );
                                    _shouldSetState = true;
                                    if (_model.appsettingCopy!.settingList
                                        .where((e) =>
                                            e.title == 'printKotWithBill')
                                        .toList()
                                        .firstOrNull!
                                        .value) {
                                      await actions.printKOTwithusbkiosk(
                                        _model.returnedList2kioskCopy!.toList(),
                                        _model.deviceCopy!.toList(),
                                        FFAppState().isPrinterConnected,
                                        FFAppState().printerName,
                                        functions.outletDocToJson(
                                            _model.outletdocCopy!),
                                        _model.docInvoicekiosk!,
                                        FFAppState().paperSize,
                                        _model.appsettingCopy!,
                                        FFAppState().port,
                                        FFAppState().ipAddresss,
                                        _model.spoutletCopy!.toList(),
                                      );
                                    }
                                    if (_model.appsettingCopy!.settingList
                                        .where((e) =>
                                            e.title == 'enableEthernetPrint')
                                        .toList()
                                        .firstOrNull!
                                        .value) {
                                      await actions.printEthernet(
                                        _model.returnedList2kioskCopy!.toList(),
                                        _model.deviceCopy!.toList(),
                                        FFAppState().isPrinterConnected,
                                        FFAppState().printerName,
                                        functions.outletDocToJson(
                                            _model.outletdocCopy!),
                                        _model.docInvoicekiosk!,
                                        '3 inch',
                                        FFAppState().port,
                                        FFAppState().ipAddresss,
                                        _model.spoutletCopy!.toList(),
                                        _model.appsettingCopy!,
                                      );
                                    }
                                    await actions.removeFromAllBillList(
                                      FFAppState().selBill,
                                    );
                                    await actions.clearValue();
                                    FFAppState().subTotal = 0.0;
                                    FFAppState().update(() {});
                                    FFAppState().finalAmt = 0.0;
                                    FFAppState().billAmt = 0.0;
                                    FFAppState().count = FFAppState().count;
                                    FFAppState().cartItem = [];
                                    FFAppState().isBillPrinted = true;
                                    FFAppState().noOfItems = 0;
                                    FFAppState().update(() {});
                                    _model.taxmasterCopy =
                                        await queryTaxMasterRecordOnce();
                                    _shouldSetState = true;
                                    _model.shiftDetailsNewresumed =
                                        await actions.shiftExists(
                                      functions.getDayId(),
                                      '0',
                                      FFAppState().outletIdRef!.id,
                                    );
                                    _shouldSetState = true;

                                    context.pushNamed(
                                      KioskDineParcelWidget.routeName,
                                      queryParameters: {
                                        'userdoc': serializeParam(
                                          _model.outletdocCopy?.userRef,
                                          ParamType.DocumentReference,
                                        ),
                                        'shiftdoc': serializeParam(
                                          _model.shiftDetailsNewresumed,
                                          ParamType.JSON,
                                        ),
                                        'appSetting': serializeParam(
                                          _model.appsettingCopy,
                                          ParamType.Document,
                                        ),
                                        'taxcollection': serializeParam(
                                          _model.taxmasterCopy,
                                          ParamType.Document,
                                          isList: true,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'appSetting': _model.appsettingCopy,
                                        'taxcollection': _model.taxmasterCopy,
                                      },
                                    );

                                    if (_shouldSetState) safeSetState(() {});
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
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );

                                    context.pushNamed(
                                        PrintSettingkioskWidget.routeName);
                                  }

                                  if (_shouldSetState) safeSetState(() {});
                                },
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'hbnondbb' /* If bill is not printed click h... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (!widget!.doc!.status)
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            50.0, 50.0, 50.0, 50.0),
                        child: Container(
                          width: double.infinity,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(6.0),
                              bottomRight: Radius.circular(6.0),
                              topLeft: Radius.circular(6.0),
                              topRight: Radius.circular(6.0),
                            ),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).tertiary,
                              width: 2.0,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              wrapWithModel(
                                model: _model.transactionStatusFailedModel,
                                updateCallback: () => safeSetState(() {}),
                                child: TransactionStatusFailedWidget(),
                              ).animateOnPageLoad(animationsMap[
                                  'transactionStatusFailedOnPageLoadAnimation']!),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (widget!.doc?.resultStatus == 'PENDING')
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            50.0, 50.0, 50.0, 50.0),
                        child: Container(
                          width: double.infinity,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(6.0),
                              bottomRight: Radius.circular(6.0),
                              topLeft: Radius.circular(6.0),
                              topRight: Radius.circular(6.0),
                            ),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).tertiary,
                              width: 2.0,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              wrapWithModel(
                                model: _model.transactionStatusPendingModel,
                                updateCallback: () => safeSetState(() {}),
                                child: TransactionStatusPendingWidget(),
                              ).animateOnPageLoad(animationsMap[
                                  'transactionStatusPendingOnPageLoadAnimation']!),
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
