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

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'package:flutter/services.dart';

import 'index.dart'; // Imports other custom widgets

import '../../grocery_windows/billing_grocery_new/billing_grocery_new_widget.dart';
import '../../grocery_windows/grocery/grocery_widget.dart';

import 'package:flutter/scheduler.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:google_fonts/google_fonts.dart';
import '/flutter_flow/custom_functions.dart' as functions;

import '/flutter_flow/custom_functions.dart' as functions;
import '../actions/setup_item_hive.dart';

import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter/scheduler.dart';

class SearchHiveprdbarcode extends StatefulWidget {
  const SearchHiveprdbarcode({
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
  _SearchHiveprdbarcodeState createState() => _SearchHiveprdbarcodeState();
}

class _SearchHiveprdbarcodeState extends State<SearchHiveprdbarcode> {
  TextEditingController _productNameController = TextEditingController();
  FocusNode _focusNode = FocusNode();
  late LoadingScreenNewModel _model;
  late GroceryWidget _model2;
  SuggestionsBoxController _suggestionsBoxController =
      SuggestionsBoxController();
  int _selectedIndex = -1; // Track selected item index
  List<ProductStructStruct> _filteredProducts = []; // Track filtered results
  List<ProductStructStruct> matchingProducts = [];
  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingScreenNewModel());
    _model2 = GroceryWidget();
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
  void dispose() {
    _productNameController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Focus(
              autofocus: true, // Ensures the widget listens for keyboard events
              child: RawKeyboardListener(
                focusNode: FocusNode(), // Separate focus to avoid conflicts
                onKey: (RawKeyEvent event) {
                  if (event is RawKeyDownEvent &&
                      _filteredProducts.isNotEmpty) {
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

                      // print('Submitted value: $_filteredProducts');
                      /*     matchingProducts = widget.document
                          .where((product) => product.name.toLowerCase() == value.toLowerCase())
                          .toList();*/

                      if (matchingProducts.isNotEmpty) {
                        ProductStructStruct selectedProduct =
                            matchingProducts.first;
                        FFAppState().productHiveput = selectedProduct;

                        var _shouldSetState = false;
                        if (selectedProduct.stockable) {
                          if (selectedProduct.stock > 0 || widget.purchase) {
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
                              _model.addtosavebill =
                                  await actions.addToHoldListprdGrocery(
                                      FFAppState().productHiveput,
                                      FFAppState().selBill,
                                      widget.taxcollection,
                                      functions.enabletaxinclusive(widget
                                          .appSettingsRecord.settingList
                                          .where((e) =>
                                              e.title == 'enableInclusiveTax')
                                          .toList()
                                          .first
                                          .value),
                                      widget.unitcollection,
                                      widget.purchase);
                              _model.calculateResult =
                                  await actions.calSubTotalForGrocery(
                                FFAppState().selBill.toString(),
                                FFAppState().allBillsList!,
                              );
                              _model.calbillAmt =
                                  await actions.calBillAmtGrocery(
                                FFAppState().disAmt,
                                FFAppState().delCharges,
                              );

                              FFAppState().groceryshow = false;
                              setState(() {});
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
                                ////////////////////
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
                                _model.addtosavebill =
                                    await actions.addToHoldListprdGrocery(
                                        FFAppState().productHiveput,
                                        FFAppState().selBill,
                                        widget.taxcollection,
                                        functions.enabletaxinclusive(widget
                                            .appSettingsRecord.settingList
                                            .where((e) =>
                                                e.title == 'enableInclusiveTax')
                                            .toList()
                                            .first
                                            .value),
                                        widget.unitcollection,
                                        widget.purchase);
                                _model.calculateResult =
                                    await actions.calSubTotalForGrocery(
                                  FFAppState().selBill.toString(),
                                  FFAppState().allBillsList!,
                                );
                                _model.calbillAmt =
                                    await actions.calBillAmtGrocery(
                                  FFAppState().disAmt,
                                  FFAppState().delCharges,
                                );

                                FFAppState().groceryshow = false;
                                setState(() {});
                                _model.submitForm();
                                _productNameController.clear();
                                await Future.delayed(
                                    Duration(milliseconds: 100));
                                FocusScope.of(context).requestFocus(_focusNode);
                                FFAppState().update(() {});

                                setState(() {});
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
                          ////////////////////////////////////////////////////////
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
                          _model.addtosavebill =
                              await actions.addToHoldListprdGrocery(
                                  FFAppState().productHiveput,
                                  FFAppState().selBill,
                                  widget.taxcollection,
                                  functions.enabletaxinclusive(widget
                                      .appSettingsRecord.settingList
                                      .where((e) =>
                                          e.title == 'enableInclusiveTax')
                                      .toList()
                                      .first
                                      .value),
                                  widget.unitcollection,
                                  widget.purchase);
                          _model.calculateResult =
                              await actions.calSubTotalForGrocery(
                            FFAppState().selBill.toString(),
                            FFAppState().allBillsList!,
                          );
                          _model.calbillAmt = await actions.calBillAmtGrocery(
                            FFAppState().disAmt,
                            FFAppState().delCharges,
                          );

                          /* setState(() {
                      print(_model2.textFieldqtTextController?.text);

                      _model2.textFieldqtTextController?.text =
                          getJsonField(
                            _model.addtosavebill!
                                .where((e) =>
                            getJsonField(
                              e,
                              r'''$.barcode''',
                            ) ==
                              value )
                                .toList()
                                .first,
                            r'''$.quantity''',
                          ).toString();


                    });*/
                          FFAppState().groceryshow = false;
                          setState(() {});
                          _model.submitForm();
                          _productNameController.clear();
                          await Future.delayed(Duration(milliseconds: 100));
                          FocusScope.of(context).requestFocus(_focusNode);
                          FFAppState().update(() {});

                          setState(() {});
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
                      if (document.stock > 0 || widget.purchase) {
                        if (FFAppState().prdid != document.id) {
                          ///////////////////////////////////////////////////////////
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
                          _model.addtosavebill =
                              await actions.addToHoldListprdGrocery(
                                  document,
                                  FFAppState().selBill,
                                  widget.taxcollection!.toList(),
                                  functions.enabletaxinclusive(widget
                                      .appSettingsRecord.settingList
                                      .where((e) =>
                                          e.title == 'enableInclusiveTax')
                                      .toList()
                                      .first
                                      .value),
                                  widget.unitcollection!.toList(),
                                  widget.purchase);
                          _model.calculateResult =
                              await actions.calSubTotalForGrocery(
                            FFAppState().selBill.toString(),
                            FFAppState().allBillsList!.toList(),
                          );

                          _model.calbillAmt = await actions.calBillAmtGrocery(
                            FFAppState().disAmt,
                            FFAppState().delCharges,
                          );
                          FFAppState().groceryshow = false;
                          FFAppState().prdid = document.id;
                          FFAppState().update(() {});

                          setState(() {});
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
                            ///////////////////////////////////////////////

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
                            _model.addtosavebill =
                                await actions.addToHoldListprdGrocery(
                                    document,
                                    FFAppState().selBill,
                                    widget.taxcollection!.toList(),
                                    functions.enabletaxinclusive(widget
                                        .appSettingsRecord.settingList
                                        .where((e) =>
                                            e.title == 'enableInclusiveTax')
                                        .toList()
                                        .first
                                        .value),
                                    widget.unitcollection!.toList(),
                                    widget.purchase);
                            _model.calculateResult =
                                await actions.calSubTotalForGrocery(
                              FFAppState().selBill.toString(),
                              FFAppState().allBillsList!.toList(),
                            );

                            _model.calbillAmt = await actions.calBillAmtGrocery(
                              FFAppState().disAmt,
                              FFAppState().delCharges,
                            );
                            FFAppState().groceryshow = false;
                            FFAppState().update(() {});

                            setState(() {});
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
                      ///////////////////////////////////////////////
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
                      _model.addtosavebill =
                          await actions.addToHoldListprdGrocery(
                              document,
                              FFAppState().selBill,
                              widget.taxcollection!.toList(),
                              functions.enabletaxinclusive(widget
                                  .appSettingsRecord.settingList
                                  .where((e) => e.title == 'enableInclusiveTax')
                                  .toList()
                                  .first
                                  .value),
                              widget.unitcollection!.toList(),
                              widget.purchase);
                      _model.calculateResult =
                          await actions.calSubTotalForGrocery(
                        FFAppState().selBill.toString(),
                        FFAppState().allBillsList!.toList(),
                      );

                      _model.calbillAmt = await actions.calBillAmtGrocery(
                        FFAppState().disAmt,
                        FFAppState().delCharges,
                      );
                      FFAppState().groceryshow = false;
                      FFAppState().update(() {});

                      setState(() {});
                    }

                    if (_shouldSetState) safeSetState(() {});
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _handleSuggestionSelected(ProductStructStruct suggestion) {
    _productNameController.text = suggestion.name;
    _selectedIndex = -1; // Reset selection
    _suggestionsBoxController.close();
    FocusScope.of(context).requestFocus(_focusNode); // Keep focus
  }

  void _refreshSuggestionsBox() {
    _suggestionsBoxController.close();
    Future.delayed(Duration(milliseconds: 50), () {
      _suggestionsBoxController.open();
    });
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

  ScrollController? listViewprd;
  void submitForm() async {
    print('Form submitted!');
  }
}
