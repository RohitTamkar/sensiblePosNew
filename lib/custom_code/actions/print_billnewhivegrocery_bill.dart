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

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

// Imports other custom actions

import 'dart:async';
import 'dart:developer';
import 'dart:io';
//import 'package:flutter_pos_printer_platform/flutter_pos_printer_platform.dart';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter_pos_printer_platform_image_3_sdt/flutter_pos_printer_platform_image_3_sdt.dart';

int? returncountnew(String? invoicestring) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  if (invoicestring == null) return null;

  // Split the string by "/" and get the last part
  List<String> parts = invoicestring.split('/');

  if (parts.isNotEmpty) {
    // Try to parse the last part as an integer
    return int.tryParse(parts.last);
  }

  return null;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}

Future printBillnewhivegroceryBill(
  dynamic data,
  List<dynamic> selectedPrinter,
  bool status,
  String statusName,
  dynamic outletDetails,
  InvoiceRecord invoiceDetails,
  String printerSize,
  AppSettingsRecord appSetting,
) async {
  // Add your function code here!
  int size = 32;
  if (printerSize == "3 inch") {
    size = 46;
  } else if (printerSize == "2 inch") {
    size = 32;
  }
  final profile = await CapabilityProfile.load();
  final generator = size == 32
      ? Generator(PaperSize.mm58, profile)
      : Generator(PaperSize.mm80, profile);

  var printerManager = PrinterManager.instance;
  List<int>? pendingTask;
  BTStatus _currentStatus = BTStatus.none;
  USBStatus _currentUsbStatus = USBStatus.none;
  if (statusName == "BTStatus.connected") {
    _currentStatus = BTStatus.connected;
  }
  // _currentUsbStatus is only supports on Android
  if (statusName == "USBStatus.connected") {
    _currentUsbStatus = USBStatus.connected;
  }
  FFAppState().printerName = "";
  List<int> bytes = [];
  String billColumn3;
  String billColumn4;
  String taxColumn3;
  bool disc = false;
  dynamic obj;

  // changes according to size
  if (size == 46) {
    billColumn3 =
        "NO ITEM_NAME             QTY    RATE     TOTAL"; // 20, 8, 9, 9 (46)
    billColumn4 = "NO   ITEM_NAME      QTY  RATE  DIS%      TOTAL";
    taxColumn3 = "TAX%      TAXABLE     CGST     SGST     TAXAMT";

    if (data.length > 0) {
      obj = data;
      String header;

      if (FFAppState().billPrintHeader != null &&
          FFAppState().billPrintHeader != " ") {
        header = FFAppState().billPrintHeader.toString();
      }

      if (invoiceDetails.source != "KOT") {
        QuerySnapshot querySnapshot;
        querySnapshot = await FirebaseFirestore.instance
            .collection('OUTLET')
            .doc(FFAppState().outletIdRef?.id)
            .collection('HEADER')
            .get();
        for (var doc in querySnapshot.docs) {
          print(doc);

          if (doc["title"] != null && doc["title"].isNotEmpty) {
            bytes += generator.text(doc["title"],
                styles: PosStyles(
                    height: PosTextSize.size2,
                    width: PosTextSize.size2,
                    align: PosAlign.center));
          }
          if (doc["address"] != null && doc["address"].isNotEmpty) {
            bytes += generator.text(doc["address"],
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: true,
                    align: PosAlign.center));
          }
          if (doc["subtitleAddress"] != null &&
              doc["subtitleAddress"].isNotEmpty) {
            bytes += generator.text(doc["subtitleAddress"],
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: true,
                    align: PosAlign.center));
          }
          if (doc["gstNo"] != null && doc["gstNo"].isNotEmpty) {
            bytes += generator.text(doc["gstNo"],
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: true,
                    align: PosAlign.center));
          }
          if (doc["contactNo"] != null && doc["contactNo"].isNotEmpty) {
            bytes += generator.text(doc["contactNo"],
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: true,
                    align: PosAlign.center));
          }
          if (doc["email"] != null && doc["email"].isNotEmpty) {
            bytes += generator.text(doc["email"],
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: true,
                    align: PosAlign.center));
          }
          if (doc["serialNo"] != null && doc["serialNo"].isNotEmpty) {
            bytes += generator.text(doc["serialNo"],
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: true,
                    align: PosAlign.center));
          }
          if (doc["taxInvoice"] != null && doc["taxInvoice"].isNotEmpty) {
            bytes += generator.text(doc["taxInvoice"],
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: true,
                    align: PosAlign.center));
          }
          if (doc["bankName"] != null && doc["bankName"].isNotEmpty) {
            bytes += generator.text(doc["bankName"],
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: true,
                    align: PosAlign.center));
          }
          if (doc["bankBranch"] != null && doc["bankBranch"].isNotEmpty) {
            bytes += generator.text(doc["bankBranch"],
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: true,
                    align: PosAlign.center));
          }

          if (doc["accountNumber"] != null && doc["accountNumber"].isNotEmpty) {
            bytes += generator.text(doc["accountNumber"],
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: true,
                    align: PosAlign.center));
          }
          if (doc["ifscCode"] != null && doc["ifscCode"].isNotEmpty) {
            bytes += generator.text(doc["ifscCode"],
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: true,
                    align: PosAlign.center));
          }
        }
        bytes += generator.text(invoiceDetails.orderType,
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.center));
        bytes += generator.text(
            "-----------------------------------------------",
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));
      }

      String printLine = '';
      String dateString = '';
      String serialTemp =
          'Serial no: ' + lastBillCount(FFAppState().count).toString();
      if (invoiceDetails.source == "KOT" ||
          invoiceDetails.source == "CUSTOMER") {
        if (invoiceDetails.source == "KOT") {
          bytes += generator.text("NEW KOT",
              styles: PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size2,
                  bold: true,
                  align: PosAlign.center));
          bytes += generator.text(
              "-----------------------------------------------",
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.center));
        }

        String printLine = '';
        String dateString = '';
        // String serialTemp = 'Token no: ' + FFAppState().count.toString();
        final DateTime now =
            DateTime.fromMillisecondsSinceEpoch(invoiceDetails.invoiceDate);
        final DateFormat formatter = DateFormat('dd-MM-yyyy');
        final String formatted = formatter.format(now);
        dateString = formatted.toString();
        // printLine = serialTemp;
        for (int i = 1; i <= (size - (dateString.length)); i++) {
          printLine += " ";
        }

        printLine += dateString;

        /*    bytes += generator.text(printLine,
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: true));*/

        printLine = '';
        final DateTime now1 =
            DateTime.fromMillisecondsSinceEpoch(invoiceDetails.invoiceDate);
        final DateFormat formatter1 = DateFormat('dd-MM-yyyy h:mm a');
        final String formatted1 = formatter1.format(now1);

        String dateTimeString = formatted1.toString();
        String billNo = 'Bill No:' + invoiceDetails.invoice.toString();
        printLine = billNo;
        for (int i = 1;
            i <= (size - (billNo.length + dateTimeString.length));
            i++) {
          printLine += " ";
        }
        printLine += dateTimeString;

        bytes += generator.text(printLine,
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true));
      } else {
        String printLine = '';
        String dateString = '';
        String serialTemp =
            'Serial no: ' + returncountnew(invoiceDetails.invoice).toString();

        final DateTime now =
            DateTime.fromMillisecondsSinceEpoch(invoiceDetails.invoiceDate);
        final DateFormat formatter = DateFormat('dd-MM-yyyy');
        final String formatted = formatter.format(now);
        dateString = formatted.toString();
        printLine = serialTemp;
        for (int i = 1;
            i <= (size - (serialTemp.length + dateString.length));
            i++) {
          printLine += " ";
        }

        printLine += dateString;

        bytes += generator.text(printLine,
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false));
        printLine = '';
        final DateTime now1 =
            DateTime.fromMillisecondsSinceEpoch(invoiceDetails.invoiceDate);
        final DateFormat formatter1 = DateFormat('h:mm:ss');
        final String formatted1 = formatter1.format(now1);

        String dateTimeString = formatted1.toString();
        String billNo = 'Bill No: ' + invoiceDetails.invoice.toString();
        printLine = billNo;
        for (int i = 1;
            i <= (size - (billNo.length + dateTimeString.length));
            i++) {
          printLine += " ";
        }
        printLine += dateTimeString;

        bytes += generator.text(printLine,
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false));
      }

      bytes += generator.text("-----------------------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));
      if (appSetting.settingList.any((setting) =>
          setting.title == 'enableproductwisediscount' &&
          setting.value == true)) {
        disc = true;
        bytes += generator.text(billColumn4,
            styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              //align: PosAlign.center
            ));
      } else {
        bytes += generator.text(billColumn3,
            styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              //align: PosAlign.center
            ));
      }

      bytes += generator.text("-----------------------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));
      if (disc) {
        for (int i = 0; i < obj["itemList"].length; i++) {
          int s = i + 1;
          bytes += generator.row([
            PosColumn(
              text: '$s.',
              width: 1,
              styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                // align: PosAlign.center
              ),
            ),
            PosColumn(
              text: obj["itemList"][i]["name"].toString(),
              width: 4,
              styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                // align: PosAlign.left
              ),
            ),
            PosColumn(
              text: obj["itemList"][i]["quantity"].toString(),
              width: 1,
              styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                // align: PosAlign.center
              ),
            ),
            PosColumn(
              text: obj["itemList"][i]["price"].toString(),
              width: 2,
              styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                // align: PosAlign.center
              ),
            ),
            PosColumn(
              text: obj["itemList"][i]["disPer"].toString(),
              width: 2,
              styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                // align: PosAlign.center
              ),
            ),
            PosColumn(
              text: obj["itemList"][i]["total"].toString(),
              width: 2,
              styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                //align: PosAlign.center
              ),
            )
          ]);
        }
      } else {
        for (int i = 0; i < obj["itemList"].length; i++) {
          int s = i + 1;
          bytes += generator.row([
            PosColumn(
              text: '$s.',
              width: 1,
              styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                // align: PosAlign.left
              ),
            ),
            PosColumn(
              text: obj["itemList"][i]["name"].toString(),
              width: 5,
              styles: PosStyles(
                //fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                // align: PosAlign.left
              ),
            ),
            PosColumn(
              text: obj["itemList"][i]["quantity"].toString(),
              width: 2,
              styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                // align: PosAlign.center
              ),
            ),
            PosColumn(
              text: obj["itemList"][i]["price"].toString(),
              width: 2,
              styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                // align: PosAlign.center
              ),
            ),
            PosColumn(
              text: obj["itemList"][i]["total"].toString(),
              width: 2,
              styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                //align: PosAlign.center
              ),
            )
          ]);
        }
      }

      bytes += generator.text("-----------------------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));
      if (invoiceDetails.source == "KOT" ||
          invoiceDetails.source == "CUSTOMER") {
        int len = invoiceDetails.productList!.length;
        String itemsNo = "Items :" + len.toString();
        printLine = itemsNo;
        String subTotal = "Sub total:" +
            ((invoiceDetails.billAmt).toStringAsFixed(2)).toString();
        for (int i = 1; i <= (size - (itemsNo.length + subTotal.length)); i++) {
          printLine += " ";
        }
        printLine += subTotal;
        bytes += generator.text(printLine,
            styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                align: PosAlign.left));
      } else {
        int len = invoiceDetails.productList!.length;
        String itemsNo = "Items :" + len.toString();
        printLine = itemsNo;
        String subTotal = "Sub total:" +
            ((invoiceDetails.billAmt - invoiceDetails.taxAmt)
                    .toStringAsFixed(2))
                .toString();
        for (int i = 1; i <= (size - (itemsNo.length + subTotal.length)); i++) {
          printLine += " ";
        }
        printLine += subTotal;
        bytes += generator.text(printLine,
            styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                align: PosAlign.left));

        bytes += generator.text(
            "-----------------------------------------------",
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));
      }

      if (invoiceDetails.roundOff != 0) {
        bytes += generator.row([
          PosColumn(
            text: "Round Off:",
            width: 6,
            styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.left),
          ),
          PosColumn(
            text: invoiceDetails.roundOff.toString(),
            width: 6,
            styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.right),
          )
        ]);
        bytes += generator.text(
            "-----------------------------------------------",
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));
      }
      if (invoiceDetails.source != "KOT" &&
          invoiceDetails.source != "CUSTOMER") {
        if (invoiceDetails.taxAmt != 0) {
          bytes += generator.row([
            PosColumn(
              text: "Total Tax : ",
              width: 6,
              styles: PosStyles(
                  fontType: PosFontType.fontA,
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.left),
            ),
            PosColumn(
              text: invoiceDetails.taxAmt.toStringAsFixed(2),
              width: 6,
              styles: PosStyles(
                  fontType: PosFontType.fontA,
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.right),
            )
          ]);
          bytes += generator.text(
              "-----------------------------------------------",
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.center));
        }
      }
      int disPer = invoiceDetails.discountPer!.round();
      if (invoiceDetails.discountPer != 0) {
        bytes += generator.row([
          PosColumn(
            text: "Total Discount %",
            width: 8,
            styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.left),
          ),
          PosColumn(
            text: invoiceDetails.discountPer.toString() + '%',
            width: 4,
            styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.right),
          )
        ]);

        bytes += generator.text(
            "-----------------------------------------------",
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));
      }
      if (invoiceDetails.discountAmt != 0) {
        bytes += generator.row([
          PosColumn(
            text: "Total Discount Amt",
            width: 8,
            styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.left),
          ),
          PosColumn(
            text: invoiceDetails.discountAmt.toString(),
            width: 4,
            styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.right),
          )
        ]);

        bytes += generator.text(
            "-----------------------------------------------",
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));
      }

      if (invoiceDetails.delliveryChrg != 0) {
        bytes += generator.row([
          PosColumn(
            text: "Delivery Charges: ",
            width: 8,
            styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.left),
          ),
          PosColumn(
            text: invoiceDetails.delliveryChrg.toString(),
            width: 4,
            styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.right),
          )
        ]);
        bytes += generator.text(
            "-----------------------------------------------",
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));
      }

      if (invoiceDetails.source != "KOT" &&
          invoiceDetails.source != "CUSTOMER") {
        bytes += generator.text(
            "Grand Total:" + invoiceDetails.finalBillAmt.toString(),
            styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size2,
                align: PosAlign.right));
        bytes += generator.text(
            "-----------------------------------------------",
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));

        bytes += generator.text(
            "PAYMENT MODE :" + invoiceDetails.paymentMode.toString(),
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));
      }
      bytes += generator.text("-----------------------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));
      /*  bytes += generator.text(FFAppState().billPrintFooter.toString(),
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));*/

      //////////////////////////////TAX//////////////////////////////////////
      if (appSetting.settingList.any((setting) =>
          setting.title == 'enablegstontotal' && setting.value == true)) {
        if (invoiceDetails.taxAmt != 0) {
          // Check if tax is inclusive or exclusive
          bool isTaxInclusive = appSetting.settingList.any((setting) =>
              setting.title == 'enableInclusiveTax' && setting.value == true);

          // Tax rate (e.g., 5% -> 5)
          double taxRate = invoiceDetails.taxPer;

          // Total bill amount
          double billAmount = invoiceDetails.billAmt;

          // Calculate taxable amount
          double taxableAmt;
          if (isTaxInclusive) {
            // Tax is inclusive: taxableAmt = billAmount / (1 + taxRate/100)
            taxableAmt = billAmount / (1 + (taxRate / 100));
          } else {
            // Tax is exclusive: taxableAmt = billAmount
            taxableAmt = billAmount;
          }

          // Calculate total tax amount
          double totalTax = taxableAmt * (taxRate / 100);

          // Calculate CGST and SGST (each is half of total tax)
          double cgst = totalTax / 2;
          double sgst = totalTax / 2;

          // Format the output strings
          String cgstString =
              "CGST@(${taxRate / 2}%): ${cgst.toStringAsFixed(2)}";
          String sgstString =
              "SGST@(${taxRate / 2}%): ${sgst.toStringAsFixed(2)}";
          String totalTaxString =
              "TaxAmt(${taxRate}%): ${totalTax.toStringAsFixed(2)}";
          String taxableString = "TaxableAmt: ${taxableAmt.toStringAsFixed(2)}";

          // Add tax details to the output
          /*   bytes += generator.text(
              isTaxInclusive
                  ? "Tax Details ( All Inclusive )"
                  : "Tax Details ( All Exclusive )",
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.right));

          bytes += generator.text(
              "-----------------------------------------------",
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.center));*/

          // Add formatted tax details
          bytes += generator.text(cgstString,
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.right));

          bytes += generator.text(sgstString,
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.right));

          bytes += generator.text(taxableString,
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.right));
          bytes += generator.text(totalTaxString,
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.right));

          bytes += generator.text(
              "-----------------------------------------------",
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.center));
          bytes += generator.text(
              "Grand Total:" + invoiceDetails.finalBillAmt.toString(),
              styles: PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size2,
                  align: PosAlign.right));
          bytes += generator.text(
              "-----------------------------------------------",
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.center));
        }
      } else {
        if (invoiceDetails.taxAmt != 0) {
          if (appSetting.settingList.any((setting) =>
              setting.title == 'enableInclusiveTax' && setting.value == true)) {
            bytes += generator.text("Tax Details ( All Inclusive )",
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: false,
                    align: PosAlign.center));
          } else {
            bytes += generator.text("Tax Details ( All Exclusive )",
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: false,
                    align: PosAlign.center));
          }

          bytes += generator.text(
              "-----------------------------------------------",
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.center));

          bytes += generator.text(taxColumn3,
              styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                //align: PosAlign.center
              ));

          bytes += generator.text(
              "-----------------------------------------------",
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.center));

          Map<String, Map<String, double>> taxMap = {};
