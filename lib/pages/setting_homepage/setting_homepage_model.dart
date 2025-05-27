import '/backend/backend.dart';
import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'setting_homepage_widget.dart' show SettingHomepageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingHomepageModel extends FlutterFlowModel<SettingHomepageWidget> {
  ///  Local state fields for this page.

  bool showgst = false;

  bool language = false;

  List<String> languagelist = [
    'English',
    'Hindi',
    'Thai',
    'Marathi',
    'Kannada',
    'Tamil'
  ];
  void addToLanguagelist(String item) => languagelist.add(item);
  void removeFromLanguagelist(String item) => languagelist.remove(item);
  void removeAtIndexFromLanguagelist(int index) => languagelist.removeAt(index);
  void insertAtIndexInLanguagelist(int index, String item) =>
      languagelist.insert(index, item);
  void updateLanguagelistAtIndex(int index, Function(String) updateFn) =>
      languagelist[index] = updateFn(languagelist[index]);

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
  }
}
