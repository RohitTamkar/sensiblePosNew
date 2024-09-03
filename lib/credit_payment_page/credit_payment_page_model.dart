import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/grocery_windows/grocery_header/grocery_header_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'credit_payment_page_widget.dart' show CreditPaymentPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreditPaymentPageModel extends FlutterFlowModel<CreditPaymentPageWidget> {
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

  final unfocusNode = FocusNode();
  // Model for GroceryHeader component.
  late GroceryHeaderModel groceryHeaderModel;
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

  @override
  void initState(BuildContext context) {
    groceryHeaderModel = createModel(context, () => GroceryHeaderModel());
  }

  @override
  void dispose() {
    groceryHeaderModel.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    textFieldCustCredAmtFocusNode?.dispose();
    textFieldCustCredAmtTextController?.dispose();
  }
}