// Initialize running totals
          double taxableAmtTotal = 0;
          double cgstTotal = 0;
          double sgstTotal = 0;
          double taxAmtTotal = 0;
          for (int i = 0; i < obj["itemList"].length; i++) {
            String taxPer = obj["itemList"][i]["taxPer"].toString();
            double price = double.parse(obj["itemList"][i]["price"].toString());
            double qty =
                double.parse(obj["itemList"][i]["quantity"].toString());
            double taxableAmt = price * qty;
            double totalTax =
                double.parse(obj["itemList"][i]["taxAmt"].toString());

            /*String taxPer = obj["itemList"][i]["taxPer"].toString();
  double taxableAmt = double.parse(obj["itemList"][i]["price"].toString());
  double totalTax = double.parse(obj["itemList"][i]["taxAmt"].toString());*/
            if (taxMap.containsKey(taxPer)) {
              taxMap[taxPer]!["taxable"] =
                  (taxMap[taxPer]!["taxable"] ?? 0) + taxableAmt;
              taxMap[taxPer]!["totalTax"] =
                  (taxMap[taxPer]!["totalTax"] ?? 0) + totalTax;
            } else {
              taxMap[taxPer] = {
                "taxable": taxableAmt,
                "totalTax": totalTax,
              };
            }

            // Update running totals
            taxableAmtTotal += taxableAmt;
            cgstTotal += totalTax / 2;
            sgstTotal += totalTax / 2;
            taxAmtTotal += totalTax;
          }

