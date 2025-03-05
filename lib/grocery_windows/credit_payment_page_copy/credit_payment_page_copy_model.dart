import '';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'credit_payment_page_copy_widget.dart' show CreditPaymentPageCopyWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreditPaymentPageCopyModel
    extends FlutterFlowModel<CreditPaymentPageCopyWidget> {
  ///  Local state fields for this page.

  List<SelItemListStruct> listprd = [];
  void addToListprd(SelItemListStruct item) => listprd.add(item);
  void removeFromListprd(SelItemListStruct item) => listprd.remove(item);
  void removeAtIndexFromListprd(int index) => listprd.removeAt(index);
  void insertAtIndexInListprd(int index, SelItemListStruct item) =>
      listprd.insert(index, item);
  void updateListprdAtIndex(int index, Function(SelItemListStruct) updateFn) =>
      listprd[index] = updateFn(listprd[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextFieldCustCredAmt widget.
  FocusNode? textFieldCustCredAmtFocusNode;
  TextEditingController? textFieldCustCredAmtTextController;
  String? Function(BuildContext, String?)?
      textFieldCustCredAmtTextControllerValidator;
  // State field(s) for DropDownCustCred widget.
  String? dropDownCustCredValue;
  FormFieldController<String>? dropDownCustCredValueController;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PaymentRecord? paymentDoc2;
  // Stores action output result for [Custom Action - scanPrinter] action in Button widget.
  bool? resDevice23;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PaymentRecord? paymentDoc3a;
  // Stores action output result for [Custom Action - connectDevice] action in Button widget.
  bool? isconnectedb;
  // Stores action output result for [Custom Action - newCustomAction] action in Button widget.
  List<dynamic>? devicef;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  PartyRecord? custmerf;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    textFieldCustCredAmtFocusNode?.dispose();
    textFieldCustCredAmtTextController?.dispose();
  }
}
