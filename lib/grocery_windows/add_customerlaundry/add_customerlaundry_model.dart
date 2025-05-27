import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'add_customerlaundry_widget.dart' show AddCustomerlaundryWidget;
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddCustomerlaundryModel
    extends FlutterFlowModel<AddCustomerlaundryWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - checkString] action in AddCustomerlaundry widget.
  bool? check2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  PartyRecord? docexist;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PartyRecord? custDoc;
  // State field(s) for TextFieldname widget.
  FocusNode? textFieldnameFocusNode;
  TextEditingController? textFieldnameTextController;
  String? Function(BuildContext, String?)? textFieldnameTextControllerValidator;
  // State field(s) for TextFieldmob widget.
  FocusNode? textFieldmobFocusNode;
  TextEditingController? textFieldmobTextController;
  String? Function(BuildContext, String?)? textFieldmobTextControllerValidator;
  // State field(s) for TextFieldaltmob widget.
  FocusNode? textFieldaltmobFocusNode;
  TextEditingController? textFieldaltmobTextController;
  String? Function(BuildContext, String?)?
      textFieldaltmobTextControllerValidator;
  // State field(s) for TextFieldemail widget.
  FocusNode? textFieldemailFocusNode;
  TextEditingController? textFieldemailTextController;
  String? Function(BuildContext, String?)?
      textFieldemailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldnameFocusNode?.dispose();
    textFieldnameTextController?.dispose();

    textFieldmobFocusNode?.dispose();
    textFieldmobTextController?.dispose();

    textFieldaltmobFocusNode?.dispose();
    textFieldaltmobTextController?.dispose();

    textFieldemailFocusNode?.dispose();
    textFieldemailTextController?.dispose();
  }
}
