import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'table_details_model.dart';
export 'table_details_model.dart';

class TableDetailsWidget extends StatefulWidget {
  const TableDetailsWidget({
    super.key,
    this.tablekot,
  });

  final TableKotRecord? tablekot;

  @override
  State<TableDetailsWidget> createState() => _TableDetailsWidgetState();
}

class _TableDetailsWidgetState extends State<TableDetailsWidget> {
  late TableDetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TableDetailsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 600.0,
          height: 400.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 10.0, 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 25.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 3.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '5qa49c1f' /* Details of : */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelLargeFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .labelLargeIsCustom,
                                      ),
                                ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  widget!.tablekot?.tableNo,
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .headlineSmallFamily,
                                      color: FlutterFlowTheme.of(context).info,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .headlineSmallIsCustom,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 100.0,
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 15.0, 0.0),
                                child: Text(
                                  functions.totalDuration(
                                      widget!.tablekot!.createdDate),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .headlineSmallFamily,
                                        color: Color(0xFF3B58FF),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .headlineSmallIsCustom,
                                      ),
                                ),
                              ),
                              Container(
                                width: 15.0,
                                height: 15.0,
                                decoration: BoxDecoration(
                                  color: Color(0x6AEF0909),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'wi714nnx' /* Deleted Kot's */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                              ),
                            ].divide(SizedBox(width: 5.0)),
                          ),
                        ),
                      ),
                      Container(
                        width: 38.0,
                        height: 38.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primaryText,
                            width: 1.0,
                          ),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 9,
                      child: Container(
                        width: 100.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondary,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'btzh5ydh' /* Item Name */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelSmallFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .labelSmallIsCustom,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        width: 100.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondary,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'h015qil6' /* Kot Time */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelSmallFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .labelSmallIsCustom,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: 100.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondary,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'gzxfdnbs' /* Qty */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelSmallFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .labelSmallIsCustom,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        width: 100.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondary,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'qqcomv2k' /* Price */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelSmallFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .labelSmallIsCustom,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        width: 100.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondary,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'svf5esi1' /* Total */,
                                ),
                                textAlign: TextAlign.end,
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelSmallFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .labelSmallIsCustom,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 9.0),
                    child: Container(
                      width: double.infinity,
                      height: 290.0,
                      decoration: BoxDecoration(),
                      child: Builder(
                        builder: (context) {
                          final list = widget!.tablekot?.productList
                                  ?.sortedList(
                                      keyOf: (e) => e.kotTime, desc: false)
                                  ?.toList() ??
                              [];

                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: list.length,
                            separatorBuilder: (_, __) => SizedBox(height: 5.0),
                            itemBuilder: (context, listIndex) {
                              final listItem = list[listIndex];
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    flex: 9,
                                    child: Container(
                                      width: 100.0,
                                      decoration: BoxDecoration(
                                        color: listItem.isDeletedItem
                                            ? Color(0x6AEF0909)
                                            : FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              listItem.name,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmallFamily,
                                                        fontSize: 13.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmallIsCustom,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      width: 100.0,
                                      decoration: BoxDecoration(
                                        color: listItem.isDeletedItem
                                            ? Color(0x6AEF0909)
                                            : FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              dateTimeFormat(
                                                "jm",
                                                DateTime
                                                    .fromMillisecondsSinceEpoch(
                                                        listItem.kotTime),
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmallFamily,
                                                        fontSize: 13.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmallIsCustom,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      width: 100.0,
                                      decoration: BoxDecoration(
                                        color: listItem.isDeletedItem
                                            ? Color(0x6AEF0909)
                                            : FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              listItem.quantity.toString(),
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmallFamily,
                                                        fontSize: 13.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmallIsCustom,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      width: 100.0,
                                      decoration: BoxDecoration(
                                        color: listItem.isDeletedItem
                                            ? Color(0x6AEF0909)
                                            : FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              listItem.price.toString(),
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmallFamily,
                                                        fontSize: 13.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmallIsCustom,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      width: 100.0,
                                      decoration: BoxDecoration(
                                        color: listItem.isDeletedItem
                                            ? Color(0x6AEF0909)
                                            : FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              listItem.total.toString(),
                                              textAlign: TextAlign.end,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmallFamily,
                                                        fontSize: 13.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmallIsCustom,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 4.0)),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Visibility(
                          visible: false,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 100.0,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 3.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'jswwo6ja' /* Total Amount : */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .titleMediumIsCustom,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 3.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'ys47yyvb' /* ₹ */,
                                ),
                                textAlign: TextAlign.end,
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleMediumFamily,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .titleMediumIsCustom,
                                    ),
                              ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                widget!.tablekot?.finalBillAmt?.toString(),
                                '0',
                              ),
                              textAlign: TextAlign.end,
                              style: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .headlineLargeFamily,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .headlineLargeIsCustom,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
