import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/selection_option/selection_option_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'kot_order_screen_widget.dart' show KotOrderScreenWidget;
import 'package:badges/badges.dart' as badges;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class KotOrderScreenModel extends FlutterFlowModel<KotOrderScreenWidget> {
  ///  Local state fields for this page.

  List<InvoiceRecord> invoices = [];
  void addToInvoices(InvoiceRecord item) => invoices.add(item);
  void removeFromInvoices(InvoiceRecord item) => invoices.remove(item);
  void removeAtIndexFromInvoices(int index) => invoices.removeAt(index);
  void insertAtIndexInInvoices(int index, InvoiceRecord item) =>
      invoices.insert(index, item);
  void updateInvoicesAtIndex(int index, Function(InvoiceRecord) updateFn) =>
      invoices[index] = updateFn(invoices[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
