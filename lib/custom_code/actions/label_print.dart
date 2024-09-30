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

import 'dart:typed_data';
import 'dart:convert';
import 'dart:async';
import 'package:another_flutter_usb_write/another_flutter_usb_write.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> labelPrint(
  List<PurchaseSaleItemListStruct> prdList,
  String labelSize,
) async {
  // Initialize the printer
  Printer _printer = Printer();
  await _printer.init();

  // Check if the printer is initialized successfully
  if (_printer.device != null) {
    for (var item in prdList) {
      // Prepare data for each item
      Map<String, dynamic> data = {
        'Name': item.name, // assuming these properties exist in your struct
        'Price': item.price.toString(),
        'MfgDate': '2023-10-18',
        'ExpDate': '2024-12-18',
        'barcode': '123456789',
        'copies': item.quantity, // assuming quantity is a number

// // set the number of copies you want to print
        //  'name': item.name, // assuming name is a String
        //address': item.address, // assuming address is a String
        //  'fssai': item.fssai, // assuming fssai is a String
        //   'phone': item.phone, // assuming phone is a String
        // 'bestBefore': item.bestBefore // assuming bestBefore is a String
      };

      // Print the label for the current item
      await _printer.printLabel(data);
    }
  } else {
    print("Printer not initialized or no USB devices found.");
  }
}

class Company {
  final String name;
  final String address;
  final String fssai;
  final String phone;

  Company(
      {required this.name,
      required this.address,
      required this.fssai,
      required this.phone});
}

class Printer {
  static const platform = MethodChannel('com.mycompany.printer/usb');
  late UsbDevice device;

  // Request USB permission
  Future<void> requestUsbPermission() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      try {
        await platform.invokeMethod('requestUsbPermission');
      } on PlatformException catch (e) {
        print("Failed to request USB permission: ${e.message}");
      }
    } else if (status.isDenied) {
      // Explain to the user why the permission is needed and ask again
    } else if (status.isPermanentlyDenied) {
      // Open app settings to allow permission
    }
  }

  // Initialize the printer
  Future<void> init() async {
    try {
      List<dynamic> devices = await platform.invokeMethod('listDevices');
      print(devices);
      if (devices.isNotEmpty) {
        var firstDevice = devices[0];
        device = UsbDevice(firstDevice['vid'], firstDevice['pid']);
        bool permissionGranted = await platform.invokeMethod(
            'hasPermission', {'vendorId': device.vid, 'productId': device.pid});
        if (permissionGranted) {
          await platform.invokeMethod(
              'openDevice', {'vendorId': device.vid, 'productId': device.pid});
        } else {
          print("USB permission not granted.");
        }
      } else {
        print("No USB devices found.");
      }
    } catch (e) {
      print(e);
    }
  }

  // Send a command to the printer
  Future<void> sendCommand(String command) async {
    try {
      await platform.invokeMethod('sendCommand', {'command': command});
    } catch (e) {
      print(e);
    }
  }

  // Print a label with the provided data
  Future<void> printLabel(Map<String, dynamic> data) async {
    await sendCommand('SIZE 25 mm,50 mm\r\n');
    await sendCommand('GAP 2.5 mm,0 mm\r\n');
    await sendCommand('CLS\r\n');
    await sendCommand('REFERENCE 0,0\r\n');
    await sendCommand('TEXT 30,30,"B.FNT",0,2,3,"${data['name']}"\r\n');
    await sendCommand('TEXT 430,30,"B.FNT",0,2,3,"${data['name']}"\r\n');
    await sendCommand('TEXT 30,80,"3.EFT",0,1,1,"${data['dateType']}:"\r\n');
    await sendCommand('TEXT 430,80,"3.EFT",0,1,1,"${data['dateType']}:"\r\n');
    await sendCommand('TEXT 110,82,"D.FNT",0,1,1,"${data['date']}"\r\n');
    await sendCommand('TEXT 510,82,"D.FNT",0,1,1,"${data['date']}"\r\n');
    await sendCommand(
        'TEXT 30,110,"3.EFT",0,1,1,"${data['quantityType']}:"\r\n');
    await sendCommand(
        'TEXT 430,110,"3.EFT",0,1,1,"${data['quantityType']}:"\r\n');
    await sendCommand('TEXT 130,112,"D.FNT",0,1,1,"${data['quantity']}"\r\n');
    await sendCommand('TEXT 530,112,"D.FNT",0,1,1,"${data['quantity']}"\r\n');
    await sendCommand('TEXT 30,140,"3.EFT",0,1,1,"MRP:"\r\n');
    await sendCommand('TEXT 430,140,"3.EFT",0,1,1,"MRP:"\r\n');
    await sendCommand('TEXT 90,142,"D.FNT",0,1,1,"${data['mrp']}"\r\n');
    await sendCommand('TEXT 490,142,"D.FNT",0,1,1,"${data['mrp']}"\r\n');

    if (data['bestBefore'] != null) {
      await sendCommand(
          'TEXT 30,170,"D.FNT",0,1,1,"Best before ${data['bestBefore']}"\r\n');
      await sendCommand(
          'TEXT 430,170,"D.FNT",0,1,1,"Best before ${data['bestBefore']}"\r\n');
    }

    if (data['phone'] != null && data['phone'] != '') {
      await sendCommand(
          'TEXT 30,200,"0",0,6,5,"Customer Care: ${data['phone']}"\r\n');
      await sendCommand(
          'TEXT 430,200,"0",0,6,5,"Customer Care: ${data['phone']}"\r\n');
    }

    if (data['fssai'] != null && data['fssai'] != '') {
      await sendCommand('TEXT 30,220,"0",0,6,5,"fssai: ${data['fssai']}"\r\n');
      await sendCommand('TEXT 430,220,"0",0,6,5,"fssai: ${data['fssai']}"\r\n');
    }

    /*  if (data['address'] != null && data['address'] != '') {
      await sendCommand('BLOCK 240,190,160,50,"0",0,6,5,"MFD BY: ${data['address']}"\r\n');
      await sendCommand('BLOCK 640,190,160,50,"0",0,6,5,"MFD BY: ${data['address']}"\r\n');
    }*/

    int copies = 1;
    copies = (copies / 2).ceil();
    await sendCommand('PRINT $copies\r\n');
  }
}

class UsbDevice {
  final int vid;
  final int pid;

  UsbDevice(this.vid, this.pid);

  @override
  String toString() {
    return 'UsbDevice{vid: $vid, pid: $pid}';
  }
}
