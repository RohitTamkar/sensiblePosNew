import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_customer_grocery_widget.dart' show AddCustomerGroceryWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddCustomerGroceryModel
    extends FlutterFlowModel<AddCustomerGroceryWidget> {
  ///  State fields for stateful widgets in this component.

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
  // State field(s) for TextFieldrefname widget.
  FocusNode? textFieldrefnameFocusNode;
  TextEditingController? textFieldrefnameTextController;
  String? Function(BuildContext, String?)?
      textFieldrefnameTextControllerValidator;
  // State field(s) for TextFieldvechno widget.
  FocusNode? textFieldvechnoFocusNode;
  TextEditingController? textFieldvechnoTextController;
  String? Function(BuildContext, String?)?
      textFieldvechnoTextControllerValidator;
  // State field(s) for TextFieldadharno widget.
  FocusNode? textFieldadharnoFocusNode;
  TextEditingController? textFieldadharnoTextController;
  String? Function(BuildContext, String?)?
      textFieldadharnoTextControllerValidator;
  // State field(s) for TextFieldpanno widget.
  FocusNode? textFieldpannoFocusNode;
  TextEditingController? textFieldpannoTextController;
  String? Function(BuildContext, String?)?
      textFieldpannoTextControllerValidator;
  // State field(s) for TextFieldgstno widget.
  FocusNode? textFieldgstnoFocusNode;
  TextEditingController? textFieldgstnoTextController;
  String? Function(BuildContext, String?)?
      textFieldgstnoTextControllerValidator;
  // State field(s) for DropDownproof widget.
  String? dropDownproofValue;
  FormFieldController<String>? dropDownproofValueController;
  // State field(s) for TextFieldcredli widget.
  FocusNode? textFieldcredliFocusNode;
  TextEditingController? textFieldcredliTextController;
  String? Function(BuildContext, String?)?
      textFieldcredliTextControllerValidator;
  // State field(s) for TextFieldoldbal widget.
  FocusNode? textFieldoldbalFocusNode;
  TextEditingController? textFieldoldbalTextController;
  String? Function(BuildContext, String?)?
      textFieldoldbalTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for TextFieldbdate widget.
  FocusNode? textFieldbdateFocusNode;
  TextEditingController? textFieldbdateTextController;
  String? Function(BuildContext, String?)?
      textFieldbdateTextControllerValidator;
  // State field(s) for TextFieldannive widget.
  FocusNode? textFieldanniveFocusNode;
  TextEditingController? textFieldanniveTextController;
  String? Function(BuildContext, String?)?
      textFieldanniveTextControllerValidator;
  // State field(s) for TextFieldfirmname widget.
  FocusNode? textFieldfirmnameFocusNode;
  TextEditingController? textFieldfirmnameTextController;
  String? Function(BuildContext, String?)?
      textFieldfirmnameTextControllerValidator;
  // State field(s) for TextFieldextdet widget.
  FocusNode? textFieldextdetFocusNode;
  TextEditingController? textFieldextdetTextController;
  String? Function(BuildContext, String?)?
      textFieldextdetTextControllerValidator;
  // State field(s) for DropDowngender widget.
  String? dropDowngenderValue;
  FormFieldController<String>? dropDowngenderValueController;
  // State field(s) for TextFieldfamsize widget.
  FocusNode? textFieldfamsizeFocusNode;
  TextEditingController? textFieldfamsizeTextController;
  String? Function(BuildContext, String?)?
      textFieldfamsizeTextControllerValidator;
  // State field(s) for TextFieldaddress widget.
  FocusNode? textFieldaddressFocusNode;
  TextEditingController? textFieldaddressTextController;
  String? Function(BuildContext, String?)?
      textFieldaddressTextControllerValidator;
  // State field(s) for TextFieldcity widget.
  FocusNode? textFieldcityFocusNode;
  TextEditingController? textFieldcityTextController;
  String? Function(BuildContext, String?)? textFieldcityTextControllerValidator;
  // State field(s) for TextFieldpostlcode widget.
  FocusNode? textFieldpostlcodeFocusNode;
  TextEditingController? textFieldpostlcodeTextController;
  String? Function(BuildContext, String?)?
      textFieldpostlcodeTextControllerValidator;
  // State field(s) for TextFieldfrmvisit widget.
  FocusNode? textFieldfrmvisitFocusNode;
  TextEditingController? textFieldfrmvisitTextController;
  String? Function(BuildContext, String?)?
      textFieldfrmvisitTextControllerValidator;
  // State field(s) for TextFieldlastvisit widget.
  FocusNode? textFieldlastvisitFocusNode;
  TextEditingController? textFieldlastvisitTextController;
  String? Function(BuildContext, String?)?
      textFieldlastvisitTextControllerValidator;
  // State field(s) for DropDowntype widget.
  String? dropDowntypeValue;
  FormFieldController<String>? dropDowntypeValueController;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PartyRecord? custDoc;

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

    textFieldrefnameFocusNode?.dispose();
    textFieldrefnameTextController?.dispose();

    textFieldvechnoFocusNode?.dispose();
    textFieldvechnoTextController?.dispose();

    textFieldadharnoFocusNode?.dispose();
    textFieldadharnoTextController?.dispose();

    textFieldpannoFocusNode?.dispose();
    textFieldpannoTextController?.dispose();

    textFieldgstnoFocusNode?.dispose();
    textFieldgstnoTextController?.dispose();

    textFieldcredliFocusNode?.dispose();
    textFieldcredliTextController?.dispose();

    textFieldoldbalFocusNode?.dispose();
    textFieldoldbalTextController?.dispose();

    textFieldbdateFocusNode?.dispose();
    textFieldbdateTextController?.dispose();

    textFieldanniveFocusNode?.dispose();
    textFieldanniveTextController?.dispose();

    textFieldfirmnameFocusNode?.dispose();
    textFieldfirmnameTextController?.dispose();

    textFieldextdetFocusNode?.dispose();
    textFieldextdetTextController?.dispose();

    textFieldfamsizeFocusNode?.dispose();
    textFieldfamsizeTextController?.dispose();

    textFieldaddressFocusNode?.dispose();
    textFieldaddressTextController?.dispose();

    textFieldcityFocusNode?.dispose();
    textFieldcityTextController?.dispose();

    textFieldpostlcodeFocusNode?.dispose();
    textFieldpostlcodeTextController?.dispose();

    textFieldfrmvisitFocusNode?.dispose();
    textFieldfrmvisitTextController?.dispose();

    textFieldlastvisitFocusNode?.dispose();
    textFieldlastvisitTextController?.dispose();
  }
}
