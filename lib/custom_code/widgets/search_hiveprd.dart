// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart';

import 'package:flutter/scheduler.dart';
import '/custom_code/actions/index.dart' as actions;

import '/flutter_flow/custom_functions.dart' as functions;
// Imports other custom widgets
import '/flutter_flow/custom_functions.dart' as functions;
import '../actions/setup_item_hive.dart';

import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter/scheduler.dart';

class SearchHiveprd extends StatefulWidget {
  const SearchHiveprd({
    Key? key,
    this.width,
    this.height,
    required this.document,
    required this.billno,
    required this.billnum,
    required this.disAmt,
    required this.delChargs,
    required this.taxcollection,
    required this.appSettingsRecord,
    required this.unitcollection,
    required this.purchase,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<ProductStructStruct> document;
  final int billno;
  final String billnum;
  final double disAmt;
  final double delChargs;
  final List<TaxMasterRecord> taxcollection;
  final AppSettingsRecord appSettingsRecord;
  final List<UnitTypeRecord> unitcollection;
  final bool purchase;
  @override
  _SearchHiveprdState createState() => _SearchHiveprdState();
}

class _SearchHiveprdState extends State<SearchHiveprd> {
  TextEditingController _productNameController = TextEditingController();

  late LoadingScreenNewModel _model;
  FocusNode _focusNode = FocusNode();
  SuggestionsBoxController _suggestionsBoxController =
      SuggestionsBoxController();
  int _selectedIndex = -1; // Track selected item index
  List<ProductStructStruct> _filteredProducts = []; // Track filtered results
  List<ProductStructStruct> matchingProducts = [];
  @override
  void initState() {
    super.initState();

    _model = createModel(context, () => LoadingScreenNewModel());

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _suggestionsBoxController.open();
      }
    });
  }

  LoadingScreenNewModel createModel(
      BuildContext context, LoadingScreenNewModel Function() modelBuilder) {
    return modelBuilder();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: RawKeyboardListener(
              focusNode: FocusNode(), // Separate focus to avoid conflicts
              onKey: (RawKeyEvent event) {
                if (event is RawKeyDownEvent && _filteredProducts.isNotEmpty) {
                  if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
                    setState(() {
                      if (_selectedIndex == -1) {
                        _selectedIndex = 0; // Start at first item
                      } else {
                        _selectedIndex =
                            (_selectedIndex + 1) % _filteredProducts.length;
                      }
                    });
                    _refreshSuggestionsBox();
                  } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
                    setState(() {
                      if (_selectedIndex == -1) {
                        _selectedIndex = _filteredProducts.length - 1;
                      } else {
                        _selectedIndex =
                            (_selectedIndex - 1 + _filteredProducts.length) %
                                _filteredProducts.length;
                      }
                    });
                    _refreshSuggestionsBox();
                  } else if (event.logicalKey == LogicalKeyboardKey.enter &&
                      _selectedIndex != -1) {
                    _handleSuggestionSelected(
                        _filteredProducts[_selectedIndex]);
                  }
                }
              },
              child: TypeAheadField<ProductStructStruct>(
                  suggestionsBoxController: _suggestionsBoxController,
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: _productNameController,
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Search for a product...',
                    ),
                    onSubmitted: (value) async {
                      // print('Submitted value: $value');
                      FFAppState().groceryshow = false;
                      setState(() {
                        _filteredProducts = widget.document
                            .where((product) => product.name
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();

                        _filteredProducts.addAll(widget.document
                            .where((product) => product.barcode
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList());

                        // Remove duplicates if necessary
                        _filteredProducts = _filteredProducts.toSet().toList();

                        _selectedIndex = -1; // Reset selection on new input
                        matchingProducts = _filteredProducts;
                      });

                      if (matchingProducts.isNotEmpty) {
                        ProductStructStruct selectedProduct =
                            matchingProducts.first;
                        FFAppState().productHiveput = selectedProduct;
                        var _shouldSetState = false;
                        if (selectedProduct.stockable) {
                          if (selectedProduct.stock > 0) {
                            if (FFAppState().prdid != selectedProduct.id) {
                              if (FFAppState().holdBillCount == 0) {
                                FFAppState().holdBillCount =
                                    FFAppState().holdBillCount + 1;
                                FFAppState().addToAllBillsList(
                                    functions.generateBillDetailsJson(
                                        0.0,
                                        0.0,
                                        0.0,
                                        'CASH',
                                        0.0,
                                        0.0,
                                        FFAppState().billAmt,
                                        0.0,
                                        FFAppState().finalAmt,
                                        '0',
                                        FFAppState().itemCartList.toList(),
                                        FFAppState().holdBillCount));
                                FFAppState().selBill = 1;
                              }
                              /* _model.addtosavebill3 =
                                  await actions.addToHoldListprdCopy(
                                selectedProduct,
                                FFAppState().selBill,
                                widget!.taxcollection!.toList(),
                                functions.enabletaxinclusive(widget
                                    .appSettingsRecord.settingList
                                    .where(
                                        (e) => e.title == 'enableInclusiveTax')
                                    .toList()
                                    .first
                                    .value),
                              );*/
                              _model.addtosavebill3 =
                                  await actions.addToHoldListprdbarcode(
                                      selectedProduct,
                                      FFAppState().selBill,
                                      widget!.taxcollection!.toList(),
                                      functions.enabletaxinclusive(widget
                                          .appSettingsRecord.settingList
                                          .where((e) =>
                                              e.title == 'enableInclusiveTax')
                                          .toList()
                                          .firstOrNull!
                                          .value),
                                      widget.unitcollection,
                                      widget.purchase);
                              _shouldSetState = true;
                              _model.calculateResult1 =
                                  await actions.calSubTotalForHoldListkiosk(
                                FFAppState().selBill.toString(),
                                FFAppState().allBillsList.toList(),
                                functions.enabletaxinclusive(widget
                                    .appSettingsRecord.settingList
                                    .where(
                                        (e) => e.title == 'enableInclusiveTax')
                                    .toList()
                                    .firstOrNull!
                                    .value),
                              );
                              _shouldSetState = true;
                              _model.calbillAmt2s = await actions.calBillAmt(
                                FFAppState().disAmt,
                                FFAppState().delCharges,
                              );
                              _shouldSetState = true;
                              // _model.stockcheck = false;
                              // widget.prdid = document.id;
                              FFAppState().prdid = selectedProduct.id;
                              safeSetState(() {});
                              await _model.listViewprd?.animateTo(
                                _model.listViewprd!.position.maxScrollExtent,
                                duration: Duration(milliseconds: 100),
                                curve: Curves.ease,
                              );
                              _model.submitForm();
                              FFAppState().update(() {});

                              setState(() {});
                              _productNameController.clear();
                              await Future.delayed(Duration(milliseconds: 100));
                              FocusScope.of(context).requestFocus(_focusNode);
                              if (_shouldSetState) safeSetState(() {});
                              return;
                            } else {
                              if (selectedProduct.stock >
                                  functions.doubleToInt(valueOrDefault<double>(
                                    getJsonField(
                                      functions
                                          .filterBillList(
                                              FFAppState().selBill,
                                              FFAppState()
                                                  .allBillsList
                                                  .toList())
                                          .where((e) =>
                                              selectedProduct.id ==
                                              valueOrDefault<String>(
                                                getJsonField(
                                                  e,
                                                  r'''$.id''',
                                                )?.toString(),
                                                '0',
                                              ))
                                          .toList()
                                          .first,
                                      r'''$.quantity''',
                                    ),
                                    0.0,
                                  ))!) {
                                if (FFAppState().holdBillCount == 0) {
                                  FFAppState().holdBillCount =
                                      FFAppState().holdBillCount + 1;
                                  FFAppState().addToAllBillsList(
                                      functions.generateBillDetailsJson(
                                          0.0,
                                          0.0,
                                          0.0,
                                          'CASH',
                                          0.0,
                                          0.0,
                                          FFAppState().billAmt,
                                          0.0,
                                          FFAppState().finalAmt,
                                          '0',
                                          FFAppState().itemCartList.toList(),
                                          FFAppState().holdBillCount));
                                  FFAppState().selBill = 1;
                                }
                                /*    _model.addtosavebill3d =
                                    await actions.addToHoldListprdCopy(
                                  selectedProduct,
                                  FFAppState().selBill,
                                  widget!.taxcollection!.toList(),
                                  functions.enabletaxinclusive(widget
                                      .appSettingsRecord.settingList
                                      .where((e) =>
                                          e.title == 'enableInclusiveTax')
                                      .toList()
                                      .first
                                      .value),
                                );*/
                                _model.addtosavebill3d =
                                    await actions.addToHoldListprdbarcode(
                                        selectedProduct,
                                        FFAppState().selBill,
                                        widget!.taxcollection!.toList(),
                                        functions.enabletaxinclusive(widget
                                            .appSettingsRecord.settingList
                                            .where((e) =>
                                                e.title == 'enableInclusiveTax')
                                            .toList()
                                            .firstOrNull!
                                            .value),
                                        widget.unitcollection,
                                        widget.purchase);
                                _shouldSetState = true;
                                _model.calculateResult1d =
                                    await actions.calSubTotalForHoldListkiosk(
                                  FFAppState().selBill.toString(),
                                  FFAppState().allBillsList.toList(),
                                  functions.enabletaxinclusive(widget
                                      .appSettingsRecord.settingList
                                      .where((e) =>
                                          e.title == 'enableInclusiveTax')
                                      .toList()
                                      .firstOrNull!
                                      .value),
                                );
                                _shouldSetState = true;
                                _model.calbillAmt2sd = await actions.calBillAmt(
                                  FFAppState().disAmt,
                                  FFAppState().delCharges,
                                );
                                _shouldSetState = true;
                                await _model.listViewprd?.animateTo(
                                  _model.listViewprd!.position.maxScrollExtent,
                                  duration: Duration(milliseconds: 100),
                                  curve: Curves.ease,
                                );
                                _model.submitForm();
                                FFAppState().update(() {});

                                setState(() {});
                                _productNameController.clear();
                                await Future.delayed(
                                    Duration(milliseconds: 100));
                                FocusScope.of(context).requestFocus(_focusNode);
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      content: Text('Item Out Of Stock'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                _model.submitForm();
                                FFAppState().update(() {});

                                setState(() {});
                                _productNameController.clear();
                                await Future.delayed(
                                    Duration(milliseconds: 100));
                                FocusScope.of(context).requestFocus(_focusNode);
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              }
                            }
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  content: Text('Item Out Of Stock'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                            _model.submitForm();
                            FFAppState().update(() {});

                            setState(() {});
                            _productNameController.clear();
                            await Future.delayed(Duration(milliseconds: 100));
                            FocusScope.of(context).requestFocus(_focusNode);
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          }
                        } else {
                          if (FFAppState().holdBillCount == 0) {
                            FFAppState().holdBillCount =
                                FFAppState().holdBillCount + 1;
                            FFAppState().addToAllBillsList(
                                functions.generateBillDetailsJson(
                                    0.0,
                                    0.0,
                                    0.0,
                                    'CASH',
                                    0.0,
                                    0.0,
                                    FFAppState().billAmt,
                                    0.0,
                                    FFAppState().finalAmt,
                                    '0',
                                    FFAppState().itemCartList.toList(),
                                    FFAppState().holdBillCount));
                            FFAppState().selBill = 1;
                          }
                          _model.addtosavebill2 =
                              await actions.addToHoldListprdbarcode(
                                  selectedProduct,
                                  FFAppState().selBill,
                                  widget!.taxcollection!.toList(),
                                  functions.enabletaxinclusive(widget
                                      .appSettingsRecord.settingList
                                      .where((e) =>
                                          e.title == 'enableInclusiveTax')
                                      .toList()
                                      .firstOrNull!
                                      .value),
                                  widget.unitcollection,
                                  widget.purchase);
                          _shouldSetState = true;
                          _model.calculateResult23 =
                              await actions.calSubTotalForHoldListkiosk(
                            FFAppState().selBill.toString(),
                            FFAppState().allBillsList.toList(),
                            functions.enabletaxinclusive(widget
                                .appSettingsRecord.settingList
                                .where((e) => e.title == 'enableInclusiveTax')
                                .toList()
                                .firstOrNull!
                                .value),
                          );
                          _shouldSetState = true;
                          _model.calbillAmt3 = await actions.calBillAmt(
                            FFAppState().disAmt,
                            FFAppState().delCharges,
                          );
                          _shouldSetState = true;
                          _model.submitForm();
                          FFAppState().update(() {});

                          setState(() {});
                          _productNameController.clear();
                          await Future.delayed(Duration(milliseconds: 100));
                          FocusScope.of(context).requestFocus(_focusNode);
                          if (_shouldSetState) safeSetState(() {});
                          FFAppState().update(() {});

                          setState(() {});

                          return;
                        }
                      }
                    },
                  ),
                  suggestionsCallback: (pattern) {
                    _filteredProducts = widget.document
                        .where((product) => product.name
                            .toLowerCase()
                            .contains(pattern.toLowerCase()))
                        .toList();
                    return _filteredProducts;
                  },
                  itemBuilder: (context, ProductStructStruct product) {
                    final index = _filteredProducts.indexOf(product);
                    final isSelected = index == _selectedIndex;
                    return ListTile(
                      title: Text(product.name),
                      subtitle: Text(
                        '₹${product.sellingPrice.toStringAsFixed(2)}  Stock: ${product.stock.toStringAsFixed(2)}',
                        style: TextStyle(
                            color:
                                product.stockable ? Colors.red : Colors.black),
                      ),
                      tileColor:
                          isSelected ? Colors.blue.withOpacity(0.2) : null,
                    );
                  },
                  onSuggestionSelected: (ProductStructStruct document) async {
                    var _shouldSetState = false;
                    if (document.stockable) {
                      if (document.stock > 0) {
                        if (FFAppState().prdid != document.id) {
                          if (FFAppState().holdBillCount == 0) {
                            FFAppState().holdBillCount =
                                FFAppState().holdBillCount + 1;
                            FFAppState().addToAllBillsList(
                                functions.generateBillDetailsJson(
                                    0.0,
                                    0.0,
                                    0.0,
                                    'CASH',
                                    0.0,
                                    0.0,
                                    FFAppState().billAmt,
                                    0.0,
                                    FFAppState().finalAmt,
                                    '0',
                                    FFAppState().itemCartList.toList(),
                                    FFAppState().holdBillCount));
                            FFAppState().selBill = 1;
                          }
                          /*     _model.addtosavebill3 =
                              await actions.addToHoldListprdCopy(
                            document,
                            FFAppState().selBill,
                            widget!.taxcollection!.toList(),
                            functions.enabletaxinclusive(widget
                                .appSettingsRecord.settingList
                                .where((e) => e.title == 'enableInclusiveTax')
                                .toList()
                                .first
                                .value),
                          );*/
                          _model.addtosavebill3 =
                              await actions.addToHoldListprdbarcode(
                                  document,
                                  FFAppState().selBill,
                                  widget!.taxcollection!.toList(),
                                  functions.enabletaxinclusive(widget
                                      .appSettingsRecord.settingList
                                      .where((e) =>
                                          e.title == 'enableInclusiveTax')
                                      .toList()
                                      .firstOrNull!
                                      .value),
                                  widget.unitcollection,
                                  widget.purchase);
                          _shouldSetState = true;
                          _model.calculateResult1 =
                              await actions.calSubTotalForHoldListkiosk(
                            FFAppState().selBill.toString(),
                            FFAppState().allBillsList.toList(),
                            functions.enabletaxinclusive(widget
                                .appSettingsRecord.settingList
                                .where((e) => e.title == 'enableInclusiveTax')
                                .toList()
                                .firstOrNull!
                                .value),
                          );
                          _shouldSetState = true;
                          _model.calbillAmt2s = await actions.calBillAmt(
                            FFAppState().disAmt,
                            FFAppState().delCharges,
                          );
                          _shouldSetState = true;
                          // _model.stockcheck = false;
                          // widget.prdid = document.id;
                          FFAppState().prdid = document.id;
                          safeSetState(() {});
                          await _model.listViewprd?.animateTo(
                            _model.listViewprd!.position.maxScrollExtent,
                            duration: Duration(milliseconds: 100),
                            curve: Curves.ease,
                          );
                          _productNameController.clear();
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        } else {
                          if (document.stock >
                              functions.doubleToInt(valueOrDefault<double>(
                                getJsonField(
                                  functions
                                      .filterBillList(FFAppState().selBill,
                                          FFAppState().allBillsList.toList())
                                      .where((e) =>
                                          document.id ==
                                          valueOrDefault<String>(
                                            getJsonField(
                                              e,
                                              r'''$.id''',
                                            )?.toString(),
                                            '0',
                                          ))
                                      .toList()
                                      .first,
                                  r'''$.quantity''',
                                ),
                                0.0,
                              ))!) {
                            if (FFAppState().holdBillCount == 0) {
                              FFAppState().holdBillCount =
                                  FFAppState().holdBillCount + 1;
                              FFAppState().addToAllBillsList(
                                  functions.generateBillDetailsJson(
                                      0.0,
                                      0.0,
                                      0.0,
                                      'CASH',
                                      0.0,
                                      0.0,
                                      FFAppState().billAmt,
                                      0.0,
                                      FFAppState().finalAmt,
                                      '0',
                                      FFAppState().itemCartList.toList(),
                                      FFAppState().holdBillCount));
                              FFAppState().selBill = 1;
                            }
                            /*  _model.addtosavebill3d =
                                await actions.addToHoldListprdCopy(
                              document,
                              FFAppState().selBill,
                              widget!.taxcollection!.toList(),
                              functions.enabletaxinclusive(widget
                                  .appSettingsRecord.settingList
                                  .where((e) => e.title == 'enableInclusiveTax')
                                  .toList()
                                  .first
                                  .value),
                            );*/
                            _model.addtosavebill3d =
                                await actions.addToHoldListprdbarcode(
                                    document,
                                    FFAppState().selBill,
                                    widget!.taxcollection!.toList(),
                                    functions.enabletaxinclusive(widget
                                        .appSettingsRecord.settingList
                                        .where((e) =>
                                            e.title == 'enableInclusiveTax')
                                        .toList()
                                        .firstOrNull!
                                        .value),
                                    widget.unitcollection,
                                    widget.purchase);
                            _shouldSetState = true;
                            _model.calculateResult1d =
                                await actions.calSubTotalForHoldListkiosk(
                              FFAppState().selBill.toString(),
                              FFAppState().allBillsList.toList(),
                              functions.enabletaxinclusive(widget
                                  .appSettingsRecord.settingList
                                  .where((e) => e.title == 'enableInclusiveTax')
                                  .toList()
                                  .firstOrNull!
                                  .value),
                            );
                            _shouldSetState = true;
                            _model.calbillAmt2sd = await actions.calBillAmt(
                              FFAppState().disAmt,
                              FFAppState().delCharges,
                            );
                            _shouldSetState = true;
                            await _model.listViewprd?.animateTo(
                              _model.listViewprd!.position.maxScrollExtent,
                              duration: Duration(milliseconds: 100),
                              curve: Curves.ease,
                            );
                            _productNameController.clear();
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  content: Text('Item Out Of Stock'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
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
                      } else {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              content: Text('Item Out Of Stock'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
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
                      if (FFAppState().holdBillCount == 0) {
                        FFAppState().holdBillCount =
                            FFAppState().holdBillCount + 1;
                        FFAppState().addToAllBillsList(
                            functions.generateBillDetailsJson(
                                0.0,
                                0.0,
                                0.0,
                                'CASH',
                                0.0,
                                0.0,
                                FFAppState().billAmt,
                                0.0,
                                FFAppState().finalAmt,
                                '0',
                                FFAppState().itemCartList.toList(),
                                FFAppState().holdBillCount));
                        FFAppState().selBill = 1;
                      }
                      /* _model.addtosavebill2 =
                          await actions.addToHoldListprdCopy(
                        document,
                        FFAppState().selBill,
                        widget!.taxcollection!.toList(),
                        functions.enabletaxinclusive(widget
                            .appSettingsRecord.settingList
                            .where((e) => e.title == 'enableInclusiveTax')
                            .toList()
                            .first
                            .value),
                      );*/
                      _model.addtosavebill2 =
                          await actions.addToHoldListprdbarcode(
                              document,
                              FFAppState().selBill,
                              widget!.taxcollection!.toList(),
                              functions.enabletaxinclusive(widget
                                  .appSettingsRecord.settingList
                                  .where((e) => e.title == 'enableInclusiveTax')
                                  .toList()
                                  .firstOrNull!
                                  .value),
                              widget.unitcollection,
                              widget.purchase);

                      _shouldSetState = true;
                      _model.calculateResult23 =
                          await actions.calSubTotalForHoldListkiosk(
                        FFAppState().selBill.toString(),
                        FFAppState().allBillsList.toList(),
                        functions.enabletaxinclusive(widget
                            .appSettingsRecord.settingList
                            .where((e) => e.title == 'enableInclusiveTax')
                            .toList()
                            .firstOrNull!
                            .value),
                      );
                      _shouldSetState = true;
                      _model.calbillAmt3 = await actions.calBillAmt(
                        FFAppState().disAmt,
                        FFAppState().delCharges,
                      );
                      _shouldSetState = true;
                      await _model.listViewprd?.animateTo(
                        _model.listViewprd!.position.maxScrollExtent,
                        duration: Duration(milliseconds: 100),
                        curve: Curves.ease,
                      );
                      if (_shouldSetState) safeSetState(() {});
                      FFAppState().update(() {});
                      _productNameController.clear();
                      setState(() {});
                      return;
                    }

                    if (_shouldSetState) safeSetState(() {});
                  }),
            ),
          ),
        ),
      ],
    );
  }

  void _refreshSuggestionsBox() {
    _suggestionsBoxController.close();
    Future.delayed(Duration(milliseconds: 50), () {
      _suggestionsBoxController.open();
    });
  }

  void _handleSuggestionSelected(ProductStructStruct suggestion) {
    _productNameController.text = suggestion.name;
    _selectedIndex = -1; // Reset selection
    _suggestionsBoxController.close();
    FocusScope.of(context).requestFocus(_focusNode); // Keep focus
  }
}

