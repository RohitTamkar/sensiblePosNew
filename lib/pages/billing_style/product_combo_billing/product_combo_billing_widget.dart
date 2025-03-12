import '';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/menu_drawer/menu_drawer_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/grocery_windows/add_customer_grocery/add_customer_grocery_widget.dart';
import '/pages/billing_style/text_field_combo/text_field_combo_widget.dart';
import '/pages/billing_style/xyzproduct_cart/xyzproduct_cart_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'product_combo_billing_model.dart';
export 'product_combo_billing_model.dart';

class ProductComboBillingWidget extends StatefulWidget {
  const ProductComboBillingWidget({
    super.key,
    this.billDetails,
    this.doc,
    this.shiftDetails,
    required this.taxcollection,
  });

  final DocumentReference? billDetails;
  final DocumentReference? doc;
  final dynamic shiftDetails;
  final List<TaxMasterRecord>? taxcollection;

  static String routeName = 'productComboBilling';
  static String routePath = 'productComboBilling';

  @override
  State<ProductComboBillingWidget> createState() =>
      _ProductComboBillingWidgetState();
}

class _ProductComboBillingWidgetState extends State<ProductComboBillingWidget>
    with TickerProviderStateMixin {
  late ProductComboBillingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasContainerTriggered1 = false;
  var hasContainerTriggered2 = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductComboBillingModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.hideStatusBar();
      FFAppState().shiftDocExists = getJsonField(
        widget!.shiftDetails,
        r'''$.shiftExists''',
      );
      FFAppState().update(() {});
      FFAppState().shiftDetailsNEw = widget!.shiftDetails!;
      safeSetState(() {});
      FFAppState().shiftDetailsJson = widget!.shiftDetails!;
      safeSetState(() {});
      _model.hiveProductList = await actions.getProductlistHive();
      FFAppState().productHive =
          _model.hiveProductList!.toList().cast<ProductStructStruct>();
      FFAppState().startLoop = 0;
      safeSetState(() {});
      _model.invoiceslist20 = await queryInvoiceRecordOnce(
        parent: FFAppState().outletIdRef,
        queryBuilder: (invoiceRecord) => invoiceRecord
            .where(
              'isDeleted',
              isEqualTo: false,
            )
            .orderBy('invoiceDate', descending: true),
        limit: 10,
      );
      _model.invoices = _model.invoiceslist20!.toList().cast<InvoiceRecord>();
      safeSetState(() {});
      if (!functions.isPrinterSelected(FFAppState().printerDevice)!) {
        _model.resDevice2Copy = await actions.scanPrinter(
          FFAppState().posMode,
        );
      }
      _model.isConnected = await actions.connectDevice(
        FFAppState().printerDevice,
        FFAppState().printerIndex,
      );
    });

    _model.textFieldsearchTextController ??= TextEditingController();
    _model.textFieldsearchFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: Offset(0.92, 0.92),
            end: Offset(1.0, 1.0),
          ),
          SaturateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 180.0.ms,
            begin: Offset(0.9, 0.9),
            end: Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 180.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<AppSettingsRecord>>(
      stream: queryAppSettingsRecord(
        parent: FFAppState().outletIdRef,
        queryBuilder: (appSettingsRecord) => appSettingsRecord.where(
          'deviceId',
          isEqualTo: FFAppState().dId,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitFadingCircle(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 40.0,
                ),
              ),
            ),
          );
        }
        List<AppSettingsRecord> productComboBillingAppSettingsRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final productComboBillingAppSettingsRecord =
            productComboBillingAppSettingsRecordList.isNotEmpty
                ? productComboBillingAppSettingsRecordList.first
                : null;

        return Title(
            title: 'productComboBilling',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: WillPopScope(
                onWillPop: () async => false,
                child: Scaffold(
                  key: scaffoldKey,
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  drawer: Container(
                    width: MediaQuery.sizeOf(context).width * 0.11,
                    child: Drawer(
                      elevation: 16.0,
                      child: wrapWithModel(
                        model: _model.menuDrawerModel,
                        updateCallback: () => safeSetState(() {}),
                        child: MenuDrawerWidget(
                          billdetails: widget!.billDetails,
                          doc: widget!.doc,
                          shiftDetails: widget!.shiftDetails,
                          tax: widget!.taxcollection,
                        ),
                      ),
                    ),
                  ),
                  endDrawer: Container(
                    width: MediaQuery.sizeOf(context).width * 0.45,
                    child: Drawer(
                      elevation: 16.0,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          StreamBuilder<List<PartyRecord>>(
                            stream: queryPartyRecord(
                              parent: FFAppState().outletIdRef,
                              queryBuilder: (partyRecord) => partyRecord.where(
                                'type',
                                isNotEqualTo: 'SUPPLIER',
                              ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 40.0,
                                    height: 40.0,
                                    child: SpinKitFadingCircle(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 40.0,
                                    ),
                                  ),
                                );
                              }
                              List<PartyRecord> containerPartyRecordList =
                                  snapshot.data!;

                              return Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.1,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              icon: Icon(
                                                Icons.chevron_left,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                size: 22.0,
                                              ),
                                              onPressed: () async {
                                                context.pop();
                                              },
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '7ucwcrvp' /* CUSTOMER DETAILS */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineSmallFamily),
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              icon: Icon(
                                                Icons.person_add,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                size: 22.0,
                                              ),
                                              onPressed: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            AddCustomerGroceryWidget(),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 2.0,
                                          child: Container(
                                            width: double.infinity,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.1,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(6.0, 0.0,
                                                                0.0, 0.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .textFieldsearchTextController,
                                                      focusNode: _model
                                                          .textFieldsearchFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.textFieldsearchTextController',
                                                        Duration(
                                                            milliseconds: 2000),
                                                        () async {
                                                          safeSetState(() {
                                                            _model.simpleSearchResults =
                                                                TextSearch(
                                                              containerPartyRecordList
                                                                  .map(
                                                                    (record) =>
                                                                        TextSearchItem.fromTerms(
                                                                            record,
                                                                            [
                                                                          record
                                                                              .name!
                                                                        ]),
                                                                  )
                                                                  .toList(),
                                                            )
                                                                    .search(_model
                                                                        .textFieldsearchTextController
                                                                        .text)
                                                                    .map((r) =>
                                                                        r.object)
                                                                    .take(5)
                                                                    .toList();
                                                            ;
                                                          });
                                                          FFAppState()
                                                                  .isCustListShown =
                                                              false;
                                                          FFAppState()
                                                              .update(() {});
                                                        },
                                                      ),
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'rc17osei' /* Search Customer */,
                                                        ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily),
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    4.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    4.0),
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    4.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    4.0),
                                                          ),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    4.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    4.0),
                                                          ),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    4.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    4.0),
                                                          ),
                                                        ),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                      validator: _model
                                                          .textFieldsearchTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.06,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.1,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderWidth: 1.0,
                                                    buttonSize: 50.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    icon: Icon(
                                                      Icons.search,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBtnText,
                                                      size: 22.0,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.7,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 3.0,
                                                color: Color(0x33000000),
                                                offset: Offset(
                                                  0.0,
                                                  1.0,
                                                ),
                                              )
                                            ],
                                          ),
                                          child: Container(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.7,
                                            child: Stack(
                                              children: [
                                                if (FFAppState()
                                                        .isCustListShown ==
                                                    true)
                                                  Builder(
                                                    builder: (context) {
                                                      final containerVar =
                                                          containerPartyRecordList
                                                              .where((e) =>
                                                                  e.role ==
                                                                  'CUSTOMER')
                                                              .toList();

                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            containerVar.length,
                                                        itemBuilder: (context,
                                                            containerVarIndex) {
                                                          final containerVarItem =
                                                              containerVar[
                                                                  containerVarIndex];
                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              FFAppState()
                                                                      .setCustName =
                                                                  containerVarItem
                                                                      .name;
                                                              FFAppState()
                                                                      .setCustMobNo =
                                                                  containerVarItem
                                                                      .mobile;
                                                              FFAppState()
                                                                      .oldBalance =
                                                                  containerVarItem
                                                                      .oldBalance;
                                                              FFAppState()
                                                                      .custCredit =
                                                                  containerVarItem
                                                                      .creditLimit;
                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                              FFAppState()
                                                                      .setCustRef =
                                                                  containerVarItem
                                                                      .reference;
                                                              FFAppState()
                                                                      .isCustListShown =
                                                                  true;
                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Card(
                                                              clipBehavior: Clip
                                                                  .antiAliasWithSaveLayer,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4.0),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  FlutterFlowIconButton(
                                                                    borderColor:
                                                                        Colors
                                                                            .transparent,
                                                                    borderRadius:
                                                                        30.0,
                                                                    borderWidth:
                                                                        1.0,
                                                                    buttonSize:
                                                                        60.0,
                                                                    icon: Icon(
                                                                      Icons
                                                                          .account_circle,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          30.0,
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      print(
                                                                          'IconButton pressed ...');
                                                                    },
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          170.0,
                                                                      height: MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.14,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            containerVarItem.name,
                                                                            style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            containerVarItem.mobile,
                                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100.0,
                                                                      height: MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.14,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          if (containerVarItem
                                                                              .credit)
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'xmrmjhsa' /* Balance:  */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    containerVarItem.oldBalance.toString(),
                                                                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.06,
                                                                    height: MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.14,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              FlutterFlowIconButton(
                                                                            borderColor:
                                                                                Colors.transparent,
                                                                            borderRadius:
                                                                                30.0,
                                                                            borderWidth:
                                                                                1.0,
                                                                            buttonSize:
                                                                                60.0,
                                                                            icon:
                                                                                Icon(
                                                                              Icons.chevron_right,
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              size: 24.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              FFAppState().setCustName = containerVarItem.name;
                                                                              FFAppState().setCustMobNo = containerVarItem.mobile;
                                                                              FFAppState().oldBalance = containerVarItem.oldBalance;
                                                                              FFAppState().custCredit = containerVarItem.creditLimit;
                                                                              FFAppState().update(() {});
                                                                              FFAppState().setCustRef = containerVarItem.reference;
                                                                              FFAppState().isCustListShown = true;
                                                                              FFAppState().customer = true;
                                                                              FFAppState().update(() {});

                                                                              context.pushNamed(CreditPaymentPageWidget.routeName);
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                if (FFAppState()
                                                        .isCustListShown ==
                                                    false)
                                                  Builder(
                                                    builder: (context) {
                                                      final list = _model
                                                          .simpleSearchResults
                                                          .where((e) =>
                                                              e.role ==
                                                              'CUSTOMER')
                                                          .toList();

                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount: list.length,
                                                        itemBuilder: (context,
                                                            listIndex) {
                                                          final listItem =
                                                              list[listIndex];
                                                          return Card(
                                                            clipBehavior: Clip
                                                                .antiAliasWithSaveLayer,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.0),
                                                            ),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                FFAppState()
                                                                        .setCustName =
                                                                    listItem
                                                                        .name;
                                                                FFAppState()
                                                                        .setCustMobNo =
                                                                    listItem
                                                                        .mobile;
                                                                FFAppState()
                                                                        .custCredit =
                                                                    listItem
                                                                        .creditLimit;
                                                                FFAppState()
                                                                        .oldBalance =
                                                                    listItem
                                                                        .oldBalance;
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                FFAppState()
                                                                        .setCustRef =
                                                                    listItem
                                                                        .reference;
                                                                FFAppState()
                                                                        .isCustListShown =
                                                                    true;
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                              },
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  FlutterFlowIconButton(
                                                                    borderColor:
                                                                        Colors
                                                                            .transparent,
                                                                    borderRadius:
                                                                        30.0,
                                                                    borderWidth:
                                                                        1.0,
                                                                    buttonSize:
                                                                        60.0,
                                                                    icon: Icon(
                                                                      Icons
                                                                          .account_circle,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          30.0,
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      print(
                                                                          'IconButton pressed ...');
                                                                    },
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          170.0,
                                                                      height: MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.14,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceAround,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            listItem.name,
                                                                            style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            listItem.mobile,
                                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100.0,
                                                                      height: MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.14,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          if (listItem
                                                                              .credit)
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [],
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.08,
                                                                    height: MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.14,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        if (false)
                                                                          Expanded(
                                                                            child:
                                                                                FlutterFlowIconButton(
                                                                              borderColor: Colors.transparent,
                                                                              borderRadius: 30.0,
                                                                              borderWidth: 1.0,
                                                                              buttonSize: 60.0,
                                                                              icon: Icon(
                                                                                Icons.chevron_right,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 24.0,
                                                                              ),
                                                                              onPressed: () async {
                                                                                FFAppState().setCustName = listItem.name;
                                                                                FFAppState().setCustMobNo = listItem.mobile;
                                                                                FFAppState().oldBalance = listItem.oldBalance;
                                                                                FFAppState().custCredit = listItem.creditLimit;
                                                                                FFAppState().update(() {});
                                                                                FFAppState().setCustRef = listItem.reference;
                                                                                FFAppState().isCustListShown = true;
                                                                                FFAppState().customer = true;
                                                                                FFAppState().update(() {});

                                                                                context.pushNamed(CreditPaymentPageWidget.routeName);
                                                                              },
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  body: Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.05,
                              height: MediaQuery.sizeOf(context).height * 0.05,
                              decoration: BoxDecoration(),
                              child: Image.asset(
                                'assets/images/IMG_20220412_140945.png',
                                width: 100.0,
                                height: 100.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: 100.0,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.06,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 100.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 3.0, 0.0),
                                                child: Text(
                                                  FFAppState().outletName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmallFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily),
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 6.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'mbgjfxqr' /* Admin */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily),
                                                      ),
                                                ),
                                              ),
                                              if (false)
                                                Container(
                                                  width: 100.0,
                                                  height: 45.0,
                                                  child:
                                                      custom_widgets.OnlineSync(
                                                    width: 100.0,
                                                    height: 45.0,
                                                    outletRef: FFAppState()
                                                        .outletIdRef!,
                                                    userDoc: widget!.doc!,
                                                  ),
                                                ),
                                              Container(
                                                width: 200.0,
                                                height: 40.0,
                                                child: custom_widgets
                                                    .Datetimecountdown(
                                                  width: 200.0,
                                                  height: 40.0,
                                                  parameter: 0,
                                                ),
                                              ),
                                              if (functions.isPrinterSelected(
                                                      FFAppState()
                                                          .printerDevice) ??
                                                  true)
                                                Icon(
                                                  Icons.print_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  size: 30.0,
                                                ),
                                              if (!functions.isPrinterSelected(
                                                  FFAppState().printerDevice)!)
                                                Icon(
                                                  Icons.print_disabled,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  size: 30.0,
                                                ),
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  _model.allprdrefresh =
                                                      await queryProductRecordOnce(
                                                    parent: FFAppState()
                                                        .outletIdRef,
                                                  );
                                                  _model.prdlist = await actions
                                                      .addFirebasetoHiveProduct(
                                                    _model.allprdrefresh!
                                                        .toList(),
                                                  );
                                                  _model.listcategory =
                                                      await queryCategoryRecordOnce(
                                                    parent: FFAppState()
                                                        .outletIdRef,
                                                  );
                                                  _model.cat = await actions
                                                      .addFirebasetoHiveCategory(
                                                    _model.listcategory!
                                                        .toList(),
                                                  );
                                                  _model.prdhive2refresh =
                                                      await actions
                                                          .getProductlistHive();
                                                  _model.catlistrefresh =
                                                      await actions
                                                          .getCategorylistHive();
                                                  FFAppState().productHive = _model
                                                      .prdhive2refresh!
                                                      .toList()
                                                      .cast<
                                                          ProductStructStruct>();
                                                  FFAppState().categoryHive = _model
                                                      .catlistrefresh!
                                                      .toList()
                                                      .cast<
                                                          CategoryStructStruct>();
                                                  safeSetState(() {});

                                                  safeSetState(() {});
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'vg2xwlzd' /*  */,
                                                ),
                                                icon: Icon(
                                                  Icons.refresh_sharp,
                                                  size: 20.0,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsets.all(2.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts: GoogleFonts
                                                                    .asMap()
                                                                .containsKey(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmallFamily),
                                                          ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                              if (productComboBillingAppSettingsRecord
                                                      ?.settingList
                                                      ?.where((e) =>
                                                          e.title ==
                                                          'enableLedDisplay')
                                                      .toList()
                                                      ?.firstOrNull
                                                      ?.value ??
                                                  true)
                                                Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  child: custom_widgets
                                                      .PdLedCustomerdisplay(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    amount: FFAppState()
                                                        .finalAmt
                                                        .toString(),
                                                    displayString: 'TOTAL',
                                                    port: 'COM1',
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Text(
                                              FFAppState().userName,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              scaffoldKey.currentState!
                                                  .openDrawer();
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation1'] !=
                                                  null) {
                                                safeSetState(() =>
                                                    hasContainerTriggered1 =
                                                        true);
                                                SchedulerBinding.instance
                                                    .addPostFrameCallback(
                                                        (_) async =>
                                                            await animationsMap[
                                                                    'containerOnActionTriggerAnimation1']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0));
                                              }
                                            },
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.115,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.07,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.menu_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 18.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ).animateOnActionTrigger(
                                              animationsMap[
                                                  'containerOnActionTriggerAnimation1']!,
                                              hasBeenTriggered:
                                                  hasContainerTriggered1),
                                        ],
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
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 20,
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Builder(
                                      builder: (context) {
                                        final productList2 = FFAppState()
                                            .productHive
                                            .where((e) => e.type == 0)
                                            .toList()
                                            .sortedList(
                                                keyOf: (e) => e.code,
                                                desc: false)
                                            .toList();

                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: productList2.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(width: 20.0),
                                          itemBuilder:
                                              (context, productList2Index) {
                                            final productList2Item =
                                                productList2[productList2Index];
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: Container(
                                                    width: 130.0,
                                                    height: 110.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFD2DDFF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  5.0,
                                                                  8.0,
                                                                  5.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Flexible(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: Text(
                                                                productList2Item
                                                                    .name,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleMediumFamily,
                                                                      fontSize:
                                                                          15.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleMediumFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          Flexible(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          3.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'h5sx5gi2' /* ₹  */,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelLargeFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                        ),
                                                                  ),
                                                                  Flexible(
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        productList2Item
                                                                            .sellingPrice
                                                                            .toString(),
                                                                        '500',
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).labelLargeFamily,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          if (productList2Item
                                                              .stockable)
                                                            Text(
                                                              'Stock:${valueOrDefault<String>(
                                                                productList2Item
                                                                    .stock
                                                                    .toString(),
                                                                '0',
                                                              )}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: Color(
                                                                        0xFF830D1C),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: StreamBuilder<
                                                      List<RecipeRecord>>(
                                                    stream: queryRecipeRecord(
                                                      parent: FFAppState()
                                                          .outletIdRef,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 40.0,
                                                            height: 40.0,
                                                            child:
                                                                SpinKitFadingCircle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 40.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<RecipeRecord>
                                                          containerRecipeRecordList =
                                                          snapshot.data!;

                                                      return Container(
                                                        width: 130.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Builder(
                                                              builder:
                                                                  (context) {
                                                                final recipeVar = functions
                                                                    .returnrecipeprd(
                                                                        containerRecipeRecordList
                                                                            .toList(),
                                                                        productList2Item,
                                                                        FFAppState()
                                                                            .productHive
                                                                            .toList())
                                                                    .sortedList(
                                                                        keyOf: (e) => e
                                                                            .code,
                                                                        desc:
                                                                            false)
                                                                    .toList();

                                                                return ListView
                                                                    .separated(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      recipeVar
                                                                          .length,
                                                                  separatorBuilder: (_,
                                                                          __) =>
                                                                      SizedBox(
                                                                          height:
                                                                              5.0),
                                                                  itemBuilder:
                                                                      (context,
                                                                          recipeVarIndex) {
                                                                    final recipeVarItem =
                                                                        recipeVar[
                                                                            recipeVarIndex];
                                                                    return InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        var _shouldSetState =
                                                                            false;
                                                                        if (productList2Item
                                                                            .stockable) {
                                                                          if (productList2Item.stock >
                                                                              0) {
                                                                            if (productList2Item.stock >=
                                                                                valueOrDefault<int>(
                                                                                  functions.doubleToInt(double.parse(recipeVarItem.name) +
                                                                                      valueOrDefault<double>(
                                                                                        getJsonField(
                                                                                          functions
                                                                                              .filterBillList(FFAppState().selBill, FFAppState().allBillsList.toList())
                                                                                              .where((e) =>
                                                                                                  productList2Item.id ==
                                                                                                  valueOrDefault<String>(
                                                                                                    getJsonField(
                                                                                                      e,
                                                                                                      r'''$.id''',
                                                                                                    )?.toString(),
                                                                                                    '0',
                                                                                                  ))
                                                                                              .toList()
                                                                                              .firstOrNull,
                                                                                          r'''$.quantity''',
                                                                                        ),
                                                                                        0.0,
                                                                                      )),
                                                                                  0,
                                                                                )) {
                                                                              if (FFAppState().holdBillCount == 0) {
                                                                                FFAppState().holdBillCount = FFAppState().holdBillCount + 1;
                                                                                FFAppState().addToAllBillsList(functions.generateBillDetailsJson(0.0, 0.0, 0.0, 'CASH', 0.0, 0.0, FFAppState().billAmt, 0.0, FFAppState().finalAmt, '0', FFAppState().itemCartList.toList(), FFAppState().holdBillCount));
                                                                                FFAppState().selBill = 1;
                                                                                FFAppState().productColor = recipeVarItem.id;
                                                                                safeSetState(() {});
                                                                              } else {
                                                                                FFAppState().productColor = recipeVarItem.id;
                                                                                safeSetState(() {});
                                                                              }

                                                                              if (recipeVarItem.recipeRefId != null && recipeVarItem.recipeRefId != '') {
                                                                                _model.receipeproductliststock = await queryRecipeRecordOnce(
                                                                                  parent: FFAppState().outletIdRef,
                                                                                  queryBuilder: (recipeRecord) => recipeRecord.where(
                                                                                    'id',
                                                                                    isEqualTo: recipeVarItem.recipeRefId,
                                                                                  ),
                                                                                  singleRecord: true,
                                                                                ).then((s) => s.firstOrNull);
                                                                                _shouldSetState = true;
                                                                                FFAppState().startLoop = 0;
                                                                                safeSetState(() {});
                                                                                while (FFAppState().startLoop < _model.receipeproductliststock!.items.length) {
                                                                                  _model.updatePrditemrecipeStruct(
                                                                                    (e) => e
                                                                                      ..id = (_model.receipeproductliststock?.items?.elementAtOrNull(FFAppState().startLoop))?.id
                                                                                      ..price = (_model.receipeproductliststock?.items?.elementAtOrNull(FFAppState().startLoop))?.price
                                                                                      ..category = (_model.receipeproductliststock?.items?.elementAtOrNull(FFAppState().startLoop))?.catId
                                                                                      ..name = (_model.receipeproductliststock?.items?.elementAtOrNull(FFAppState().startLoop))?.name
                                                                                      ..sellingPrice = (_model.receipeproductliststock?.items?.elementAtOrNull(FFAppState().startLoop))?.price
                                                                                      ..taxId = (_model.receipeproductliststock?.items?.elementAtOrNull(FFAppState().startLoop))?.taxId
                                                                                      ..stockable = (_model.receipeproductliststock?.items?.elementAtOrNull(FFAppState().startLoop))?.stockable,
                                                                                  );
                                                                                  safeSetState(() {});
                                                                                  _model.resreplistStock = await actions.comboAddToHoldListprd(
                                                                                    _model.prditemrecipe!,
                                                                                    FFAppState().selBill,
                                                                                    widget!.taxcollection!.toList(),
                                                                                    functions.enabletaxinclusive(productComboBillingAppSettingsRecord!.settingList.where((e) => e.title == 'enableInclusiveTax').toList().firstOrNull!.value),
                                                                                    _model.receipeproductliststock!.items.elementAtOrNull(FFAppState().startLoop)!.quantity,
                                                                                  );
                                                                                  _shouldSetState = true;
                                                                                  _model.calculateResultrestock = await actions.laundrycalSubTotalForHoldList(
                                                                                    FFAppState().selBill.toString(),
                                                                                    _model.resreplistStock!.toList(),
                                                                                  );
                                                                                  _shouldSetState = true;
                                                                                  _model.calbillAmtstock = await actions.calBillAmt(
                                                                                    FFAppState().disAmt,
                                                                                    FFAppState().delCharges,
                                                                                  );
                                                                                  _shouldSetState = true;
                                                                                  FFAppState().startLoop = FFAppState().startLoop + 1;
                                                                                  safeSetState(() {});
                                                                                }
                                                                                FFAppState().startLoop = 0;
                                                                                FFAppState().endLoop = 0;
                                                                                safeSetState(() {});
                                                                              } else {
                                                                                _model.addtosavebill22st = await actions.laundryAddToHoldListprd(
                                                                                  recipeVarItem,
                                                                                  FFAppState().selBill,
                                                                                  widget!.taxcollection!.toList(),
                                                                                  functions.enabletaxinclusive(productComboBillingAppSettingsRecord!.settingList.where((e) => e.title == 'enableInclusiveTax').toList().firstOrNull!.value),
                                                                                );
                                                                                _shouldSetState = true;
                                                                                _model.calculateResultst = await actions.laundrycalSubTotalForHoldList(
                                                                                  FFAppState().selBill.toString(),
                                                                                  _model.addtosavebill22st!.toList(),
                                                                                );
                                                                                _shouldSetState = true;
                                                                                _model.calbillAmtst = await actions.calBillAmt(
                                                                                  FFAppState().disAmt,
                                                                                  FFAppState().delCharges,
                                                                                );
                                                                                _shouldSetState = true;
                                                                              }
                                                                            } else {
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    content: Text('Item Out Of  Stock'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                              return;
                                                                            }
                                                                          } else {
                                                                            await showDialog(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  content: Text('Item Out Of Stock'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                      child: Text('Ok'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            );
                                                                            if (_shouldSetState)
                                                                              safeSetState(() {});
                                                                            return;
                                                                          }
                                                                        } else {
                                                                          if (FFAppState().holdBillCount ==
                                                                              0) {
                                                                            FFAppState().holdBillCount =
                                                                                FFAppState().holdBillCount + 1;
                                                                            FFAppState().addToAllBillsList(functions.generateBillDetailsJson(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                'CASH',
                                                                                0.0,
                                                                                0.0,
                                                                                FFAppState().billAmt,
                                                                                0.0,
                                                                                FFAppState().finalAmt,
                                                                                '0',
                                                                                FFAppState().itemCartList.toList(),
                                                                                FFAppState().holdBillCount));
                                                                            FFAppState().selBill =
                                                                                1;
                                                                            FFAppState().productColor =
                                                                                recipeVarItem.id;
                                                                            safeSetState(() {});
                                                                          } else {
                                                                            FFAppState().productColor =
                                                                                recipeVarItem.id;
                                                                            safeSetState(() {});
                                                                          }

                                                                          if (recipeVarItem.recipeRefId != null &&
                                                                              recipeVarItem.recipeRefId != '') {
                                                                            _model.receipeproductlistno =
                                                                                await queryRecipeRecordOnce(
                                                                              parent: FFAppState().outletIdRef,
                                                                              queryBuilder: (recipeRecord) => recipeRecord.where(
                                                                                'id',
                                                                                isEqualTo: recipeVarItem.recipeRefId,
                                                                              ),
                                                                              singleRecord: true,
                                                                            ).then((s) => s.firstOrNull);
                                                                            _shouldSetState =
                                                                                true;
                                                                            FFAppState().startLoop =
                                                                                0;
                                                                            safeSetState(() {});
                                                                            while (FFAppState().startLoop <
                                                                                _model.receipeproductlistno!.items.length) {
                                                                              _model.updatePrditemrecipeStruct(
                                                                                (e) => e
                                                                                  ..id = (_model.receipeproductlistno?.items?.elementAtOrNull(FFAppState().startLoop))?.id
                                                                                  ..price = (_model.receipeproductlistno?.items?.elementAtOrNull(FFAppState().startLoop))?.price
                                                                                  ..category = (_model.receipeproductlistno?.items?.elementAtOrNull(FFAppState().startLoop))?.catId
                                                                                  ..name = (_model.receipeproductlistno?.items?.elementAtOrNull(FFAppState().startLoop))?.name
                                                                                  ..sellingPrice = (_model.receipeproductlistno?.items?.elementAtOrNull(FFAppState().startLoop))?.price
                                                                                  ..taxId = (_model.receipeproductlistno?.items?.elementAtOrNull(FFAppState().startLoop))?.taxId
                                                                                  ..stockable = (_model.receipeproductlistno?.items?.elementAtOrNull(FFAppState().startLoop))?.stockable,
                                                                              );
                                                                              safeSetState(() {});
                                                                              _model.resreplistStockno = await actions.comboAddToHoldListprd(
                                                                                _model.prditemrecipe!,
                                                                                FFAppState().selBill,
                                                                                widget!.taxcollection!.toList(),
                                                                                functions.enabletaxinclusive(productComboBillingAppSettingsRecord!.settingList.where((e) => e.title == 'enableInclusiveTax').toList().firstOrNull!.value),
                                                                                _model.receipeproductlistno!.items.elementAtOrNull(FFAppState().startLoop)!.quantity,
                                                                              );
                                                                              _shouldSetState = true;
                                                                              _model.calculateResultrestockno = await actions.laundrycalSubTotalForHoldList(
                                                                                FFAppState().selBill.toString(),
                                                                                _model.resreplistStockno!.toList(),
                                                                              );
                                                                              _shouldSetState = true;
                                                                              _model.calbillAmtstockno = await actions.calBillAmt(
                                                                                FFAppState().disAmt,
                                                                                FFAppState().delCharges,
                                                                              );
                                                                              _shouldSetState = true;
                                                                              FFAppState().startLoop = FFAppState().startLoop + 1;
                                                                              safeSetState(() {});
                                                                            }
                                                                            FFAppState().startLoop =
                                                                                0;
                                                                            FFAppState().endLoop =
                                                                                0;
                                                                            safeSetState(() {});
                                                                          } else {
                                                                            _model.addtosavebill22stno =
                                                                                await actions.laundryAddToHoldListprd(
                                                                              recipeVarItem,
                                                                              FFAppState().selBill,
                                                                              widget!.taxcollection!.toList(),
                                                                              functions.enabletaxinclusive(productComboBillingAppSettingsRecord!.settingList.where((e) => e.title == 'enableInclusiveTax').toList().firstOrNull!.value),
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            _model.calculateResultstno =
                                                                                await actions.laundrycalSubTotalForHoldList(
                                                                              FFAppState().selBill.toString(),
                                                                              _model.addtosavebill22stno!.toList(),
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            _model.calbillAmtstno =
                                                                                await actions.calBillAmt(
                                                                              FFAppState().disAmt,
                                                                              FFAppState().delCharges,
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                          }
                                                                        }

                                                                        if (_shouldSetState)
                                                                          safeSetState(
                                                                              () {});
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: recipeVarItem.id == FFAppState().productColor
                                                                              ? FlutterFlowTheme.of(context).parkingPrimary
                                                                              : FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(5.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(10.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                recipeVarItem.name.maybeHandleOverflow(
                                                                                  maxChars: 25,
                                                                                ),
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ).animateOnActionTrigger(
                                                                        animationsMap[
                                                                            'containerOnActionTriggerAnimation2']!,
                                                                        hasBeenTriggered:
                                                                            hasContainerTriggered2);
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                            TextFieldComboWidget(
                                                              key: Key(
                                                                  'Keyc5o_${productList2Index}_of_${productList2.length}'),
                                                              parameter1:
                                                                  productList2Item,
                                                              parameter2: widget!
                                                                  .taxcollection!,
                                                              parameter3: productComboBillingAppSettingsRecord
                                                                  ?.settingList
                                                                  ?.where((e) =>
                                                                      e.title ==
                                                                      'enableInclusiveTax')
                                                                  .toList()
                                                                  ?.firstOrNull
                                                                  ?.value,
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    width: 100.0,
                                    height: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Builder(
                                          builder: (context) {
                                            final listpay =
                                                _model.liststring.toList();

                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children:
                                                  List.generate(listpay.length,
                                                      (listpayIndex) {
                                                final listpayItem =
                                                    listpay[listpayIndex];
                                                return FFButtonWidget(
                                                  onPressed: () async {
                                                    FFAppState().PayMode =
                                                        listpayItem;
                                                    safeSetState(() {});
                                                  },
                                                  text: listpayItem,
                                                  options: FFButtonOptions(
                                                    width: 150.0,
                                                    height: 50.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                20.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FFAppState()
                                                                .PayMode ==
                                                            listpayItem
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .alternate
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                              color: FFAppState()
                                                                          .PayMode ==
                                                                      listpayItem
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              useGoogleFonts: GoogleFonts
                                                                      .asMap()
                                                                  .containsKey(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmallFamily),
                                                            ),
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                );
                                              }).divide(SizedBox(height: 5.0)),
                                            );
                                          },
                                        ),
                                        FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'ry8nnxjj' /* SWIGGY */,
                                          ),
                                          options: FFButtonOptions(
                                            width: 150.0,
                                            height: 50.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0xFFF09B0E),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily,
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily),
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'a4hjv57g' /* ZOMATO */,
                                          ),
                                          options: FFButtonOptions(
                                            width: 150.0,
                                            height: 50.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0xD4B6001A),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily,
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily),
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 5.0)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        3.0, 0.0, 0.0, 0.0),
                                    child: Container(
                                      width: 100.0,
                                      height: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (false)
                                              Container(
                                                width: double.infinity,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.08,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.003,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Flexible(
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 1.0,
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.15,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.08,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              child: Container(
                                                                width: 300.0,
                                                                height: 300.0,
                                                                child: custom_widgets
                                                                    .Weightscalewidget(
                                                                  width: 300.0,
                                                                  height: 300.0,
                                                                  port:
                                                                      FFAppState()
                                                                          .port,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.03,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .customColor2,
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                flex: 6,
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 28,
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.12,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'jc0qoh1p' /* Item Name */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 14,
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.08,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '5xwkd9xs' /* Qty */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 9,
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.08,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'jy804qqm' /* Amt */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  width: 100.0,
                                                                  height: 100.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      var confirmDialogResponse = await showDialog<
                                                                              bool>(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                title: Text('Delete All Bills..?'),
                                                                                content: Text('Are you sure you want to delete all Bills..'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                    child: Text('cancle'),
                                                                                  ),
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                    child: Text('confirm'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          ) ??
                                                                          false;
                                                                      if (confirmDialogResponse) {
                                                                        FFAppState()
                                                                            .holdBillCount = 0;
                                                                        FFAppState().allBillsList =
                                                                            [];
                                                                        FFAppState()
                                                                            .update(() {});
                                                                        FFAppState().itemCartList =
                                                                            [];
                                                                        FFAppState()
                                                                            .update(() {});
                                                                        await actions
                                                                            .clearValue();
                                                                        FFAppState()
                                                                            .noOfItems = 0;
                                                                        FFAppState()
                                                                            .update(() {});
                                                                        FFAppState().prdid =
                                                                            '';
                                                                        safeSetState(
                                                                            () {});
                                                                      } else {
                                                                        return;
                                                                      }
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .delete_forever_outlined,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        2.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 100.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final bill = functions
                                                                      .filterBillList(
                                                                          FFAppState()
                                                                              .selBill,
                                                                          FFAppState()
                                                                              .allBillsList
                                                                              .toList())
                                                                      .toList();

                                                                  return ListView
                                                                      .separated(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount: bill
                                                                        .length,
                                                                    separatorBuilder: (_,
                                                                            __) =>
                                                                        SizedBox(
                                                                            height:
                                                                                3.0),
                                                                    itemBuilder:
                                                                        (context,
                                                                            billIndex) {
                                                                      final billItem =
                                                                          bill[
                                                                              billIndex];
                                                                      return Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              flex: 6,
                                                                              child: XyzproductCartWidget(
                                                                                key: Key('Keyi2r_${billIndex}_of_${bill.length}'),
                                                                                parameter6: productComboBillingAppSettingsRecord?.settingList?.where((e) => e.title == 'enableInclusiveTax').toList()?.firstOrNull?.value,
                                                                                parameter7: productComboBillingAppSettingsRecord?.settingList?.where((e) => e.title == 'enableInclusiveTax').toList()?.firstOrNull?.value,
                                                                                parameter1: getJsonField(
                                                                                  billItem,
                                                                                  r'''$.name''',
                                                                                ),
                                                                                parameter2: getJsonField(
                                                                                  billItem,
                                                                                  r'''$.price''',
                                                                                ),
                                                                                parameter3: getJsonField(
                                                                                  billItem,
                                                                                  r'''$''',
                                                                                ),
                                                                                parameter4: ProductStructStruct.maybeFromMap(billItem),
                                                                                parameter5: widget!.taxcollection!,
                                                                                parameter8: getJsonField(
                                                                                  billItem,
                                                                                  r'''$.quantity''',
                                                                                ),
                                                                                parameter9: getJsonField(
                                                                                  billItem,
                                                                                  r'''$.stockable''',
                                                                                ),
                                                                                parameter10: getJsonField(
                                                                                  billItem,
                                                                                  r'''$.currentStock''',
                                                                                ),
                                                                                parameter11: getJsonField(
                                                                                  billItem,
                                                                                  r'''$.quantity''',
                                                                                ),
                                                                                parameter12: getJsonField(
                                                                                  billItem,
                                                                                  r'''$.price''',
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: FlutterFlowIconButton(
                                                                                borderRadius: 8.0,
                                                                                buttonSize: 45.0,
                                                                                icon: Icon(
                                                                                  Icons.delete_rounded,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 24.0,
                                                                                ),
                                                                                onPressed: () async {
                                                                                  _model.res20 = await actions.removeHoldListItem(
                                                                                    billItem,
                                                                                    FFAppState().selBill,
                                                                                  );
                                                                                  _model.res21 = await actions.calSubTotalForHoldList(
                                                                                    FFAppState().selBill.toString(),
                                                                                    FFAppState().allBillsList.toList(),
                                                                                  );
                                                                                  _model.reuslt22 = await actions.calBillAmt(
                                                                                    valueOrDefault<double>(
                                                                                      FFAppState().disAmt,
                                                                                      0.0,
                                                                                    ),
                                                                                    FFAppState().delCharges,
                                                                                  );
                                                                                  FFAppState().prdid = '';
                                                                                  safeSetState(() {});

                                                                                  safeSetState(() {});
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'rkgcizac' /* Last Bill */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelSmallFamily),
                                                              ),
                                                        ),
                                                        FFButtonWidget(
                                                          onPressed: () async {
                                                            var confirmDialogResponse =
                                                                await showDialog<
                                                                        bool>(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          content:
                                                                              Text('Are You Sure To Clear All Invoices ?'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                              child: Text('Cancel'),
                                                                            ),
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                              child: Text('Confirm'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    ) ??
                                                                    false;
                                                            if (confirmDialogResponse) {
                                                              _model.invoices =
                                                                  [];
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'vdg4trs1' /* Clear All */,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width:
                                                                double.infinity,
                                                            height: 40.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleSmallFamily),
                                                                    ),
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Builder(
                                                            builder: (context) {
                                                              final invlist = _model
                                                                  .invoices
                                                                  .sortedList(
                                                                      keyOf: (e) =>
                                                                          e.invoiceDate,
                                                                      desc: true)
                                                                  .toList();

                                                              return ListView
                                                                  .separated(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    invlist
                                                                        .length,
                                                                separatorBuilder: (_,
                                                                        __) =>
                                                                    SizedBox(
                                                                        height:
                                                                            5.0),
                                                                itemBuilder:
                                                                    (context,
                                                                        invlistIndex) {
                                                                  final invlistItem =
                                                                      invlist[
                                                                          invlistIndex];
                                                                  return Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                    ),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onDoubleTap:
                                                                          () async {
                                                                        if (invlistItem.source ==
                                                                            'KOT') {
                                                                          if (true) {
                                                                            _model.outletdid2Copy =
                                                                                await queryOutletRecordOnce(
                                                                              queryBuilder: (outletRecord) => outletRecord.where(
                                                                                'id',
                                                                                isEqualTo: FFAppState().outletIdRef?.id,
                                                                              ),
                                                                              singleRecord: true,
                                                                            ).then((s) => s.firstOrNull);

                                                                            await invlistItem.reference.update(createInvoiceRecordData(
                                                                              source: 'CUSTOMER',
                                                                            ));
                                                                            if (!functions.isPrinterSelected(FFAppState().printerDevice)!) {
                                                                              _model.resDevice2billCopy = await actions.scanPrinter(
                                                                                FFAppState().posMode,
                                                                              );
                                                                            }
                                                                            _model.isconnectedbillCopy =
                                                                                await actions.connectDevice(
                                                                              FFAppState().printerDevice,
                                                                              FFAppState().printerIndex,
                                                                            );
                                                                            _model.invoicecusrt =
                                                                                await queryInvoiceRecordOnce(
                                                                              parent: FFAppState().outletIdRef,
                                                                              queryBuilder: (invoiceRecord) => invoiceRecord.where(
                                                                                'id',
                                                                                isEqualTo: invlistItem.reference.id,
                                                                              ),
                                                                              singleRecord: true,
                                                                            ).then((s) => s.firstOrNull);
                                                                            _model.resultItembillCopy =
                                                                                await actions.docToJson(
                                                                              _model.invoicecusrt,
                                                                            );
                                                                            _model.device233Copy =
                                                                                await actions.newCustomAction(
                                                                              FFAppState().printerIndex,
                                                                            );
                                                                            await actions.printBillnewhivegroceryBill(
                                                                              _model.resultItembillCopy!,
                                                                              _model.device233Copy!.toList(),
                                                                              FFAppState().isPrinterConnected,
                                                                              FFAppState().printerName,
                                                                              getJsonField(
                                                                                functions.outletDocToJson(_model.outletdid2Copy!),
                                                                                r'''$''',
                                                                              ),
                                                                              _model.invoicecusrt!,
                                                                              FFAppState().paperSize,
                                                                              productComboBillingAppSettingsRecord!,
                                                                            );
                                                                            _model.invoiceslist =
                                                                                await queryInvoiceRecordOnce(
                                                                              parent: FFAppState().outletIdRef,
                                                                              queryBuilder: (invoiceRecord) => invoiceRecord
                                                                                  .where(
                                                                                    'isDeleted',
                                                                                    isEqualTo: false,
                                                                                  )
                                                                                  .orderBy('invoiceDate', descending: true),
                                                                              limit: 10,
                                                                            );
                                                                            _model.invoices =
                                                                                _model.invoiceslist!.toList().cast<InvoiceRecord>();
                                                                            safeSetState(() {});
                                                                          }
                                                                        } else {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                content: Text('This Is Customer Bill !'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext),
                                                                                    child: Text('Ok'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          );
                                                                        }

                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {},
                                                                        text:
                                                                            '₹ ${invlistItem.finalBillAmt.toString()}',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              40.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              0.0,
                                                                              16.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                color: Colors.white,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                              ),
                                                                          elevation:
                                                                              0.0,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        FFButtonWidget(
                                                          onPressed: () async {
                                                            var _shouldSetState =
                                                                false;
                                                            if ((functions
                                                                        .filterBillList(
                                                                            FFAppState()
                                                                                .selBill,
                                                                            FFAppState()
                                                                                .allBillsList
                                                                                .toList())
                                                                        .length >
                                                                    0) &&
                                                                (FFAppState()
                                                                            .PayMode !=
                                                                        null &&
                                                                    FFAppState()
                                                                            .PayMode !=
                                                                        '')) {
                                                              if (getJsonField(
                                                                FFAppState()
                                                                    .shiftDetailsJson,
                                                                r'''$.shiftExists''',
                                                              )) {
                                                                FFAppState()
                                                                        .count =
                                                                    FFAppState()
                                                                            .count +
                                                                        1;
                                                                FFAppState()
                                                                        .newcount =
                                                                    FFAppState()
                                                                            .newcount +
                                                                        1;
                                                                FFAppState()
                                                                        .billcount =
                                                                    FFAppState()
                                                                            .billcount +
                                                                        1;
                                                                safeSetState(
                                                                    () {});
                                                              } else {
                                                                FFAppState()
                                                                        .count =
                                                                    FFAppState()
                                                                            .count +
                                                                        1;
                                                                FFAppState()
                                                                        .newcount =
                                                                    FFAppState()
                                                                            .newcount +
                                                                        1;
                                                                FFAppState()
                                                                        .billcount =
                                                                    FFAppState()
                                                                            .billcount +
                                                                        1;
                                                                safeSetState(
                                                                    () {});
                                                              }

                                                              _model.prdlinstnewtx =
                                                                  await actions
                                                                      .filterProducts2(
                                                                FFAppState()
                                                                    .selBill,
                                                                FFAppState()
                                                                    .allBillsList
                                                                    .toList(),
                                                              );
                                                              _shouldSetState =
                                                                  true;
                                                              await actions
                                                                  .calBillAmtGroceryPay(
                                                                0.0,
                                                                0.0,
                                                                FFAppState()
                                                                    .fsTaxAMt,
                                                                functions.enabletaxinclusive(productComboBillingAppSettingsRecord!
                                                                    .settingList
                                                                    .where((e) =>
                                                                        e.title ==
                                                                        'enableInclusiveTax')
                                                                    .toList()
                                                                    .firstOrNull!
                                                                    .value),
                                                              );
                                                              FFAppState()
                                                                      .billPrintFooter =
                                                                  'KOT';
                                                              safeSetState(
                                                                  () {});
                                                              _model.outlecdoc =
                                                                  await queryOutletRecordOnce(
                                                                queryBuilder:
                                                                    (outletRecord) =>
                                                                        outletRecord
                                                                            .where(
                                                                  'id',
                                                                  isEqualTo:
                                                                      FFAppState()
                                                                          .outletIdRef
                                                                          ?.id,
                                                                ),
                                                                singleRecord:
                                                                    true,
                                                              ).then((s) => s
                                                                      .firstOrNull);
                                                              _shouldSetState =
                                                                  true;
                                                              if (!isAndroid) {
                                                                await actions
                                                                    .newCustomAction5();
                                                              }
                                                              _model.interprd =
                                                                  await actions
                                                                      .checkInternetConnection();
                                                              _shouldSetState =
                                                                  true;
                                                              if (_model
                                                                  .interprd!) {
                                                                var invoiceRecordReference =
                                                                    InvoiceRecord.createDoc(
                                                                        FFAppState()
                                                                            .outletIdRef!);
                                                                await invoiceRecordReference
                                                                    .set({
                                                                  ...createInvoiceRecordData(
                                                                    invoice: functions.genInvoiceNum(
                                                                        FFAppState()
                                                                            .newcount,
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .shiftNo),
                                                                    party: valueOrDefault<
                                                                        String>(
                                                                      FFAppState()
                                                                          .setCustRef
                                                                          ?.id,
                                                                      'NA',
                                                                    ),
                                                                    products:
                                                                        '',
                                                                    invoiceDate:
                                                                        functions
                                                                            .timestampToMili(getCurrentTimestamp),
                                                                    paymentMode:
                                                                        FFAppState()
                                                                            .PayMode,
                                                                    dayId: functions
                                                                        .getDayId(),
                                                                    discountAmt:
                                                                        valueOrDefault<
                                                                            double>(
                                                                      FFAppState()
                                                                          .disAmt,
                                                                      0.0,
                                                                    ),
                                                                    discountPer:
                                                                        valueOrDefault<
                                                                            double>(
                                                                      FFAppState()
                                                                          .disPer,
                                                                      0.0,
                                                                    ),
                                                                    delliveryChrg:
                                                                        valueOrDefault<
                                                                            double>(
                                                                      FFAppState()
                                                                          .delCharges,
                                                                      0.0,
                                                                    ),
                                                                    taxAmt: valueOrDefault<
                                                                        double>(
                                                                      FFAppState()
                                                                          .taxAmtPay,
                                                                      0.0,
                                                                    ),
                                                                    billAmt:
                                                                        valueOrDefault<
                                                                            double>(
                                                                      FFAppState()
                                                                          .billAmt,
                                                                      0.0,
                                                                    ),
                                                                    finalBillAmt:
                                                                        valueOrDefault<
                                                                            double>(
                                                                      FFAppState()
                                                                          .finalAmt,
                                                                      0.0,
                                                                    ),
                                                                    shiftId:
                                                                        getJsonField(
                                                                      widget!
                                                                          .shiftDetails,
                                                                      r'''$.shiftId''',
                                                                    ).toString(),
                                                                    count: FFAppState()
                                                                        .newcount,
                                                                    source:
                                                                        'KOT',
                                                                    isDeleted:
                                                                        false,
                                                                    taxPer: FFAppState()
                                                                        .fsTaxAMt,
                                                                  ),
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'productList':
                                                                          getSelItemListListFirestoreData(
                                                                        _model
                                                                            .prdlinstnewtx,
                                                                      ),
                                                                    },
                                                                  ),
                                                                });
                                                                _model.invonlineprt =
                                                                    InvoiceRecord
                                                                        .getDocumentFromData({
                                                                  ...createInvoiceRecordData(
                                                                    invoice: functions.genInvoiceNum(
                                                                        FFAppState()
                                                                            .newcount,
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .shiftNo),
                                                                    party: valueOrDefault<
                                                                        String>(
                                                                      FFAppState()
                                                                          .setCustRef
                                                                          ?.id,
                                                                      'NA',
                                                                    ),
                                                                    products:
                                                                        '',
                                                                    invoiceDate:
                                                                        functions
                                                                            .timestampToMili(getCurrentTimestamp),
                                                                    paymentMode:
                                                                        FFAppState()
                                                                            .PayMode,
                                                                    dayId: functions
                                                                        .getDayId(),
                                                                    discountAmt:
                                                                        valueOrDefault<
                                                                            double>(
                                                                      FFAppState()
                                                                          .disAmt,
                                                                      0.0,
                                                                    ),
                                                                    discountPer:
                                                                        valueOrDefault<
                                                                            double>(
                                                                      FFAppState()
                                                                          .disPer,
                                                                      0.0,
                                                                    ),
                                                                    delliveryChrg:
                                                                        valueOrDefault<
                                                                            double>(
                                                                      FFAppState()
                                                                          .delCharges,
                                                                      0.0,
                                                                    ),
                                                                    taxAmt: valueOrDefault<
                                                                        double>(
                                                                      FFAppState()
                                                                          .taxAmtPay,
                                                                      0.0,
                                                                    ),
                                                                    billAmt:
                                                                        valueOrDefault<
                                                                            double>(
                                                                      FFAppState()
                                                                          .billAmt,
                                                                      0.0,
                                                                    ),
                                                                    finalBillAmt:
                                                                        valueOrDefault<
                                                                            double>(
                                                                      FFAppState()
                                                                          .finalAmt,
                                                                      0.0,
                                                                    ),
                                                                    shiftId:
                                                                        getJsonField(
                                                                      widget!
                                                                          .shiftDetails,
                                                                      r'''$.shiftId''',
                                                                    ).toString(),
                                                                    count: FFAppState()
                                                                        .newcount,
                                                                    source:
                                                                        'KOT',
                                                                    isDeleted:
                                                                        false,
                                                                    taxPer: FFAppState()
                                                                        .fsTaxAMt,
                                                                  ),
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'productList':
                                                                          getSelItemListListFirestoreData(
                                                                        _model
                                                                            .prdlinstnewtx,
                                                                      ),
                                                                    },
                                                                  ),
                                                                }, invoiceRecordReference);
                                                                _shouldSetState =
                                                                    true;

                                                                await _model
                                                                    .invonlineprt!
                                                                    .reference
                                                                    .update(
                                                                        createInvoiceRecordData(
                                                                  id: _model
                                                                      .invonlineprt
                                                                      ?.reference
                                                                      .id,
                                                                ));
                                                                _model.addToInvoices(
                                                                    _model
                                                                        .invonlineprt!);
                                                                safeSetState(
                                                                    () {});
                                                              } else {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      content: Text(
                                                                          'Internet Not Available'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                                return;
                                                              }

                                                              if (getJsonField(
                                                                FFAppState()
                                                                    .shiftDetailsJson,
                                                                r'''$.shiftExists''',
                                                              )) {
                                                                _model.shiftSummarResultsNew =
                                                                    await actions
                                                                        .calShiftSummary(
                                                                  _model
                                                                      .invonlineprt!,
                                                                  FFAppState()
                                                                      .shiftDetailsJson,
                                                                );
                                                                _shouldSetState =
                                                                    true;
                                                                FFAppState()
                                                                    .updateShiftDetailsStruct(
                                                                  (e) => e
                                                                    ..billCount =
                                                                        valueOrDefault<
                                                                            int>(
                                                                      FFAppState()
                                                                          .billcount,
                                                                      0,
                                                                    )
                                                                    ..totalSale =
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultsNew,
                                                                      r'''$.totalSale''',
                                                                    )
                                                                    ..deliveryCharges =
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultsNew,
                                                                      r'''$.deliveryCharges''',
                                                                    )
                                                                    ..tax =
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultsNew,
                                                                      r'''$.tax''',
                                                                    )
                                                                    ..lastBillNo =
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultsNew,
                                                                      r'''$.lastBillNo''',
                                                                    ).toString()
                                                                    ..discount =
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultsNew,
                                                                      r'''$.discount''',
                                                                    )
                                                                    ..lastBillTime =
                                                                        functions
                                                                            .timestampToMili(getCurrentTimestamp)
                                                                    ..cashSale =
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultsNew,
                                                                      r'''$.cashSale''',
                                                                    )
                                                                    ..paymentJson =
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultsNew,
                                                                      r'''$.paymentJson''',
                                                                    ).toString()
                                                                    ..dayId =
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultsNew,
                                                                      r'''$.dayId''',
                                                                    ).toString()
                                                                    ..shiftId =
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultsNew,
                                                                      r'''$.shiftId''',
                                                                    ).toString()
                                                                    ..hivekey = FFAppState()
                                                                        .shiftDetails
                                                                        .hivekey
                                                                    ..newIDShift =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .newIDShift
                                                                    ..code = FFAppState()
                                                                        .shiftDetails
                                                                        .code
                                                                    ..endTime = FFAppState()
                                                                        .shiftDetails
                                                                        .endTime
                                                                    ..advanceAmtTotal =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .advanceAmtTotal
                                                                    ..customerReciveAmtTotal =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .customerReciveAmtTotal
                                                                    ..expensesAmtTotal =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .expensesAmtTotal
                                                                    ..openingAmt =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .openingAmt
                                                                    ..receiveAmtTotal =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .receiveAmtTotal
                                                                    ..refoundAmount =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .refoundAmount
                                                                    ..roundOff =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .roundOff
                                                                    ..cashInHand =
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultsNew,
                                                                      r'''$.cashInHand''',
                                                                    )
                                                                    ..startTime =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .startTime
                                                                    ..inActive =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .inActive
                                                                    ..shiftNo = FFAppState()
                                                                        .shiftDetails
                                                                        .shiftNo
                                                                    ..subTotalBill =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .subTotalBill
                                                                    ..version = FFAppState()
                                                                        .shiftDetails
                                                                        .version
                                                                    ..userId = FFAppState()
                                                                        .shiftDetails
                                                                        .userId
                                                                    ..deviceId =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .deviceId
                                                                    ..synC = FFAppState()
                                                                        .shiftDetails
                                                                        .synC
                                                                    ..id = FFAppState()
                                                                        .shiftDetails
                                                                        .id,
                                                                );
                                                                safeSetState(
                                                                    () {});
                                                                if (_model
                                                                    .interprd!) {
                                                                  _model.shiftondataprint =
                                                                      await queryShiftRecordOnce(
                                                                    parent: FFAppState()
                                                                        .outletIdRef,
                                                                    queryBuilder:
                                                                        (shiftRecord) =>
                                                                            shiftRecord.where(
                                                                      'id',
                                                                      isEqualTo:
                                                                          valueOrDefault<
                                                                              String>(
                                                                        getJsonField(
                                                                          FFAppState()
                                                                              .shiftDetailsJson,
                                                                          r'''$.ref''',
                                                                        )?.toString(),
                                                                        'NA',
                                                                      ),
                                                                    ),
                                                                    singleRecord:
                                                                        true,
                                                                  ).then((s) =>
                                                                          s.firstOrNull);
                                                                  _shouldSetState =
                                                                      true;

                                                                  await _model
                                                                      .shiftondataprint!
                                                                      .reference
                                                                      .update(
                                                                          createShiftRecordData(
                                                                    billCount: FFAppState()
                                                                        .shiftDetails
                                                                        .billCount,
                                                                    dayId:
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultsNew,
                                                                      r'''$.dayId''',
                                                                    ).toString(),
                                                                    lastBillNo:
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultsNew,
                                                                      r'''$.lastBillNo''',
                                                                    ).toString(),
                                                                    lastBillTime:
                                                                        functions
                                                                            .timestampToMili(getCurrentTimestamp),
                                                                    tax:
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultsNew,
                                                                      r'''$.tax''',
                                                                    ),
                                                                    deliveryCharges:
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultsNew,
                                                                      r'''$.deliveryCharges''',
                                                                    ),
                                                                    discount:
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultsNew,
                                                                      r'''$.discount''',
                                                                    ),
                                                                    totalSale:
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultsNew,
                                                                      r'''$.totalSale''',
                                                                    ),
                                                                    cashSale:
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultsNew,
                                                                      r'''$.cashSale''',
                                                                    ),
                                                                    paymentJson:
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultsNew,
                                                                      r'''$.paymentJson''',
                                                                    ).toString(),
                                                                    code: FFAppState()
                                                                        .shiftDetails
                                                                        .code,
                                                                    endTime: FFAppState()
                                                                        .shiftDetails
                                                                        .endTime,
                                                                    advanceAmtTotal:
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .advanceAmtTotal,
                                                                    customerReciveAmtTotal:
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .customerReciveAmtTotal,
                                                                    expensesAmtTotal:
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .expensesAmtTotal,
                                                                    openingAmt: FFAppState()
                                                                        .shiftDetails
                                                                        .openingAmt,
                                                                    receiveAmtTotal:
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .receiveAmtTotal,
                                                                    refoundAmount:
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .refoundAmount,
                                                                    roundOff: FFAppState()
                                                                        .shiftDetails
                                                                        .roundOff,
                                                                    cashInHand: FFAppState()
                                                                        .shiftDetails
                                                                        .cashInHand,
                                                                    startTime: FFAppState()
                                                                        .shiftDetails
                                                                        .startTime,
                                                                    inActive: FFAppState()
                                                                        .shiftDetails
                                                                        .inActive,
                                                                    shiftNo: FFAppState()
                                                                        .shiftDetails
                                                                        .shiftNo,
                                                                    shiftId:
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultsNew,
                                                                      r'''$.shiftId''',
                                                                    ).toString(),
                                                                  ));
                                                                } else {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        content:
                                                                            Text('Internet Not Available'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                                Text('Ok'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                  return;
                                                                }
                                                              } else {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Login again to start Shift ',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        Color(
                                                                            0x00000000),
                                                                  ),
                                                                );
                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                                return;
                                                              }

                                                              if (!functions
                                                                  .isPrinterSelected(
                                                                      FFAppState()
                                                                          .printerDevice)!) {
                                                                _model.resDevice2 =
                                                                    await actions
                                                                        .scanPrinter(
                                                                  FFAppState()
                                                                      .posMode,
                                                                );
                                                                _shouldSetState =
                                                                    true;
                                                              }
                                                              _model.isconnected =
                                                                  await actions
                                                                      .connectDevice(
                                                                FFAppState()
                                                                    .printerDevice,
                                                                FFAppState()
                                                                    .printerIndex,
                                                              );
                                                              _shouldSetState =
                                                                  true;
                                                              if (_model
                                                                  .isconnected!) {
                                                                FFAppState()
                                                                        .lastBill =
                                                                    FFAppState()
                                                                        .finalAmt;
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                _model.returnedList2 =
                                                                    await actions
                                                                        .selectBillPrint(
                                                                  FFAppState()
                                                                      .selBill
                                                                      .toString(),
                                                                  FFAppState()
                                                                      .allBillsList
                                                                      .toList(),
                                                                );
                                                                _shouldSetState =
                                                                    true;
                                                                _model.device =
                                                                    await actions
                                                                        .newCustomAction(
                                                                  FFAppState()
                                                                      .printerIndex,
                                                                );
                                                                _shouldSetState =
                                                                    true;
                                                                await actions
                                                                    .printBillnewhive2(
                                                                  _model
                                                                      .returnedList2!
                                                                      .toList(),
                                                                  _model.device!
                                                                      .toList(),
                                                                  FFAppState()
                                                                      .isPrinterConnected,
                                                                  FFAppState()
                                                                      .printerName,
                                                                  getJsonField(
                                                                    functions.outletDocToJson(
                                                                        _model
                                                                            .outlecdoc!),
                                                                    r'''$''',
                                                                  ),
                                                                  _model
                                                                      .invonlineprt!,
                                                                  FFAppState()
                                                                      .paperSize,
                                                                  productComboBillingAppSettingsRecord!,
                                                                );
                                                                if (productComboBillingAppSettingsRecord!
                                                                    .settingList
                                                                    .where((e) =>
                                                                        e.title ==
                                                                        'enableStock')
                                                                    .toList()
                                                                    .firstOrNull!
                                                                    .value) {
                                                                  FFAppState()
                                                                      .startLoop = 0;
                                                                  safeSetState(
                                                                      () {});
                                                                  while (FFAppState()
                                                                          .startLoop <
                                                                      _model
                                                                          .invonlineprt!
                                                                          .productList
                                                                          .length) {
                                                                    _model.recipe =
                                                                        await queryRecipeRecordOnce(
                                                                      parent: FFAppState()
                                                                          .outletIdRef,
                                                                      queryBuilder:
                                                                          (recipeRecord) =>
                                                                              recipeRecord.where(
                                                                        'productId',
                                                                        isEqualTo:
                                                                            (_model.invonlineprt?.productList?.elementAtOrNull(FFAppState().startLoop))?.id,
                                                                      ),
                                                                      singleRecord:
                                                                          true,
                                                                    ).then((s) =>
                                                                            s.firstOrNull);
                                                                    _shouldSetState =
                                                                        true;
                                                                    if (_model
                                                                            .recipe !=
                                                                        null) {
                                                                      await actions
                                                                          .updateProductStock(
                                                                        _model
                                                                            .recipe!,
                                                                        _model
                                                                            .invonlineprt!
                                                                            .productList
                                                                            .elementAtOrNull(FFAppState().startLoop)!,
                                                                      );
                                                                      FFAppState()
                                                                          .productHive = [];
                                                                      FFAppState()
                                                                              .productHiveput =
                                                                          ProductStructStruct();
                                                                      safeSetState(
                                                                          () {});
                                                                      _model.newupdatedproductlist22 =
                                                                          await actions
                                                                              .getProductlistHive();
                                                                      _shouldSetState =
                                                                          true;
                                                                      FFAppState().productHive = _model
                                                                          .newupdatedproductlist22!
                                                                          .toList()
                                                                          .cast<
                                                                              ProductStructStruct>();
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                    FFAppState()
                                                                            .startLoop =
                                                                        FFAppState().startLoop +
                                                                            1;
                                                                    safeSetState(
                                                                        () {});
                                                                  }
                                                                  FFAppState()
                                                                      .startLoop = 0;
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                                await actions
                                                                    .removeFromAllBillList(
                                                                  FFAppState()
                                                                      .selBill,
                                                                );
                                                                await actions
                                                                    .clearValue();
                                                                FFAppState()
                                                                        .subTotal =
                                                                    0.0;
                                                                FFAppState()
                                                                        .delCharges =
                                                                    0.0;
                                                                FFAppState()
                                                                    .oldBalance = 0;
                                                                FFAppState()
                                                                    .custCredit = 0;
                                                                FFAppState()
                                                                        .custNameRef =
                                                                    null;
                                                                FFAppState()
                                                                        .setCustRef =
                                                                    null;
                                                                FFAppState()
                                                                    .setCustName = '';
                                                                FFAppState()
                                                                    .setCustMobNo = '';
                                                                FFAppState()
                                                                    .noOfItems = 0;
                                                                FFAppState()
                                                                    .prdid = '';
                                                                FFAppState()
                                                                    .productColor = '';
                                                                FFAppState()
                                                                    .billPrintFooter = '';
                                                                FFAppState()
                                                                    .PayMode = '';
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                FFAppState()
                                                                        .finalAmt =
                                                                    0.0;
                                                                FFAppState()
                                                                        .billAmt =
                                                                    0.0;
                                                                FFAppState()
                                                                        .count =
                                                                    FFAppState()
                                                                        .shiftDetails
                                                                        .billCount;
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                                return;
                                                              } else {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: Text(
                                                                          'printer connection'),
                                                                      content: Text(
                                                                          'printer not connected'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                                return;
                                                              }
                                                            } else {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    content: Text(
                                                                        'Select Payment Mode !'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                            }

                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                          },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'oc92eaf7' /* KOT  */,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width:
                                                                double.infinity,
                                                            height: 50.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          1.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleSmallFamily),
                                                                    ),
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                        FFButtonWidget(
                                                          onPressed: () async {
                                                            var _shouldSetState =
                                                                false;
                                                            if ((functions
                                                                        .filterBillList(
                                                                            FFAppState()
                                                                                .selBill,
                                                                            FFAppState()
                                                                                .allBillsList
                                                                                .toList())
                                                                        .length >
                                                                    0) &&
                                                                (FFAppState()
                                                                            .PayMode !=
                                                                        null &&
                                                                    FFAppState()
                                                                            .PayMode !=
                                                                        '')) {
                                                              if (getJsonField(
                                                                FFAppState()
                                                                    .shiftDetailsJson,
                                                                r'''$.shiftExists''',
                                                              )) {
                                                                FFAppState()
                                                                        .count =
                                                                    FFAppState()
                                                                            .count +
                                                                        1;
                                                                FFAppState()
                                                                        .newcount =
                                                                    FFAppState()
                                                                            .newcount +
                                                                        1;
                                                                FFAppState()
                                                                        .billcount =
                                                                    FFAppState()
                                                                            .billcount +
                                                                        1;
                                                                safeSetState(
                                                                    () {});
                                                              } else {
                                                                FFAppState()
                                                                        .count =
                                                                    FFAppState()
                                                                            .count +
                                                                        1;
                                                                FFAppState()
                                                                        .newcount =
                                                                    FFAppState()
                                                                            .newcount +
                                                                        1;
                                                                FFAppState()
                                                                        .billcount =
                                                                    FFAppState()
                                                                            .billcount +
                                                                        1;
                                                                safeSetState(
                                                                    () {});
                                                              }

                                                              _model.prdlinstnewtx2 =
                                                                  await actions
                                                                      .filterProducts2(
                                                                FFAppState()
                                                                    .selBill,
                                                                FFAppState()
                                                                    .allBillsList
                                                                    .toList(),
                                                              );
                                                              _shouldSetState =
                                                                  true;
                                                              await actions
                                                                  .calBillAmtGroceryPay(
                                                                0.0,
                                                                0.0,
                                                                FFAppState()
                                                                    .fsTaxAMt,
                                                                functions.enabletaxinclusive(productComboBillingAppSettingsRecord!
                                                                    .settingList
                                                                    .where((e) =>
                                                                        e.title ==
                                                                        'enableInclusiveTax')
                                                                    .toList()
                                                                    .firstOrNull!
                                                                    .value),
                                                              );
                                                              FFAppState()
                                                                      .billPrintFooter =
                                                                  'CUSTOMER';
                                                              safeSetState(
                                                                  () {});
                                                              _model.outlecdoccust =
                                                                  await queryOutletRecordOnce(
                                                                queryBuilder:
                                                                    (outletRecord) =>
                                                                        outletRecord
                                                                            .where(
                                                                  'id',
                                                                  isEqualTo:
                                                                      FFAppState()
                                                                          .outletIdRef
                                                                          ?.id,
                                                                ),
                                                                singleRecord:
                                                                    true,
                                                              ).then((s) => s
                                                                      .firstOrNull);
                                                              _shouldSetState =
                                                                  true;
                                                              if (!isAndroid) {
                                                                await actions
                                                                    .newCustomAction5();
                                                              }
                                                              _model.interprdcust =
                                                                  await actions
                                                                      .checkInternetConnection();
                                                              _shouldSetState =
                                                                  true;
                                                              if (_model
                                                                  .interprdcust!) {
                                                                var invoiceRecordReference =
                                                                    InvoiceRecord.createDoc(
                                                                        FFAppState()
                                                                            .outletIdRef!);
                                                                await invoiceRecordReference
                                                                    .set({
                                                                  ...createInvoiceRecordData(
                                                                    invoice: functions.genInvoiceNum(
                                                                        FFAppState()
                                                                            .newcount,
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .shiftNo),
                                                                    party: valueOrDefault<
                                                                        String>(
                                                                      FFAppState()
                                                                          .setCustRef
                                                                          ?.id,
                                                                      'NA',
                                                                    ),
                                                                    products:
                                                                        '',
                                                                    invoiceDate:
                                                                        functions
                                                                            .timestampToMili(getCurrentTimestamp),
                                                                    paymentMode:
                                                                        FFAppState()
                                                                            .PayMode,
                                                                    dayId: functions
                                                                        .getDayId(),
                                                                    discountAmt:
                                                                        valueOrDefault<
                                                                            double>(
                                                                      FFAppState()
                                                                          .disAmt,
                                                                      0.0,
                                                                    ),
                                                                    discountPer:
                                                                        valueOrDefault<
                                                                            double>(
                                                                      FFAppState()
                                                                          .disPer,
                                                                      0.0,
                                                                    ),
                                                                    delliveryChrg:
                                                                        valueOrDefault<
                                                                            double>(
                                                                      FFAppState()
                                                                          .delCharges,
                                                                      0.0,
                                                                    ),
                                                                    taxAmt: valueOrDefault<
                                                                        double>(
                                                                      FFAppState()
                                                                          .taxAmtPay,
                                                                      0.0,
                                                                    ),
                                                                    billAmt:
                                                                        valueOrDefault<
                                                                            double>(
                                                                      FFAppState()
                                                                          .billAmt,
                                                                      0.0,
                                                                    ),
                                                                    finalBillAmt:
                                                                        valueOrDefault<
                                                                            double>(
                                                                      FFAppState()
                                                                          .finalAmt,
                                                                      0.0,
                                                                    ),
                                                                    shiftId:
                                                                        getJsonField(
                                                                      widget!
                                                                          .shiftDetails,
                                                                      r'''$.shiftId''',
                                                                    ).toString(),
                                                                    count: FFAppState()
                                                                        .newcount,
                                                                    source:
                                                                        'CUSTOMER',
                                                                    isDeleted:
                                                                        false,
                                                                    taxPer: FFAppState()
                                                                        .fsTaxAMt,
                                                                  ),
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'productList':
                                                                          getSelItemListListFirestoreData(
                                                                        _model
                                                                            .prdlinstnewtx2,
                                                                      ),
                                                                    },
                                                                  ),
                                                                });
                                                                _model.invonlineprtcust =
                                                                    InvoiceRecord
                                                                        .getDocumentFromData({
                                                                  ...createInvoiceRecordData(
                                                                    invoice: functions.genInvoiceNum(
                                                                        FFAppState()
                                                                            .newcount,
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .shiftNo),
                                                                    party: valueOrDefault<
                                                                        String>(
                                                                      FFAppState()
                                                                          .setCustRef
                                                                          ?.id,
                                                                      'NA',
                                                                    ),
                                                                    products:
                                                                        '',
                                                                    invoiceDate:
                                                                        functions
                                                                            .timestampToMili(getCurrentTimestamp),
                                                                    paymentMode:
                                                                        FFAppState()
                                                                            .PayMode,
                                                                    dayId: functions
                                                                        .getDayId(),
                                                                    discountAmt:
                                                                        valueOrDefault<
                                                                            double>(
                                                                      FFAppState()
                                                                          .disAmt,
                                                                      0.0,
                                                                    ),
                                                                    discountPer:
                                                                        valueOrDefault<
                                                                            double>(
                                                                      FFAppState()
                                                                          .disPer,
                                                                      0.0,
                                                                    ),
                                                                    delliveryChrg:
                                                                        valueOrDefault<
                                                                            double>(
                                                                      FFAppState()
                                                                          .delCharges,
                                                                      0.0,
                                                                    ),
                                                                    taxAmt: valueOrDefault<
                                                                        double>(
                                                                      FFAppState()
                                                                          .taxAmtPay,
                                                                      0.0,
                                                                    ),
                                                                    billAmt:
                                                                        valueOrDefault<
                                                                            double>(
                                                                      FFAppState()
                                                                          .billAmt,
                                                                      0.0,
                                                                    ),
                                                                    finalBillAmt:
                                                                        valueOrDefault<
                                                                            double>(
                                                                      FFAppState()
                                                                          .finalAmt,
                                                                      0.0,
                                                                    ),
                                                                    shiftId:
                                                                        getJsonField(
                                                                      widget!
                                                                          .shiftDetails,
                                                                      r'''$.shiftId''',
                                                                    ).toString(),
                                                                    count: FFAppState()
                                                                        .newcount,
                                                                    source:
                                                                        'CUSTOMER',
                                                                    isDeleted:
                                                                        false,
                                                                    taxPer: FFAppState()
                                                                        .fsTaxAMt,
                                                                  ),
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'productList':
                                                                          getSelItemListListFirestoreData(
                                                                        _model
                                                                            .prdlinstnewtx2,
                                                                      ),
                                                                    },
                                                                  ),
                                                                }, invoiceRecordReference);
                                                                _shouldSetState =
                                                                    true;

                                                                await _model
                                                                    .invonlineprtcust!
                                                                    .reference
                                                                    .update(
                                                                        createInvoiceRecordData(
                                                                  id: _model
                                                                      .invonlineprtcust
                                                                      ?.reference
                                                                      .id,
                                                                ));
                                                                _model.addToInvoices(
                                                                    _model
                                                                        .invonlineprtcust!);
                                                                safeSetState(
                                                                    () {});
                                                              } else {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      content: Text(
                                                                          'Internet Not Available'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                                return;
                                                              }

                                                              if (getJsonField(
                                                                FFAppState()
                                                                    .shiftDetailsJson,
                                                                r'''$.shiftExists''',
                                                              )) {
                                                                _model.shiftSummarResultscust =
                                                                    await actions
                                                                        .calShiftSummary(
                                                                  _model
                                                                      .invonlineprtcust!,
                                                                  FFAppState()
                                                                      .shiftDetailsJson,
                                                                );
                                                                _shouldSetState =
                                                                    true;
                                                                FFAppState()
                                                                    .updateShiftDetailsStruct(
                                                                  (e) => e
                                                                    ..billCount =
                                                                        valueOrDefault<
                                                                            int>(
                                                                      FFAppState()
                                                                          .billcount,
                                                                      0,
                                                                    )
                                                                    ..totalSale =
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultscust,
                                                                      r'''$.totalSale''',
                                                                    )
                                                                    ..deliveryCharges =
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultscust,
                                                                      r'''$.deliveryCharges''',
                                                                    )
                                                                    ..tax =
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultscust,
                                                                      r'''$.tax''',
                                                                    )
                                                                    ..lastBillNo =
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultscust,
                                                                      r'''$.lastBillNo''',
                                                                    ).toString()
                                                                    ..discount =
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultscust,
                                                                      r'''$.discount''',
                                                                    )
                                                                    ..lastBillTime =
                                                                        functions
                                                                            .timestampToMili(getCurrentTimestamp)
                                                                    ..cashSale =
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultscust,
                                                                      r'''$.cashSale''',
                                                                    )
                                                                    ..paymentJson =
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultscust,
                                                                      r'''$.paymentJson''',
                                                                    ).toString()
                                                                    ..dayId =
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultscust,
                                                                      r'''$.dayId''',
                                                                    ).toString()
                                                                    ..shiftId =
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultscust,
                                                                      r'''$.shiftId''',
                                                                    ).toString()
                                                                    ..hivekey = FFAppState()
                                                                        .shiftDetails
                                                                        .hivekey
                                                                    ..newIDShift =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .newIDShift
                                                                    ..code = FFAppState()
                                                                        .shiftDetails
                                                                        .code
                                                                    ..endTime = FFAppState()
                                                                        .shiftDetails
                                                                        .endTime
                                                                    ..advanceAmtTotal =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .advanceAmtTotal
                                                                    ..customerReciveAmtTotal =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .customerReciveAmtTotal
                                                                    ..expensesAmtTotal =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .expensesAmtTotal
                                                                    ..openingAmt =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .openingAmt
                                                                    ..receiveAmtTotal =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .receiveAmtTotal
                                                                    ..refoundAmount =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .refoundAmount
                                                                    ..roundOff =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .roundOff
                                                                    ..cashInHand =
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultscust,
                                                                      r'''$.cashInHand''',
                                                                    )
                                                                    ..startTime =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .startTime
                                                                    ..inActive =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .inActive
                                                                    ..shiftNo = FFAppState()
                                                                        .shiftDetails
                                                                        .shiftNo
                                                                    ..subTotalBill =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .subTotalBill
                                                                    ..version = FFAppState()
                                                                        .shiftDetails
                                                                        .version
                                                                    ..userId = FFAppState()
                                                                        .shiftDetails
                                                                        .userId
                                                                    ..deviceId =
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .deviceId
                                                                    ..synC = FFAppState()
                                                                        .shiftDetails
                                                                        .synC
                                                                    ..id = FFAppState()
                                                                        .shiftDetails
                                                                        .id,
                                                                );
                                                                safeSetState(
                                                                    () {});
                                                                if (_model
                                                                    .interprdcust!) {
                                                                  _model.shiftondataprintcust =
                                                                      await queryShiftRecordOnce(
                                                                    parent: FFAppState()
                                                                        .outletIdRef,
                                                                    queryBuilder:
                                                                        (shiftRecord) =>
                                                                            shiftRecord.where(
                                                                      'id',
                                                                      isEqualTo:
                                                                          valueOrDefault<
                                                                              String>(
                                                                        getJsonField(
                                                                          FFAppState()
                                                                              .shiftDetailsJson,
                                                                          r'''$.ref''',
                                                                        )?.toString(),
                                                                        'NA',
                                                                      ),
                                                                    ),
                                                                    singleRecord:
                                                                        true,
                                                                  ).then((s) =>
                                                                          s.firstOrNull);
                                                                  _shouldSetState =
                                                                      true;

                                                                  await _model
                                                                      .shiftondataprintcust!
                                                                      .reference
                                                                      .update(
                                                                          createShiftRecordData(
                                                                    billCount: FFAppState()
                                                                        .shiftDetails
                                                                        .billCount,
                                                                    dayId:
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultscust,
                                                                      r'''$.dayId''',
                                                                    ).toString(),
                                                                    lastBillNo:
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultscust,
                                                                      r'''$.lastBillNo''',
                                                                    ).toString(),
                                                                    lastBillTime:
                                                                        functions
                                                                            .timestampToMili(getCurrentTimestamp),
                                                                    tax:
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultscust,
                                                                      r'''$.tax''',
                                                                    ),
                                                                    deliveryCharges:
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultscust,
                                                                      r'''$.deliveryCharges''',
                                                                    ),
                                                                    discount:
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultscust,
                                                                      r'''$.discount''',
                                                                    ),
                                                                    totalSale:
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultscust,
                                                                      r'''$.totalSale''',
                                                                    ),
                                                                    cashSale:
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultscust,
                                                                      r'''$.cashSale''',
                                                                    ),
                                                                    paymentJson:
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultscust,
                                                                      r'''$.paymentJson''',
                                                                    ).toString(),
                                                                    code: FFAppState()
                                                                        .shiftDetails
                                                                        .code,
                                                                    endTime: FFAppState()
                                                                        .shiftDetails
                                                                        .endTime,
                                                                    advanceAmtTotal:
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .advanceAmtTotal,
                                                                    customerReciveAmtTotal:
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .customerReciveAmtTotal,
                                                                    expensesAmtTotal:
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .expensesAmtTotal,
                                                                    openingAmt: FFAppState()
                                                                        .shiftDetails
                                                                        .openingAmt,
                                                                    receiveAmtTotal:
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .receiveAmtTotal,
                                                                    refoundAmount:
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .refoundAmount,
                                                                    roundOff: FFAppState()
                                                                        .shiftDetails
                                                                        .roundOff,
                                                                    cashInHand: FFAppState()
                                                                        .shiftDetails
                                                                        .cashInHand,
                                                                    startTime: FFAppState()
                                                                        .shiftDetails
                                                                        .startTime,
                                                                    inActive: FFAppState()
                                                                        .shiftDetails
                                                                        .inActive,
                                                                    shiftNo: FFAppState()
                                                                        .shiftDetails
                                                                        .shiftNo,
                                                                    shiftId:
                                                                        getJsonField(
                                                                      _model
                                                                          .shiftSummarResultscust,
                                                                      r'''$.shiftId''',
                                                                    ).toString(),
                                                                  ));
                                                                } else {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        content:
                                                                            Text('Internet Not Available'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                                Text('Ok'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                  return;
                                                                }
                                                              } else {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Login again to start Shift ',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        Color(
                                                                            0x00000000),
                                                                  ),
                                                                );
                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                                return;
                                                              }

                                                              if (!functions
                                                                  .isPrinterSelected(
                                                                      FFAppState()
                                                                          .printerDevice)!) {
                                                                _model.resDevice2cust =
                                                                    await actions
                                                                        .scanPrinter(
                                                                  FFAppState()
                                                                      .posMode,
                                                                );
                                                                _shouldSetState =
                                                                    true;
                                                              }
                                                              _model.isconnectedcust =
                                                                  await actions
                                                                      .connectDevice(
                                                                FFAppState()
                                                                    .printerDevice,
                                                                FFAppState()
                                                                    .printerIndex,
                                                              );
                                                              _shouldSetState =
                                                                  true;
                                                              if (_model
                                                                  .isconnectedcust!) {
                                                                FFAppState()
                                                                        .lastBill =
                                                                    FFAppState()
                                                                        .finalAmt;
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                _model.returnedList2cust =
                                                                    await actions
                                                                        .selectBillPrint(
                                                                  FFAppState()
                                                                      .selBill
                                                                      .toString(),
                                                                  FFAppState()
                                                                      .allBillsList
                                                                      .toList(),
                                                                );
                                                                _shouldSetState =
                                                                    true;
                                                                _model.devicecust =
                                                                    await actions
                                                                        .newCustomAction(
                                                                  FFAppState()
                                                                      .printerIndex,
                                                                );
                                                                _shouldSetState =
                                                                    true;
                                                                await actions
                                                                    .printBillnewhive2(
                                                                  _model
                                                                      .returnedList2cust!
                                                                      .toList(),
                                                                  _model
                                                                      .devicecust!
                                                                      .toList(),
                                                                  FFAppState()
                                                                      .isPrinterConnected,
                                                                  FFAppState()
                                                                      .printerName,
                                                                  getJsonField(
                                                                    functions.outletDocToJson(
                                                                        _model
                                                                            .outlecdoccust!),
                                                                    r'''$''',
                                                                  ),
                                                                  _model
                                                                      .invonlineprtcust!,
                                                                  FFAppState()
                                                                      .paperSize,
                                                                  productComboBillingAppSettingsRecord!,
                                                                );
                                                                if (productComboBillingAppSettingsRecord!
                                                                    .settingList
                                                                    .where((e) =>
                                                                        e.title ==
                                                                        'enableStock')
                                                                    .toList()
                                                                    .firstOrNull!
                                                                    .value) {
                                                                  FFAppState()
                                                                      .startLoop = 0;
                                                                  safeSetState(
                                                                      () {});
                                                                  while (FFAppState()
                                                                          .startLoop <
                                                                      _model
                                                                          .invonlineprt!
                                                                          .productList
                                                                          .length) {
                                                                    _model.recipecust =
                                                                        await queryRecipeRecordOnce(
                                                                      parent: FFAppState()
                                                                          .outletIdRef,
                                                                      queryBuilder:
                                                                          (recipeRecord) =>
                                                                              recipeRecord.where(
                                                                        'productId',
                                                                        isEqualTo:
                                                                            (_model.invonlineprt?.productList?.elementAtOrNull(FFAppState().startLoop))?.id,
                                                                      ),
                                                                      singleRecord:
                                                                          true,
                                                                    ).then((s) =>
                                                                            s.firstOrNull);
                                                                    _shouldSetState =
                                                                        true;
                                                                    if (_model
                                                                            .recipecust !=
                                                                        null) {
                                                                      await actions
                                                                          .updateProductStock(
                                                                        _model
                                                                            .recipecust!,
                                                                        _model
                                                                            .invonlineprt!
                                                                            .productList
                                                                            .elementAtOrNull(FFAppState().startLoop)!,
                                                                      );
                                                                      FFAppState()
                                                                          .productHive = [];
                                                                      FFAppState()
                                                                              .productHiveput =
                                                                          ProductStructStruct();
                                                                      safeSetState(
                                                                          () {});
                                                                      _model.customergetphive =
                                                                          await actions
                                                                              .getProductlistHive();
                                                                      _shouldSetState =
                                                                          true;
                                                                      FFAppState().productHive = _model
                                                                          .customergetphive!
                                                                          .toList()
                                                                          .cast<
                                                                              ProductStructStruct>();
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                    FFAppState()
                                                                            .startLoop =
                                                                        FFAppState().startLoop +
                                                                            1;
                                                                    safeSetState(
                                                                        () {});
                                                                  }
                                                                  FFAppState()
                                                                      .startLoop = 0;
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                                await actions
                                                                    .removeFromAllBillList(
                                                                  FFAppState()
                                                                      .selBill,
                                                                );
                                                                await actions
                                                                    .clearValue();
                                                                FFAppState()
                                                                        .subTotal =
                                                                    0.0;
                                                                FFAppState()
                                                                        .delCharges =
                                                                    0.0;
                                                                FFAppState()
                                                                    .oldBalance = 0;
                                                                FFAppState()
                                                                    .custCredit = 0;
                                                                FFAppState()
                                                                        .custNameRef =
                                                                    null;
                                                                FFAppState()
                                                                        .setCustRef =
                                                                    null;
                                                                FFAppState()
                                                                    .setCustName = '';
                                                                FFAppState()
                                                                    .setCustMobNo = '';
                                                                FFAppState()
                                                                    .noOfItems = 0;
                                                                FFAppState()
                                                                    .prdid = '';
                                                                FFAppState()
                                                                    .productColor = '';
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                FFAppState()
                                                                        .finalAmt =
                                                                    0.0;
                                                                FFAppState()
                                                                        .billAmt =
                                                                    0.0;
                                                                FFAppState()
                                                                        .count =
                                                                    FFAppState()
                                                                        .shiftDetails
                                                                        .billCount;
                                                                FFAppState()
                                                                    .billPrintFooter = '';
                                                                FFAppState()
                                                                    .PayMode = '';
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                                return;
                                                              } else {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: Text(
                                                                          'printer connection'),
                                                                      content: Text(
                                                                          'printer not connected'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                                return;
                                                              }
                                                            } else {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    content: Text(
                                                                        'Select Payment Mode !'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                            }

                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                          },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'rs0d0w0p' /* Customer Bill */,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width:
                                                                double.infinity,
                                                            height: 50.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          8.0,
                                                                      letterSpacing:
                                                                          1.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleSmallFamily),
                                                                    ),
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                        if (false)
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              var _shouldSetState =
                                                                  false;
                                                              if (functions
                                                                      .filterBillList(
                                                                          FFAppState()
                                                                              .selBill,
                                                                          FFAppState()
                                                                              .allBillsList
                                                                              .toList())
                                                                      .length >
                                                                  0) {
                                                                if (getJsonField(
                                                                  FFAppState()
                                                                      .shiftDetailsJson,
                                                                  r'''$.shiftExists''',
                                                                )) {
                                                                  FFAppState()
                                                                          .count =
                                                                      FFAppState()
                                                                              .count +
                                                                          1;
                                                                  FFAppState()
                                                                          .newcount =
                                                                      FFAppState()
                                                                              .newcount +
                                                                          1;
                                                                  safeSetState(
                                                                      () {});
                                                                } else {
                                                                  FFAppState()
                                                                          .count =
                                                                      FFAppState()
                                                                              .count +
                                                                          1;
                                                                  FFAppState()
                                                                          .newcount =
                                                                      FFAppState()
                                                                              .newcount +
                                                                          1;
                                                                  safeSetState(
                                                                      () {});
                                                                }

                                                                _model.prdlistsavebill =
                                                                    await actions
                                                                        .filterProducts2(
                                                                  FFAppState()
                                                                      .selBill,
                                                                  FFAppState()
                                                                      .allBillsList
                                                                      .toList(),
                                                                );
                                                                _shouldSetState =
                                                                    true;
                                                                await actions
                                                                    .newCustomAction5();
                                                                _model.internetcon =
                                                                    await actions
                                                                        .checkInternetConnection();
                                                                _shouldSetState =
                                                                    true;
                                                                if (_model
                                                                    .internetcon!) {
                                                                  var invoiceRecordReference =
                                                                      InvoiceRecord.createDoc(
                                                                          FFAppState()
                                                                              .outletIdRef!);
                                                                  await invoiceRecordReference
                                                                      .set({
                                                                    ...createInvoiceRecordData(
                                                                      invoice: functions
                                                                          .genInvoiceNumyear(
                                                                              FFAppState().newcount),
                                                                      party: valueOrDefault<
                                                                          String>(
                                                                        FFAppState()
                                                                            .setCustRef
                                                                            ?.id,
                                                                        'NA',
                                                                      ),
                                                                      products:
                                                                          '',
                                                                      invoiceDate:
                                                                          functions
                                                                              .timestampToMili(getCurrentTimestamp),
                                                                      paymentMode:
                                                                          'CASH',
                                                                      dayId: functions
                                                                          .getDayId(),
                                                                      discountAmt:
                                                                          valueOrDefault<
                                                                              double>(
                                                                        FFAppState()
                                                                            .disAmt,
                                                                        0.0,
                                                                      ),
                                                                      discountPer:
                                                                          valueOrDefault<
                                                                              double>(
                                                                        FFAppState()
                                                                            .disPer,
                                                                        0.0,
                                                                      ),
                                                                      delliveryChrg:
                                                                          valueOrDefault<
                                                                              double>(
                                                                        FFAppState()
                                                                            .delCharges,
                                                                        0.0,
                                                                      ),
                                                                      taxAmt: FFAppState()
                                                                          .taxamt,
                                                                      billAmt:
                                                                          valueOrDefault<
                                                                              double>(
                                                                        FFAppState()
                                                                            .billAmt,
                                                                        0.0,
                                                                      ),
                                                                      finalBillAmt:
                                                                          valueOrDefault<
                                                                              double>(
                                                                        FFAppState()
                                                                            .finalAmt,
                                                                        0.0,
                                                                      ),
                                                                      shiftId:
                                                                          '',
                                                                      isDeleted:
                                                                          false,
                                                                      source:
                                                                          'SAVE',
                                                                    ),
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'productList':
                                                                            getSelItemListListFirestoreData(
                                                                          _model
                                                                              .prdlistsavebill,
                                                                        ),
                                                                      },
                                                                    ),
                                                                  });
                                                                  _model.invonline =
                                                                      InvoiceRecord
                                                                          .getDocumentFromData({
                                                                    ...createInvoiceRecordData(
                                                                      invoice: functions
                                                                          .genInvoiceNumyear(
                                                                              FFAppState().newcount),
                                                                      party: valueOrDefault<
                                                                          String>(
                                                                        FFAppState()
                                                                            .setCustRef
                                                                            ?.id,
                                                                        'NA',
                                                                      ),
                                                                      products:
                                                                          '',
                                                                      invoiceDate:
                                                                          functions
                                                                              .timestampToMili(getCurrentTimestamp),
                                                                      paymentMode:
                                                                          'CASH',
                                                                      dayId: functions
                                                                          .getDayId(),
                                                                      discountAmt:
                                                                          valueOrDefault<
                                                                              double>(
                                                                        FFAppState()
                                                                            .disAmt,
                                                                        0.0,
                                                                      ),
                                                                      discountPer:
                                                                          valueOrDefault<
                                                                              double>(
                                                                        FFAppState()
                                                                            .disPer,
                                                                        0.0,
                                                                      ),
                                                                      delliveryChrg:
                                                                          valueOrDefault<
                                                                              double>(
                                                                        FFAppState()
                                                                            .delCharges,
                                                                        0.0,
                                                                      ),
                                                                      taxAmt: FFAppState()
                                                                          .taxamt,
                                                                      billAmt:
                                                                          valueOrDefault<
                                                                              double>(
                                                                        FFAppState()
                                                                            .billAmt,
                                                                        0.0,
                                                                      ),
                                                                      finalBillAmt:
                                                                          valueOrDefault<
                                                                              double>(
                                                                        FFAppState()
                                                                            .finalAmt,
                                                                        0.0,
                                                                      ),
                                                                      shiftId:
                                                                          '',
                                                                      isDeleted:
                                                                          false,
                                                                      source:
                                                                          'SAVE',
                                                                    ),
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'productList':
                                                                            getSelItemListListFirestoreData(
                                                                          _model
                                                                              .prdlistsavebill,
                                                                        ),
                                                                      },
                                                                    ),
                                                                  }, invoiceRecordReference);
                                                                  _shouldSetState =
                                                                      true;

                                                                  await _model
                                                                      .invonline!
                                                                      .reference
                                                                      .update(
                                                                          createInvoiceRecordData(
                                                                    id: _model
                                                                        .invonline
                                                                        ?.reference
                                                                        .id,
                                                                  ));
                                                                  _model.hiveInvoiceDataCopyCopy =
                                                                      await actions
                                                                          .addInvoiceBillhive(
                                                                    _model
                                                                        .invonline!
                                                                        .reference
                                                                        .id,
                                                                    functions.genInvoiceNumyear(
                                                                        FFAppState()
                                                                            .newcount),
                                                                    valueOrDefault<
                                                                        String>(
                                                                      FFAppState()
                                                                          .setCustRef
                                                                          ?.id,
                                                                      'NA',
                                                                    ),
                                                                    functions
                                                                        .timestampToMili(
                                                                            getCurrentTimestamp),
                                                                    functions
                                                                        .getDayId(),
                                                                    'CASH',
                                                                    valueOrDefault<
                                                                        double>(
                                                                      FFAppState()
                                                                          .disAmt,
                                                                      0.0,
                                                                    ),
                                                                    valueOrDefault<
                                                                        double>(
                                                                      FFAppState()
                                                                          .disPer,
                                                                      0.0,
                                                                    ),
                                                                    valueOrDefault<
                                                                        double>(
                                                                      FFAppState()
                                                                          .delCharges,
                                                                      0.0,
                                                                    ),
                                                                    FFAppState()
                                                                        .taxamt,
                                                                    valueOrDefault<
                                                                        double>(
                                                                      FFAppState()
                                                                          .billAmt,
                                                                      0.0,
                                                                    ),
                                                                    valueOrDefault<
                                                                        double>(
                                                                      FFAppState()
                                                                          .finalAmt,
                                                                      0.0,
                                                                    ),
                                                                    0.0,
                                                                    _model
                                                                        .prdlistsavebill
                                                                        ?.toList(),
                                                                    getJsonField(
                                                                      FFAppState()
                                                                          .shiftDetailsJson,
                                                                      r'''$.shiftId''',
                                                                    ).toString(),
                                                                    true,
                                                                    FFAppState()
                                                                        .invoiceStructVersion,
                                                                  );
                                                                  _shouldSetState =
                                                                      true;
                                                                } else {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        content:
                                                                            Text('Internet Not Available'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                                Text('Ok'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                  return;
                                                                }

                                                                if (getJsonField(
                                                                  FFAppState()
                                                                      .shiftDetailsJson,
                                                                  r'''$.shiftExists''',
                                                                )) {
                                                                  _model.shiftSummarResultsNew2 =
                                                                      await actions
                                                                          .calShiftSummaryNew(
                                                                    _model
                                                                        .hiveInvoiceDataCopyCopy!,
                                                                    FFAppState()
                                                                        .shiftDetailsJson,
                                                                  );
                                                                  _shouldSetState =
                                                                      true;
                                                                  _model.shiftidhive2 =
                                                                      await actions
                                                                          .shiftIdtoInt(
                                                                    getJsonField(
                                                                      FFAppState()
                                                                          .shiftDetailsJson,
                                                                      r'''$.shiftId''',
                                                                    ).toString(),
                                                                  );
                                                                  _shouldSetState =
                                                                      true;
                                                                  _model.getOfflineShiftdetails =
                                                                      await actions
                                                                          .hiveShiftCrud(
                                                                    _model
                                                                        .shiftidhive2,
                                                                    FFAppState()
                                                                        .shiftDetails,
                                                                    'get',
                                                                  );
                                                                  _shouldSetState =
                                                                      true;
                                                                  FFAppState()
                                                                      .updateShiftDetailsStruct(
                                                                    (e) => e
                                                                      ..billCount = functions.lastBillCount(FFAppState()
                                                                          .shiftDetails
                                                                          .billCount)
                                                                      ..totalSale =
                                                                          getJsonField(
                                                                        _model
                                                                            .shiftSummarResultsNew2,
                                                                        r'''$.totalSale''',
                                                                      )
                                                                      ..deliveryCharges =
                                                                          getJsonField(
                                                                        _model
                                                                            .shiftSummarResultsNew2,
                                                                        r'''$.deliveryCharges''',
                                                                      )
                                                                      ..tax =
                                                                          getJsonField(
                                                                        _model
                                                                            .shiftSummarResultsNew2,
                                                                        r'''$.tax''',
                                                                      )
                                                                      ..lastBillNo =
                                                                          getJsonField(
                                                                        _model
                                                                            .shiftSummarResultsNew2,
                                                                        r'''$.lastBillNo''',
                                                                      ).toString()
                                                                      ..discount =
                                                                          getJsonField(
                                                                        _model
                                                                            .shiftSummarResultsNew2,
                                                                        r'''$.discount''',
                                                                      )
                                                                      ..lastBillTime =
                                                                          functions
                                                                              .timestampToMili(getCurrentTimestamp)
                                                                      ..cashSale =
                                                                          getJsonField(
                                                                        _model
                                                                            .shiftSummarResultsNew2,
                                                                        r'''$.cashSale''',
                                                                      )
                                                                      ..paymentJson =
                                                                          getJsonField(
                                                                        _model
                                                                            .shiftSummarResultsNew2,
                                                                        r'''$.paymentJson''',
                                                                      ).toString()
                                                                      ..dayId =
                                                                          getJsonField(
                                                                        _model
                                                                            .shiftSummarResultsNew2,
                                                                        r'''$.dayId''',
                                                                      ).toString()
                                                                      ..code = FFAppState()
                                                                          .shiftDetails
                                                                          .code
                                                                      ..endTime = FFAppState()
                                                                          .shiftDetails
                                                                          .endTime
                                                                      ..advanceAmtTotal = FFAppState()
                                                                          .shiftDetails
                                                                          .advanceAmtTotal
                                                                      ..customerReciveAmtTotal = FFAppState()
                                                                          .shiftDetails
                                                                          .customerReciveAmtTotal
                                                                      ..expensesAmtTotal = FFAppState()
                                                                          .shiftDetails
                                                                          .expensesAmtTotal
                                                                      ..openingAmt = FFAppState()
                                                                          .shiftDetails
                                                                          .openingAmt
                                                                      ..receiveAmtTotal = FFAppState()
                                                                          .shiftDetails
                                                                          .receiveAmtTotal
                                                                      ..refoundAmount = FFAppState()
                                                                          .shiftDetails
                                                                          .refoundAmount
                                                                      ..roundOff = FFAppState()
                                                                          .shiftDetails
                                                                          .roundOff
                                                                      ..cashInHand = FFAppState()
                                                                          .shiftDetails
                                                                          .cashInHand
                                                                      ..startTime = FFAppState()
                                                                          .shiftDetails
                                                                          .startTime
                                                                      ..inActive = FFAppState()
                                                                          .shiftDetails
                                                                          .inActive
                                                                      ..shiftNo = FFAppState()
                                                                          .shiftDetails
                                                                          .shiftNo
                                                                      ..subTotalBill = FFAppState()
                                                                          .shiftDetails
                                                                          .subTotalBill
                                                                      ..userId = FFAppState()
                                                                          .shiftDetails
                                                                          .userId
                                                                      ..deviceId = FFAppState()
                                                                          .shiftDetails
                                                                          .deviceId
                                                                      ..version = FFAppState()
                                                                          .shiftDetails
                                                                          .version
                                                                      ..shiftId =
                                                                          getJsonField(
                                                                        _model
                                                                            .shiftSummarResultsNew2,
                                                                        r'''$.shiftId''',
                                                                      ).toString()
                                                                      ..synC = FFAppState()
                                                                          .shiftDetails
                                                                          .synC
                                                                      ..newIDShift = FFAppState()
                                                                          .shiftDetails
                                                                          .newIDShift
                                                                      ..hivekey = FFAppState()
                                                                          .shiftDetails
                                                                          .hivekey
                                                                      ..id = FFAppState()
                                                                          .shiftDetails
                                                                          .id,
                                                                  );
                                                                  safeSetState(
                                                                      () {});
                                                                  if (_model
                                                                      .internetcon!) {
                                                                    _model.shiftondata =
                                                                        await queryShiftRecordOnce(
                                                                      parent: FFAppState()
                                                                          .outletIdRef,
                                                                      queryBuilder:
                                                                          (shiftRecord) =>
                                                                              shiftRecord.where(
                                                                        'id',
                                                                        isEqualTo:
                                                                            valueOrDefault<String>(
                                                                          getJsonField(
                                                                            FFAppState().shiftDetailsJson,
                                                                            r'''$.ref''',
                                                                          )?.toString(),
                                                                          'NA',
                                                                        ),
                                                                      ),
                                                                      singleRecord:
                                                                          true,
                                                                    ).then((s) =>
                                                                            s.firstOrNull);
                                                                    _shouldSetState =
                                                                        true;

                                                                    await _model
                                                                        .shiftondata!
                                                                        .reference
                                                                        .update(
                                                                            createShiftRecordData(
                                                                      billCount:
                                                                          functions
                                                                              .lastBillCount(getJsonField(
                                                                        _model
                                                                            .shiftSummarResultsNew2,
                                                                        r'''$.billCount''',
                                                                      )),
                                                                      dayId:
                                                                          getJsonField(
                                                                        _model
                                                                            .shiftSummarResultsNew2,
                                                                        r'''$.dayId''',
                                                                      ).toString(),
                                                                      lastBillNo:
                                                                          getJsonField(
                                                                        _model
                                                                            .shiftSummarResultsNew2,
                                                                        r'''$.lastBillNo''',
                                                                      ).toString(),
                                                                      lastBillTime:
                                                                          functions
                                                                              .timestampToMili(getCurrentTimestamp),
                                                                      tax:
                                                                          getJsonField(
                                                                        _model
                                                                            .shiftSummarResultsNew2,
                                                                        r'''$.tax''',
                                                                      ),
                                                                      deliveryCharges:
                                                                          getJsonField(
                                                                        _model
                                                                            .shiftSummarResultsNew2,
                                                                        r'''$.deliveryCharges''',
                                                                      ),
                                                                      discount:
                                                                          getJsonField(
                                                                        _model
                                                                            .shiftSummarResultsNew2,
                                                                        r'''$.discount''',
                                                                      ),
                                                                      totalSale:
                                                                          getJsonField(
                                                                        _model
                                                                            .shiftSummarResultsNew2,
                                                                        r'''$.totalSale''',
                                                                      ),
                                                                      cashSale:
                                                                          getJsonField(
                                                                        _model
                                                                            .shiftSummarResultsNew2,
                                                                        r'''$.cashSale''',
                                                                      ),
                                                                      paymentJson:
                                                                          getJsonField(
                                                                        _model
                                                                            .shiftSummarResultsNew2,
                                                                        r'''$.paymentJson''',
                                                                      ).toString(),
                                                                      code: FFAppState()
                                                                          .shiftDetails
                                                                          .code,
                                                                      endTime: FFAppState()
                                                                          .shiftDetails
                                                                          .endTime,
                                                                      advanceAmtTotal: FFAppState()
                                                                          .shiftDetails
                                                                          .advanceAmtTotal,
                                                                      customerReciveAmtTotal: FFAppState()
                                                                          .shiftDetails
                                                                          .customerReciveAmtTotal,
                                                                      expensesAmtTotal: FFAppState()
                                                                          .shiftDetails
                                                                          .expensesAmtTotal,
                                                                      openingAmt: FFAppState()
                                                                          .shiftDetails
                                                                          .openingAmt,
                                                                      receiveAmtTotal: FFAppState()
                                                                          .shiftDetails
                                                                          .receiveAmtTotal,
                                                                      refoundAmount: FFAppState()
                                                                          .shiftDetails
                                                                          .refoundAmount,
                                                                      roundOff: FFAppState()
                                                                          .shiftDetails
                                                                          .roundOff,
                                                                      cashInHand: FFAppState()
                                                                          .shiftDetails
                                                                          .cashInHand,
                                                                      startTime: FFAppState()
                                                                          .shiftDetails
                                                                          .startTime,
                                                                      inActive: FFAppState()
                                                                          .shiftDetails
                                                                          .inActive,
                                                                      shiftNo: FFAppState()
                                                                          .shiftDetails
                                                                          .shiftNo,
                                                                      shiftId:
                                                                          getJsonField(
                                                                        _model
                                                                            .shiftSummarResultsNew2,
                                                                        r'''$.shiftId''',
                                                                      ).toString(),
                                                                    ));
                                                                    _model.updatedShift23 =
                                                                        await actions
                                                                            .hiveShiftCrud(
                                                                      _model
                                                                          .getOfflineShiftdetails
                                                                          ?.newIDShift,
                                                                      FFAppState()
                                                                          .shiftDetails,
                                                                      'update',
                                                                    );
                                                                    _shouldSetState =
                                                                        true;
                                                                  } else {
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  }

                                                                  await actions
                                                                      .removeFromAllBillList(
                                                                    FFAppState()
                                                                        .selBill,
                                                                  );
                                                                  FFAppState()
                                                                          .lastBill =
                                                                      FFAppState()
                                                                          .finalAmt;
                                                                  FFAppState()
                                                                      .update(
                                                                          () {});
                                                                  _model.prdid =
                                                                      '0';
                                                                  safeSetState(
                                                                      () {});
                                                                  await actions
                                                                      .clearValue();
                                                                  FFAppState()
                                                                      .noOfItems = 0;
                                                                  FFAppState()
                                                                          .subTotal =
                                                                      0.0;
                                                                  FFAppState()
                                                                          .count =
                                                                      _model
                                                                          .updatedShift23!
                                                                          .billCount;
                                                                  FFAppState()
                                                                          .delCharges =
                                                                      0.0;
                                                                  FFAppState()
                                                                      .update(
                                                                          () {});
                                                                  FFAppState()
                                                                      .oldBalance = 0;
                                                                  FFAppState()
                                                                      .custCredit = 0;
                                                                  FFAppState()
                                                                          .custNameRef =
                                                                      null;
                                                                  FFAppState()
                                                                          .setCustRef =
                                                                      null;
                                                                  FFAppState()
                                                                      .setCustName = '';
                                                                  FFAppState()
                                                                      .setCustMobNo = '';
                                                                  FFAppState()
                                                                      .prdid = '';
                                                                  FFAppState()
                                                                      .update(
                                                                          () {});
                                                                  FFAppState()
                                                                          .finalAmt =
                                                                      0.0;
                                                                  FFAppState()
                                                                          .billAmt =
                                                                      0.0;
                                                                  FFAppState()
                                                                      .update(
                                                                          () {});
                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                  return;
                                                                } else {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Login again to start Shift ',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          Color(
                                                                              0x00000000),
                                                                    ),
                                                                  );
                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                  return;
                                                                }
                                                              }
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'w17j5ebq' /* Save */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: double
                                                                  .infinity,
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                      ].divide(SizedBox(
                                                          height: 5.0)),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 5.0)),
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.07,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 12.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (productComboBillingAppSettingsRecord
                                                            ?.settingList
                                                            ?.where((e) =>
                                                                e.title ==
                                                                'enableCustomer')
                                                            .toList()
                                                            ?.firstOrNull
                                                            ?.value ??
                                                        true)
                                                      Expanded(
                                                        flex: 11,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      2.0,
                                                                      0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              scaffoldKey
                                                                  .currentState!
                                                                  .openEndDrawer();
                                                            },
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.075,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            3.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.03,
                                                                      height: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.03,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          width:
                                                                              0.5,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .person,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            17.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          3.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                2.0),
                                                                            child:
                                                                                Text(
                                                                              valueOrDefault<String>(
                                                                                FFAppState().setCustName,
                                                                                'Customer Name',
                                                                              ),
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              FFAppState().setCustMobNo,
                                                                              'Mobile Number',
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    Expanded(
                                                      flex: 3,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        5.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'm5n54hhs' /* Item */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodySmallFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                          Text(
                                                            FFAppState()
                                                                .noOfItems
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLargeFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyLargeFamily),
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 3,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        5.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'kj6o73sd' /* Qty */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodySmallFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              FFAppState()
                                                                  .totalQuantity
                                                                  .toString(),
                                                              '0',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLargeFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyLargeFamily),
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 6,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    3.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'oj7a2m9k' /* Sub Total */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodySmallFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'ni0alzhf' /* ₹  */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                      ),
                                                                ),
                                                                Text(
                                                                  FFAppState()
                                                                      .billAmt
                                                                      .toString(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.085,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 12.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      flex: 4,
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.125,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.085,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Expanded(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '6al5x0m2' /* Final Amt */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).labelSmallFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'bz2t7lrr' /* ₹  */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                              color: FlutterFlowTheme.of(context).lineColor,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        FFAppState()
                                                                            .finalAmt
                                                                            .toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).lineColor,
                                                                              fontSize: 26.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 10.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
