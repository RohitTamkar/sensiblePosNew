import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'weightscalesetting_widget.dart' show WeightscalesettingWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WeightscalesettingModel
    extends FlutterFlowModel<WeightscalesettingWidget> {
  ///  Local state fields for this page.

  List<String> list = [];
  void addToList(String item) => list.add(item);
  void removeFromList(String item) => list.remove(item);
  void removeAtIndexFromList(int index) => list.removeAt(index);
  void insertAtIndexInList(int index, String item) => list.insert(index, item);
  void updateListAtIndex(int index, Function(String) updateFn) =>
      list[index] = updateFn(list[index]);

  String port = 'COM4';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - listofSerialPorts] action in weightscalesetting widget.
  List<String>? list12Copy;
  // Stores action output result for [Custom Action - listofSerialPorts] action in Icon widget.
  List<String>? list12;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
