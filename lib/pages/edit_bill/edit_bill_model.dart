import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'edit_bill_widget.dart' show EditBillWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class EditBillModel extends FlutterFlowModel<EditBillWidget> {
  ///  Local state fields for this page.

  bool customerbill = false;

  List<InvoiceRecord> invoiceslist = [];
  void addToInvoiceslist(InvoiceRecord item) => invoiceslist.add(item);
  void removeFromInvoiceslist(InvoiceRecord item) => invoiceslist.remove(item);
  void removeAtIndexFromInvoiceslist(int index) => invoiceslist.removeAt(index);
  void insertAtIndexInInvoiceslist(int index, InvoiceRecord item) =>
      invoiceslist.insert(index, item);
  void updateInvoiceslistAtIndex(int index, Function(InvoiceRecord) updateFn) =>
      invoiceslist[index] = updateFn(invoiceslist[index]);

  DateTime? date;

  bool showcustombills = false;

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Stores action output result for [Custom Action - docToJson] action in Container widget.
  dynamic? resultItem;
  // State field(s) for Checkbox widget.
  Map<InvoiceRecord, bool> checkboxValueMap = {};
  List<InvoiceRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  DateTime? datePicked1;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Custom Action - scanPrinter] action in PrintEditBill widget.
  bool? resDevice2;
  // Stores action output result for [Custom Action - newCustomAction] action in PrintEditBill widget.
  List<dynamic>? device1;
  // Stores action output result for [Custom Action - reduceQuantityEB] action in EditMinus widget.
  List<dynamic>? res1;
  // Stores action output result for [Custom Action - calSubTotalCopy] action in Delete widget.
  double? zzz;
  // Stores action output result for [Custom Action - newCustomAction2] action in Button widget.
  List<SelItemListStruct>? returnListCopy;
  // Stores action output result for [Custom Action - shiftExistseditbill] action in Button widget.
  dynamic? shiftlist2;
  // Stores action output result for [Custom Action - updateShiftSummaryFordeletebill] action in Button widget.
  dynamic? returnList1Copy;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ShiftRecord>? shiftsummary;
  // Stores action output result for [Custom Action - shiftDetailNewpark] action in Button widget.
  dynamic? shiftdetailsnewonline;
  // Stores action output result for [Custom Action - newCustomAction2] action in Save widget.
  List<SelItemListStruct>? returnList;
  // Stores action output result for [Custom Action - shiftExists] action in Save widget.
  dynamic? shiftList;
  // Stores action output result for [Custom Action - updateShiftSummaryForEB] action in Save widget.
  dynamic? returnList1;
  // Stores action output result for [Firestore Query - Query a collection] action in Save widget.
  List<ShiftRecord>? shiftsummary2;
  // Stores action output result for [Custom Action - shiftDetailNewpark] action in Save widget.
  dynamic? shiftdetailsnewonline2;
  // Stores action output result for [Custom Action - docToJson] action in Button widget.
  dynamic? resultItemloop;
  // Stores action output result for [Custom Action - shiftExistseditbill] action in Button widget.
  dynamic? shiftListeditbill;
  // Stores action output result for [Custom Action - updateShiftSummaryFordeletebill] action in Button widget.
  dynamic? returnList1editbill;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ShiftRecord>? shiftsummaryCopy;
  // Stores action output result for [Custom Action - shiftDetailNewpark] action in Button widget.
  dynamic? shiftdetailsnewonlineCopy;
  DateTime? datePicked2;
  // State field(s) for DropDownstart widget.
  String? dropDownstartValue;
  FormFieldController<String>? dropDownstartValueController;
  // State field(s) for DropDownend widget.
  String? dropDownendValue;
  FormFieldController<String>? dropDownendValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<InvoiceRecord>? ivnlisted;
  // Stores action output result for [Custom Action - mergeBills] action in Button widget.
  List<InvoiceRecord>? returnedbills;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  InvoiceRecord? invcodeneww2;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
  }
}
