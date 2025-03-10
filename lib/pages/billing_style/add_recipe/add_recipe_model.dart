import '';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/grocery_windows/add_product_grocery/add_product_grocery_widget.dart';
import '/pages/billing_style/raw_material/raw_material_widget.dart';
import 'dart:ui';
import 'add_recipe_widget.dart' show AddRecipeWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddRecipeModel extends FlutterFlowModel<AddRecipeWidget> {
  ///  Local state fields for this page.

  List<RecipeItemListStruct> itemlist = [];
  void addToItemlist(RecipeItemListStruct item) => itemlist.add(item);
  void removeFromItemlist(RecipeItemListStruct item) => itemlist.remove(item);
  void removeAtIndexFromItemlist(int index) => itemlist.removeAt(index);
  void insertAtIndexInItemlist(int index, RecipeItemListStruct item) =>
      itemlist.insert(index, item);
  void updateItemlistAtIndex(
          int index, Function(RecipeItemListStruct) updateFn) =>
      itemlist[index] = updateFn(itemlist[index]);

  RecipeItemListStruct? recipelist;
  void updateRecipelistStruct(Function(RecipeItemListStruct) updateFn) {
    updateFn(recipelist ??= RecipeItemListStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RecipeRecord? itemslist;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
