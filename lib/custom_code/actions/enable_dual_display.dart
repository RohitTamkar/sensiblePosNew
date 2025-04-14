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

import 'package:window_manager/window_manager.dart';

Future<void> enableDualDisplay() async {
  try {
    // Get the list of available screens
    final screens = await windowManager.getScreens();

    if (screens.length < 2) {
      debugPrint('Only one display detected');
      return;
    }

    // The secondary screen is typically at index 1
    final secondaryScreen = screens[1];

    // Create a new window for the secondary display
    await windowManager.createWindow(
      WindowOptions(
        title: 'Opening Balance - Secondary Display',
        size: Size(800, 600),
        // Position the window on the secondary screen
        position: Offset(
          secondaryScreen.visiblePosition.dx,
          secondaryScreen.visiblePosition.dy,
        ),
        center: false,
        backgroundColor: Colors.transparent,
        skipTaskbar: false,
        titleBarStyle: TitleBarStyle.normal,
      ),
    );

    // Load your widget in the new window
    runApp(MaterialApp(
      home: Scaffold(
        body: OpeningBalNewWidget(),
      ),
    ));

    // Show the new window
    await windowManager.show();
    await windowManager.focus();
  } catch (e) {
    debugPrint('Error enabling dual display: $e');
  }
}

// Example of your OpeningBalNewWidget
class OpeningBalNewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text('Opening Balance Content', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
