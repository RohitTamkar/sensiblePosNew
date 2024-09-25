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

Future<String> generateInvoice(
  String? orderId,
  List<PurchaseSaleItemListStruct>? orderList,
  String? totalAmt,
  PurchaseRecord? customerDetails,
  PartyRecord? userDetails,
) async {
  final pdf = pw.Document();

  // Load logo image from URL
  // final http.Response response = await http.get(Uri.parse(logoImageUrl!));
  // final Uint8List logoImageBytes = response.bodyBytes;
  // final logoImageProvider = pw.MemoryImage(logoImageBytes);

  // final http.Response response1 = await http.get(Uri.parse(
  //     'https://firebasestorage.googleapis.com/v0/b/uvpixcel.appspot.com/o/importantImages%2Faddd.jpg?alt=media&token=6a7b48ba-ecb3-4b43-817f-3386f5783546'!));
  // final Uint8List logoImageBytes1 = response1.bodyBytes;
  // final logoImageProvider1 = pw.MemoryImage(logoImageBytes1);

  pdf.addPage(
    pw.Page(
      build: (context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Header with logo
            // pw.Row(
            //   mainAxisAlignment: pw.MainAxisAlignment.center,
            //   children: [
            //     pw.SizedBox(width: 20),
            //     pw.Image(logoImageProvider, width: 100), // Logo image
            //   ],
            // ),
            // Order details
            pw.Container(
              padding: pw.EdgeInsets.symmetric(vertical: 10),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('Thank You For Your Order !'),
                  pw.Text(
                      'Date: ${DateFormat('dd-MM-yyyy').format(DateTime.now())}'), // Current date
                  pw.Text('Order ID: $orderId'),

                  pw.SizedBox(height: 10),
                  pw.Text(
                    'To Address: ',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text('${userDetails?.address ?? ''}'),
                  pw.SizedBox(height: 10),
                  // Bold labels for customer details
                  pw.Text(
                    'Customer Name: ',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text(
                    '${userDetails?.name ?? ''}',
                  ),

                  pw.Text(
                    'Mobile No: ',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text('+91${userDetails?.mobile ?? ''}'),
                  pw.Text(
                    'Email: ',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text('${userDetails?.email ?? ''}'),
                  pw.SizedBox(height: 10),

                  pw.Table.fromTextArray(
                    context: context,
                    cellAlignment: pw.Alignment.centerLeft,
                    headerAlignment: pw.Alignment.centerLeft,
                    data: [
                      // Header row
                      ['Product Name', 'Quantity', 'Price'],
                      // Order items
                      ...orderList!.map((order) => [
                            '${order.categoryName} , (${order.size}) ,${order.thickness} ,${order.shapes}',
                            order.qty.toString(),
                            order.price.toString()
                          ]),
                      // GST and Total row
                      ['', 'GST (18% included):', calculateGST(totalAmt)],
                      ['', 'Grand Total:', totalAmt],
                    ],
                  ),
                  pw.SizedBox(height: 10),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.SizedBox(width: 10),
                      //  pw.Image(logoImageProvider1, width: 300), // Logo image
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    ),
  );

  // Save the PDF bytes
  final bytes = await pdf.save();
  final base64String = base64Encode(bytes);
  final pdfDataUri = 'data:application/pdf;base64,$base64String';

  // Print the PDF in web environment
  if (html.window.navigator.userAgent.contains('Chrome')) {
    // For Chrome browser
    html.AnchorElement(href: pdfDataUri)
      ..setAttribute('download', 'ORD-$orderId.pdf')
      ..click();
  } else {
    // For other browsers
    html.window.open(pdfDataUri, '_blank');
  }

  return pdfDataUri;
}

String calculateGST(String? totalAmt) {
  if (totalAmt == null) return '0.00';
  double amt = double.tryParse(totalAmt) ?? 0.0;
  double gst = amt * 0.18; // 18% GST
  return gst.toStringAsFixed(2);
}