class LoadingScreenNewModel {
  List<ProductStructStruct> productHive = [];
  void addToProductHive(ProductStructStruct item) => productHive.add(item);
  void initState(BuildContext context) {}
  final unfocusNode = FocusNode();
  List<ProductStructStruct>? hiveProductList;

  List<dynamic>? addtosavebill;

  double? calculateResult;

  double? calbillAmt;

  ProductStructStruct? getproductForupdate;

  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;

  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  List<dynamic>? addtosavebill3;
  // Stores action output result for [Custom Action - calSubTotalForHoldList] action in ProductName widget.
  double? calculateResult1;
  // Stores action output result for [Custom Action - calBillAmt] action in ProductName widget.
  double? calbillAmt2s;
  // Stores action output result for [Custom Action - addToHoldListprdCopy] action in ProductName widget.
  List<dynamic>? addtosavebill3d;
  // Stores action output result for [Custom Action - calSubTotalForHoldList] action in ProductName widget.
  double? calculateResult1d;
  // Stores action output result for [Custom Action - calBillAmt] action in ProductName widget.
  double? calbillAmt2sd;
  // Stores action output result for [Custom Action - addToHoldListprdCopy] action in ProductName widget.
  List<dynamic>? addtosavebill2;
  // Stores action output result for [Custom Action - calSubTotalForHoldList] action in ProductName widget.
  double? calculateResult23;
  // Stores action output result for [Custom Action - calBillAmt] action in ProductName widget.
  double? calbillAmt3;
  // Stores action output result for [Custom Action - addToHoldListprdCopy] action in productimage widget.
  List<dynamic>? addtosavebill23;
  // Stores action output result for [Custom Action - calSubTotalForHoldList] action in productimage widget.
  double? calculateResult2;
  // Stores action output result for [Custom Action - calBillAmt] action in productimage widget.
  double? calbillAmt2;
  ScrollController? listViewprd;
  void submitForm() async {
    print('Form submitted!');
  }
}
