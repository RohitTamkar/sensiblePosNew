import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'payment_mode_grocery_widget.dart' show PaymentModeGroceryWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaymentModeGroceryModel
    extends FlutterFlowModel<PaymentModeGroceryWidget> {
  ///  Local state fields for this component.

  String? amount = '';

  double? advance;

  double? paid;

  double? balance;

  double? returnAmt;

  List<PaymentModeRecord> paymentM = [];
  void addToPaymentM(PaymentModeRecord item) => paymentM.add(item);
  void removeFromPaymentM(PaymentModeRecord item) => paymentM.remove(item);
  void removeAtIndexFromPaymentM(int index) => paymentM.removeAt(index);
  void insertAtIndexInPaymentM(int index, PaymentModeRecord item) =>
      paymentM.insert(index, item);
  void updatePaymentMAtIndex(int index, Function(PaymentModeRecord) updateFn) =>
      paymentM[index] = updateFn(paymentM[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - calculateGroceryAmtaction] action in Button widget.
  dynamic? result233;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
