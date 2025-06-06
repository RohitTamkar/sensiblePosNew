// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:number_to_character/number_to_character.dart';

Future<String> numberToCharacter(double amount) async {
  String res;

  var converter = NumberToCharacterConverter('en');
  res = converter.convertDouble(amount); // i
  return res;
  // Add your function code here!
}
