import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/exit_confirm/exit_confirm_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/grocery_windows/barcodefield/barcodefield_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'barcode_print_new_widget.dart' show BarcodePrintNewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BarcodePrintNewModel extends FlutterFlowModel<BarcodePrintNewWidget> {
  ///  Local state fields for this page.

  bool show = false;

  List<PaymentModeRecord> paymentMode = [];
  void addToPaymentMode(PaymentModeRecord item) => paymentMode.add(item);
  void removeFromPaymentMode(PaymentModeRecord item) =>
      paymentMode.remove(item);
  void removeAtIndexFromPaymentMode(int index) => paymentMode.removeAt(index);
  void insertAtIndexInPaymentMode(int index, PaymentModeRecord item) =>
      paymentMode.insert(index, item);
  void updatePaymentModeAtIndex(
          int index, Function(PaymentModeRecord) updateFn) =>
      paymentMode[index] = updateFn(paymentMode[index]);

  bool submenureport = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getProductlistHive] action in BarcodePrintNew widget.
  List<ProductStructStruct>? hiveProductList;
  // Stores action output result for [Custom Action - getCategorylistHive] action in BarcodePrintNew widget.
  List<CategoryStructStruct>? categoryListHive;
  // Stores action output result for [Custom Action - scanPrinter] action in BarcodePrintNew widget.
  bool? resDevice2Copy;
  // Stores action output result for [Custom Action - connectDevice] action in BarcodePrintNew widget.
  bool? isConnected;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<PaymentModeRecord>? paymentmode;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ProductRecord>? allprdrefresh;
  // Stores action output result for [Custom Action - addFirebasetoHiveProduct] action in Button widget.
  int? prdlist;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CategoryRecord>? listcategory;
  // Stores action output result for [Custom Action - addFirebasetoHiveCategory] action in Button widget.
  int? cat;
  // Stores action output result for [Custom Action - getProductlistHive] action in Button widget.
  List<ProductStructStruct>? prdhive2refresh;
  // Stores action output result for [Custom Action - getCategorylistHive] action in Button widget.
  List<CategoryStructStruct>? catlistrefresh;
  // State field(s) for TextFieldcont widget.
  FocusNode? textFieldcontFocusNode;
  TextEditingController? textFieldcontTextController;
  String? Function(BuildContext, String?)? textFieldcontTextControllerValidator;
  // State field(s) for TextFieldbranch widget.
  FocusNode? textFieldbranchFocusNode;
  TextEditingController? textFieldbranchTextController;
  String? Function(BuildContext, String?)?
      textFieldbranchTextControllerValidator;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue1;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue2;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue3;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue4;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue5;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue6;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue7;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue8;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue9;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue10;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue11;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue12;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue13;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue14;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue15;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue16;
  // Stores action output result for [Custom Action - scanPrinter] action in Button widget.
  bool? resultDevic;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Custom Action - connectDevice] action in Container widget.
  bool? con2;
  // Stores action output result for [Custom Action - newCustomAction] action in Container widget.
  List<dynamic>? selected2;
  // Stores action output result for [Custom Action - removeHoldListItem] action in IconButton widget.
  List<dynamic>? res20;
  // Stores action output result for [Custom Action - calSubTotalForGrocery] action in IconButton widget.
  double? ret;
  // Stores action output result for [Custom Action - calBillAmtGrocery] action in IconButton widget.
  double? ads;
  // Stores action output result for [Custom Action - scanPrinter] action in Button widget.
  bool? resDevice2CopyCopy;
  // Stores action output result for [Custom Action - connectDevice] action in Button widget.
  bool? connectdevice4;
  // Stores action output result for [Custom Action - newCustomAction] action in Button widget.
  List<dynamic>? selected4;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldcontFocusNode?.dispose();
    textFieldcontTextController?.dispose();

    textFieldbranchFocusNode?.dispose();
    textFieldbranchTextController?.dispose();
  }
}
