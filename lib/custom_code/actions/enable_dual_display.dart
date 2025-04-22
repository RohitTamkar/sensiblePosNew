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

import '../../test_widget/test_widget_widget.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:screen_retriever/screen_retriever.dart';

import 'dart:convert';

// Store the window ID at a higher level so it persists between function calls
int? _secondWindowId;

Future<void> enableDualDisplay(BuildContext context) async {
  final screens = await screenRetriever.getAllDisplays();

  if (screens.length < 2) {
    //ScaffoldMessenger.of(context).showSnackBar(
    // const SnackBar(content: Text('Only one display detected.')),
    // );
    return;
  }

  // If we already have a window ID, check if the window still exists
  if (_secondWindowId != null) {
    final allWindowIds = await DesktopMultiWindow.getAllSubWindowIds();
    if (allWindowIds.contains(_secondWindowId)) {
      // Window exists - just refresh it
      await DesktopMultiWindow.invokeMethod(
        _secondWindowId!,
        'refresh',
        jsonEncode({
          'args1': 'Sub window',
          'args2': 100,
          'args3': true,
          'business': 'business_test',
          'allBilllist': functions.filterBillList(
              FFAppState().selBill, FFAppState().allBillsList),
        }),
      );

      // Bring window to front
      // await DesktopMultiWindow.show(_secondWindowId!);

      // ScaffoldMessenger.of(context).showSnackBar(
      //  SnackBar(content: Text('Refreshed existing window')),
      //  );
      return;
    }
  }

  // Create a new window if one doesn't exist
  final window = await DesktopMultiWindow.createWindow(jsonEncode({
    'args1': 'Sub window',
    'args2': 100,
    'args3': true,
    'business': 'business_test',
    'allBilllist': functions.filterBillList(
        FFAppState().selBill, FFAppState().allBillsList),
  }));

  // Store the window ID for future reference
  _secondWindowId = window.windowId;

  // Move the new window to the second screen
  final secondScreen = screens[1];
  await window.setFrame(Rect.fromLTWH(
    secondScreen.visiblePosition!.dx.toDouble(),
    secondScreen.visiblePosition!.dy.toDouble(),
    800,
    600,
  ));

  await window.show();

  // ScaffoldMessenger.of(context).showSnackBar(
  // SnackBar(content: Text(FFAppState().billPrintHeader)),
  // );
}
