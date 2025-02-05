import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_mode_grocery_print_model.dart';
export 'payment_mode_grocery_print_model.dart';

class PaymentModeGroceryPrintWidget extends StatefulWidget {
  const PaymentModeGroceryPrintWidget({
    super.key,
    this.paymentMode,
  });

  final List<PaymentModeRecord>? paymentMode;

  @override
  State<PaymentModeGroceryPrintWidget> createState() =>
      _PaymentModeGroceryPrintWidgetState();
}

class _PaymentModeGroceryPrintWidgetState
    extends State<PaymentModeGroceryPrintWidget> {
  late PaymentModeGroceryPrintModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentModeGroceryPrintModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.amount = FFAppState().finalAmt.toString();
      safeSetState(() {});
      FFAppState().PayMode = 'CASH';
      safeSetState(() {});
      safeSetState(() {
        _model.textController1?.text = _model.amount!;
      });
    });

    _model.textController1 ??= TextEditingController(text: _model.amount);
    _model.textFieldFocusNode ??= FocusNode();

    _model.textFielddisperTextController ??= TextEditingController();
    _model.textFielddisperFocusNode ??= FocusNode();

    _model.textFielddisamtTextController ??= TextEditingController();
    _model.textFielddisamtFocusNode ??= FocusNode();

    _model.textFieldgstperTextController ??= TextEditingController();
    _model.textFieldgstperFocusNode ??= FocusNode();

    _model.textFieldextraTextController ??= TextEditingController();
    _model.textFieldextraFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.textFielddisperTextController?.text =
              FFLocalizations.of(context).getText(
            'pc5k09cw' /* 0 */,
          );
          _model.textFielddisamtTextController?.text =
              FFLocalizations.of(context).getText(
            'cabgtzyy' /* 0 */,
          );
          _model.textFieldgstperTextController?.text =
              FFLocalizations.of(context).getText(
            '44kpov35' /* 0 */,
          );
          _model.textFieldextraTextController?.text =
              FFLocalizations.of(context).getText(
            'x2539lvu' /* 0 */,
          );
        }));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Shortcuts(
      shortcuts: {
        SingleActivator(
          LogicalKeyboardKey.enter,
        ): VoidCallbackIntent(() async {
          var _shouldSetState = false;
          _model.result233 = await actions.calculateGroceryAmtaction(
            FFAppState().PayMode,
            valueOrDefault<double>(
              FFAppState().finalAmt,
              0.0,
            ),
            double.parse(_model.textController1.text),
          );
          _shouldSetState = true;
          FFAppState().groceryJson = _model.result233!;
          safeSetState(() {});
          _model.amount = '';
          _model.flag = true;
          safeSetState(() {});
          if ((FFAppState().finalAmt ==
                  getJsonField(
                    FFAppState().groceryJson,
                    r'''$.paidAmt''',
                  )) &&
              _model.flag) {
            if (getJsonField(
              FFAppState().shiftDetailsJson,
              r'''$.shiftExists''',
            )) {
              FFAppState().count = FFAppState().count + 1;
              FFAppState().newcount = FFAppState().newcount + 1;
              FFAppState().billcount = FFAppState().billcount + 1;
              safeSetState(() {});
            } else {
              FFAppState().count = FFAppState().count + 1;
              FFAppState().newcount = FFAppState().newcount + 1;
              FFAppState().billcount = FFAppState().billcount + 1;
              safeSetState(() {});
            }

            _model.flag = false;
            safeSetState(() {});
            _model.prdlinstnewtxCopy = await actions.filterProducts2(
              FFAppState().selBill,
              FFAppState().allBillsList.toList(),
            );
            _shouldSetState = true;
            _model.appsettingnewCopy = await queryAppSettingsRecordOnce(
              parent: FFAppState().outletIdRef,
              queryBuilder: (appSettingsRecord) => appSettingsRecord.where(
                'deviceId',
                isEqualTo: FFAppState().dId,
              ),
              singleRecord: true,
            ).then((s) => s.firstOrNull);
            _shouldSetState = true;
            _model.outletdocCopy = await queryOutletRecordOnce(
              queryBuilder: (outletRecord) => outletRecord.where(
                'id',
                isEqualTo: FFAppState().outletIdRef?.id,
              ),
              singleRecord: true,
            ).then((s) => s.firstOrNull);
            _shouldSetState = true;
            if ((double.parse(valueOrDefault<String>(
                  getJsonField(
                    FFAppState().groceryJson,
                    r'''$.paymentMode.CREDIT''',
                  )?.toString(),
                  '0',
                ))) >
                0.0) {
              if (FFAppState().setCustRef?.id != null &&
                  FFAppState().setCustRef?.id != '') {
                if (FFAppState().oldBalance < FFAppState().custCredit) {
                  _model.totalcreditCopy = await actions.oldbalanceplusamt(
                    FFAppState().oldBalance,
                    valueOrDefault<double>(
                      getJsonField(
                        FFAppState().groceryJson,
                        r'''$.paymentMode.CREDIT''',
                      ),
                      0.0,
                    ),
                  );
                  _shouldSetState = true;

                  await FFAppState().setCustRef!.update(createPartyRecordData(
                        credit: true,
                        oldBalance: _model.totalcreditCopy,
                        lastVisit: getCurrentTimestamp.millisecondsSinceEpoch
                            .toString(),
                      ));

                  var paymentRecordReference =
                      PaymentRecord.createDoc(FFAppState().outletIdRef!);
                  await paymentRecordReference.set(createPaymentRecordData(
                    amount: valueOrDefault<double>(
                      getJsonField(
                        FFAppState().groceryJson,
                        r'''$.paymentMode.CREDIT''',
                      ),
                      0.0,
                    ),
                    paymentType: 'CREDIT',
                    createdBy: FFAppState().userdoc,
                    createdDate: getCurrentTimestamp.millisecondsSinceEpoch,
                    party: FFAppState().setCustRef,
                    expenceType: 'Debit',
                    oldBalance: _model.totalcreditCopy,
                  ));
                  _model.paymentDoc22dCopy = PaymentRecord.getDocumentFromData(
                      createPaymentRecordData(
                        amount: valueOrDefault<double>(
                          getJsonField(
                            FFAppState().groceryJson,
                            r'''$.paymentMode.CREDIT''',
                          ),
                          0.0,
                        ),
                        paymentType: 'CREDIT',
                        createdBy: FFAppState().userdoc,
                        createdDate: getCurrentTimestamp.millisecondsSinceEpoch,
                        party: FFAppState().setCustRef,
                        expenceType: 'Debit',
                        oldBalance: _model.totalcreditCopy,
                      ),
                      paymentRecordReference);
                  _shouldSetState = true;
                } else {
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        content: Text('Credit Limit Exceeded !'),
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
              } else {
                await showDialog(
                  context: context,
                  builder: (alertDialogContext) {
                    return AlertDialog(
                      content: Text('Select Customer '),
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

            var invoiceRecordReference =
                InvoiceRecord.createDoc(FFAppState().outletIdRef!);
            await invoiceRecordReference.set({
              ...createInvoiceRecordData(
                invoice: functions.genInvoiceNumyear(FFAppState().newcount),
                party: valueOrDefault<String>(
                  FFAppState().setCustRef?.id,
                  'NA',
                ),
                products: '',
                invoiceDate: functions.timestampToMili(getCurrentTimestamp),
                paymentMode: getJsonField(
                  FFAppState().groceryJson,
                  r'''$.paymentMode''',
                ).toString(),
                dayId: functions.getDayId(),
                discountAmt: valueOrDefault<double>(
                  FFAppState().disAmt,
                  0.0,
                ),
                discountPer: valueOrDefault<double>(
                  FFAppState().disPer,
                  0.0,
                ),
                delliveryChrg: valueOrDefault<double>(
                  FFAppState().delCharges,
                  0.0,
                ),
                taxAmt: FFAppState().taxamt,
                billAmt: valueOrDefault<double>(
                  FFAppState().billAmt,
                  0.0,
                ),
                finalBillAmt: valueOrDefault<double>(
                  FFAppState().finalAmt,
                  0.0,
                ),
                shiftId: getJsonField(
                  FFAppState().shiftDetailsJson,
                  r'''$.shiftId''',
                ).toString(),
                count: FFAppState().newcount,
              ),
              ...mapToFirestore(
                {
                  'productList': getSelItemListListFirestoreData(
                    _model.prdlinstnewtxCopy,
                  ),
                },
              ),
            });
            _model.invonlineprtCopy = InvoiceRecord.getDocumentFromData({
              ...createInvoiceRecordData(
                invoice: functions.genInvoiceNumyear(FFAppState().newcount),
                party: valueOrDefault<String>(
                  FFAppState().setCustRef?.id,
                  'NA',
                ),
                products: '',
                invoiceDate: functions.timestampToMili(getCurrentTimestamp),
                paymentMode: getJsonField(
                  FFAppState().groceryJson,
                  r'''$.paymentMode''',
                ).toString(),
                dayId: functions.getDayId(),
                discountAmt: valueOrDefault<double>(
                  FFAppState().disAmt,
                  0.0,
                ),
                discountPer: valueOrDefault<double>(
                  FFAppState().disPer,
                  0.0,
                ),
                delliveryChrg: valueOrDefault<double>(
                  FFAppState().delCharges,
                  0.0,
                ),
                taxAmt: FFAppState().taxamt,
                billAmt: valueOrDefault<double>(
                  FFAppState().billAmt,
                  0.0,
                ),
                finalBillAmt: valueOrDefault<double>(
                  FFAppState().finalAmt,
                  0.0,
                ),
                shiftId: getJsonField(
                  FFAppState().shiftDetailsJson,
                  r'''$.shiftId''',
                ).toString(),
                count: FFAppState().newcount,
              ),
              ...mapToFirestore(
                {
                  'productList': getSelItemListListFirestoreData(
                    _model.prdlinstnewtxCopy,
                  ),
                },
              ),
            }, invoiceRecordReference);
            _shouldSetState = true;

            await _model.invonlineprtCopy!.reference
                .update(createInvoiceRecordData(
              id: _model.invonlineprtCopy?.reference.id,
            ));
            _model.hiveInvoiceDataCopy = await actions.addInvoiceBillhive(
              _model.invonlineprtCopy!.reference.id,
              functions.genInvoiceNumyear(FFAppState().newcount),
              valueOrDefault<String>(
                FFAppState().setCustRef?.id,
                '0',
              ),
              functions.timestampToMili(getCurrentTimestamp),
              functions.getDayId(),
              getJsonField(
                FFAppState().groceryJson,
                r'''$.paymentMode''',
              ).toString(),
              valueOrDefault<double>(
                FFAppState().disAmt,
                0.0,
              ),
              valueOrDefault<double>(
                FFAppState().disPer,
                0.0,
              ),
              valueOrDefault<double>(
                FFAppState().delCharges,
                0.0,
              ),
              FFAppState().taxamt,
              valueOrDefault<double>(
                FFAppState().billAmt,
                0.0,
              ),
              valueOrDefault<double>(
                FFAppState().finalAmt,
                0.0,
              ),
              0.0,
              _model.prdlinstnewtxCopy?.toList(),
              getJsonField(
                FFAppState().shiftDetailsJson,
                r'''$.shiftId''',
              ).toString(),
              false,
              FFAppState().invoiceStructVersion,
            );
            _shouldSetState = true;
            if (getJsonField(
              FFAppState().shiftDetailsJson,
              r'''$.shiftExists''',
            )) {
              _model.shiftSummarResultsNewCopy =
                  await actions.calShiftSummaryNewgrocery(
                _model.hiveInvoiceDataCopy!,
                FFAppState().shiftDetailsJson,
              );
              _shouldSetState = true;
              FFAppState().updateShiftDetailsStruct(
                (e) => e
                  ..billCount = FFAppState().billcount
                  ..totalSale = getJsonField(
                    _model.shiftSummarResultsNewCopy,
                    r'''$.totalSale''',
                  )
                  ..deliveryCharges = getJsonField(
                    _model.shiftSummarResultsNewCopy,
                    r'''$.deliveryCharges''',
                  )
                  ..tax = getJsonField(
                    _model.shiftSummarResultsNewCopy,
                    r'''$.tax''',
                  )
                  ..lastBillNo = getJsonField(
                    _model.shiftSummarResultsNewCopy,
                    r'''$.lastBillno''',
                  ).toString()
                  ..discount = getJsonField(
                    _model.shiftSummarResultsNewCopy,
                    r'''$.discount''',
                  )
                  ..lastBillTime =
                      functions.timestampToMili(getCurrentTimestamp)
                  ..cashSale = getJsonField(
                    _model.shiftSummarResultsNewCopy,
                    r'''$.cashSale''',
                  )
                  ..paymentJson = getJsonField(
                    _model.shiftSummarResultsNewCopy,
                    r'''$.paymentJson''',
                  ).toString()
                  ..dayId = getJsonField(
                    _model.shiftSummarResultsNewCopy,
                    r'''$.dayId''',
                  ).toString()
                  ..shiftId = getJsonField(
                    _model.shiftSummarResultsNewCopy,
                    r'''$.shiftId''',
                  ).toString()
                  ..hivekey = FFAppState().shiftDetails.hivekey
                  ..newIDShift = FFAppState().shiftDetails.newIDShift
                  ..code = FFAppState().shiftDetails.code
                  ..endTime = FFAppState().shiftDetails.endTime
                  ..advanceAmtTotal = FFAppState().shiftDetails.advanceAmtTotal
                  ..customerReciveAmtTotal =
                      FFAppState().shiftDetails.customerReciveAmtTotal
                  ..expensesAmtTotal =
                      FFAppState().shiftDetails.expensesAmtTotal
                  ..openingAmt = FFAppState().shiftDetails.openingAmt
                  ..receiveAmtTotal = FFAppState().shiftDetails.receiveAmtTotal
                  ..refoundAmount = FFAppState().shiftDetails.refoundAmount
                  ..roundOff = FFAppState().shiftDetails.roundOff
                  ..cashInHand = getJsonField(
                    _model.shiftSummarResultsNewCopy,
                    r'''$.cashSale''',
                  )
                  ..startTime = FFAppState().shiftDetails.startTime
                  ..inActive = FFAppState().shiftDetails.inActive
                  ..shiftNo = FFAppState().shiftDetails.shiftNo
                  ..subTotalBill = FFAppState().shiftDetails.subTotalBill
                  ..version = FFAppState().shiftDetails.version
                  ..userId = FFAppState().shiftDetails.userId
                  ..deviceId = FFAppState().shiftDetails.deviceId
                  ..synC = FFAppState().shiftDetails.synC
                  ..id = FFAppState().shiftDetails.id,
              );
              safeSetState(() {});
              _model.shiftondataprintCopy = await queryShiftRecordOnce(
                parent: FFAppState().outletIdRef,
                queryBuilder: (shiftRecord) => shiftRecord.where(
                  'id',
                  isEqualTo: valueOrDefault<String>(
                    getJsonField(
                      FFAppState().shiftDetailsJson,
                      r'''$.ref''',
                    )?.toString(),
                    'NA',
                  ),
                ),
                singleRecord: true,
              ).then((s) => s.firstOrNull);
              _shouldSetState = true;

              await _model.shiftondataprintCopy!.reference
                  .update(createShiftRecordData(
                billCount: FFAppState().shiftDetails.billCount,
                dayId: getJsonField(
                  _model.shiftSummarResultsNewCopy,
                  r'''$.dayId''',
                ).toString(),
                lastBillNo: getJsonField(
                  _model.shiftSummarResultsNewCopy,
                  r'''$.lastBillNo''',
                ).toString(),
                lastBillTime: functions.timestampToMili(getCurrentTimestamp),
                tax: getJsonField(
                  _model.shiftSummarResultsNewCopy,
                  r'''$.tax''',
                ),
                deliveryCharges: getJsonField(
                  _model.shiftSummarResultsNewCopy,
                  r'''$.deliveryCharges''',
                ),
                discount: getJsonField(
                  _model.shiftSummarResultsNewCopy,
                  r'''$.discount''',
                ),
                totalSale: getJsonField(
                  _model.shiftSummarResultsNewCopy,
                  r'''$.totalSale''',
                ),
                cashSale: getJsonField(
                  _model.shiftSummarResultsNewCopy,
                  r'''$.cashSale''',
                ),
                paymentJson: getJsonField(
                  _model.shiftSummarResultsNewCopy,
                  r'''$.paymentJson''',
                ).toString(),
                code: FFAppState().newcount,
                endTime: getJsonField(
                  FFAppState().shiftDetailsJson,
                  r'''$.endTime''',
                ),
                advanceAmtTotal: FFAppState().shiftDetails.advanceAmtTotal,
                cashInHand: getJsonField(
                  _model.shiftSummarResultsNewCopy,
                  r'''$.cashSale''',
                ),
              ));
              _model.updatedShiftDetailsCopy = await actions.hiveShiftCrud(
                FFAppState().shiftDetails.newIDShift,
                FFAppState().shiftDetails,
                'update',
              );
              _shouldSetState = true;
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
              if (_shouldSetState) safeSetState(() {});
              return;
            }

            if (!functions.isPrinterSelected(FFAppState().printerDevice)!) {
              _model.resDevice2Copy = await actions.scanPrinter(
                FFAppState().posMode,
              );
              _shouldSetState = true;
            }
            _model.isconnectedCopy = await actions.connectDevice(
              FFAppState().printerDevice,
              FFAppState().printerIndex,
            );
            _shouldSetState = true;
            if (_model.isconnectedCopy!) {
              FFAppState().lastBill = FFAppState().finalAmt;
              FFAppState().update(() {});
              _model.returnedList2Copy = await actions.selectBillPrint(
                FFAppState().selBill.toString(),
                FFAppState().allBillsList.toList(),
              );
              _shouldSetState = true;
              _model.deviceCopy = await actions.newCustomAction(
                FFAppState().printerIndex,
              );
              _shouldSetState = true;
              await actions.printBillnewhivegrocery(
                _model.returnedList2Copy!.toList(),
                _model.deviceCopy!.toList(),
                FFAppState().isPrinterConnected,
                FFAppState().printerName,
                getJsonField(
                  functions.outletDocToJson(_model.outletdocCopy!),
                  r'''$''',
                ),
                _model.hiveInvoiceDataCopy!,
                FFAppState().paperSize,
                _model.appsettingnewCopy!,
              );
              if (_model.appsettingnewCopy!.settingList
                  .where((e) => e.title == 'enableStock')
                  .toList()
                  .firstOrNull!
                  .value) {
                FFAppState().startLoop = 0;
                safeSetState(() {});
                while (
                    FFAppState().startLoop < _model.prdlinstnewtxCopy!.length) {
                  _model.stockupdateprdprtCopy = await queryProductRecordOnce(
                    parent: FFAppState().outletIdRef,
                    queryBuilder: (productRecord) => productRecord
                        .where(
                          'id',
                          isEqualTo: (_model.prdlinstnewtxCopy
                                  ?.elementAtOrNull(FFAppState().startLoop))
                              ?.id,
                        )
                        .where(
                          'stockable',
                          isEqualTo: true,
                        ),
                    singleRecord: true,
                  ).then((s) => s.firstOrNull);
                  _shouldSetState = true;
                  if (_model.stockupdateprdprtCopy != null) {
                    await _model.stockupdateprdprtCopy!.reference.update({
                      ...mapToFirestore(
                        {
                          'currentStock': FieldValue.increment(
                              -(functions.doubleToInt((_model.prdlinstnewtxCopy
                                      ?.elementAtOrNull(FFAppState().startLoop))
                                  ?.quantity)!)),
                        },
                      ),
                    });
                    _model.itemprd2Copy = await actions.hivegetproductbyId(
                      _model.stockupdateprdprtCopy?.reference.id,
                      _model.prdlinstnewtxCopy
                          ?.elementAtOrNull(FFAppState().startLoop),
                      'get',
                    );
                    _shouldSetState = true;
                    FFAppState().updateProductHiveputStruct(
                      (e) => e
                        ..id = _model.itemprd2Copy?.id
                        ..price = _model.itemprd2Copy?.price
                        ..category = _model.itemprd2Copy?.category
                        ..code = _model.itemprd2Copy?.code
                        ..name = _model.itemprd2Copy?.name
                        ..sellingPrice = _model.itemprd2Copy?.sellingPrice
                        ..mrpPrice = _model.itemprd2Copy?.mrpPrice
                        ..purchasePrice = _model.itemprd2Copy?.purchasePrice
                        ..categoryId = _model.itemprd2Copy?.categoryId
                        ..taxId = _model.itemprd2Copy?.taxId
                        ..unitId = _model.itemprd2Copy?.unitId
                        ..regionalName = _model.itemprd2Copy?.regionalName
                        ..barcode = _model.itemprd2Copy?.barcode
                        ..hsncode = _model.itemprd2Copy?.hsncode
                        ..reorderLevel = _model.itemprd2Copy?.reorderLevel
                        ..searchcode = _model.itemprd2Copy?.code
                        ..shortName =
                            _model.itemprd2Copy?.weightable?.toString()
                        ..weightable = _model.itemprd2Copy?.weightable
                        ..stockable = _model.itemprd2Copy?.stockable
                        ..discountPer = _model.itemprd2Copy?.discountPer
                        ..discountAmt = _model.itemprd2Copy?.discountAmt
                        ..productMasterId = _model.itemprd2Copy?.productMasterId
                        ..recipeRefId = _model.itemprd2Copy?.recipeRefId
                        ..imageUrl = _model.itemprd2Copy?.imageUrl
                        ..serviceOutletId = _model.itemprd2Copy?.serviceOutletId
                        ..type = _model.itemprd2Copy?.type
                        ..recipeId = _model.itemprd2Copy?.recipeId
                        ..stock = _model.itemprd2Copy!.stock -
                            (functions.doubleToInt((_model.prdlinstnewtxCopy
                                    ?.elementAtOrNull(FFAppState().startLoop))
                                ?.quantity)!)
                        ..isDeleted = _model.itemprd2Copy?.isDeleted
                        ..keywords = _model.itemprd2Copy!.keywords.toList()
                        ..synC = _model.itemprd2Copy?.synC
                        ..hivekey = _model.itemprd2Copy?.hivekey
                        ..version = _model.itemprd2Copy?.version,
                    );
                    safeSetState(() {});
                    _model.productupdated2Copy = await actions.hiveProductCrud(
                      FFAppState().productHiveput.hivekey,
                      FFAppState().productHiveput,
                      'update',
                    );
                    _shouldSetState = true;
                    FFAppState().productHive = [];
                    FFAppState().productHiveput = ProductStructStruct();
                    safeSetState(() {});
                    _model.newupdatedproductlist22Copy =
                        await actions.getProductlistHive();
                    _shouldSetState = true;
                    FFAppState().productHive = _model
                        .newupdatedproductlist22Copy!
                        .toList()
                        .cast<ProductStructStruct>();
                    safeSetState(() {});
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
              FFAppState().delCharges = 0.0;
              FFAppState().oldBalance = 0;
              FFAppState().custCredit = 0;
              FFAppState().custNameRef = null;
              FFAppState().setCustRef = null;
              FFAppState().setCustName = '';
              FFAppState().setCustMobNo = '';
              FFAppState().noOfItems = 0;
              FFAppState().taxAmtPay = 0.0;
              FFAppState().taxamt = 0.0;
              FFAppState().disAmtPay = 0.0;
              FFAppState().disPer = 0.0;
              FFAppState().disAmt = 0.0;
              FFAppState().update(() {});
              FFAppState().finalAmt = 0.0;
              FFAppState().billAmt = 0.0;
              FFAppState().count = _model.updatedShiftDetailsCopy!.billCount;
              FFAppState().groceryJson = null;
              FFAppState().prdid = '';
              FFAppState().billcount =
                  _model.updatedShiftDetailsCopy!.billCount;
              FFAppState().shiftDetails = _model.updatedShiftDetailsCopy!;
              FFAppState().shiftDetailsJson = _model.shiftSummarResultsNewCopy!;
              FFAppState().update(() {});
              Navigator.pop(context);
              if (_shouldSetState) safeSetState(() {});
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
              if (_shouldSetState) safeSetState(() {});
              return;
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Pay All Amount  !',
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                duration: Duration(milliseconds: 1900),
                backgroundColor: FlutterFlowTheme.of(context).alternate,
              ),
            );
          }

          if (_shouldSetState) safeSetState(() {});
        }),
      },
      child: Actions(
        actions: {
          VoidCallbackIntent: CallbackAction<VoidCallbackIntent>(
            onInvoke: (intent) => intent.callback(),
          ),
        },
        child: Focus(
          autofocus: isShortcutsSupported,
          focusNode: _model.paymentModeGroceryPrintShortcutsFocusNode,
          child: GestureDetector(
              onTap: () => _model.paymentModeGroceryPrintShortcutsFocusNode!
                      .canRequestFocus
                  ? FocusScope.of(context).requestFocus(
                      _model.paymentModeGroceryPrintShortcutsFocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: StreamBuilder<List<AppSettingsRecord>>(
                      stream: queryAppSettingsRecord(
                        parent: FFAppState().outletIdRef,
                        queryBuilder: (appSettingsRecord) =>
                            appSettingsRecord.where(
                          'deviceId',
                          isEqualTo: FFAppState().dId,
                        ),
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 40.0,
                              height: 40.0,
                              child: SpinKitFadingCircle(
                                color: FlutterFlowTheme.of(context).primary,
                                size: 40.0,
                              ),
                            ),
                          );
                        }
                        List<AppSettingsRecord> containerAppSettingsRecordList =
                            snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final containerAppSettingsRecord =
                            containerAppSettingsRecordList.isNotEmpty
                                ? containerAppSettingsRecordList.first
                                : null;

                        return Container(
                          width: 800.0,
                          height: 700.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'pfew440f' /* Payment Mode */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMediumFamily),
                                            ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30.0,
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        icon: Icon(
                                          Icons.close_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: StreamBuilder<List<PaymentModeRecord>>(
                                    stream: queryPaymentModeRecord(),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 40.0,
                                            height: 40.0,
                                            child: SpinKitFadingCircle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 40.0,
                                            ),
                                          ),
                                        );
                                      }
                                      List<PaymentModeRecord>
                                          containerPaymentModeRecordList =
                                          snapshot.data!;

                                      return Container(
                                        width: double.infinity,
                                        height: 550.0,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .customColor1,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 20.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      flex: 3,
                                                      child: Container(
                                                        width: 250.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .customColor3,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final paymentMode = containerPaymentModeRecordList
                                                                  .where((e) =>
                                                                      (e.name != 'CASH&GPAY') &&
                                                                      (e.name !=
                                                                          'CASH&CARD') &&
                                                                      (e.name !=
                                                                          'CASH&PHONEPE') &&
                                                                      (e.name !=
                                                                          'CASH&OTHER') &&
                                                                      (e.name !=
                                                                          'CASH&PAYTM'))
                                                                  .toList();

                                                              return GridView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                gridDelegate:
                                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                                  crossAxisCount:
                                                                      2,
                                                                  crossAxisSpacing:
                                                                      5.0,
                                                                  mainAxisSpacing:
                                                                      10.0,
                                                                  childAspectRatio:
                                                                      1.75,
                                                                ),
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    paymentMode
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        paymentModeIndex) {
                                                                  final paymentModeItem =
                                                                      paymentMode[
                                                                          paymentModeIndex];
                                                                  return Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: paymentModeItem.name ==
                                                                              FFAppState()
                                                                                  .PayMode
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .alternate
                                                                          : FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                    ),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        FFAppState().PayMode =
                                                                            paymentModeItem.name;
                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            paymentModeItem.name,
                                                                            style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 4,
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child: Column(
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
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Flexible(
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        FFAppState()
                                                                            .PayMode,
                                                                        'Cash',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                    child: Text(
                                                                      'Grand Total:${FFAppState().finalAmt.toString()}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              TextFormField(
                                                                controller: _model
                                                                    .textController1,
                                                                focusNode: _model
                                                                    .textFieldFocusNode,
                                                                autofocus:
                                                                    false,
                                                                readOnly: true,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'xo1dvny7' /* Amount */,
                                                                  ),
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                      ),
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.0),
                                                                  ),
                                                                  filled: true,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          22.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleMediumFamily),
                                                                    ),
                                                                validator: _model
                                                                    .textController1Validator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        _model.amount =
                                                                            '${_model.textController1.text}1';
                                                                        safeSetState(
                                                                            () {});
                                                                        safeSetState(
                                                                            () {
                                                                          _model
                                                                              .textController1
                                                                              ?.text = _model.amount!;
                                                                        });
                                                                      },
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'k0whupsn' /* 1 */,
                                                                      ),
                                                                      options:
                                                                          FFButtonOptions(
                                                                        height:
                                                                            50.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .customColor2,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 19.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                            ),
                                                                        elevation:
                                                                            3.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        _model.amount =
                                                                            '${_model.textController1.text}2';
                                                                        safeSetState(
                                                                            () {});
                                                                        safeSetState(
                                                                            () {
                                                                          _model
                                                                              .textController1
                                                                              ?.text = _model.amount!;
                                                                        });
                                                                      },
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'lv3uaed7' /* 2 */,
                                                                      ),
                                                                      options:
                                                                          FFButtonOptions(
                                                                        height:
                                                                            50.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .customColor2,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 19.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                            ),
                                                                        elevation:
                                                                            3.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        _model.amount =
                                                                            '${_model.textController1.text}3';
                                                                        safeSetState(
                                                                            () {});
                                                                        safeSetState(
                                                                            () {
                                                                          _model
                                                                              .textController1
                                                                              ?.text = _model.amount!;
                                                                        });
                                                                      },
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '2qkgxrgv' /* 3 */,
                                                                      ),
                                                                      options:
                                                                          FFButtonOptions(
                                                                        height:
                                                                            50.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .customColor2,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 19.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                            ),
                                                                        elevation:
                                                                            3.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        15.0)),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        _model.amount =
                                                                            '${_model.textController1.text}4';
                                                                        safeSetState(
                                                                            () {});
                                                                        safeSetState(
                                                                            () {
                                                                          _model
                                                                              .textController1
                                                                              ?.text = _model.amount!;
                                                                        });
                                                                      },
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'o09mttkp' /* 4 */,
                                                                      ),
                                                                      options:
                                                                          FFButtonOptions(
                                                                        height:
                                                                            50.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .customColor2,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 19.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                            ),
                                                                        elevation:
                                                                            3.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        _model.amount =
                                                                            '${_model.textController1.text}5';
                                                                        safeSetState(
                                                                            () {});
                                                                        safeSetState(
                                                                            () {
                                                                          _model
                                                                              .textController1
                                                                              ?.text = _model.amount!;
                                                                        });
                                                                      },
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'hncetyzu' /* 5 */,
                                                                      ),
                                                                      options:
                                                                          FFButtonOptions(
                                                                        height:
                                                                            50.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .customColor2,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 19.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                            ),
                                                                        elevation:
                                                                            3.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        _model.amount =
                                                                            '${_model.textController1.text}6';
                                                                        safeSetState(
                                                                            () {});
                                                                        safeSetState(
                                                                            () {
                                                                          _model
                                                                              .textController1
                                                                              ?.text = _model.amount!;
                                                                        });
                                                                      },
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'qzi6c4cv' /* 6 */,
                                                                      ),
                                                                      options:
                                                                          FFButtonOptions(
                                                                        height:
                                                                            50.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .customColor2,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 19.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                            ),
                                                                        elevation:
                                                                            3.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        15.0)),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        _model.amount =
                                                                            '${_model.textController1.text}7';
                                                                        safeSetState(
                                                                            () {});
                                                                        safeSetState(
                                                                            () {
                                                                          _model
                                                                              .textController1
                                                                              ?.text = _model.amount!;
                                                                        });
                                                                      },
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'm3mhk0b8' /* 7 */,
                                                                      ),
                                                                      options:
                                                                          FFButtonOptions(
                                                                        height:
                                                                            50.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .customColor2,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 19.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                            ),
                                                                        elevation:
                                                                            3.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        _model.amount =
                                                                            '${_model.textController1.text}8';
                                                                        safeSetState(
                                                                            () {});
                                                                        safeSetState(
                                                                            () {
                                                                          _model
                                                                              .textController1
                                                                              ?.text = _model.amount!;
                                                                        });
                                                                      },
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'it9n022c' /* 8 */,
                                                                      ),
                                                                      options:
                                                                          FFButtonOptions(
                                                                        height:
                                                                            50.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .customColor2,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 19.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                            ),
                                                                        elevation:
                                                                            3.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        _model.amount =
                                                                            '${_model.textController1.text}9';
                                                                        safeSetState(
                                                                            () {});
                                                                        safeSetState(
                                                                            () {
                                                                          _model
                                                                              .textController1
                                                                              ?.text = _model.amount!;
                                                                        });
                                                                      },
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '224ejjzz' /* 9 */,
                                                                      ),
                                                                      options:
                                                                          FFButtonOptions(
                                                                        height:
                                                                            50.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .customColor2,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 19.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                            ),
                                                                        elevation:
                                                                            3.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        15.0)),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        _model.amount =
                                                                            '${_model.textController1.text}.';
                                                                        safeSetState(
                                                                            () {});
                                                                        safeSetState(
                                                                            () {
                                                                          _model
                                                                              .textController1
                                                                              ?.text = _model.amount!;
                                                                        });
                                                                      },
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'fr6733po' /* . */,
                                                                      ),
                                                                      options:
                                                                          FFButtonOptions(
                                                                        height:
                                                                            50.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .customColor2,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 28.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                            ),
                                                                        elevation:
                                                                            3.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        _model.amount =
                                                                            '${_model.textController1.text}0';
                                                                        safeSetState(
                                                                            () {});
                                                                        safeSetState(
                                                                            () {
                                                                          _model
                                                                              .textController1
                                                                              ?.text = _model.amount!;
                                                                        });
                                                                      },
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'pzww549p' /* 0 */,
                                                                      ),
                                                                      options:
                                                                          FFButtonOptions(
                                                                        height:
                                                                            50.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .customColor2,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 19.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                            ),
                                                                        elevation:
                                                                            3.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        FFAppState().groceryJson =
                                                                            null;
                                                                        FFAppState().disAmtPay =
                                                                            0.0;
                                                                        FFAppState().taxAmtPay =
                                                                            0.0;
                                                                        FFAppState().delCharges =
                                                                            0.0;
                                                                        safeSetState(
                                                                            () {});
                                                                        safeSetState(
                                                                            () {
                                                                          _model
                                                                              .textFielddisamtTextController
                                                                              ?.clear();
                                                                          _model
                                                                              .textFieldgstperTextController
                                                                              ?.clear();
                                                                          _model
                                                                              .textFieldextraTextController
                                                                              ?.clear();
                                                                          _model
                                                                              .textFielddisperTextController
                                                                              ?.clear();
                                                                        });
                                                                        _model.ret =
                                                                            await actions.calSubTotalForGrocery(
                                                                          FFAppState()
                                                                              .selBill
                                                                              .toString(),
                                                                          FFAppState()
                                                                              .allBillsList
                                                                              .toList(),
                                                                        );
                                                                        _model.add =
                                                                            await actions.calBillAmtGroceryPay(
                                                                          FFAppState()
                                                                              .disAmtPay,
                                                                          valueOrDefault<
                                                                              double>(
                                                                            FFAppState().delCharges,
                                                                            0.0,
                                                                          ),
                                                                          0.0,
                                                                          containerAppSettingsRecord!
                                                                              .settingList
                                                                              .where((e) => e.title == 'enableInclusiveTax')
                                                                              .toList()
                                                                              .firstOrNull!
                                                                              .value
                                                                              .toString(),
                                                                        );

                                                                        FFAppState()
                                                                            .update(() {});

                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'sfj3y5lz' /* Reset */,
                                                                      ),
                                                                      options:
                                                                          FFButtonOptions(
                                                                        height:
                                                                            50.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .customColor2,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 10.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                            ),
                                                                        elevation:
                                                                            3.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      showLoadingIndicator:
                                                                          false,
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        15.0)),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 15.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 10.0)),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              flex: 7,
                                                              child: Container(
                                                                width: 100.0,
                                                                height: 31.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor1,
                                                                  ),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'r7k7g78r' /* Advance */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelLargeFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          fontSize:
                                                                              17.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 4,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: 100.0,
                                                                  height: 31.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .customColor1,
                                                                    ),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        getJsonField(
                                                                          FFAppState()
                                                                              .groceryJson,
                                                                          r'''$.advanceAmt''',
                                                                        )?.toString(),
                                                                        '0',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).labelLargeFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            fontSize:
                                                                                17.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 7,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: 100.0,
                                                                  height: 31.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .customColor1,
                                                                    ),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '52enf87j' /* Paid */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).labelLargeFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                17.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 4,
                                                              child: Container(
                                                                width: 100.0,
                                                                height: 31.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor1,
                                                                  ),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      getJsonField(
                                                                        FFAppState()
                                                                            .groceryJson,
                                                                        r'''$.paidAmt''',
                                                                      )?.toString(),
                                                                      '0',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelLargeFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          fontSize:
                                                                              17.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              flex: 7,
                                                              child: Container(
                                                                width: 100.0,
                                                                height: 31.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor1,
                                                                  ),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '1gl9kukx' /* Balance */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelLargeFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              17.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 4,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: 100.0,
                                                                  height: 31.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .customColor1,
                                                                    ),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        getJsonField(
                                                                          FFAppState()
                                                                              .groceryJson,
                                                                          r'''$.balanceAmt''',
                                                                        )?.toString(),
                                                                        '0',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).labelLargeFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            fontSize:
                                                                                17.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 7,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: 100.0,
                                                                  height: 31.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .customColor1,
                                                                    ),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '13dyfhc2' /* Return */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).labelLargeFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).info,
                                                                            fontSize:
                                                                                17.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 4,
                                                              child: Container(
                                                                width: 100.0,
                                                                height: 31.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor1,
                                                                  ),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      getJsonField(
                                                                        FFAppState()
                                                                            .groceryJson,
                                                                        r'''$.returnAmt''',
                                                                      )?.toString(),
                                                                      '0',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelLargeFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          fontSize:
                                                                              17.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              flex: 7,
                                                              child: Container(
                                                                width: 100.0,
                                                                height: 31.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor1,
                                                                  ),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '2e5mbjum' /* Discount(%) */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelLargeFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              17.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 4,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: 100.0,
                                                                  height: 31.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .customColor1,
                                                                    ),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.textFielddisperTextController,
                                                                        focusNode:
                                                                            _model.textFielddisperFocusNode,
                                                                        onFieldSubmitted:
                                                                            (_) async {
                                                                          FFAppState().disAmtPay = functions.disAmtPer(
                                                                              double.tryParse(_model.textFielddisperTextController.text),
                                                                              FFAppState().subTotal);
                                                                          FFAppState().disAmt = functions.disAmtPer(
                                                                              double.tryParse(_model.textFielddisperTextController.text),
                                                                              FFAppState().subTotal);
                                                                          FFAppState().disPer = double.parse(_model
                                                                              .textFielddisperTextController
                                                                              .text);
                                                                          FFAppState()
                                                                              .update(() {});
                                                                          await actions
                                                                              .calBillAmtGroceryPay(
                                                                            FFAppState().disAmtPay,
                                                                            FFAppState().delCharges,
                                                                            double.parse(_model.textFieldgstperTextController.text),
                                                                            containerAppSettingsRecord!.settingList.where((e) => e.title == 'enableInclusiveTax').toList().firstOrNull!.value.toString(),
                                                                          );
                                                                          safeSetState(
                                                                              () {
                                                                            _model.textFielddisamtTextController?.text =
                                                                                FFAppState().disAmtPay.toString();
                                                                          });
                                                                        },
                                                                        autofocus:
                                                                            false,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          isDense:
                                                                              false,
                                                                          labelStyle: FlutterFlowTheme.of(context)
                                                                              .labelLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                fontSize: 17.0,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                              ),
                                                                          hintText:
                                                                              FFLocalizations.of(context).getText(
                                                                            'esxpvspp' /* 0 */,
                                                                          ),
                                                                          hintStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                              ),
                                                                          enabledBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          errorBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              fontSize: 17.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        validator: _model
                                                                            .textFielddisperTextControllerValidator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 7,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: 100.0,
                                                                  height: 31.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .customColor1,
                                                                    ),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'iqwq1pfb' /* Discount Amt */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).labelLargeFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).info,
                                                                            fontSize:
                                                                                17.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 4,
                                                              child: Container(
                                                                width: 100.0,
                                                                height: 31.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor1,
                                                                  ),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .textFielddisamtTextController,
                                                                      focusNode:
                                                                          _model
                                                                              .textFielddisamtFocusNode,
                                                                      onFieldSubmitted:
                                                                          (_) async {
                                                                        FFAppState().delCharges = double.parse(_model
                                                                            .textFieldextraTextController
                                                                            .text);
                                                                        FFAppState().disAmtPay = double.parse(_model
                                                                            .textFielddisamtTextController
                                                                            .text);
                                                                        FFAppState()
                                                                            .update(() {});
                                                                        FFAppState().disPer = functions.discountAmount(
                                                                            FFAppState().subTotal,
                                                                            double.tryParse(_model.textFielddisamtTextController.text));
                                                                        FFAppState()
                                                                            .update(() {});
                                                                        await actions
                                                                            .calBillAmtGroceryPay(
                                                                          FFAppState()
                                                                              .disAmtPay,
                                                                          FFAppState()
                                                                              .delCharges,
                                                                          double.parse(_model
                                                                              .textFieldgstperTextController
                                                                              .text),
                                                                          containerAppSettingsRecord!
                                                                              .settingList
                                                                              .where((e) => e.title == 'enableInclusiveTax')
                                                                              .toList()
                                                                              .firstOrNull!
                                                                              .value
                                                                              .toString(),
                                                                        );
                                                                        safeSetState(
                                                                            () {
                                                                          _model
                                                                              .textFielddisperTextController
                                                                              ?.text = FFAppState().disPer.toString();
                                                                        });
                                                                      },
                                                                      autofocus:
                                                                          false,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        labelStyle: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              fontSize: 17.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                            ),
                                                                        hintText:
                                                                            FFLocalizations.of(context).getText(
                                                                          'oqeqe7rf' /* 0 */,
                                                                        ),
                                                                        hintStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                            ),
                                                                        enabledBorder:
                                                                            UnderlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            topLeft:
                                                                                Radius.circular(4.0),
                                                                            topRight:
                                                                                Radius.circular(4.0),
                                                                          ),
                                                                        ),
                                                                        focusedBorder:
                                                                            UnderlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            topLeft:
                                                                                Radius.circular(4.0),
                                                                            topRight:
                                                                                Radius.circular(4.0),
                                                                          ),
                                                                        ),
                                                                        errorBorder:
                                                                            UnderlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            topLeft:
                                                                                Radius.circular(4.0),
                                                                            topRight:
                                                                                Radius.circular(4.0),
                                                                          ),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            UnderlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            topLeft:
                                                                                Radius.circular(4.0),
                                                                            topRight:
                                                                                Radius.circular(4.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            fontSize:
                                                                                17.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      validator: _model
                                                                          .textFielddisamtTextControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              flex: 7,
                                                              child: Container(
                                                                width: 100.0,
                                                                height: 31.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor1,
                                                                  ),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'jw81qkj2' /* GST(%) */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 17.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        '(${valueOrDefault<String>(
                                                                          FFAppState()
                                                                              .taxAmtPay
                                                                              .toString(),
                                                                          '0',
                                                                        )})',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 17.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 4,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: 100.0,
                                                                  height: 31.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .customColor1,
                                                                    ),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.textFieldgstperTextController,
                                                                        focusNode:
                                                                            _model.textFieldgstperFocusNode,
                                                                        onFieldSubmitted:
                                                                            (_) async {
                                                                          await actions
                                                                              .calBillAmtGroceryPay(
                                                                            FFAppState().disAmtPay,
                                                                            FFAppState().delCharges,
                                                                            double.parse(_model.textFieldgstperTextController.text),
                                                                            containerAppSettingsRecord!.settingList.where((e) => e.title == 'enableInclusiveTax').toList().firstOrNull!.value.toString(),
                                                                          );

                                                                          FFAppState()
                                                                              .update(() {});
                                                                        },
                                                                        autofocus:
                                                                            false,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          labelStyle: FlutterFlowTheme.of(context)
                                                                              .labelLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                fontSize: 17.0,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                              ),
                                                                          hintText:
                                                                              FFLocalizations.of(context).getText(
                                                                            '604ixicz' /* 0 */,
                                                                          ),
                                                                          hintStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                              ),
                                                                          enabledBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                const BorderRadius.only(
                                                                              topLeft: Radius.circular(4.0),
                                                                              topRight: Radius.circular(4.0),
                                                                            ),
                                                                          ),
                                                                          focusedBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                const BorderRadius.only(
                                                                              topLeft: Radius.circular(4.0),
                                                                              topRight: Radius.circular(4.0),
                                                                            ),
                                                                          ),
                                                                          errorBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                const BorderRadius.only(
                                                                              topLeft: Radius.circular(4.0),
                                                                              topRight: Radius.circular(4.0),
                                                                            ),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                const BorderRadius.only(
                                                                              topLeft: Radius.circular(4.0),
                                                                              topRight: Radius.circular(4.0),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              fontSize: 17.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        validator: _model
                                                                            .textFieldgstperTextControllerValidator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 7,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: 100.0,
                                                                  height: 31.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .customColor1,
                                                                    ),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'mgfqri7f' /* Extra Charges */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).labelLargeFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).info,
                                                                            fontSize:
                                                                                17.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 4,
                                                              child: Container(
                                                                width: 100.0,
                                                                height: 31.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor1,
                                                                  ),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .textFieldextraTextController,
                                                                      focusNode:
                                                                          _model
                                                                              .textFieldextraFocusNode,
                                                                      onFieldSubmitted:
                                                                          (_) async {
                                                                        FFAppState().delCharges = double.parse(_model
                                                                            .textFieldextraTextController
                                                                            .text);
                                                                        FFAppState().disAmtPay = double.parse(_model
                                                                            .textFielddisamtTextController
                                                                            .text);
                                                                        FFAppState()
                                                                            .update(() {});
                                                                        await actions
                                                                            .calBillAmtGroceryPay(
                                                                          double.parse(_model
                                                                              .textFielddisamtTextController
                                                                              .text),
                                                                          double.parse(_model
                                                                              .textFieldextraTextController
                                                                              .text),
                                                                          double.parse(_model
                                                                              .textFieldgstperTextController
                                                                              .text),
                                                                          containerAppSettingsRecord!
                                                                              .settingList
                                                                              .where((e) => e.title == 'enableInclusiveTax')
                                                                              .toList()
                                                                              .firstOrNull!
                                                                              .value
                                                                              .toString(),
                                                                        );
                                                                      },
                                                                      autofocus:
                                                                          false,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        labelStyle: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              fontSize: 17.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                            ),
                                                                        hintText:
                                                                            FFLocalizations.of(context).getText(
                                                                          'a7pdlo3s' /* 0 */,
                                                                        ),
                                                                        hintStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                            ),
                                                                        enabledBorder:
                                                                            UnderlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            topLeft:
                                                                                Radius.circular(4.0),
                                                                            topRight:
                                                                                Radius.circular(4.0),
                                                                          ),
                                                                        ),
                                                                        focusedBorder:
                                                                            UnderlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            topLeft:
                                                                                Radius.circular(4.0),
                                                                            topRight:
                                                                                Radius.circular(4.0),
                                                                          ),
                                                                        ),
                                                                        errorBorder:
                                                                            UnderlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            topLeft:
                                                                                Radius.circular(4.0),
                                                                            topRight:
                                                                                Radius.circular(4.0),
                                                                          ),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            UnderlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            topLeft:
                                                                                Radius.circular(4.0),
                                                                            topRight:
                                                                                Radius.circular(4.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            fontSize:
                                                                                17.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      validator: _model
                                                                          .textFieldextraTextControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      var _shouldSetState =
                                                          false;
                                                      _model.resultsave =
                                                          await actions
                                                              .calculateGroceryAmtaction(
                                                        FFAppState().PayMode,
                                                        valueOrDefault<double>(
                                                          FFAppState().finalAmt,
                                                          0.0,
                                                        ),
                                                        double.parse(_model
                                                            .textController1
                                                            .text),
                                                      );
                                                      _shouldSetState = true;
                                                      FFAppState().groceryJson =
                                                          _model.resultsave!;
                                                      safeSetState(() {});
                                                      _model.amount = '';
                                                      safeSetState(() {});
                                                      if (FFAppState()
                                                              .finalAmt ==
                                                          getJsonField(
                                                            FFAppState()
                                                                .groceryJson,
                                                            r'''$.paidAmt''',
                                                          )) {
                                                        if (getJsonField(
                                                          FFAppState()
                                                              .shiftDetailsJson,
                                                          r'''$.shiftExists''',
                                                        )) {
                                                          FFAppState().count =
                                                              FFAppState()
                                                                      .count +
                                                                  1;
                                                          FFAppState()
                                                                  .billcount =
                                                              FFAppState()
                                                                      .billcount +
                                                                  1;
                                                          safeSetState(() {});
                                                        } else {
                                                          FFAppState().count =
                                                              FFAppState()
                                                                      .count +
                                                                  1;
                                                          FFAppState()
                                                                  .newcount =
                                                              FFAppState()
                                                                      .newcount +
                                                                  1;
                                                          FFAppState()
                                                                  .billcount =
                                                              FFAppState()
                                                                      .billcount +
                                                                  1;
                                                          safeSetState(() {});
                                                        }

                                                        _model.prdlistsavebill =
                                                            await actions
                                                                .filterProducts2(
                                                          FFAppState().selBill,
                                                          FFAppState()
                                                              .allBillsList
                                                              .toList(),
                                                        );
                                                        _shouldSetState = true;
                                                        if (FFAppState()
                                                                .setCustRef !=
                                                            null) {
                                                          if (FFAppState()
                                                                  .PayMode ==
                                                              'CREDIT') {
                                                            if (FFAppState()
                                                                    .oldBalance <
                                                                FFAppState()
                                                                    .custCredit) {
                                                              _model.totalcredit2 =
                                                                  await actions
                                                                      .oldbalanceplusamt(
                                                                FFAppState()
                                                                    .oldBalance,
                                                                valueOrDefault<
                                                                    double>(
                                                                  getJsonField(
                                                                    FFAppState()
                                                                        .groceryJson,
                                                                    r'''$.paymentMode.CREDIT''',
                                                                  ),
                                                                  0.0,
                                                                ),
                                                              );
                                                              _shouldSetState =
                                                                  true;

                                                              await FFAppState()
                                                                  .setCustRef!
                                                                  .update(
                                                                      createPartyRecordData(
                                                                    credit:
                                                                        true,
                                                                    oldBalance:
                                                                        _model
                                                                            .totalcredit2,
                                                                    lastVisit: getCurrentTimestamp
                                                                        .millisecondsSinceEpoch
                                                                        .toString(),
                                                                  ));

                                                              var paymentRecordReference =
                                                                  PaymentRecord
                                                                      .createDoc(
                                                                          FFAppState()
                                                                              .outletIdRef!);
                                                              await paymentRecordReference
                                                                  .set(
                                                                      createPaymentRecordData(
                                                                amount:
                                                                    valueOrDefault<
                                                                        double>(
                                                                  getJsonField(
                                                                    FFAppState()
                                                                        .groceryJson,
                                                                    r'''$.paymentMode.CREDIT''',
                                                                  ),
                                                                  0.0,
                                                                ),
                                                                paymentType:
                                                                    'CREDIT',
                                                                createdBy:
                                                                    FFAppState()
                                                                        .userdoc,
                                                                createdDate:
                                                                    getCurrentTimestamp
                                                                        .millisecondsSinceEpoch,
                                                                party: FFAppState()
                                                                    .setCustRef,
                                                                expenceType:
                                                                    'Debit',
                                                                oldBalance: _model
                                                                    .totalcredit2,
                                                              ));
                                                              _model.paymentDoc2 =
                                                                  PaymentRecord
                                                                      .getDocumentFromData(
                                                                          createPaymentRecordData(
                                                                            amount:
                                                                                valueOrDefault<double>(
                                                                              getJsonField(
                                                                                FFAppState().groceryJson,
                                                                                r'''$.paymentMode.CREDIT''',
                                                                              ),
                                                                              0.0,
                                                                            ),
                                                                            paymentType:
                                                                                'CREDIT',
                                                                            createdBy:
                                                                                FFAppState().userdoc,
                                                                            createdDate:
                                                                                getCurrentTimestamp.millisecondsSinceEpoch,
                                                                            party:
                                                                                FFAppState().setCustRef,
                                                                            expenceType:
                                                                                'Debit',
                                                                            oldBalance:
                                                                                _model.totalcredit2,
                                                                          ),
                                                                          paymentRecordReference);
                                                              _shouldSetState =
                                                                  true;
                                                            } else {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    content: Text(
                                                                        'Credit Limit Exceeded !'),
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
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            }
                                                          }
                                                        }

                                                        var invoiceRecordReference =
                                                            InvoiceRecord.createDoc(
                                                                FFAppState()
                                                                    .outletIdRef!);
                                                        await invoiceRecordReference
                                                            .set({
                                                          ...createInvoiceRecordData(
                                                            invoice: functions
                                                                .genInvoiceNumyear(
                                                                    FFAppState()
                                                                        .newcount),
                                                            party:
                                                                valueOrDefault<
                                                                    String>(
                                                              FFAppState()
                                                                  .setCustRef
                                                                  ?.id,
                                                              'NA',
                                                            ),
                                                            products: '',
                                                            invoiceDate: functions
                                                                .timestampToMili(
                                                                    getCurrentTimestamp),
                                                            paymentMode:
                                                                getJsonField(
                                                              FFAppState()
                                                                  .groceryJson,
                                                              r'''$.paymentMode''',
                                                            ).toString(),
                                                            dayId: functions
                                                                .getDayId(),
                                                            discountAmt:
                                                                valueOrDefault<
                                                                    double>(
                                                              FFAppState()
                                                                  .disAmt,
                                                              0.0,
                                                            ),
                                                            discountPer:
                                                                valueOrDefault<
                                                                    double>(
                                                              FFAppState()
                                                                  .disPer,
                                                              0.0,
                                                            ),
                                                            delliveryChrg:
                                                                valueOrDefault<
                                                                    double>(
                                                              FFAppState()
                                                                  .delCharges,
                                                              0.0,
                                                            ),
                                                            taxAmt: FFAppState()
                                                                .taxamt,
                                                            billAmt:
                                                                valueOrDefault<
                                                                    double>(
                                                              FFAppState()
                                                                  .billAmt,
                                                              0.0,
                                                            ),
                                                            finalBillAmt:
                                                                valueOrDefault<
                                                                    double>(
                                                              FFAppState()
                                                                  .finalAmt,
                                                              0.0,
                                                            ),
                                                            shiftId: '',
                                                            createdBy:
                                                                FFAppState()
                                                                    .userdoc,
                                                            code: FFAppState()
                                                                .newcount,
                                                            partyMobNo:
                                                                valueOrDefault<
                                                                    String>(
                                                              FFAppState()
                                                                  .currentMobile,
                                                              '0',
                                                            ),
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'productList':
                                                                  getSelItemListListFirestoreData(
                                                                _model
                                                                    .prdlistsavebill,
                                                              ),
                                                            },
                                                          ),
                                                        });
                                                        _model.invonline =
                                                            InvoiceRecord
                                                                .getDocumentFromData({
                                                          ...createInvoiceRecordData(
                                                            invoice: functions
                                                                .genInvoiceNumyear(
                                                                    FFAppState()
                                                                        .newcount),
                                                            party:
                                                                valueOrDefault<
                                                                    String>(
                                                              FFAppState()
                                                                  .setCustRef
                                                                  ?.id,
                                                              'NA',
                                                            ),
                                                            products: '',
                                                            invoiceDate: functions
                                                                .timestampToMili(
                                                                    getCurrentTimestamp),
                                                            paymentMode:
                                                                getJsonField(
                                                              FFAppState()
                                                                  .groceryJson,
                                                              r'''$.paymentMode''',
                                                            ).toString(),
                                                            dayId: functions
                                                                .getDayId(),
                                                            discountAmt:
                                                                valueOrDefault<
                                                                    double>(
                                                              FFAppState()
                                                                  .disAmt,
                                                              0.0,
                                                            ),
                                                            discountPer:
                                                                valueOrDefault<
                                                                    double>(
                                                              FFAppState()
                                                                  .disPer,
                                                              0.0,
                                                            ),
                                                            delliveryChrg:
                                                                valueOrDefault<
                                                                    double>(
                                                              FFAppState()
                                                                  .delCharges,
                                                              0.0,
                                                            ),
                                                            taxAmt: FFAppState()
                                                                .taxamt,
                                                            billAmt:
                                                                valueOrDefault<
                                                                    double>(
                                                              FFAppState()
                                                                  .billAmt,
                                                              0.0,
                                                            ),
                                                            finalBillAmt:
                                                                valueOrDefault<
                                                                    double>(
                                                              FFAppState()
                                                                  .finalAmt,
                                                              0.0,
                                                            ),
                                                            shiftId: '',
                                                            createdBy:
                                                                FFAppState()
                                                                    .userdoc,
                                                            code: FFAppState()
                                                                .newcount,
                                                            partyMobNo:
                                                                valueOrDefault<
                                                                    String>(
                                                              FFAppState()
                                                                  .currentMobile,
                                                              '0',
                                                            ),
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'productList':
                                                                  getSelItemListListFirestoreData(
                                                                _model
                                                                    .prdlistsavebill,
                                                              ),
                                                            },
                                                          ),
                                                        }, invoiceRecordReference);
                                                        _shouldSetState = true;

                                                        await _model.invonline!
                                                            .reference
                                                            .update(
                                                                createInvoiceRecordData(
                                                          id: _model.invonline
                                                              ?.reference.id,
                                                        ));
                                                        _model.hiveInvoiceDataCopyCopy =
                                                            await actions
                                                                .addInvoiceBillhive(
                                                          _model.invonline!
                                                              .reference.id,
                                                          functions
                                                              .genInvoiceNumyear(
                                                                  FFAppState()
                                                                      .newcount),
                                                          FFAppState()
                                                              .setCustName,
                                                          functions.timestampToMili(
                                                              getCurrentTimestamp),
                                                          functions.getDayId(),
                                                          getJsonField(
                                                            FFAppState()
                                                                .groceryJson,
                                                            r'''$.paymentMode''',
                                                          ).toString(),
                                                          valueOrDefault<
                                                              double>(
                                                            FFAppState().disAmt,
                                                            0.0,
                                                          ),
                                                          valueOrDefault<
                                                              double>(
                                                            FFAppState().disPer,
                                                            0.0,
                                                          ),
                                                          valueOrDefault<
                                                              double>(
                                                            FFAppState()
                                                                .delCharges,
                                                            0.0,
                                                          ),
                                                          FFAppState().taxamt,
                                                          valueOrDefault<
                                                              double>(
                                                            FFAppState()
                                                                .billAmt,
                                                            0.0,
                                                          ),
                                                          valueOrDefault<
                                                              double>(
                                                            FFAppState()
                                                                .finalAmt,
                                                            0.0,
                                                          ),
                                                          0.0,
                                                          _model.prdlistsavebill
                                                              ?.toList(),
                                                          getJsonField(
                                                            FFAppState()
                                                                .shiftDetailsJson,
                                                            r'''$.shiftId''',
                                                          ).toString(),
                                                          false,
                                                          FFAppState()
                                                              .invoiceStructVersion,
                                                        );
                                                        _shouldSetState = true;
                                                        if (getJsonField(
                                                          FFAppState()
                                                              .shiftDetailsJson,
                                                          r'''$.shiftExists''',
                                                        )) {
                                                          _model.shiftSummarResultsNew2 =
                                                              await actions
                                                                  .calShiftSummaryNewgroceryPrint(
                                                            _model
                                                                .hiveInvoiceDataCopyCopy!,
                                                            FFAppState()
                                                                .shiftDetailsJson,
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                          _model.shiftidhive2 =
                                                              await actions
                                                                  .shiftIdtoInt(
                                                            getJsonField(
                                                              FFAppState()
                                                                  .shiftDetailsJson,
                                                              r'''$.shiftId''',
                                                            ).toString(),
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                          _model.getOfflineShiftdetails =
                                                              await actions
                                                                  .hiveShiftCrud(
                                                            _model.shiftidhive2,
                                                            FFAppState()
                                                                .shiftDetails,
                                                            'get',
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                          FFAppState()
                                                              .updateShiftDetailsStruct(
                                                            (e) => e
                                                              ..billCount =
                                                                  FFAppState()
                                                                      .billcount
                                                              ..totalSale =
                                                                  getJsonField(
                                                                _model
                                                                    .shiftSummarResultsNew2,
                                                                r'''$.totalSale''',
                                                              )
                                                              ..deliveryCharges =
                                                                  getJsonField(
                                                                _model
                                                                    .shiftSummarResultsNew2,
                                                                r'''$.deliveryCharges''',
                                                              )
                                                              ..tax =
                                                                  getJsonField(
                                                                _model
                                                                    .shiftSummarResultsNew2,
                                                                r'''$.tax''',
                                                              )
                                                              ..lastBillNo =
                                                                  getJsonField(
                                                                _model
                                                                    .shiftSummarResultsNew2,
                                                                r'''$.lastBillNo''',
                                                              ).toString()
                                                              ..discount =
                                                                  getJsonField(
                                                                _model
                                                                    .shiftSummarResultsNew2,
                                                                r'''$.discount''',
                                                              )
                                                              ..lastBillTime = functions
                                                                  .timestampToMili(
                                                                      getCurrentTimestamp)
                                                              ..cashSale =
                                                                  getJsonField(
                                                                _model
                                                                    .shiftSummarResultsNew2,
                                                                r'''$.cashSale''',
                                                              )
                                                              ..paymentJson =
                                                                  getJsonField(
                                                                _model
                                                                    .shiftSummarResultsNew2,
                                                                r'''$.paymentJson''',
                                                              ).toString()
                                                              ..dayId =
                                                                  getJsonField(
                                                                _model
                                                                    .shiftSummarResultsNew2,
                                                                r'''$.dayId''',
                                                              ).toString()
                                                              ..code = FFAppState()
                                                                  .shiftDetails
                                                                  .code
                                                              ..endTime =
                                                                  FFAppState()
                                                                      .shiftDetails
                                                                      .endTime
                                                              ..advanceAmtTotal =
                                                                  FFAppState()
                                                                      .shiftDetails
                                                                      .advanceAmtTotal
                                                              ..customerReciveAmtTotal =
                                                                  FFAppState()
                                                                      .shiftDetails
                                                                      .customerReciveAmtTotal
                                                              ..expensesAmtTotal =
                                                                  FFAppState()
                                                                      .shiftDetails
                                                                      .expensesAmtTotal
                                                              ..openingAmt =
                                                                  FFAppState()
                                                                      .shiftDetails
                                                                      .openingAmt
                                                              ..receiveAmtTotal =
                                                                  FFAppState()
                                                                      .shiftDetails
                                                                      .receiveAmtTotal
                                                              ..refoundAmount =
                                                                  FFAppState()
                                                                      .shiftDetails
                                                                      .refoundAmount
                                                              ..roundOff =
                                                                  FFAppState()
                                                                      .shiftDetails
                                                                      .roundOff
                                                              ..cashInHand =
                                                                  FFAppState()
                                                                      .shiftDetails
                                                                      .cashInHand
                                                              ..startTime =
                                                                  FFAppState()
                                                                      .shiftDetails
                                                                      .startTime
                                                              ..inActive =
                                                                  FFAppState()
                                                                      .shiftDetails
                                                                      .inActive
                                                              ..shiftNo =
                                                                  FFAppState()
                                                                      .shiftDetails
                                                                      .shiftNo
                                                              ..subTotalBill =
                                                                  FFAppState()
                                                                      .shiftDetails
                                                                      .subTotalBill
                                                              ..userId =
                                                                  FFAppState()
                                                                      .shiftDetails
                                                                      .userId
                                                              ..deviceId =
                                                                  FFAppState()
                                                                      .shiftDetails
                                                                      .deviceId
                                                              ..version =
                                                                  FFAppState()
                                                                      .shiftDetails
                                                                      .version
                                                              ..shiftId =
                                                                  getJsonField(
                                                                _model
                                                                    .shiftSummarResultsNew2,
                                                                r'''$.shiftId''',
                                                              ).toString()
                                                              ..synC = FFAppState()
                                                                  .shiftDetails
                                                                  .synC
                                                              ..newIDShift =
                                                                  FFAppState()
                                                                      .shiftDetails
                                                                      .newIDShift
                                                              ..hivekey =
                                                                  FFAppState()
                                                                      .shiftDetails
                                                                      .hivekey
                                                              ..id = FFAppState()
                                                                  .shiftDetails
                                                                  .id,
                                                          );
                                                          safeSetState(() {});
                                                          _model.shiftondata =
                                                              await queryShiftRecordOnce(
                                                            parent: FFAppState()
                                                                .outletIdRef,
                                                            queryBuilder:
                                                                (shiftRecord) =>
                                                                    shiftRecord
                                                                        .where(
                                                              'id',
                                                              isEqualTo:
                                                                  valueOrDefault<
                                                                      String>(
                                                                getJsonField(
                                                                  FFAppState()
                                                                      .shiftDetailsJson,
                                                                  r'''$.ref''',
                                                                )?.toString(),
                                                                'NA',
                                                              ),
                                                            ),
                                                            singleRecord: true,
                                                          ).then((s) => s
                                                                  .firstOrNull);
                                                          _shouldSetState =
                                                              true;

                                                          await _model
                                                              .shiftondata!
                                                              .reference
                                                              .update(
                                                                  createShiftRecordData(
                                                            billCount:
                                                                FFAppState()
                                                                    .shiftDetails
                                                                    .billCount,
                                                            dayId: getJsonField(
                                                              _model
                                                                  .shiftSummarResultsNew2,
                                                              r'''$.dayId''',
                                                            ).toString(),
                                                            lastBillNo:
                                                                getJsonField(
                                                              _model
                                                                  .shiftSummarResultsNew2,
                                                              r'''$.lastBillNo''',
                                                            ).toString(),
                                                            lastBillTime: functions
                                                                .timestampToMili(
                                                                    getCurrentTimestamp),
                                                            tax: getJsonField(
                                                              _model
                                                                  .shiftSummarResultsNew2,
                                                              r'''$.tax''',
                                                            ),
                                                            deliveryCharges:
                                                                getJsonField(
                                                              _model
                                                                  .shiftSummarResultsNew2,
                                                              r'''$.deliveryCharges''',
                                                            ),
                                                            discount:
                                                                getJsonField(
                                                              _model
                                                                  .shiftSummarResultsNew2,
                                                              r'''$.discount''',
                                                            ),
                                                            totalSale:
                                                                getJsonField(
                                                              _model
                                                                  .shiftSummarResultsNew2,
                                                              r'''$.totalSale''',
                                                            ),
                                                            cashSale:
                                                                getJsonField(
                                                              _model
                                                                  .shiftSummarResultsNew2,
                                                              r'''$.cashSale''',
                                                            ),
                                                            paymentJson:
                                                                getJsonField(
                                                              _model
                                                                  .shiftSummarResultsNew2,
                                                              r'''$.paymentJson''',
                                                            ).toString(),
                                                            code: FFAppState()
                                                                .newcount,
                                                            endTime: FFAppState()
                                                                .shiftDetails
                                                                .endTime,
                                                            advanceAmtTotal:
                                                                FFAppState()
                                                                    .shiftDetails
                                                                    .advanceAmtTotal,
                                                            cashInHand:
                                                                getJsonField(
                                                              _model
                                                                  .shiftSummarResultsNew2,
                                                              r'''$.cashSale''',
                                                            ),
                                                          ));
                                                          _model.updatedShift =
                                                              await actions
                                                                  .hiveShiftCrud(
                                                            _model.shiftidhive2,
                                                            FFAppState()
                                                                .shiftDetails,
                                                            'update',
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                          if (containerAppSettingsRecord!
                                                              .settingList
                                                              .where((e) =>
                                                                  e.title ==
                                                                  'enableStock')
                                                              .toList()
                                                              .firstOrNull!
                                                              .value) {
                                                            FFAppState()
                                                                .startLoop = 0;
                                                            safeSetState(() {});
                                                            while (FFAppState()
                                                                    .startLoop <
                                                                _model
                                                                    .prdlistsavebill!
                                                                    .length) {
                                                              _model.stockupdateprdsave =
                                                                  await queryProductRecordOnce(
                                                                parent: FFAppState()
                                                                    .outletIdRef,
                                                                queryBuilder:
                                                                    (productRecord) =>
                                                                        productRecord
                                                                            .where(
                                                                              'id',
                                                                              isEqualTo: (_model.prdlistsavebill?.elementAtOrNull(FFAppState().startLoop))?.id,
                                                                            )
                                                                            .where(
                                                                              'stockable',
                                                                              isEqualTo: true,
                                                                            ),
                                                                singleRecord:
                                                                    true,
                                                              ).then((s) => s
                                                                      .firstOrNull);
                                                              _shouldSetState =
                                                                  true;
                                                              if (_model
                                                                      .stockupdateprdsave !=
                                                                  null) {
                                                                await _model
                                                                    .stockupdateprdsave!
                                                                    .reference
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'currentStock': FieldValue.increment(-(functions.doubleToInt((_model
                                                                              .prdlistsavebill
                                                                              ?.elementAtOrNull(FFAppState().startLoop))
                                                                          ?.quantity)!)),
                                                                    },
                                                                  ),
                                                                });
                                                                _model.itemprd =
                                                                    await actions
                                                                        .hivegetproductbyId(
                                                                  _model
                                                                      .stockupdateprdsave
                                                                      ?.reference
                                                                      .id,
                                                                  _model
                                                                      .prdlistsavebill
                                                                      ?.elementAtOrNull(
                                                                          FFAppState()
                                                                              .startLoop),
                                                                  'get',
                                                                );
                                                                _shouldSetState =
                                                                    true;
                                                                FFAppState()
                                                                    .updateProductHiveputStruct(
                                                                  (e) => e
                                                                    ..id = _model
                                                                        .itemprd
                                                                        ?.id
                                                                    ..price = _model
                                                                        .itemprd
                                                                        ?.price
                                                                    ..category = _model
                                                                        .itemprd
                                                                        ?.category
                                                                    ..code = _model
                                                                        .itemprd
                                                                        ?.code
                                                                    ..name = _model
                                                                        .itemprd
                                                                        ?.name
                                                                    ..sellingPrice = _model
                                                                        .itemprd
                                                                        ?.sellingPrice
                                                                    ..mrpPrice = _model
                                                                        .itemprd
                                                                        ?.mrpPrice
                                                                    ..purchasePrice = _model
                                                                        .itemprd
                                                                        ?.purchasePrice
                                                                    ..categoryId = _model
                                                                        .itemprd
                                                                        ?.categoryId
                                                                    ..taxId = _model
                                                                        .itemprd
                                                                        ?.taxId
                                                                    ..unitId = _model
                                                                        .itemprd
                                                                        ?.unitId
                                                                    ..regionalName = _model
                                                                        .itemprd
                                                                        ?.regionalName
                                                                    ..barcode = _model
                                                                        .itemprd
                                                                        ?.barcode
                                                                    ..hsncode = _model
                                                                        .itemprd
                                                                        ?.hsncode
                                                                    ..reorderLevel = _model
                                                                        .itemprd
                                                                        ?.reorderLevel
                                                                    ..searchcode = _model
                                                                        .itemprd
                                                                        ?.searchcode
                                                                    ..shortName = _model
                                                                        .itemprd
                                                                        ?.shortName
                                                                    ..weightable = _model
                                                                        .itemprd
                                                                        ?.weightable
                                                                    ..stockable = _model
                                                                        .itemprd
                                                                        ?.stockable
                                                                    ..discountPer = _model
                                                                        .itemprd
                                                                        ?.discountPer
                                                                    ..discountAmt = _model
                                                                        .itemprd
                                                                        ?.discountAmt
                                                                    ..productMasterId = _model
                                                                        .itemprd
                                                                        ?.productMasterId
                                                                    ..recipeRefId = _model
                                                                        .itemprd
                                                                        ?.recipeRefId
                                                                    ..imageUrl = _model
                                                                        .itemprd
                                                                        ?.imageUrl
                                                                    ..serviceOutletId = _model
                                                                        .itemprd
                                                                        ?.serviceOutletId
                                                                    ..type = _model
                                                                        .itemprd
                                                                        ?.type
                                                                    ..recipeId = _model
                                                                        .itemprd
                                                                        ?.recipeRefId
                                                                    ..stock = _model
                                                                            .itemprd!
                                                                            .stock -
                                                                        (functions
                                                                            .doubleToInt((_model.prdlistsavebill?.elementAtOrNull(FFAppState().startLoop))?.quantity)!)
                                                                    ..isDeleted = _model
                                                                        .itemprd
                                                                        ?.isDeleted
                                                                    ..keywords = _model
                                                                        .itemprd!
                                                                        .keywords
                                                                        .toList()
                                                                    ..synC = _model
                                                                        .itemprd
                                                                        ?.synC
                                                                    ..hivekey = _model
                                                                        .itemprd
                                                                        ?.hivekey
                                                                    ..version = _model
                                                                        .itemprd
                                                                        ?.version,
                                                                );
                                                                safeSetState(
                                                                    () {});
                                                                _model.productupdated =
                                                                    await actions
                                                                        .hiveProductCrud(
                                                                  FFAppState()
                                                                      .productHiveput
                                                                      .hivekey,
                                                                  FFAppState()
                                                                      .productHiveput,
                                                                  'update',
                                                                );
                                                                _shouldSetState =
                                                                    true;
                                                                FFAppState()
                                                                    .productHive = [];
                                                                FFAppState()
                                                                        .productHiveput =
                                                                    ProductStructStruct();
                                                                safeSetState(
                                                                    () {});
                                                                _model.newupdatedproductlist2 =
                                                                    await actions
                                                                        .getProductlistHive();
                                                                _shouldSetState =
                                                                    true;
                                                                FFAppState()
                                                                        .productHive =
                                                                    _model
                                                                        .newupdatedproductlist2!
                                                                        .toList()
                                                                        .cast<
                                                                            ProductStructStruct>();
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                              FFAppState()
                                                                      .startLoop =
                                                                  FFAppState()
                                                                          .startLoop +
                                                                      1;
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          }
                                                          await actions
                                                              .removeFromAllBillList(
                                                            FFAppState()
                                                                .selBill,
                                                          );
                                                          FFAppState()
                                                                  .lastBill =
                                                              FFAppState()
                                                                  .finalAmt;
                                                          FFAppState()
                                                              .update(() {});
                                                          await actions
                                                              .clearValue();
                                                          FFAppState()
                                                              .noOfItems = 0;
                                                          FFAppState()
                                                              .subTotal = 0.0;
                                                          FFAppState().count =
                                                              _model
                                                                  .updatedShift!
                                                                  .billCount;
                                                          FFAppState()
                                                                  .billcount =
                                                              _model
                                                                  .updatedShift!
                                                                  .billCount;
                                                          FFAppState()
                                                              .update(() {});
                                                          FFAppState()
                                                              .oldBalance = 0;
                                                          FFAppState()
                                                              .custCredit = 0;
                                                          FFAppState()
                                                                  .custNameRef =
                                                              null;
                                                          FFAppState()
                                                                  .setCustRef =
                                                              null;
                                                          FFAppState()
                                                              .setCustName = '';
                                                          FFAppState()
                                                              .setCustMobNo = '';
                                                          FFAppState().taxamt =
                                                              0.0;
                                                          FFAppState()
                                                              .taxAmtPay = 0.0;
                                                          FFAppState().disPer =
                                                              0.0;
                                                          FFAppState()
                                                              .disAmtPay = 0.0;
                                                          FFAppState().disAmt =
                                                              0.0;
                                                          FFAppState()
                                                              .update(() {});
                                                          FFAppState()
                                                              .finalAmt = 0.0;
                                                          FFAppState().billAmt =
                                                              0.0;
                                                          FFAppState()
                                                                  .groceryJson =
                                                              null;
                                                          FFAppState()
                                                              .delCharges = 0.0;
                                                          FFAppState()
                                                              .disAmtPay = 0.0;
                                                          FFAppState()
                                                              .taxAmtPay = 0.0;
                                                          FFAppState().prdid =
                                                              '';
                                                          FFAppState()
                                                                  .shiftDetails =
                                                              _model
                                                                  .updatedShift!;
                                                          FFAppState()
                                                              .update(() {});
                                                          Navigator.pop(
                                                              context);
                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                          return;
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Login again to start Shift ',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                          return;
                                                        }
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Pay All Amount  !',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    1900),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                          ),
                                                        );
                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                        return;
                                                      }

                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'rungxnmb' /* Save */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 90.0,
                                                      height: 50.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor2,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLargeFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineLargeFamily),
                                                              ),
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      hoverColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      hoverBorderSide:
                                                          BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                      hoverTextColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      var _shouldSetState =
                                                          false;
                                                      _model.resultprint =
                                                          await actions
                                                              .calculateGroceryAmtaction(
                                                        FFAppState().PayMode,
                                                        valueOrDefault<double>(
                                                          FFAppState().finalAmt,
                                                          0.0,
                                                        ),
                                                        double.parse(_model
                                                            .textController1
                                                            .text),
                                                      );
                                                      _shouldSetState = true;
                                                      FFAppState().groceryJson =
                                                          _model.resultprint!;
                                                      safeSetState(() {});
                                                      _model.amount = '';
                                                      safeSetState(() {});
                                                      if (FFAppState()
                                                              .finalAmt ==
                                                          getJsonField(
                                                            FFAppState()
                                                                .groceryJson,
                                                            r'''$.paidAmt''',
                                                          )) {
                                                        if (getJsonField(
                                                          FFAppState()
                                                              .shiftDetailsJson,
                                                          r'''$.shiftExists''',
                                                        )) {
                                                          FFAppState().count =
                                                              FFAppState()
                                                                      .count +
                                                                  1;
                                                          FFAppState()
                                                                  .newcount =
                                                              FFAppState()
                                                                      .newcount +
                                                                  1;
                                                          FFAppState()
                                                                  .billcount =
                                                              FFAppState()
                                                                      .billcount +
                                                                  1;
                                                          safeSetState(() {});
                                                        } else {
                                                          FFAppState().count =
                                                              FFAppState()
                                                                      .count +
                                                                  1;
                                                          FFAppState()
                                                                  .newcount =
                                                              FFAppState()
                                                                      .newcount +
                                                                  1;
                                                          FFAppState()
                                                                  .billcount =
                                                              FFAppState()
                                                                      .billcount +
                                                                  1;
                                                          safeSetState(() {});
                                                        }

                                                        _model.prdlinstnewtx =
                                                            await actions
                                                                .filterProducts2(
                                                          FFAppState().selBill,
                                                          FFAppState()
                                                              .allBillsList
                                                              .toList(),
                                                        );
                                                        _shouldSetState = true;
                                                        _model.appsettingnew =
                                                            await queryAppSettingsRecordOnce(
                                                          parent: FFAppState()
                                                              .outletIdRef,
                                                          queryBuilder:
                                                              (appSettingsRecord) =>
                                                                  appSettingsRecord
                                                                      .where(
                                                            'deviceId',
                                                            isEqualTo:
                                                                FFAppState()
                                                                    .dId,
                                                          ),
                                                          singleRecord: true,
                                                        ).then((s) =>
                                                                s.firstOrNull);
                                                        _shouldSetState = true;
                                                        _model.outletdoc =
                                                            await queryOutletRecordOnce(
                                                          queryBuilder:
                                                              (outletRecord) =>
                                                                  outletRecord
                                                                      .where(
                                                            'id',
                                                            isEqualTo:
                                                                FFAppState()
                                                                    .outletIdRef
                                                                    ?.id,
                                                          ),
                                                          singleRecord: true,
                                                        ).then((s) =>
                                                                s.firstOrNull);
                                                        _shouldSetState = true;
                                                        if ((double.parse(
                                                                valueOrDefault<
                                                                    String>(
                                                              getJsonField(
                                                                FFAppState()
                                                                    .groceryJson,
                                                                r'''$.paymentMode.CREDIT''',
                                                              )?.toString(),
                                                              '0',
                                                            ))) >
                                                            0.0) {
                                                          if (FFAppState()
                                                                      .setCustRef
                                                                      ?.id !=
                                                                  null &&
                                                              FFAppState()
                                                                      .setCustRef
                                                                      ?.id !=
                                                                  '') {
                                                            if (FFAppState()
                                                                    .oldBalance <
                                                                FFAppState()
                                                                    .custCredit) {
                                                              _model.totalcredit =
                                                                  await actions
                                                                      .oldbalanceplusamt(
                                                                FFAppState()
                                                                    .oldBalance,
                                                                valueOrDefault<
                                                                    double>(
                                                                  getJsonField(
                                                                    FFAppState()
                                                                        .groceryJson,
                                                                    r'''$.paymentMode.CREDIT''',
                                                                  ),
                                                                  0.0,
                                                                ),
                                                              );
                                                              _shouldSetState =
                                                                  true;

                                                              await FFAppState()
                                                                  .setCustRef!
                                                                  .update(
                                                                      createPartyRecordData(
                                                                    credit:
                                                                        true,
                                                                    oldBalance:
                                                                        _model
                                                                            .totalcredit,
                                                                    lastVisit: getCurrentTimestamp
                                                                        .millisecondsSinceEpoch
                                                                        .toString(),
                                                                  ));

                                                              var paymentRecordReference =
                                                                  PaymentRecord
                                                                      .createDoc(
                                                                          FFAppState()
                                                                              .outletIdRef!);
                                                              await paymentRecordReference
                                                                  .set(
                                                                      createPaymentRecordData(
                                                                amount:
                                                                    valueOrDefault<
                                                                        double>(
                                                                  getJsonField(
                                                                    FFAppState()
                                                                        .groceryJson,
                                                                    r'''$.paymentMode.CREDIT''',
                                                                  ),
                                                                  0.0,
                                                                ),
                                                                paymentType:
                                                                    'CREDIT',
                                                                createdBy:
                                                                    FFAppState()
                                                                        .userdoc,
                                                                createdDate:
                                                                    getCurrentTimestamp
                                                                        .millisecondsSinceEpoch,
                                                                party: FFAppState()
                                                                    .setCustRef,
                                                                expenceType:
                                                                    'Debit',
                                                                oldBalance: _model
                                                                    .totalcredit,
                                                              ));
                                                              _model.paymentDoc22d =
                                                                  PaymentRecord
                                                                      .getDocumentFromData(
                                                                          createPaymentRecordData(
                                                                            amount:
                                                                                valueOrDefault<double>(
                                                                              getJsonField(
                                                                                FFAppState().groceryJson,
                                                                                r'''$.paymentMode.CREDIT''',
                                                                              ),
                                                                              0.0,
                                                                            ),
                                                                            paymentType:
                                                                                'CREDIT',
                                                                            createdBy:
                                                                                FFAppState().userdoc,
                                                                            createdDate:
                                                                                getCurrentTimestamp.millisecondsSinceEpoch,
                                                                            party:
                                                                                FFAppState().setCustRef,
                                                                            expenceType:
                                                                                'Debit',
                                                                            oldBalance:
                                                                                _model.totalcredit,
                                                                          ),
                                                                          paymentRecordReference);
                                                              _shouldSetState =
                                                                  true;
                                                            } else {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    content: Text(
                                                                        'Credit Limit Exceeded !'),
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
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            }
                                                          } else {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  content: Text(
                                                                      'Select Customer '),
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
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          }
                                                        }

                                                        var invoiceRecordReference =
                                                            InvoiceRecord.createDoc(
                                                                FFAppState()
                                                                    .outletIdRef!);
                                                        await invoiceRecordReference
                                                            .set({
                                                          ...createInvoiceRecordData(
                                                            invoice: functions
                                                                .genInvoiceNumyear(
                                                                    FFAppState()
                                                                        .newcount),
                                                            party:
                                                                valueOrDefault<
                                                                    String>(
                                                              FFAppState()
                                                                  .setCustRef
                                                                  ?.id,
                                                              'NA',
                                                            ),
                                                            products: '',
                                                            invoiceDate: functions
                                                                .timestampToMili(
                                                                    getCurrentTimestamp),
                                                            paymentMode:
                                                                getJsonField(
                                                              FFAppState()
                                                                  .groceryJson,
                                                              r'''$.paymentMode''',
                                                            ).toString(),
                                                            dayId: functions
                                                                .getDayId(),
                                                            discountAmt:
                                                                valueOrDefault<
                                                                    double>(
                                                              FFAppState()
                                                                  .disAmt,
                                                              0.0,
                                                            ),
                                                            discountPer:
                                                                valueOrDefault<
                                                                    double>(
                                                              FFAppState()
                                                                  .disPer,
                                                              0.0,
                                                            ),
                                                            delliveryChrg:
                                                                valueOrDefault<
                                                                    double>(
                                                              FFAppState()
                                                                  .delCharges,
                                                              0.0,
                                                            ),
                                                            taxAmt: FFAppState()
                                                                .taxamt,
                                                            billAmt:
                                                                valueOrDefault<
                                                                    double>(
                                                              FFAppState()
                                                                  .billAmt,
                                                              0.0,
                                                            ),
                                                            finalBillAmt:
                                                                valueOrDefault<
                                                                    double>(
                                                              FFAppState()
                                                                  .finalAmt,
                                                              0.0,
                                                            ),
                                                            shiftId:
                                                                getJsonField(
                                                              FFAppState()
                                                                  .shiftDetailsJson,
                                                              r'''$.shiftId''',
                                                            ).toString(),
                                                            count: FFAppState()
                                                                .newcount,
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'productList':
                                                                  getSelItemListListFirestoreData(
                                                                _model
                                                                    .prdlinstnewtx,
                                                              ),
                                                            },
                                                          ),
                                                        });
                                                        _model.invonlineprt =
                                                            InvoiceRecord
                                                                .getDocumentFromData({
                                                          ...createInvoiceRecordData(
                                                            invoice: functions
                                                                .genInvoiceNumyear(
                                                                    FFAppState()
                                                                        .newcount),
                                                            party:
                                                                valueOrDefault<
                                                                    String>(
                                                              FFAppState()
                                                                  .setCustRef
                                                                  ?.id,
                                                              'NA',
                                                            ),
                                                            products: '',
                                                            invoiceDate: functions
                                                                .timestampToMili(
                                                                    getCurrentTimestamp),
                                                            paymentMode:
                                                                getJsonField(
                                                              FFAppState()
                                                                  .groceryJson,
                                                              r'''$.paymentMode''',
                                                            ).toString(),
                                                            dayId: functions
                                                                .getDayId(),
                                                            discountAmt:
                                                                valueOrDefault<
                                                                    double>(
                                                              FFAppState()
                                                                  .disAmt,
                                                              0.0,
                                                            ),
                                                            discountPer:
                                                                valueOrDefault<
                                                                    double>(
                                                              FFAppState()
                                                                  .disPer,
                                                              0.0,
                                                            ),
                                                            delliveryChrg:
                                                                valueOrDefault<
                                                                    double>(
                                                              FFAppState()
                                                                  .delCharges,
                                                              0.0,
                                                            ),
                                                            taxAmt: FFAppState()
                                                                .taxamt,
                                                            billAmt:
                                                                valueOrDefault<
                                                                    double>(
                                                              FFAppState()
                                                                  .billAmt,
                                                              0.0,
                                                            ),
                                                            finalBillAmt:
                                                                valueOrDefault<
                                                                    double>(
                                                              FFAppState()
                                                                  .finalAmt,
                                                              0.0,
                                                            ),
                                                            shiftId:
                                                                getJsonField(
                                                              FFAppState()
                                                                  .shiftDetailsJson,
                                                              r'''$.shiftId''',
                                                            ).toString(),
                                                            count: FFAppState()
                                                                .newcount,
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'productList':
                                                                  getSelItemListListFirestoreData(
                                                                _model
                                                                    .prdlinstnewtx,
                                                              ),
                                                            },
                                                          ),
                                                        }, invoiceRecordReference);
                                                        _shouldSetState = true;

                                                        await _model
                                                            .invonlineprt!
                                                            .reference
                                                            .update(
                                                                createInvoiceRecordData(
                                                          id: _model
                                                              .invonlineprt
                                                              ?.reference
                                                              .id,
                                                        ));
                                                        _model.hiveInvoiceData =
                                                            await actions
                                                                .addInvoiceBillhive(
                                                          _model.invonlineprt!
                                                              .reference.id,
                                                          functions
                                                              .genInvoiceNumyear(
                                                                  FFAppState()
                                                                      .newcount),
                                                          valueOrDefault<
                                                              String>(
                                                            FFAppState()
                                                                .setCustRef
                                                                ?.id,
                                                            '0',
                                                          ),
                                                          functions.timestampToMili(
                                                              getCurrentTimestamp),
                                                          functions.getDayId(),
                                                          getJsonField(
                                                            FFAppState()
                                                                .groceryJson,
                                                            r'''$.paymentMode''',
                                                          ).toString(),
                                                          valueOrDefault<
                                                              double>(
                                                            FFAppState().disAmt,
                                                            0.0,
                                                          ),
                                                          valueOrDefault<
                                                              double>(
                                                            FFAppState().disPer,
                                                            0.0,
                                                          ),
                                                          valueOrDefault<
                                                              double>(
                                                            FFAppState()
                                                                .delCharges,
                                                            0.0,
                                                          ),
                                                          FFAppState().taxamt,
                                                          valueOrDefault<
                                                              double>(
                                                            FFAppState()
                                                                .billAmt,
                                                            0.0,
                                                          ),
                                                          valueOrDefault<
                                                              double>(
                                                            FFAppState()
                                                                .finalAmt,
                                                            0.0,
                                                          ),
                                                          0.0,
                                                          _model.prdlinstnewtx
                                                              ?.toList(),
                                                          getJsonField(
                                                            FFAppState()
                                                                .shiftDetailsJson,
                                                            r'''$.shiftId''',
                                                          ).toString(),
                                                          false,
                                                          FFAppState()
                                                              .invoiceStructVersion,
                                                        );
                                                        _shouldSetState = true;
                                                        if (getJsonField(
                                                          FFAppState()
                                                              .shiftDetailsJson,
                                                          r'''$.shiftExists''',
                                                        )) {
                                                          _model.shiftSummarResultsNew =
                                                              await actions
                                                                  .calShiftSummaryNewgrocery(
                                                            _model
                                                                .hiveInvoiceData!,
                                                            FFAppState()
                                                                .shiftDetailsJson,
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                          FFAppState()
                                                              .updateShiftDetailsStruct(
                                                            (e) => e
                                                              ..billCount =
                                                                  FFAppState()
                                                                      .billcount
                                                              ..totalSale =
                                                                  getJsonField(
                                                                _model
                                                                    .shiftSummarResultsNew,
                                                                r'''$.totalSale''',
                                                              )
                                                              ..deliveryCharges =
                                                                  getJsonField(
                                                                _model
                                                                    .shiftSummarResultsNew,
                                                                r'''$.deliveryCharges''',
                                                              )
                                                              ..tax =
                                                                  getJsonField(
                                                                _model
                                                                    .shiftSummarResultsNew,
                                                                r'''$.tax''',
                                                              )
                                                              ..lastBillNo =
                                                                  getJsonField(
                                                                _model
                                                                    .shiftSummarResultsNew,
                                                                r'''$.lastBillno''',
                                                              ).toString()
                                                              ..discount =
                                                                  getJsonField(
                                                                _model
                                                                    .shiftSummarResultsNew,
                                                                r'''$.discount''',
                                                              )
                                                              ..lastBillTime = functions
                                                                  .timestampToMili(
                                                                      getCurrentTimestamp)
                                                              ..cashSale =
                                                                  getJsonField(
                                                                _model
                                                                    .shiftSummarResultsNew,
                                                                r'''$.cashSale''',
                                                              )
                                                              ..paymentJson =
                                                                  getJsonField(
                                                                _model
                                                                    .shiftSummarResultsNew,
                                                                r'''$.paymentJson''',
                                                              ).toString()
                                                              ..dayId =
                                                                  getJsonField(
                                                                _model
                                                                    .shiftSummarResultsNew,
                                                                r'''$.dayId''',
                                                              ).toString()
                                                              ..shiftId =
                                                                  getJsonField(
                                                                _model
                                                                    .shiftSummarResultsNew,
                                                                r'''$.shiftId''',
                                                              ).toString()
                                                              ..hivekey =
                                                                  FFAppState()
                                                                      .shiftDetails
                                                                      .hivekey
                                                              ..newIDShift =
                                                                  FFAppState()
                                                                      .shiftDetails
                                                                      .newIDShift
                                                              ..code = FFAppState()
                                                                  .shiftDetails
                                                                  .code
                                                              ..endTime =
                                                                  FFAppState()
                                                                      .shiftDetails
                                                                      .endTime
                                                              ..advanceAmtTotal =
                                                                  FFAppState()
                                                                      .shiftDetails
                                                                      .advanceAmtTotal
                                                              ..customerReciveAmtTotal =
                                                                  FFAppState()
                                                                      .shiftDetails
                                                                      .customerReciveAmtTotal
                                                              ..expensesAmtTotal =
                                                                  FFAppState()
                                                                      .shiftDetails
                                                                      .expensesAmtTotal
                                                              ..openingAmt =
                                                                  FFAppState()
                                                                      .shiftDetails
                                                                      .openingAmt
                                                              ..receiveAmtTotal =
                                                                  FFAppState()
                                                                      .shiftDetails
                                                                      .receiveAmtTotal
                                                              ..refoundAmount =
                                                                  FFAppState()
                                                                      .shiftDetails
                                                                      .refoundAmount
                                                              ..roundOff =
                                                                  FFAppState()
                                                                      .shiftDetails
                                                                      .roundOff
                                                              ..cashInHand =
                                                                  getJsonField(
                                                                _model
                                                                    .shiftSummarResultsNew,
                                                                r'''$.cashSale''',
                                                              )
                                                              ..startTime =
                                                                  FFAppState()
                                                                      .shiftDetails
                                                                      .startTime
                                                              ..inActive =
                                                                  FFAppState()
                                                                      .shiftDetails
                                                                      .inActive
                                                              ..shiftNo =
                                                                  FFAppState()
                                                                      .shiftDetails
                                                                      .shiftNo
                                                              ..subTotalBill =
                                                                  FFAppState()
                                                                      .shiftDetails
                                                                      .subTotalBill
                                                              ..version =
                                                                  FFAppState()
                                                                      .shiftDetails
                                                                      .version
                                                              ..userId =
                                                                  FFAppState()
                                                                      .shiftDetails
                                                                      .userId
                                                              ..deviceId =
                                                                  FFAppState()
                                                                      .shiftDetails
                                                                      .deviceId
                                                              ..synC = FFAppState()
                                                                  .shiftDetails
                                                                  .synC
                                                              ..id = FFAppState()
                                                                  .shiftDetails
                                                                  .id,
                                                          );
                                                          safeSetState(() {});
                                                          _model.shiftondataprint =
                                                              await queryShiftRecordOnce(
                                                            parent: FFAppState()
                                                                .outletIdRef,
                                                            queryBuilder:
                                                                (shiftRecord) =>
                                                                    shiftRecord
                                                                        .where(
                                                              'id',
                                                              isEqualTo:
                                                                  valueOrDefault<
                                                                      String>(
                                                                getJsonField(
                                                                  FFAppState()
                                                                      .shiftDetailsJson,
                                                                  r'''$.ref''',
                                                                )?.toString(),
                                                                'NA',
                                                              ),
                                                            ),
                                                            singleRecord: true,
                                                          ).then((s) => s
                                                                  .firstOrNull);
                                                          _shouldSetState =
                                                              true;

                                                          await _model
                                                              .shiftondataprint!
                                                              .reference
                                                              .update(
                                                                  createShiftRecordData(
                                                            billCount:
                                                                FFAppState()
                                                                    .shiftDetails
                                                                    .billCount,
                                                            dayId: getJsonField(
                                                              _model
                                                                  .shiftSummarResultsNew,
                                                              r'''$.dayId''',
                                                            ).toString(),
                                                            lastBillNo:
                                                                getJsonField(
                                                              _model
                                                                  .shiftSummarResultsNew,
                                                              r'''$.lastBillNo''',
                                                            ).toString(),
                                                            lastBillTime: functions
                                                                .timestampToMili(
                                                                    getCurrentTimestamp),
                                                            tax: getJsonField(
                                                              _model
                                                                  .shiftSummarResultsNew,
                                                              r'''$.tax''',
                                                            ),
                                                            deliveryCharges:
                                                                getJsonField(
                                                              _model
                                                                  .shiftSummarResultsNew,
                                                              r'''$.deliveryCharges''',
                                                            ),
                                                            discount:
                                                                getJsonField(
                                                              _model
                                                                  .shiftSummarResultsNew,
                                                              r'''$.discount''',
                                                            ),
                                                            totalSale:
                                                                getJsonField(
                                                              _model
                                                                  .shiftSummarResultsNew,
                                                              r'''$.totalSale''',
                                                            ),
                                                            cashSale:
                                                                getJsonField(
                                                              _model
                                                                  .shiftSummarResultsNew,
                                                              r'''$.cashSale''',
                                                            ),
                                                            paymentJson:
                                                                getJsonField(
                                                              _model
                                                                  .shiftSummarResultsNew,
                                                              r'''$.paymentJson''',
                                                            ).toString(),
                                                            code: FFAppState()
                                                                .newcount,
                                                            endTime:
                                                                getJsonField(
                                                              FFAppState()
                                                                  .shiftDetailsJson,
                                                              r'''$.endTime''',
                                                            ),
                                                            advanceAmtTotal:
                                                                FFAppState()
                                                                    .shiftDetails
                                                                    .advanceAmtTotal,
                                                            cashInHand:
                                                                getJsonField(
                                                              _model
                                                                  .shiftSummarResultsNew,
                                                              r'''$.cashSale''',
                                                            ),
                                                          ));
                                                          _model.updatedShiftDetails =
                                                              await actions
                                                                  .hiveShiftCrud(
                                                            FFAppState()
                                                                .shiftDetails
                                                                .newIDShift,
                                                            FFAppState()
                                                                .shiftDetails,
                                                            'update',
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Login again to start Shift ',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                          return;
                                                        }

                                                        if (!functions
                                                            .isPrinterSelected(
                                                                FFAppState()
                                                                    .printerDevice)!) {
                                                          _model.resDevice2 =
                                                              await actions
                                                                  .scanPrinter(
                                                            FFAppState()
                                                                .posMode,
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                        }
                                                        _model.isconnected =
                                                            await actions
                                                                .connectDevice(
                                                          FFAppState()
                                                              .printerDevice,
                                                          FFAppState()
                                                              .printerIndex,
                                                        );
                                                        _shouldSetState = true;
                                                        if (_model
                                                            .isconnected!) {
                                                          FFAppState()
                                                                  .lastBill =
                                                              FFAppState()
                                                                  .finalAmt;
                                                          FFAppState()
                                                              .update(() {});
                                                          _model.returnedList2 =
                                                              await actions
                                                                  .selectBillPrint(
                                                            FFAppState()
                                                                .selBill
                                                                .toString(),
                                                            FFAppState()
                                                                .allBillsList
                                                                .toList(),
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                          _model.device =
                                                              await actions
                                                                  .newCustomAction(
                                                            FFAppState()
                                                                .printerIndex,
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                          await actions
                                                              .printBillnewhivegrocery(
                                                            _model
                                                                .returnedList2!
                                                                .toList(),
                                                            _model.device!
                                                                .toList(),
                                                            FFAppState()
                                                                .isPrinterConnected,
                                                            FFAppState()
                                                                .printerName,
                                                            getJsonField(
                                                              functions
                                                                  .outletDocToJson(
                                                                      _model
                                                                          .outletdoc!),
                                                              r'''$''',
                                                            ),
                                                            _model
                                                                .hiveInvoiceData!,
                                                            FFAppState()
                                                                .paperSize,
                                                            _model
                                                                .appsettingnew!,
                                                          );
                                                          if (_model
                                                              .appsettingnew!
                                                              .settingList
                                                              .where((e) =>
                                                                  e.title ==
                                                                  'enableStock')
                                                              .toList()
                                                              .firstOrNull!
                                                              .value) {
                                                            FFAppState()
                                                                .startLoop = 0;
                                                            safeSetState(() {});
                                                            while (FFAppState()
                                                                    .startLoop <
                                                                _model
                                                                    .prdlinstnewtx!
                                                                    .length) {
                                                              _model.stockupdateprdprt =
                                                                  await queryProductRecordOnce(
                                                                parent: FFAppState()
                                                                    .outletIdRef,
                                                                queryBuilder:
                                                                    (productRecord) =>
                                                                        productRecord
                                                                            .where(
                                                                              'id',
                                                                              isEqualTo: (_model.prdlinstnewtx?.elementAtOrNull(FFAppState().startLoop))?.id,
                                                                            )
                                                                            .where(
                                                                              'stockable',
                                                                              isEqualTo: true,
                                                                            ),
                                                                singleRecord:
                                                                    true,
                                                              ).then((s) => s
                                                                      .firstOrNull);
                                                              _shouldSetState =
                                                                  true;
                                                              if (_model
                                                                      .stockupdateprdprt !=
                                                                  null) {
                                                                await _model
                                                                    .stockupdateprdprt!
                                                                    .reference
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'currentStock': FieldValue.increment(-(functions.doubleToInt((_model
                                                                              .prdlinstnewtx
                                                                              ?.elementAtOrNull(FFAppState().startLoop))
                                                                          ?.quantity)!)),
                                                                    },
                                                                  ),
                                                                });
                                                                _model.itemprd2 =
                                                                    await actions
                                                                        .hivegetproductbyId(
                                                                  _model
                                                                      .stockupdateprdprt
                                                                      ?.reference
                                                                      .id,
                                                                  _model
                                                                      .prdlinstnewtx
                                                                      ?.elementAtOrNull(
                                                                          FFAppState()
                                                                              .startLoop),
                                                                  'get',
                                                                );
                                                                _shouldSetState =
                                                                    true;
                                                                FFAppState()
                                                                    .updateProductHiveputStruct(
                                                                  (e) => e
                                                                    ..id = _model
                                                                        .itemprd2
                                                                        ?.id
                                                                    ..price = _model
                                                                        .itemprd2
                                                                        ?.price
                                                                    ..category = _model
                                                                        .itemprd2
                                                                        ?.category
                                                                    ..code = _model
                                                                        .itemprd2
                                                                        ?.code
                                                                    ..name = _model
                                                                        .itemprd2
                                                                        ?.name
                                                                    ..sellingPrice = _model
                                                                        .itemprd2
                                                                        ?.sellingPrice
                                                                    ..mrpPrice = _model
                                                                        .itemprd2
                                                                        ?.mrpPrice
                                                                    ..purchasePrice = _model
                                                                        .itemprd2
                                                                        ?.purchasePrice
                                                                    ..categoryId = _model
                                                                        .itemprd2
                                                                        ?.categoryId
                                                                    ..taxId = _model
                                                                        .itemprd2
                                                                        ?.taxId
                                                                    ..unitId = _model
                                                                        .itemprd2
                                                                        ?.unitId
                                                                    ..regionalName = _model
                                                                        .itemprd2
                                                                        ?.regionalName
                                                                    ..barcode = _model
                                                                        .itemprd2
                                                                        ?.barcode
                                                                    ..hsncode = _model
                                                                        .itemprd2
                                                                        ?.hsncode
                                                                    ..reorderLevel = _model
                                                                        .itemprd2
                                                                        ?.reorderLevel
                                                                    ..searchcode = _model
                                                                        .itemprd2
                                                                        ?.searchcode
                                                                    ..shortName = _model
                                                                        .itemprd2
                                                                        ?.shortName
                                                                    ..weightable = _model
                                                                        .itemprd2
                                                                        ?.weightable
                                                                    ..stockable = _model
                                                                        .itemprd2
                                                                        ?.stockable
                                                                    ..discountPer = _model
                                                                        .itemprd2
                                                                        ?.discountPer
                                                                    ..discountAmt = _model
                                                                        .itemprd2
                                                                        ?.discountAmt
                                                                    ..productMasterId = _model
                                                                        .itemprd2
                                                                        ?.productMasterId
                                                                    ..recipeRefId = _model
                                                                        .itemprd2
                                                                        ?.recipeRefId
                                                                    ..imageUrl = _model
                                                                        .itemprd2
                                                                        ?.imageUrl
                                                                    ..serviceOutletId = _model
                                                                        .itemprd2
                                                                        ?.serviceOutletId
                                                                    ..type = _model
                                                                        .itemprd2
                                                                        ?.type
                                                                    ..recipeId = _model
                                                                        .itemprd2
                                                                        ?.recipeRefId
                                                                    ..stock = _model
                                                                            .itemprd2!
                                                                            .stock -
                                                                        (functions
                                                                            .doubleToInt((_model.prdlinstnewtx?.elementAtOrNull(FFAppState().startLoop))?.quantity)!)
                                                                    ..isDeleted = _model
                                                                        .itemprd2
                                                                        ?.isDeleted
                                                                    ..keywords = _model
                                                                        .itemprd2!
                                                                        .keywords
                                                                        .toList()
                                                                    ..synC = _model
                                                                        .itemprd2
                                                                        ?.synC
                                                                    ..hivekey = _model
                                                                        .itemprd2
                                                                        ?.hivekey
                                                                    ..version = _model
                                                                        .itemprd2
                                                                        ?.version,
                                                                );
                                                                safeSetState(
                                                                    () {});
                                                                _model.productupdated2 =
                                                                    await actions
                                                                        .hiveProductCrud(
                                                                  FFAppState()
                                                                      .productHiveput
                                                                      .hivekey,
                                                                  FFAppState()
                                                                      .productHiveput,
                                                                  'update',
                                                                );
                                                                _shouldSetState =
                                                                    true;
                                                                FFAppState()
                                                                    .productHive = [];
                                                                FFAppState()
                                                                        .productHiveput =
                                                                    ProductStructStruct();
                                                                safeSetState(
                                                                    () {});
                                                                _model.newupdatedproductlist22 =
                                                                    await actions
                                                                        .getProductlistHive();
                                                                _shouldSetState =
                                                                    true;
                                                                FFAppState()
                                                                        .productHive =
                                                                    _model
                                                                        .newupdatedproductlist22!
                                                                        .toList()
                                                                        .cast<
                                                                            ProductStructStruct>();
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                              FFAppState()
                                                                      .startLoop =
                                                                  FFAppState()
                                                                          .startLoop +
                                                                      1;
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          }
                                                          await actions
                                                              .removeFromAllBillList(
                                                            FFAppState()
                                                                .selBill,
                                                          );
                                                          await actions
                                                              .clearValue();
                                                          FFAppState()
                                                              .subTotal = 0.0;
                                                          FFAppState()
                                                              .delCharges = 0.0;
                                                          FFAppState()
                                                              .oldBalance = 0;
                                                          FFAppState()
                                                              .custCredit = 0;
                                                          FFAppState()
                                                                  .custNameRef =
                                                              null;
                                                          FFAppState()
                                                                  .setCustRef =
                                                              null;
                                                          FFAppState()
                                                              .setCustName = '';
                                                          FFAppState()
                                                              .setCustMobNo = '';
                                                          FFAppState()
                                                              .noOfItems = 0;
                                                          FFAppState()
                                                              .taxAmtPay = 0.0;
                                                          FFAppState().taxamt =
                                                              0.0;
                                                          FFAppState()
                                                              .disAmtPay = 0.0;
                                                          FFAppState().disPer =
                                                              0.0;
                                                          FFAppState().disAmt =
                                                              0.0;
                                                          FFAppState()
                                                              .update(() {});
                                                          FFAppState()
                                                              .finalAmt = 0.0;
                                                          FFAppState().billAmt =
                                                              0.0;
                                                          FFAppState().count =
                                                              _model
                                                                  .updatedShiftDetails!
                                                                  .billCount;
                                                          FFAppState()
                                                                  .groceryJson =
                                                              null;
                                                          FFAppState().prdid =
                                                              '';
                                                          FFAppState()
                                                                  .billcount =
                                                              _model
                                                                  .updatedShiftDetails!
                                                                  .billCount;
                                                          FFAppState()
                                                                  .shiftDetails =
                                                              _model
                                                                  .updatedShiftDetails!;
                                                          FFAppState()
                                                                  .shiftDetailsJson =
                                                              _model
                                                                  .shiftSummarResultsNew!;
                                                          FFAppState()
                                                              .update(() {});
                                                          Navigator.pop(
                                                              context);
                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                          return;
                                                        } else {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
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
                                                                    child: Text(
                                                                        'Ok'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                          return;
                                                        }
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Pay All Amount  !',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    1900),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                          ),
                                                        );
                                                      }

                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'snwhhnio' /* Print */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 90.0,
                                                      height: 50.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLargeFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineLargeFamily),
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      hoverColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      hoverBorderSide:
                                                          BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        width: 1.0,
                                                      ),
                                                      hoverTextColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 10.0)),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  if (_model.flag)
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/10-11-02-622_512.gif',
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                ],
              )),
        ),
      ),
    );
  }
}
