// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'package:dropdown_search/dropdown_search.dart';

class DropDownSearch extends StatefulWidget {
  const DropDownSearch({
    Key? key,
    this.width,
    this.height,
    required this.productList,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<dynamic> productList;

  @override
  _DropDownSearchState createState() => _DropDownSearchState();
}

class _DropDownSearchState extends State<DropDownSearch> {
  List<dynamic> selectedProduct = [];

  @override
  Widget build(BuildContext context) {
    // var value = widget.productList![0].name;

    var value;
    List<String> nameList = [];
    // widget.productList.forEach((element) {
    //   nameList.add(element.name!);
    // });

    return Container(
        child: DropdownSearch<String>(
      popupProps: PopupProps.menu(
        showSelectedItems: true,
        showSearchBox: true,
      ),
      items: nameList,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          //labelText: "Menu mode",
          hintText: "Search Product....",
        ),
      ),
      onChanged: (val) => {
        // widget.productList.forEach((element) async {
        //   if (element.name == val) {
        //     // selectedProduct.add(element);
        //     print(selectedProduct);

        //     await addToHoldList(element, FFAppState().selBill).then((value) {
        //       setState(() {
        //         FFAppState().allBillsList = value;
        //         selectedProduct = value;
        //         calSubTotalForHoldList(
        //             FFAppState().selBill.toString(), selectedProduct);
        //         calBillAmt(FFAppState().disAmt, FFAppState().delCharges);
        //       });
        //     });
        //   }
        // })
      },
      selectedItem: value,
    ));
  }
}