// Generating rows for each tax group
          taxMap.forEach((taxPer, values) {
            double totalTax = values["totalTax"]!;
            double cgstAmt = totalTax / 2;
            double sgstAmt = totalTax / 2;

            bytes += generator.row([
              PosColumn(
                text: taxPer,
                width: 3,
                styles: PosStyles(
                  fontType: PosFontType.fontA,
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                ),
              ),
              PosColumn(
                text: values["taxable"]!.toStringAsFixed(2),
                width: 3,
                styles: PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                ),
              ),
              PosColumn(
                text: cgstAmt.toStringAsFixed(2),
                width: 2,
                styles: PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                ),
              ),
              PosColumn(
                text: sgstAmt.toStringAsFixed(2),
                width: 2,
                styles: PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                ),
              ),
              PosColumn(
                text: totalTax.toStringAsFixed(2),
                width: 2,
                styles: PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                ),
              ),
            ]);
          });

          bytes += generator.text(
              "-----------------------------------------------",
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.center));
          bytes += generator.row([
            PosColumn(
              text: "Total",
              width: 3,
              styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
              ),
            ),
            PosColumn(
              text: taxableAmtTotal.toStringAsFixed(2),
              width: 3,
              styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
              ),
            ),
            PosColumn(
              text: cgstTotal.toStringAsFixed(2),
              width: 2,
              styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
              ),
            ),
            PosColumn(
              text: sgstTotal.toStringAsFixed(2),
              width: 2,
              styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
              ),
            ),
            PosColumn(
              text: taxAmtTotal.toStringAsFixed(2),
              width: 2,
              styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
              ),
            ),
          ]);
          bytes += generator.text(
              "-----------------------------------------------",
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.center));
          ////////////////////////////////////////////////////////////////////
        }
      }
      if (invoiceDetails.party.isNotEmpty && invoiceDetails.party != null) {
        QuerySnapshot querySnapshotparty;
        querySnapshotparty = await FirebaseFirestore.instance
            .collection('OUTLET')
            .doc(FFAppState().outletIdRef?.id)
            .collection('PARTY')
            .where('id', isEqualTo: invoiceDetails.party)
            .get();
        for (var doc in querySnapshotparty.docs) {
          bytes += generator.text("Customer Details",
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: true,
                  align: PosAlign.center));

          bytes += generator.text("Name :" + doc['name'].toString(),
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: true,
                  align: PosAlign.center));

          bytes += generator.text("Contact :" + doc['mobile'].toString(),
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: true,
                  align: PosAlign.center));
          if (doc['oldBalance'].toInt() > 0) {
            bytes += generator.text(
                "Old Credit :" + doc['oldBalance'].toString(),
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: true,
                    align: PosAlign.center));
          }
          /* FFAppState().groceryJson=invoiceDetails.paymentMode;
          if (FFAppState().groceryJson['paymentMode']['CREDIT'] != null) {
            if (FFAppState().groceryJson['paymentMode']['CREDIT'] > 0) {
              bytes += generator.text(
                  "New Credit :" +
                      (FFAppState().groceryJson['paymentMode']['CREDIT'])
                          .toString(),
                  styles: const PosStyles(
                      height: PosTextSize.size1,
                      width: PosTextSize.size1,
                      bold: true,
                      align: PosAlign.center));
              bytes += generator.text(
                  "Total Credit :" +
                      (FFAppState().groceryJson['paymentMode']['CREDIT'] +
                          FFAppState().oldBalance)
                          .toString(),
                  styles: const PosStyles(
                      height: PosTextSize.size1,
                      width: PosTextSize.size1,
                      bold: true,
                      align: PosAlign.center));
            }
          }*/
        }
        /* bytes += generator.text(
            "-----------------------------------------------",
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));*/
      }
      if (invoiceDetails.source == "KOT") {
        bytes += generator.text("THIS KOT IS ONLY FOR HOTEL PURPOSED",
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));
        bytes += generator.text(
            "-----------------------------------------------",
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));
      }
      /* bytes += generator.text("** THANK YOU ! VISIT AGAIN !! **",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));*/

      QuerySnapshot querySnapshot2;
      querySnapshot2 = await FirebaseFirestore.instance
          .collection('OUTLET')
          .doc(FFAppState().outletIdRef?.id)
          .collection('FOOTER')
          .get();
      for (var doc in querySnapshot2.docs) {
        print(doc);
        if (doc["footerText1"] != null && doc["footerText1"].isNotEmpty) {
          bytes += generator.text(doc["footerText1"],
              styles: PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  align: PosAlign.center));
        }
        if (doc["footerText2"] != null && doc["footerText2"].isNotEmpty) {
          bytes += generator.text(doc["footerText2"],
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: true,
                  align: PosAlign.center));
        }
        if (doc["footerText3"] != null && doc["footerText3"].isNotEmpty) {
          bytes += generator.text(doc["footerText3"],
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: true,
                  align: PosAlign.center));
        }
        if (doc["footerText4"] != null && doc["footerText4"].isNotEmpty) {
          bytes += generator.text(doc["footerText4"],
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: true,
                  align: PosAlign.center));
        }
        if (doc["footerText5"] != null && doc["footerText5"].isNotEmpty) {
          bytes += generator.text(doc["footerText5"],
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: true,
                  align: PosAlign.center));
        }
      }
    } else {
      bytes += generator.text('TEST Print',
          styles: PosStyles(
              height: PosTextSize.size2,
              width: PosTextSize.size2,
              align: PosAlign.center));
    }
  } else if (size == 32) {
    billColumn3 =
        "ITEM         QTY  RATE  TOTAL "; // Adjusted for 32 characters
    taxColumn3 =
        "TAX%  TAXABLE  CGST  SGST  TAXAMT"; // Adjusted for 32 characters

    if (data.length > 0) {
      obj = data;
      String header;
      if (FFAppState().billPrintHeader != null &&
          FFAppState().billPrintHeader != " ") {
        header = FFAppState().billPrintHeader.toString();
      }

      QuerySnapshot querySnapshot;
      querySnapshot = await FirebaseFirestore.instance
          .collection('OUTLET')
          .doc(FFAppState().outletIdRef?.id)
          .collection('HEADER')
          .get();
      for (var doc in querySnapshot.docs) {
        if (invoiceDetails.source != "KOT") {
          if (doc["title"] != null && doc["title"].isNotEmpty) {
            bytes += generator.text(doc["title"],
                styles: PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    align: PosAlign.center));
          }
          if (doc["address"] != null && doc["address"].isNotEmpty) {
            bytes += generator.text(doc["address"],
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: true,
                    align: PosAlign.center));
          }
          if (doc["gstNo"] != null && doc["gstNo"].isNotEmpty) {
            bytes += generator.text(doc["gstNo"],
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: true,
                    align: PosAlign.center));
          }
          if (doc["contactNo"] != null && doc["contactNo"].isNotEmpty) {
            bytes += generator.text(doc["contactNo"],
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: true,
                    align: PosAlign.center));
          }
          if (doc["email"] != null && doc["email"].isNotEmpty) {
            bytes += generator.text(doc["email"],
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: true,
                    align: PosAlign.center));
          }
          if (doc["serialNo"] != null && doc["serialNo"].isNotEmpty) {
            bytes += generator.text(doc["serialNo"],
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: true,
                    align: PosAlign.center));
          }
          if (doc["taxInvoice"] != null && doc["taxInvoice"].isNotEmpty) {
            bytes += generator.text(doc["taxInvoice"],
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: true,
                    align: PosAlign.center));
          }
          if (doc["bankName"] != null && doc["bankName"].isNotEmpty) {
            bytes += generator.text(doc["bankName"],
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: true,
                    align: PosAlign.center));
          }
          if (doc["bankBranch"] != null && doc["bankBranch"].isNotEmpty) {
            bytes += generator.text(doc["bankBranch"],
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: true,
                    align: PosAlign.center));
          }
          if (doc["accountNumber"] != null && doc["accountNumber"].isNotEmpty) {
            bytes += generator.text(doc["accountNumber"],
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: true,
                    align: PosAlign.center));
          }
          if (doc["ifscCode"] != null && doc["ifscCode"].isNotEmpty) {
            bytes += generator.text(doc["ifscCode"],
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: true,
                    align: PosAlign.center));
          }
          if (doc["subtitleAddress"] != null &&
              doc["subtitleAddress"].isNotEmpty) {
            bytes += generator.text(doc["subtitleAddress"],
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: true,
                    align: PosAlign.center));
          }
        }
      }

      bytes += generator.text(FFAppState().orderType,
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: true,
              align: PosAlign.center));

      if (invoiceDetails.source == "KOT") {
        bytes += generator.text("NEW KOT",
            styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
                align: PosAlign.center));
      }

      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      String printLine = '';

      if (invoiceDetails.source == "KOT" ||
          invoiceDetails.source == "CUSTOMER") {
        String dateString = '';
        final DateTime now =
            DateTime.fromMillisecondsSinceEpoch(invoiceDetails.invoiceDate);
        final DateFormat formatter = DateFormat('dd-MM-yyyy  h:mm a');
        final String formatted = formatter.format(now);
        dateString = formatted.toString();

        printLine = dateString;
        bytes += generator.text(printLine,
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                align: PosAlign.center,
                bold: true));

        printLine = '';
        final DateTime now1 =
            DateTime.fromMillisecondsSinceEpoch(invoiceDetails.invoiceDate);
        final DateFormat formatter1 = DateFormat('dd-MM-yyyy h:mm a');
        final String formatted1 = formatter1.format(now1);

        String dateTimeString = formatted1.toString();
        String billNo = 'Bill No:' + invoiceDetails.invoice.toString();
        printLine = billNo;
        bytes += generator.text(printLine,
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                align: PosAlign.center,
                bold: true));
      } else {
        String dateString = '';
        String serialTemp =
            'Serial no: ' + lastBillCount(FFAppState().count).toString();
        final DateTime now =
            DateTime.fromMillisecondsSinceEpoch(invoiceDetails.invoiceDate);
        final DateFormat formatter = DateFormat('dd-MM-yyyy');
        final String formatted = formatter.format(now);
        dateString = formatted.toString();
        printLine = serialTemp + " " + dateString;

        bytes += generator.text(printLine,
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                align: PosAlign.center,
                bold: false));

        printLine = '';
        final DateTime now1 =
            DateTime.fromMillisecondsSinceEpoch(invoiceDetails.invoiceDate);
        final DateFormat formatter1 = DateFormat('h:mm:ss');
        final String formatted1 = formatter1.format(now1);

        String dateTimeString = formatted1.toString();
        String billNo = 'Bill No: ' + invoiceDetails.invoice.toString();
        printLine = billNo + " " + dateTimeString;

        bytes += generator.text(printLine,
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false));
      }

      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      bytes += generator.text(billColumn3,
          styles: const PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: false,
          ));

      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      for (int i = 0; i < obj["itemList"].length; i++) {
        bytes += generator.row([
          PosColumn(
            text: obj["itemList"][i]["name"].toString(),
            width: 5,
            styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
            ),
          ),
          PosColumn(
            text: obj["itemList"][i]["quantity"].toString(),
            width: 2,
            styles: PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
            ),
          ),
          PosColumn(
            text: obj["itemList"][i]["price"].toString(),
            width: 2,
            styles: PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
            ),
          ),
          PosColumn(
            text: obj["itemList"][i]["total"].toString(),
            width: 3,
            styles: PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
            ),
          )
        ]);
      }

      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      if (invoiceDetails.source != "KOT" &&
          invoiceDetails.source != "CUSTOMER") {
        int len = invoiceDetails.productList!.length;
        String itemsNo = "Items :" + len.toString();
        printLine = itemsNo;
        String subTotal = "Sub total:" +
            ((invoiceDetails.billAmt - invoiceDetails.taxAmt)
                    .toStringAsFixed(2))
                .toString();
        for (int i = 1; i <= (size - (itemsNo.length + subTotal.length)); i++) {
          printLine += " ";
        }
        printLine += subTotal;
        bytes += generator.text(printLine,
            styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                align: PosAlign.left));
      } else {
        int len = invoiceDetails.productList!.length;
        String itemsNo = "Items :" + len.toString();
        printLine = itemsNo;
        String subTotal = "Sub total:" +
            ((invoiceDetails.billAmt).toStringAsFixed(2)).toString();
        for (int i = 1; i <= (size - (itemsNo.length + subTotal.length)); i++) {
          printLine += " ";
        }
        printLine += subTotal;
        bytes += generator.text(printLine,
            styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                align: PosAlign.left));
      }

      if (invoiceDetails.source != "KOT" &&
          invoiceDetails.source != "CUSTOMER") {
        bytes += generator.text("--------------------------------",
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));
      }

      if (invoiceDetails.roundOff != 0) {
        bytes += generator.row([
          PosColumn(
            text: "Round Off:",
            width: 12,
            styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.left),
          ),
          PosColumn(
            text: invoiceDetails.roundOff.toString(),
            width: 12,
            styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.right),
          )
        ]);
        bytes += generator.text("--------------------------------",
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));
      }

      if (invoiceDetails.source != "KOT" &&
          invoiceDetails.source != "CUSTOMER") {
        if (invoiceDetails.taxAmt != 0) {
          bytes += generator.row([
            PosColumn(
              text: "Tax : ",
              width: 12,
              styles: PosStyles(
                  fontType: PosFontType.fontA,
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.left),
            ),
            PosColumn(
              text: invoiceDetails.taxAmt.toStringAsFixed(2),
              width: 12,
              styles: PosStyles(
                  fontType: PosFontType.fontA,
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.right),
            )
          ]);
          bytes += generator.text("--------------------------------",
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.center));
        }
      }

      if (invoiceDetails.delliveryChrg != 0) {
        bytes += generator.row([
          PosColumn(
            text: "Delivery Charges: ",
            width: 16,
            styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.left),
          ),
          PosColumn(
            text: invoiceDetails.delliveryChrg.toString(),
            width: 8,
            styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.right),
          )
        ]);
        bytes += generator.text("--------------------------------",
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));
      }

      int disPer = invoiceDetails.discountPer!.round();
      if (invoiceDetails.discountAmt != 0) {
        bytes += generator.row([
          PosColumn(
            text: "Discount (" + disPer.toString() + "%): ",
            width: 16,
            styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.left),
          ),
          PosColumn(
            text: invoiceDetails.discountAmt.toString(),
            width: 8,
            styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.right),
          )
        ]);

        bytes += generator.text("--------------------------------",
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));
      }

      if (invoiceDetails.source != "KOT" &&
          invoiceDetails.source != "CUSTOMER") {
        bytes += generator.text(
            "Grand Total:" + invoiceDetails.finalBillAmt.toString(),
            styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                align: PosAlign.right));
        bytes += generator.text("--------------------------------",
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));

        bytes += generator.text(
            "PAYMENT MODE :" + invoiceDetails.paymentMode.toString(),
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));
      }

      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      //////////////////////////////TAX//////////////////////////////////////
      if (appSetting.settingList.any((setting) =>
          setting.title == 'enablegstontotal' && setting.value == true)) {
        if (invoiceDetails.taxAmt != 0) {
          bool isTaxInclusive = appSetting.settingList.any((setting) =>
              setting.title == 'enableInclusiveTax' && setting.value == true);

          double taxRate = invoiceDetails.taxPer;
          double billAmount = invoiceDetails.billAmt;

          double taxableAmt;
          if (isTaxInclusive) {
            taxableAmt = billAmount / (1 + (taxRate / 100));
          } else {
            taxableAmt = billAmount;
          }

          double totalTax = taxableAmt * (taxRate / 100);
          double cgst = totalTax / 2;
          double sgst = totalTax / 2;

          String cgstString =
              "CGST@(${taxRate / 2}%): ${cgst.toStringAsFixed(2)}";
          String sgstString =
              "SGST@(${taxRate / 2}%): ${sgst.toStringAsFixed(2)}";
          String totalTaxString =
              "TaxAmt(${taxRate}%): ${totalTax.toStringAsFixed(2)}";
          String taxableString = "TaxableAmt: ${taxableAmt.toStringAsFixed(2)}";

/*  bytes += generator.text(
  isTaxInclusive
  ? "Tax Details ( Inclusive )"
      : "Tax Details ( Exclusive )",
  styles: const PosStyles(
  height: PosTextSize.size1,
  width: PosTextSize.size1,
  bold: false,
  align: PosAlign.right));

  bytes += generator.text("--------------------------------",
  styles: const PosStyles(
  height: PosTextSize.size1,
  width: PosTextSize.size1,
  bold: false,
  align: PosAlign.center));
*/
          bytes += generator.text(cgstString,
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.right));

          bytes += generator.text(sgstString,
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.right));

          bytes += generator.text(taxableString,
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.right));

          bytes += generator.text(totalTaxString,
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.right));

          bytes += generator.text("--------------------------------",
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.center));

          bytes += generator.text(
              "Grand Total:" + invoiceDetails.finalBillAmt.toString(),
              styles: PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  align: PosAlign.right));

          bytes += generator.text("--------------------------------",
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.center));
        }
      } else {
        if (invoiceDetails.taxAmt != 0) {
          if (appSetting.settingList.any((setting) =>
              setting.title == 'enableInclusiveTax' && setting.value == true)) {
            bytes += generator.text("Tax Details ( Inclusive )",
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: false,
                    align: PosAlign.center));
          } else {
            bytes += generator.text("Tax Details ( Exclusive )",
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: false,
                    align: PosAlign.center));
          }

          bytes += generator.text("--------------------------------",
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.center));

          bytes += generator.text(taxColumn3,
              styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
              ));

          bytes += generator.text("--------------------------------",
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.center));

          Map<String, Map<String, double>> taxMap = {};
          double taxableAmtTotal = 0;
          double cgstTotal = 0;
          double sgstTotal = 0;
          double taxAmtTotal = 0;

          for (int i = 0; i < obj["itemList"].length; i++) {
            String taxPer = obj["itemList"][i]["taxPer"].toString();
            double price = double.parse(obj["itemList"][i]["price"].toString());
            double qty =
                double.parse(obj["itemList"][i]["quantity"].toString());
            double taxableAmt = price * qty;
            double totalTax =
                double.parse(obj["itemList"][i]["taxAmt"].toString());

            if (taxMap.containsKey(taxPer)) {
              taxMap[taxPer]!["taxable"] =
                  (taxMap[taxPer]!["taxable"] ?? 0) + taxableAmt;
              taxMap[taxPer]!["totalTax"] =
                  (taxMap[taxPer]!["totalTax"] ?? 0) + totalTax;
            } else {
              taxMap[taxPer] = {
                "taxable": taxableAmt,
                "totalTax": totalTax,
              };
            }

            taxableAmtTotal += taxableAmt;
            cgstTotal += totalTax / 2;
            sgstTotal += totalTax / 2;
            taxAmtTotal += totalTax;
          }

          taxMap.forEach((taxPer, values) {
            double totalTax = values["totalTax"]!;
            double cgstAmt = totalTax / 2;
            double sgstAmt = totalTax / 2;

            bytes += generator.row([
              PosColumn(
                text: taxPer,
                width: 3,
                styles: PosStyles(
                  fontType: PosFontType.fontA,
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                ),
              ),
              PosColumn(
                text: values["taxable"]!.toString(),
                width: 6,
                styles: PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                ),
              ),
              PosColumn(
                text: cgstAmt.toStringAsFixed(2),
                width: 4,
                styles: PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                ),
              ),
              PosColumn(
                text: sgstAmt.toStringAsFixed(2),
                width: 4,
                styles: PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                ),
              ),
              PosColumn(
                text: totalTax.toStringAsFixed(2),
                width: 4,
                styles: PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                ),
              ),
            ]);
          });

          bytes += generator.text("--------------------------------",
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.center));

          bytes += generator.row([
            PosColumn(
              text: "Total",
              width: 3,
              styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
              ),
            ),
            PosColumn(
              text: taxableAmtTotal.toStringAsFixed(2),
              width: 6,
              styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
              ),
            ),
            PosColumn(
              text: cgstTotal.toStringAsFixed(2),
              width: 4,
              styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
              ),
            ),
            PosColumn(
              text: sgstTotal.toStringAsFixed(2),
              width: 4,
              styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
              ),
            ),
            PosColumn(
              text: taxAmtTotal.toStringAsFixed(2),
              width: 4,
              styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: true,
              ),
            ),
          ]);

          bytes += generator.text("--------------------------------",
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.center));
        }
      }

      if (FFAppState().setCustName.isNotEmpty) {
        QuerySnapshot querySnapshotparty;
        querySnapshotparty = await FirebaseFirestore.instance
            .collection('OUTLET')
            .doc(FFAppState().outletIdRef?.id)
            .collection('PARTY')
            .where('id', isEqualTo: FFAppState().setCustRef!.id)
            .get();
        for (var doc in querySnapshotparty.docs) {
          bytes += generator.text("Customer Details",
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: true,
                  align: PosAlign.center));

          bytes += generator.text("Name :" + doc['name'].toString(),
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: true,
                  align: PosAlign.center));

          bytes += generator.text("Contact :" + doc['mobile'].toString(),
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: true,
                  align: PosAlign.center));
          if (doc['oldBalance'].toInt() > 0) {
            bytes += generator.text(
                "Old Credit :" + FFAppState().oldBalance.toString(),
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: true,
                    align: PosAlign.center));
          }
          if (invoiceDetails.paymentMode.toString() == 'CREDIT') {
            bytes += generator.text(
                "New Credit :" + FFAppState().finalAmt.toString(),
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: true,
                    align: PosAlign.center));
            bytes += generator.text(
                "Total Credit :" +
                    (FFAppState().finalAmt + FFAppState().oldBalance)
                        .toString(),
                styles: const PosStyles(
                    height: PosTextSize.size1,
                    width: PosTextSize.size1,
                    bold: true,
                    align: PosAlign.center));
          }
        }
        bytes += generator.text("--------------------------------",
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));
      }

      if (invoiceDetails.source == "KOT") {
        bytes += generator.text("THIS KOT IS ONLY FOR HOTEL PURPOSED",
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));
        bytes += generator.text("--------------------------------",
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));
      }

      QuerySnapshot querySnapshot2;
      querySnapshot2 = await FirebaseFirestore.instance
          .collection('OUTLET')
          .doc(FFAppState().outletIdRef?.id)
          .collection('FOOTER')
          .get();
      for (var doc in querySnapshot2.docs) {
        if (doc["footerText1"] != null && doc["footerText1"].isNotEmpty) {
          bytes += generator.text(doc["footerText1"],
              styles: PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  align: PosAlign.center));
        }
        if (doc["footerText2"] != null && doc["footerText2"].isNotEmpty) {
          bytes += generator.text(doc["footerText2"],
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: true,
                  align: PosAlign.center));
        }
        if (doc["footerText3"] != null && doc["footerText3"].isNotEmpty) {
          bytes += generator.text(doc["footerText3"],
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: true,
                  align: PosAlign.center));
        }
        if (doc["footerText4"] != null && doc["footerText4"].isNotEmpty) {
          bytes += generator.text(doc["footerText4"],
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: true,
                  align: PosAlign.center));
        }
        if (doc["footerText5"] != null && doc["footerText5"].isNotEmpty) {
          bytes += generator.text(doc["footerText5"],
              styles: const PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: true,
                  align: PosAlign.center));
        }
      }
    } else {
      bytes += generator.text('TEST Print',
          styles: PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              align: PosAlign.center));
    }
  }
  if (appSetting.settingList.any(
      (setting) => setting.title == 'printtwobills' && setting.value == true)) {
    if (bytes.length > 0) {
      if (selectedPrinter == null) return;
      var bluetoothPrinter = selectedPrinter[0]!;

      // Function to print a single bill
      Future<void> printBill(List<int> billBytes) async {
        switch (bluetoothPrinter["typePrinter"]) {
          case PrinterType.usb:
            billBytes += generator.feed(2);
            billBytes += generator.cut();
            FFAppState().printerName = statusName;
            FFAppState().isPrinterConnected = status;
            await printerManager.connect(
                type: bluetoothPrinter["typePrinter"],
                model: UsbPrinterInput(
                    name: bluetoothPrinter["deviceName"],
                    productId: bluetoothPrinter["productId"],
                    vendorId: bluetoothPrinter["vendorId"]));
            pendingTask = null;
            if (Platform.isAndroid) pendingTask = billBytes;
            break;

          case PrinterType.bluetooth:
            billBytes += generator.cut();
            FFAppState().printerName = statusName;
            FFAppState().isPrinterConnected = status;
            await printerManager.connect(
                type: bluetoothPrinter["typePrinter"],
                model: BluetoothPrinterInput(
                  name: bluetoothPrinter["deviceName"],
                  address: bluetoothPrinter["address"],
                  isBle: bluetoothPrinter["isBle"] ?? false,
                ));
            pendingTask = null;
            if (Platform.isIOS || Platform.isAndroid) pendingTask = billBytes;
            break;

          case PrinterType.network:
            billBytes += generator.feed(2);
            billBytes += generator.cut();
            await printerManager.connect(
                type: bluetoothPrinter["typePrinter"],
                model: TcpPrinterInput(ipAddress: bluetoothPrinter.address!));
            break;

          default:
        }

        if (bluetoothPrinter["typePrinter"] == PrinterType.bluetooth) {
          _currentStatus = BTStatus.connected;

          if (_currentStatus == BTStatus.connected) {
            FFAppState().printerName = "connected bt";
            printerManager.send(
                type: bluetoothPrinter["typePrinter"], bytes: billBytes);
            pendingTask = null;
          }
        } else if (bluetoothPrinter["typePrinter"] == PrinterType.usb &&
            Platform.isAndroid) {
          if (_currentUsbStatus == USBStatus.connected) {
            FFAppState().printerName = "connected usb";
            printerManager.send(
                type: bluetoothPrinter["typePrinter"], bytes: billBytes);
            pendingTask = null;
          }
        } else {
          printerManager.send(
              type: bluetoothPrinter["typePrinter"], bytes: billBytes);
        }
      }

      // Generate and print the first bill
      await printBill(bytes);

      // Optionally, if you want a slight delay between prints
      await Future.delayed(Duration(seconds: 1));

      // Generate and print the second bill (reuse bytes or regenerate)
      await printBill(bytes);
    }
  } else {
    if (bytes.length > 0) {
      if (selectedPrinter == null) return;
      var bluetoothPrinter = selectedPrinter[0]!;

      // Function to print a single bill
      Future<void> printBill(List<int> billBytes) async {
        switch (bluetoothPrinter["typePrinter"]) {
          case PrinterType.usb:
            billBytes += generator.feed(2);
            billBytes += generator.cut();
            FFAppState().printerName = statusName;
            FFAppState().isPrinterConnected = status;
            await printerManager.connect(
                type: bluetoothPrinter["typePrinter"],
                model: UsbPrinterInput(
                    name: bluetoothPrinter["deviceName"],
                    productId: bluetoothPrinter["productId"],
                    vendorId: bluetoothPrinter["vendorId"]));
            pendingTask = null;
            if (Platform.isAndroid) pendingTask = billBytes;
            break;

          case PrinterType.bluetooth:
            billBytes += generator.cut();
            FFAppState().printerName = statusName;
            FFAppState().isPrinterConnected = status;
            await printerManager.connect(
                type: bluetoothPrinter["typePrinter"],
                model: BluetoothPrinterInput(
                  name: bluetoothPrinter["deviceName"],
                  address: bluetoothPrinter["address"],
                  isBle: bluetoothPrinter["isBle"] ?? false,
                ));
            pendingTask = null;
            if (Platform.isIOS || Platform.isAndroid) pendingTask = billBytes;
            break;

          case PrinterType.network:
            billBytes += generator.feed(2);
            billBytes += generator.cut();
            await printerManager.connect(
                type: bluetoothPrinter["typePrinter"],
                model: TcpPrinterInput(ipAddress: bluetoothPrinter.address!));
            break;

          default:
        }

        if (bluetoothPrinter["typePrinter"] == PrinterType.bluetooth) {
          _currentStatus = BTStatus.connected;

          if (_currentStatus == BTStatus.connected) {
            FFAppState().printerName = "connected bt";
            printerManager.send(
                type: bluetoothPrinter["typePrinter"], bytes: billBytes);
            pendingTask = null;
          }
        } else if (bluetoothPrinter["typePrinter"] == PrinterType.usb &&
            Platform.isAndroid) {
          if (_currentUsbStatus == USBStatus.connected) {
            FFAppState().printerName = "connected usb";
            printerManager.send(
                type: bluetoothPrinter["typePrinter"], bytes: billBytes);
            pendingTask = null;
          }
        } else {
          printerManager.send(
              type: bluetoothPrinter["typePrinter"], bytes: billBytes);
        }
      }

      // Generate and print the first bill
      await printBill(bytes);
    }
  }
}
