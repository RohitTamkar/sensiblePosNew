import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'barcode_printing_widget.dart' show BarcodePrintingWidget;
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BarcodePrintingModel extends FlutterFlowModel<BarcodePrintingWidget> {
  ///  Local state fields for this page.

  List<ProductRecord> productDoclist = [];
  void addToProductDoclist(ProductRecord item) => productDoclist.add(item);
  void removeFromProductDoclist(ProductRecord item) =>
      productDoclist.remove(item);
  void removeAtIndexFromProductDoclist(int index) =>
      productDoclist.removeAt(index);
  void insertAtIndexInProductDoclist(int index, ProductRecord item) =>
      productDoclist.insert(index, item);
  void updateProductDoclistAtIndex(
          int index, Function(ProductRecord) updateFn) =>
      productDoclist[index] = updateFn(productDoclist[index]);

  String labelSize = '0';

  List<PurchaseSaleItemListStruct> productlist = [];
  void addToProductlist(PurchaseSaleItemListStruct item) =>
      productlist.add(item);
  void removeFromProductlist(PurchaseSaleItemListStruct item) =>
      productlist.remove(item);
  void removeAtIndexFromProductlist(int index) => productlist.removeAt(index);
  void insertAtIndexInProductlist(int index, PurchaseSaleItemListStruct item) =>
      productlist.insert(index, item);
  void updateProductlistAtIndex(
          int index, Function(PurchaseSaleItemListStruct) updateFn) =>
      productlist[index] = updateFn(productlist[index]);

  PurchaseSaleItemListStruct? product;
  void updateProductStruct(Function(PurchaseSaleItemListStruct) updateFn) {
    updateFn(product ??= PurchaseSaleItemListStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Stores action output result for [Custom Action - scanPrinter] action in Button widget.
  bool? resultDevic;
  // Stores action output result for [Custom Action - connectDevice] action in Container widget.
  bool? con2;
  // Stores action output result for [Custom Action - newCustomAction] action in Container widget.
  List<dynamic>? selected2;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Stores action output result for [Custom Action - scanPrinter] action in Button widget.
  bool? resDevice2Copy;
  // Stores action output result for [Custom Action - connectDevice] action in Button widget.
  bool? connectdevice;
  // Stores action output result for [Custom Action - newCustomAction] action in Button widget.
  List<dynamic>? selected;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
  }
}
