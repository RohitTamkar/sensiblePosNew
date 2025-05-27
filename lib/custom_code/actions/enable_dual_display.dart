// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
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

int? secondaryWindowId;

Future<void> enableDualDisplay(BuildContext context) async {
  final billListData = functions.filterBillList(
    FFAppState().selBill,
    FFAppState().allBillsList,
  );
  final screens = await screenRetriever.getAllDisplays();

  if (screens.length < 2) {
    //ScaffoldMessenger.of(context).showSnackBar(
    // const SnackBar(content: Text('Only one display detected.')),
    // );
    return;
  }
  final windowArgs = {
    'args1': 'Sub window',
    'args2': 100,
    'args3': true,
    'business': 'business_test',
    'allBilllist': billListData,
  };

  if (secondaryWindowId != null) {
    try {
      await DesktopMultiWindow.invokeMethod(
        secondaryWindowId!,
        'updateBillList',
        jsonEncode(windowArgs),
      );
      return;
    } catch (e) {
      print('Failed to send update, creating new window: $e');
      // If window is closed or failed, reset
      secondaryWindowId = null;
    }
  }

  final window = await DesktopMultiWindow.createWindow(jsonEncode(windowArgs));
  secondaryWindowId = window.windowId;
  // Store the window ID for future reference
  //_secondWindowId = window.windowId;

  // Move the new window to the second screen

  final secondScreen = screens[1];
  await window.setFrame(Rect.fromLTWH(
    secondScreen.visiblePosition!.dx.toDouble(),
    secondScreen.visiblePosition!.dy.toDouble(),
    secondScreen.size.width.toDouble(), // Use screen width
    secondScreen.size.height.toDouble(), // Use screen height
  ));

// Optionally, you can also set fullscreen mode explicitly

  await window.show();
}
