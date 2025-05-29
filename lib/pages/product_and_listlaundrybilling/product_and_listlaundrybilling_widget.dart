import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/discount_and_delivery_copy/discount_and_delivery_copy_widget.dart';
import '/components/menu_drawer/menu_drawer_widget.dart';
import '/components/mix_payment_mode/mix_payment_mode_widget.dart';
import '/components/product_cart_list_complaundry_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/grocery_windows/add_customerlaundry/add_customerlaundry_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_and_listlaundrybilling_model.dart';
export 'product_and_listlaundrybilling_model.dart';

class ProductAndListlaundrybillingWidget extends StatefulWidget {
  const ProductAndListlaundrybillingWidget({
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

  static String routeName = 'ProductAndListlaundrybilling';
  static String routePath = 'productAndListlaundrybilling';

  @override
  State<ProductAndListlaundrybillingWidget> createState() =>
      _ProductAndListlaundrybillingWidgetState();
}

class _ProductAndListlaundrybillingWidgetState
    extends State<ProductAndListlaundrybillingWidget>
    with TickerProviderStateMixin {
  late ProductAndListlaundrybillingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasContainerTriggered1 = false;
  var hasContainerTriggered2 = false;
  var hasContainerTriggered3 = false;
  var hasContainerTriggered4 = false;
  var hasContainerTriggered5 = false;
  var hasContainerTriggered6 = false;
  var hasContainerTriggered7 = false;
  var hasContainerTriggered8 = false;
  var hasContainerTriggered9 = false;
  var hasContainerTriggered10 = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductAndListlaundrybillingModel());

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
      _model.categoryListHive = await actions.getCategorylistHive();
      FFAppState().productHive =
          _model.hiveProductList!.toList().cast<ProductStructStruct>();
      safeSetState(() {});
      FFAppState().categoryHive =
          _model.categoryListHive!.toList().cast<CategoryStructStruct>();
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
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 180.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 180.0.ms,
            begin: Offset(0.9, 0.9),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation3': AnimationInfo(
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
      'containerOnActionTriggerAnimation4': AnimationInfo(
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
      'containerOnActionTriggerAnimation5': AnimationInfo(
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
      'containerOnActionTriggerAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 120.0.ms,
            begin: Offset(0.9, 0.9),
            end: Offset(1.0, 1.0),
          ),
          SaturateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 120.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation7': AnimationInfo(
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
      'containerOnActionTriggerAnimation8': AnimationInfo(
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
      'containerOnActionTriggerAnimation9': AnimationInfo(
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
      'containerOnActionTriggerAnimation10': AnimationInfo(
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
        List<AppSettingsRecord>
            productAndListlaundrybillingAppSettingsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final productAndListlaundrybillingAppSettingsRecord =
            productAndListlaundrybillingAppSettingsRecordList.isNotEmpty
                ? productAndListlaundrybillingAppSettingsRecordList.first
                : null;

        return Title(
            title: 'ProductAndListlaundrybilling',
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
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onLongPress: () async {},
                                child: Image.asset(
                                  'assets/images/IMG_20220412_140945.png',
                                  width: 100.0,
                                  height: 100.0,
                                  fit: BoxFit.contain,
                                ),
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
                                      10.0, 0.0, 10.0, 0.0),
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
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmallIsCustom,
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
                                                    'zqpog9sd' /* Admin */,
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
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmallIsCustom,
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
                                                  'bdhlrrr3' /*  */,
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
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallIsCustom,
                                                          ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
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
                                          Text(
                                            FFAppState().userName,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 3.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 18,
                                child: FutureBuilder<List<UnitTypeRecord>>(
                                  future: queryUnitTypeRecordOnce(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 40.0,
                                          height: 40.0,
                                          child: SpinKitFadingCircle(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 40.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<UnitTypeRecord>
                                        containerUnitTypeRecordList =
                                        snapshot.data!;

                                    return Container(
                                      width: 100.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.065,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .customColor2,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 3.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
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
                                                                      from:
                                                                          0.0));
                                                }
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.115,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.07,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.menu_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
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
                                          ),
                                          Expanded(
                                            flex: 19,
                                            child: Container(
                                              width: 100.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.08,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x32000000),
                                                    offset: Offset(
                                                      0.0,
                                                      2.0,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 750.0,
                                                    height: 50.0,
                                                    child: custom_widgets
                                                        .SearchHiveprd(
                                                      width: 750.0,
                                                      height: 50.0,
                                                      billno:
                                                          FFAppState().selBill,
                                                      document: FFAppState()
                                                          .productHive,
                                                      billnum: FFAppState()
                                                          .selBill
                                                          .toString(),
                                                      disAmt:
                                                          FFAppState().disAmt,
                                                      delChargs: FFAppState()
                                                          .delCharges,
                                                      taxcollection: widget!
                                                          .taxcollection!,
                                                      appSettingsRecord:
                                                          productAndListlaundrybillingAppSettingsRecord!,
                                                      purchase: false,
                                                      unitcollection:
                                                          containerUnitTypeRecordList,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          if (false)
                                            Expanded(
                                              flex: 19,
                                              child: StreamBuilder<
                                                  List<PartyRecord>>(
                                                stream: queryPartyRecord(
                                                  parent:
                                                      FFAppState().outletIdRef,
                                                  queryBuilder: (partyRecord) =>
                                                      partyRecord.where(
                                                    'role',
                                                    isEqualTo: 'CUSTOMER',
                                                  ),
                                                ),
                                                builder: (context, snapshot) {
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
                                                  List<PartyRecord>
                                                      containerPartyRecordList =
                                                      snapshot.data!;

                                                  return Container(
                                                    width: 100.0,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.08,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x32000000),
                                                          offset: Offset(
                                                            0.0,
                                                            2.0,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width: 750.0,
                                                          height: 50.0,
                                                          child: custom_widgets
                                                              .Searchcustomer(
                                                            width: 750.0,
                                                            height: 50.0,
                                                            customer:
                                                                containerPartyRecordList,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          Flexible(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
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
                                                              AddCustomerlaundryWidget(),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                                child: Container(
                                                  width: 50.0,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.08,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x32000000),
                                                        offset: Offset(
                                                          0.0,
                                                          2.0,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.person_add,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 35.0,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 10,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      3.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    width: 100.0,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.065,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            FFAppState().holdBillCount =
                                                FFAppState().holdBillCount + 1;
                                            FFAppState().addToAllBillsList(
                                                functions
                                                    .generateBillDetailsJson(
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
                                                        FFAppState()
                                                            .itemCartList
                                                            .toList(),
                                                        FFAppState()
                                                            .holdBillCount));
                                            FFAppState().update(() {});
                                          },
                                          child: Container(
                                            width: 36.0,
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 3.0, 0.0),
                                              child: FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                buttonSize: 35.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                disabledColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                icon: Icon(
                                                  Icons.add,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 16.0,
                                                ),
                                                onPressed:
                                                    !productAndListlaundrybillingAppSettingsRecord!
                                                            .showHoldListButton
                                                        ? null
                                                        : () {
                                                            print(
                                                                'IconButton pressed ...');
                                                          },
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Builder(
                                            builder: (context) {
                                              final holdListPL = FFAppState()
                                                  .allBillsList
                                                  .map((e) => getJsonField(
                                                        e,
                                                        r'''$''',
                                                      ))
                                                  .toList();

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: holdListPL.length,
                                                itemBuilder:
                                                    (context, holdListPLIndex) {
                                                  final holdListPLItem =
                                                      holdListPL[
                                                          holdListPLIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                3.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        FFAppState()
                                                            .activeHoldBill = [];
                                                        FFAppState()
                                                            .addToActiveHoldBill(
                                                                getJsonField(
                                                          holdListPLItem,
                                                          r'''$.billno''',
                                                        ));
                                                        FFAppState()
                                                            .update(() {});
                                                        FFAppState().selBill =
                                                            getJsonField(
                                                          holdListPLItem,
                                                          r'''$.billno''',
                                                        );
                                                        FFAppState()
                                                            .update(() {});
                                                        _model.res11 = await actions
                                                            .calSubTotalForHoldList(
                                                          FFAppState()
                                                              .selBill
                                                              .toString(),
                                                          FFAppState()
                                                              .allBillsList
                                                              .toList(),
                                                        );
                                                        await actions
                                                            .calBillAmt(
                                                          FFAppState().disAmt,
                                                          FFAppState()
                                                              .delCharges,
                                                        );
                                                        FFAppState()
                                                                .holdListColor =
                                                            getJsonField(
                                                          holdListPLItem,
                                                          r'''$.billno''',
                                                        );
                                                        FFAppState()
                                                            .update(() {});

                                                        safeSetState(() {});
                                                      },
                                                      onLongPress: () async {
                                                        var confirmDialogResponse =
                                                            await showDialog<
                                                                    bool>(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: Text(
                                                                          'Delete Bill..?'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              alertDialogContext,
                                                                              false),
                                                                          child:
                                                                              Text('Cancel'),
                                                                        ),
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              alertDialogContext,
                                                                              true),
                                                                          child:
                                                                              Text('Confirm'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                ) ??
                                                                false;
                                                        if (confirmDialogResponse) {
                                                          await actions
                                                              .removeFromAllBillList(
                                                            getJsonField(
                                                              holdListPLItem,
                                                              r'''$.billno''',
                                                            ),
                                                          );
                                                        } else {
                                                          return;
                                                        }
                                                      },
                                                      child: Container(
                                                        width: 40.0,
                                                        height: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: getJsonField(
                                                                    holdListPLItem,
                                                                    r'''$.billno''',
                                                                  ) ==
                                                                  FFAppState()
                                                                      .holdListColor
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .alternate
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiary,
                                                        ),
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
                                                                          7.0,
                                                                          0.0,
                                                                          7.0,
                                                                          0.0),
                                                              child: Text(
                                                                getJsonField(
                                                                  holdListPLItem,
                                                                  r'''$.billno''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineSmallFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .headlineSmallIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                                controller:
                                                    _model.listViewController1,
                                              );
                                            },
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.04,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 0.5,
                                            ),
                                          ),
                                          child: FlutterFlowIconButton(
                                            icon: Icon(
                                              Icons.auto_delete,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 20.0,
                                            ),
                                            onPressed: () async {
                                              var confirmDialogResponse =
                                                  await showDialog<bool>(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Delete All Bills..?'),
                                                            content: Text(
                                                                'Are you sure you want to delete all Bills..'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        false),
                                                                child: Text(
                                                                    'cancle'),
                                                              ),
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        true),
                                                                child: Text(
                                                                    'confirm'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ) ??
                                                      false;
                                              if (!confirmDialogResponse) {
                                                return;
                                              }
                                              FFAppState().holdBillCount = 0;
                                              FFAppState().allBillsList = [];
                                              FFAppState().update(() {});
                                              FFAppState().itemCartList = [];
                                              FFAppState().update(() {});
                                              await actions.clearValue();
                                              FFAppState().noOfItems = 0;
                                              FFAppState().update(() {});
                                              FFAppState().prdid = '';
                                              safeSetState(() {});
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 3.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 18,
                                  child: Container(
                                    width: 100.0,
                                    height: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: double.infinity,
                                            height: double.infinity,
                                            child: Stack(
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          3.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.115,
                                                                height: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          1.5),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await actions
                                                                              .hideAppbar();
                                                                          FFAppState().categoryColor =
                                                                              '';
                                                                          FFAppState()
                                                                              .update(() {});
                                                                          FFAppState().outletCatRef =
                                                                              FFAppState().catRef;
                                                                          FFAppState()
                                                                              .update(() {});
                                                                          FFAppState().catAllColor =
                                                                              FlutterFlowTheme.of(context).primary;
                                                                          FFAppState()
                                                                              .update(() {});
                                                                          FFAppState().categoryID =
                                                                              '';
                                                                          safeSetState(
                                                                              () {});
                                                                          _model.prdhiveall =
                                                                              await actions.getProductlistHive();
                                                                          FFAppState().productHive = _model
                                                                              .prdhiveall!
                                                                              .toList()
                                                                              .cast<ProductStructStruct>();
                                                                          safeSetState(
                                                                              () {});

                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                valueOrDefault<Color>(
                                                                              FFAppState().catAllColor,
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                            ),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).customColor1,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(3.0, 12.0, 3.0, 12.0),
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'z8vrv24p' /* All */,
                                                                                  ),
                                                                                  textAlign: TextAlign.center,
                                                                                  style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                        color: FlutterFlowTheme.of(context).lineColor,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            3.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final categoryList = FFAppState().categoryHive.sortedList(keyOf: (e) => e.name, desc: false).toList();

                                                                              return ListView.builder(
                                                                                padding: EdgeInsets.zero,
                                                                                scrollDirection: Axis.vertical,
                                                                                itemCount: categoryList.length,
                                                                                itemBuilder: (context, categoryListIndex) {
                                                                                  final categoryListItem = categoryList[categoryListIndex];
                                                                                  return Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.5),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        FFAppState().catAllColor = Color(4292855973);
                                                                                        safeSetState(() {});
                                                                                        FFAppState().categoryColor = categoryListItem.id;
                                                                                        FFAppState().update(() {});
                                                                                        _model.prdhive = await actions.getProductlistHive();
                                                                                        FFAppState().categoryID = categoryListItem.id;
                                                                                        safeSetState(() {});
                                                                                        FFAppState().productHive = _model.prdhive!.where((e) => e.categoryId == categoryListItem.id).toList().cast<ProductStructStruct>();
                                                                                        safeSetState(() {});

                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      child: Container(
                                                                                        width: double.infinity,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FFAppState().categoryColor == categoryListItem.id ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).secondary,
                                                                                        ),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(3.0, 12.0, 3.0, 12.0),
                                                                                              child: Text(
                                                                                                categoryListItem.name.maybeHandleOverflow(
                                                                                                  maxChars: 9,
                                                                                                  replacement: '…',
                                                                                                ),
                                                                                                textAlign: TextAlign.center,
                                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                      color: FlutterFlowTheme.of(context).lineColor,
                                                                                                      fontSize: 15.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                                controller: _model.listViewController2,
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 19,
                                                              child: Container(
                                                                width: 100.0,
                                                                height: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Stack(
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              1.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final productList =
                                                                                FFAppState().productHive.sortedList(keyOf: (e) => e.code, desc: false).toList();
                                                                            if (productList.isEmpty) {
                                                                              return Center(
                                                                                child: Image.asset(
                                                                                  'assets/images/9091-empty-sad-shopping-bag.gif',
                                                                                  width: MediaQuery.sizeOf(context).width * 0.28,
                                                                                ),
                                                                              );
                                                                            }

                                                                            return GridView.builder(
                                                                              padding: EdgeInsets.zero,
                                                                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                                crossAxisCount: 5,
                                                                                crossAxisSpacing: 3.0,
                                                                                mainAxisSpacing: 4.0,
                                                                                childAspectRatio: 1.3,
                                                                              ),
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: productList.length,
                                                                              itemBuilder: (context, productListIndex) {
                                                                                final productListItem = productList[productListIndex];
                                                                                return Container(
                                                                                  width: 113.0,
                                                                                  height: 100.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    borderRadius: BorderRadius.circular(5.0),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).customColor2,
                                                                                      width: 1.0,
                                                                                    ),
                                                                                  ),
                                                                                  child: Stack(
                                                                                    children: [
                                                                                      if (!productAndListlaundrybillingAppSettingsRecord!.settingList.where((e) => e.title == 'showProductImage').toList().firstOrNull!.value)
                                                                                        InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            if (FFAppState().holdBillCount == 0) {
                                                                                              FFAppState().holdBillCount = FFAppState().holdBillCount + 1;
                                                                                              FFAppState().addToAllBillsList(functions.generateBillDetailsJson(0.0, 0.0, 0.0, 'CASH', 0.0, 0.0, FFAppState().billAmt, 0.0, FFAppState().finalAmt, '0', FFAppState().itemCartList.toList(), FFAppState().holdBillCount));
                                                                                              FFAppState().selBill = 1;
                                                                                            }
                                                                                            _model.addtosavebill22 = await actions.laundryAddToHoldListprd(
                                                                                              productListItem,
                                                                                              FFAppState().selBill,
                                                                                              widget!.taxcollection!.toList(),
                                                                                              functions.enabletaxinclusive(productAndListlaundrybillingAppSettingsRecord!.settingList.where((e) => e.title == 'enableInclusiveTax').toList().firstOrNull!.value),
                                                                                            );
                                                                                            _model.calculateResult233 = await actions.laundrycalSubTotalForHoldList(
                                                                                              FFAppState().selBill.toString(),
                                                                                              _model.addtosavebill22!.toList(),
                                                                                            );
                                                                                            _model.calbillAmt3 = await actions.calBillAmt(
                                                                                              FFAppState().disAmt,
                                                                                              FFAppState().delCharges,
                                                                                            );
                                                                                            await _model.listViewprd?.animateTo(
                                                                                              _model.listViewprd!.position.maxScrollExtent,
                                                                                              duration: Duration(milliseconds: 100),
                                                                                              curve: Curves.ease,
                                                                                            );

                                                                                            safeSetState(() {});
                                                                                          },
                                                                                          onDoubleTap: () async {},
                                                                                          onLongPress: () async {},
                                                                                          child: Container(
                                                                                            decoration: BoxDecoration(
                                                                                              color: FFAppState().productColor == productListItem.id ? FlutterFlowTheme.of(context).secondary : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsets.all(2.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 7.0),
                                                                                                    child: Text(
                                                                                                      productListItem.name.maybeHandleOverflow(
                                                                                                        maxChars: 25,
                                                                                                      ),
                                                                                                      textAlign: TextAlign.center,
                                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Flexible(
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'oqei5da5' /* ₹  */,
                                                                                                            ),
                                                                                                            textAlign: TextAlign.center,
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                ),
                                                                                                          ),
                                                                                                          Flexible(
                                                                                                            child: Text(
                                                                                                              productListItem.sellingPrice.toString(),
                                                                                                              textAlign: TextAlign.center,
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  if (productListItem.stockable)
                                                                                                    Flexible(
                                                                                                      child: Text(
                                                                                                        'Stock :${productListItem.stock.toString()}',
                                                                                                        textAlign: TextAlign.justify,
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ).animateOnActionTrigger(animationsMap['containerOnActionTriggerAnimation3']!, hasBeenTriggered: hasContainerTriggered3),
                                                                                      if (productAndListlaundrybillingAppSettingsRecord?.settingList?.where((e) => e.title == 'showProductImage').toList()?.firstOrNull?.value ?? true)
                                                                                        InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            if (FFAppState().holdBillCount == 0) {
                                                                                              FFAppState().holdBillCount = FFAppState().holdBillCount + 1;
                                                                                              FFAppState().addToAllBillsList(functions.generateBillDetailsJson(0.0, 0.0, 0.0, 'CASH', 0.0, 0.0, FFAppState().billAmt, 0.0, FFAppState().finalAmt, '0', FFAppState().itemCartList.toList(), FFAppState().holdBillCount));
                                                                                              FFAppState().selBill = 1;
                                                                                            }
                                                                                            _model.addtosavebill23 = await actions.addToHoldListprdCopy(
                                                                                              productListItem,
                                                                                              FFAppState().selBill,
                                                                                              widget!.taxcollection!.toList(),
                                                                                              functions.enabletaxinclusive(productAndListlaundrybillingAppSettingsRecord!.settingList.where((e) => e.title == 'enableInclusiveTax').toList().firstOrNull!.value),
                                                                                            );
                                                                                            _model.calculateResult2 = await actions.calSubTotalForHoldList(
                                                                                              FFAppState().selBill.toString(),
                                                                                              _model.addtosavebill23!.toList(),
                                                                                            );
                                                                                            _model.calbillAmt2 = await actions.calBillAmt(
                                                                                              FFAppState().disAmt,
                                                                                              FFAppState().delCharges,
                                                                                            );
                                                                                            await _model.listViewprd?.animateTo(
                                                                                              _model.listViewprd!.position.maxScrollExtent,
                                                                                              duration: Duration(milliseconds: 100),
                                                                                              curve: Curves.ease,
                                                                                            );

                                                                                            safeSetState(() {});
                                                                                          },
                                                                                          onDoubleTap: () async {},
                                                                                          onLongPress: () async {},
                                                                                          child: Container(
                                                                                            decoration: BoxDecoration(
                                                                                              color: FFAppState().productColor == productListItem.id ? FlutterFlowTheme.of(context).secondary : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsets.all(0.5),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: Container(
                                                                                                      width: double.infinity,
                                                                                                      height: MediaQuery.sizeOf(context).height * 0.12,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: Color(0x1A000000),
                                                                                                        image: DecorationImage(
                                                                                                          fit: BoxFit.cover,
                                                                                                          image: CachedNetworkImageProvider(
                                                                                                            functions.imageurltostring(productListItem.imageUrl),
                                                                                                          ),
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                                      ),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                                              child: Container(
                                                                                                                width: double.infinity,
                                                                                                                height: MediaQuery.sizeOf(context).height * 0.15,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  image: DecorationImage(
                                                                                                                    fit: BoxFit.cover,
                                                                                                                    image: Image.network(
                                                                                                                      '',
                                                                                                                    ).image,
                                                                                                                  ),
                                                                                                                  gradient: LinearGradient(
                                                                                                                    colors: [
                                                                                                                      Colors.transparent,
                                                                                                                      Color(0xA7000000)
                                                                                                                    ],
                                                                                                                    stops: [0.0, 1.0],
                                                                                                                    begin: AlignmentDirectional(0.0, -1.0),
                                                                                                                    end: AlignmentDirectional(0, 1.0),
                                                                                                                  ),
                                                                                                                  borderRadius: BorderRadius.circular(5.0),
                                                                                                                ),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 3.0),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                    children: [
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                                                                        child: Text(
                                                                                                                          productListItem.name,
                                                                                                                          textAlign: TextAlign.center,
                                                                                                                          style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                                                color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.w600,
                                                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                          children: [
                                                                                                                            Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                                                              child: Text(
                                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                                  'lrjkzc1x' /* ₹ */,
                                                                                                                                ),
                                                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                                                      color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            Text(
                                                                                                                              productListItem.sellingPrice.toString(),
                                                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                                                    color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
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
                                                                                        ).animateOnActionTrigger(animationsMap['containerOnActionTriggerAnimation4']!, hasBeenTriggered: hasContainerTriggered4),
                                                                                    ],
                                                                                  ),
                                                                                ).animateOnActionTrigger(animationsMap['containerOnActionTriggerAnimation2']!, hasBeenTriggered: hasContainerTriggered2);
                                                                              },
                                                                              controller: _model.gridViewController,
                                                                            );
                                                                          },
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
                                Expanded(
                                  flex: 10,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        3.0, 0.0, 0.0, 0.0),
                                    child: Container(
                                      width: 100.0,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.08,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.003,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 1.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      width: 100.0,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.03,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            flex: 28,
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.12,
                                                              height: 100.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'pqejdefy' /* Item Name */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodySmallFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 15,
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.08,
                                                              height: 100.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Column(
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
                                                                      'xm0usks3' /* Qty */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodySmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 10,
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.08,
                                                              height: 100.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Column(
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
                                                                      'joccsput' /* Amt */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodySmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 5,
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 100.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
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
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 2.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final bill = functions
                                                          .filterBillList(
                                                              FFAppState()
                                                                  .selBill,
                                                              FFAppState()
                                                                  .allBillsList
                                                                  .toList())
                                                          .toList();

                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount: bill.length,
                                                        itemBuilder: (context,
                                                            billIndex) {
                                                          final billItem =
                                                              bill[billIndex];
                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .productCartListComplaundryModels
                                                                        .getModel(
                                                                      billIndex
                                                                          .toString(),
                                                                      billIndex,
                                                                    ),
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        ProductCartListComplaundryWidget(
                                                                      key: Key(
                                                                        'Key33v_${billIndex.toString()}',
                                                                      ),
                                                                      parameter1:
                                                                          getJsonField(
                                                                        billItem,
                                                                        r'''$.name''',
                                                                      ),
                                                                      parameter2:
                                                                          getJsonField(
                                                                        billItem,
                                                                        r'''$.price''',
                                                                      ),
                                                                      parameter3:
                                                                          getJsonField(
                                                                        billItem,
                                                                        r'''$''',
                                                                      ),
                                                                      parameter4:
                                                                          ProductStructStruct.maybeFromMap(
                                                                              billItem),
                                                                      parameter5:
                                                                          widget!
                                                                              .taxcollection!,
                                                                      parameter6:
                                                                          productAndListlaundrybillingAppSettingsRecord
                                                                              ?.inclusiveTax,
                                                                      parameter7: productAndListlaundrybillingAppSettingsRecord
                                                                          ?.settingList
                                                                          ?.where((e) =>
                                                                              e.title ==
                                                                              'enableInclusiveTax')
                                                                          .toList()
                                                                          ?.firstOrNull
                                                                          ?.value,
                                                                      parameter8:
                                                                          getJsonField(
                                                                        billItem,
                                                                        r'''$.quantity''',
                                                                      ),
                                                                      parameter9:
                                                                          getJsonField(
                                                                        billItem,
                                                                        r'''$.stockable''',
                                                                      ),
                                                                      parameter10:
                                                                          getJsonField(
                                                                        billItem,
                                                                        r'''$.currentStock''',
                                                                      ),
                                                                      parameter11:
                                                                          getJsonField(
                                                                        billItem,
                                                                        r'''$.quantity''',
                                                                      ),
                                                                      parameter12:
                                                                          getJsonField(
                                                                        billItem,
                                                                        r'''$.price''',
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    _model.res20 =
                                                                        await actions
                                                                            .removeHoldListItem(
                                                                      billItem,
                                                                      FFAppState()
                                                                          .selBill,
                                                                    );
                                                                    _model.res21 =
                                                                        await actions
                                                                            .calSubTotalForHoldList(
                                                                      FFAppState()
                                                                          .selBill
                                                                          .toString(),
                                                                      FFAppState()
                                                                          .allBillsList
                                                                          .toList(),
                                                                    );
                                                                    _model.reuslt22 =
                                                                        await actions
                                                                            .calBillAmt(
                                                                      valueOrDefault<
                                                                          double>(
                                                                        FFAppState()
                                                                            .disAmt,
                                                                        0.0,
                                                                      ),
                                                                      FFAppState()
                                                                          .delCharges,
                                                                    );
                                                                    FFAppState()
                                                                        .prdid = '';
                                                                    safeSetState(
                                                                        () {});

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .delete,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 30.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                        controller:
                                                            _model.listViewprd,
                                                      );
                                                    },
                                                  ),
                                                ),
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
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 15.0,
                                                    color: Color(0x40000000),
                                                    offset: Offset(
                                                      2.0,
                                                      -2.0,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 12.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (productAndListlaundrybillingAppSettingsRecord
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
                                                            onTap: () async {},
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
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              FFAppState().setCustName,
                                                                              'Customer Name',
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
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
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
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
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'q22gjk6z' /* Item */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmallIsCustom,
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
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLargeIsCustom,
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
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '06yif9zt' /* Qty */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmallIsCustom,
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
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLargeIsCustom,
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
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '5t8kab4i' /* Sub Total */,
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
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodySmallIsCustom,
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
                                                                    'srge3jbe' /* ₹  */,
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
                                                                            !FlutterFlowTheme.of(context).bodyLargeIsCustom,
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
                                                                            !FlutterFlowTheme.of(context).bodyLargeIsCustom,
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
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  2.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            barrierColor: Color(
                                                                0x00000000),
                                                            context: context,
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                onTap: () {
                                                                  FocusScope.of(
                                                                          context)
                                                                      .unfocus();
                                                                  FocusManager
                                                                      .instance
                                                                      .primaryFocus
                                                                      ?.unfocus();
                                                                },
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        360.0,
                                                                    child:
                                                                        DiscountAndDeliveryCopyWidget(
                                                                      appsetting:
                                                                          productAndListlaundrybillingAppSettingsRecord,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));

                                                          if (animationsMap[
                                                                  'containerOnActionTriggerAnimation5'] !=
                                                              null) {
                                                            safeSetState(() =>
                                                                hasContainerTriggered5 =
                                                                    true);
                                                            SchedulerBinding
                                                                .instance
                                                                .addPostFrameCallback((_) async => await animationsMap[
                                                                        'containerOnActionTriggerAnimation5']!
                                                                    .controller
                                                                    .forward(
                                                                        from:
                                                                            0.0));
                                                          }
                                                        },
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.032,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.032,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .lineColor,
                                                              width: 0.5,
                                                            ),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .receipt,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .lineColor,
                                                              size: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ).animateOnActionTrigger(
                                                          animationsMap[
                                                              'containerOnActionTriggerAnimation5']!,
                                                          hasBeenTriggered:
                                                              hasContainerTriggered5),
                                                    ),
                                                    Expanded(
                                                      flex: 3,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            if (animationsMap[
                                                                    'containerOnActionTriggerAnimation6'] !=
                                                                null) {
                                                              safeSetState(() =>
                                                                  hasContainerTriggered6 =
                                                                      true);
                                                              SchedulerBinding
                                                                  .instance
                                                                  .addPostFrameCallback((_) async => await animationsMap[
                                                                          'containerOnActionTriggerAnimation6']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0));
                                                            }
                                                          },
                                                          child: Container(
                                                            width: 100.0,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.085,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      3.0,
                                                                  color: Color(
                                                                      0x33000000),
                                                                  offset:
                                                                      Offset(
                                                                    1.0,
                                                                    1.0,
                                                                  ),
                                                                  spreadRadius:
                                                                      2.0,
                                                                )
                                                              ],
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(2.0),
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
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '1e4vc3ol' /* Last Bill */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).titleSmallFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).lineColor,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).titleSmallIsCustom,
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
                                                                          'bkiqija9' /* ₹ */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                              color: FlutterFlowTheme.of(context).lineColor,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          FFAppState()
                                                                              .lastBill
                                                                              .toString(),
                                                                          '00.00',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                              color: FlutterFlowTheme.of(context).lineColor,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ).animateOnActionTrigger(
                                                            animationsMap[
                                                                'containerOnActionTriggerAnimation6']!,
                                                            hasBeenTriggered:
                                                                hasContainerTriggered6),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 4,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.02,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 3.0,
                                                                color: Color(
                                                                    0x33000000),
                                                                offset: Offset(
                                                                  1.0,
                                                                  1.0,
                                                                ),
                                                                spreadRadius:
                                                                    2.0,
                                                              )
                                                            ],
                                                          ),
                                                          child: StreamBuilder<
                                                              List<
                                                                  PaymentModeRecord>>(
                                                            stream:
                                                                queryPaymentModeRecord(),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 20.0,
                                                                    height:
                                                                        20.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        Color(
                                                                            0x00B6001A),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<PaymentModeRecord>
                                                                  dropDownPaymentModeRecordList =
                                                                  snapshot
                                                                      .data!;

                                                              return FlutterFlowDropDown<
                                                                  String>(
                                                                controller: _model
                                                                        .dropDownValueController ??=
                                                                    FormFieldController<
                                                                        String>(
                                                                  _model.dropDownValue ??=
                                                                      FFAppState()
                                                                          .defPayMode,
                                                                ),
                                                                options: dropDownPaymentModeRecordList
                                                                    .map((e) =>
                                                                        e.name)
                                                                    .toList(),
                                                                onChanged:
                                                                    (val) async {
                                                                  safeSetState(() =>
                                                                      _model.dropDownValue =
                                                                          val);
                                                                  FFAppState()
                                                                          .PayMode =
                                                                      _model
                                                                          .dropDownValue!;
                                                                  safeSetState(
                                                                      () {});
                                                                  _model.returntrue =
                                                                      await actions
                                                                          .paymentmodemix(
                                                                    FFAppState()
                                                                        .PayMode,
                                                                  );
                                                                  if (_model
                                                                      .returntrue!) {
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            FocusScope.of(context).unfocus();
                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                          },
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                Container(
                                                                              height: 360.0,
                                                                              child: MixPaymentModeWidget(
                                                                                appsetting: productAndListlaundrybillingAppSettingsRecord,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));
                                                                  }

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                width: double
                                                                    .infinity,
                                                                height: double
                                                                    .infinity,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .lineColor,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .titleSmallIsCustom,
                                                                    ),
                                                                hintText:
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                  'zxx78gp0' /* Pay Mode */,
                                                                ),
                                                                icon: Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .lineColor,
                                                                  size: 22.0,
                                                                ),
                                                                elevation: 2.0,
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderWidth:
                                                                    0.0,
                                                                borderRadius:
                                                                    0.0,
                                                                margin:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            7.0,
                                                                            4.0,
                                                                            5.0,
                                                                            4.0),
                                                                hidesUnderline:
                                                                    true,
                                                                isSearchable:
                                                                    false,
                                                                isMultiSelect:
                                                                    false,
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
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
                                                                  .end,
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
                                                                        .end,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'smam3abu' /* Final Amt */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).lineColor,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
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
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '2slkm7ma' /* ₹  */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                              color: FlutterFlowTheme.of(context).lineColor,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
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
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).headlineMediumIsCustom,
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
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                if (productAndListlaundrybillingAppSettingsRecord
                                                        ?.couponSaveBill ??
                                                    true)
                                                  Expanded(
                                                    flex: 8,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  1.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          if (animationsMap[
                                                                  'containerOnActionTriggerAnimation7'] !=
                                                              null) {
                                                            safeSetState(() =>
                                                                hasContainerTriggered7 =
                                                                    true);
                                                            SchedulerBinding
                                                                .instance
                                                                .addPostFrameCallback((_) async => await animationsMap[
                                                                        'containerOnActionTriggerAnimation7']!
                                                                    .controller
                                                                    .forward(
                                                                        from:
                                                                            0.0));
                                                          }
                                                        },
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.15,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.085,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                          ),
                                                          child: Column(
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
                                                                  'wv9ah4zz' /* Coupon */,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBtnText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .headlineSmallIsCustom,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ).animateOnActionTrigger(
                                                          animationsMap[
                                                              'containerOnActionTriggerAnimation7']!,
                                                          hasBeenTriggered:
                                                              hasContainerTriggered7),
                                                    ),
                                                  ),
                                                if (productAndListlaundrybillingAppSettingsRecord
                                                        ?.upiButton ??
                                                    true)
                                                  Expanded(
                                                    flex: 8,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  1.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          if (animationsMap[
                                                                  'containerOnActionTriggerAnimation8'] !=
                                                              null) {
                                                            safeSetState(() =>
                                                                hasContainerTriggered8 =
                                                                    true);
                                                            SchedulerBinding
                                                                .instance
                                                                .addPostFrameCallback((_) async => await animationsMap[
                                                                        'containerOnActionTriggerAnimation8']!
                                                                    .controller
                                                                    .forward(
                                                                        from:
                                                                            0.0));
                                                          }
                                                        },
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.15,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.085,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                          ),
                                                          child: Column(
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
                                                                  'zo8zrb9s' /* UPI */,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBtnText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .headlineSmallIsCustom,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ).animateOnActionTrigger(
                                                          animationsMap[
                                                              'containerOnActionTriggerAnimation8']!,
                                                          hasBeenTriggered:
                                                              hasContainerTriggered8),
                                                    ),
                                                  ),
                                                if (productAndListlaundrybillingAppSettingsRecord
                                                        ?.settingList
                                                        ?.where((e) =>
                                                            e.title ==
                                                            'enableSaveBill')
                                                        .toList()
                                                        ?.firstOrNull
                                                        ?.value ??
                                                    true)
                                                  Expanded(
                                                    flex: 8,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  1.0,
                                                                  0.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.15,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.085,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
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
                                                                        .countLaundryForContinuesIncrement =
                                                                    FFAppState()
                                                                            .countLaundryForContinuesIncrement +
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
                                                                        .countLaundryForContinuesIncrement =
                                                                    FFAppState()
                                                                            .countLaundryForContinuesIncrement +
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
                                                              if (FFAppState()
                                                                      .setCustRef !=
                                                                  null) {
                                                                if (_model
                                                                        .dropDownValue ==
                                                                    'CREDIT') {
                                                                  if (FFAppState()
                                                                          .oldBalance <
                                                                      FFAppState()
                                                                          .custCredit) {
                                                                    _model.totalcredit2 =
                                                                        await actions
                                                                            .oldbalanceplusamt(
                                                                      FFAppState()
                                                                          .oldBalance,
                                                                      FFAppState()
                                                                          .finalAmt,
                                                                    );
                                                                    _shouldSetState =
                                                                        true;

                                                                    await FFAppState()
                                                                        .setCustRef!
                                                                        .update(
                                                                            createPartyRecordData(
                                                                          credit:
                                                                              true,
                                                                          oldBalance:
                                                                              valueOrDefault<int>(
                                                                            _model.totalcredit2,
                                                                            0,
                                                                          ),
                                                                          lastVisit: getCurrentTimestamp
                                                                              .millisecondsSinceEpoch
                                                                              .toString(),
                                                                        ));
                                                                  } else {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          content:
                                                                              Text('Credit Limit Exceeded !'),
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
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  }
                                                                }
                                                              }
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
                                                                    invoice: functions.genInvoiceNumLaundry(
                                                                        FFAppState()
                                                                            .countLaundryForContinuesIncrement,
                                                                        FFAppState()
                                                                            .shiftCount),
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
                                                                        _model
                                                                            .dropDownValue,
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
                                                                    shiftId: '',
                                                                    weight: FFAppState()
                                                                        .weight,
                                                                    isDeleted:
                                                                        false,
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
                                                                    invoice: functions.genInvoiceNumLaundry(
                                                                        FFAppState()
                                                                            .countLaundryForContinuesIncrement,
                                                                        FFAppState()
                                                                            .shiftCount),
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
                                                                        _model
                                                                            .dropDownValue,
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
                                                                    shiftId: '',
                                                                    weight: FFAppState()
                                                                        .weight,
                                                                    isDeleted:
                                                                        false,
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
                                                                  valueOrDefault<
                                                                      String>(
                                                                    _model
                                                                        .invonline
                                                                        ?.reference
                                                                        .id,
                                                                    'NA',
                                                                  ),
                                                                  functions.genInvoiceNumLaundry(
                                                                      FFAppState()
                                                                          .countLaundryForContinuesIncrement,
                                                                      FFAppState()
                                                                          .shiftCount),
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
                                                                  _model
                                                                      .dropDownValue!,
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
                                                                    ..billCount =
                                                                        functions.lastBillCount(FFAppState()
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
                                                                        FFAppState()
                                                                            .shiftDetails
                                                                            .cashInHand
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
                                                                    ..userId = FFAppState()
                                                                        .shiftDetails
                                                                        .userId
                                                                    ..deviceId =
                                                                        FFAppState()
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
                                                                    ..newIDShift =
                                                                        FFAppState()
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
                                                                      .shiftondata!
                                                                      .reference
                                                                      .update(
                                                                          createShiftRecordData(
                                                                    billCount: functions.lastBillCount(_model
                                                                        .getOfflineShiftdetails!
                                                                        .billCount),
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
                                                                  if (productAndListlaundrybillingAppSettingsRecord!
                                                                      .settingList
                                                                      .where((e) =>
                                                                          e.title ==
                                                                          'sendInvoiceToWhatsapp')
                                                                      .toList()
                                                                      .firstOrNull!
                                                                      .value) {
                                                                    var confirmDialogResponse =
                                                                        await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title: Text('Send Whatsapp Bill'),
                                                                                  content: Text('You want to send bill to whatsapp.'),
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
                                                                      if (FFAppState().setCustMobNo !=
                                                                              null &&
                                                                          FFAppState().setCustMobNo !=
                                                                              '') {
                                                                        _model.pdfinvoiceDoc1 =
                                                                            await queryInvoiceRecordOnce(
                                                                          parent:
                                                                              FFAppState().outletIdRef,
                                                                          queryBuilder: (invoiceRecord) =>
                                                                              invoiceRecord.where(
                                                                            'invoice',
                                                                            isEqualTo:
                                                                                functions.genInvoiceNumLaundry(FFAppState().countLaundryForContinuesIncrement, FFAppState().shiftCount),
                                                                          ),
                                                                          singleRecord:
                                                                              true,
                                                                        ).then((s) =>
                                                                                s.firstOrNull);
                                                                        _shouldSetState =
                                                                            true;
                                                                        _model.pdfheaderDoc1 =
                                                                            await queryHeaderRecordOnce(
                                                                          parent:
                                                                              FFAppState().outletIdRef,
                                                                          singleRecord:
                                                                              true,
                                                                        ).then((s) =>
                                                                                s.firstOrNull);
                                                                        _shouldSetState =
                                                                            true;
                                                                        _model.pdfOutletDoc1 =
                                                                            await queryOutletRecordOnce(
                                                                          queryBuilder: (outletRecord) =>
                                                                              outletRecord.where(
                                                                            'id',
                                                                            isEqualTo:
                                                                                FFAppState().outletIdRef?.id,
                                                                          ),
                                                                          singleRecord:
                                                                              true,
                                                                        ).then((s) =>
                                                                                s.firstOrNull);
                                                                        _shouldSetState =
                                                                            true;
                                                                        _model.base64Link1 =
                                                                            await actions.genBillInvoicePdf(
                                                                          _model
                                                                              .pdfinvoiceDoc1!,
                                                                          _model
                                                                              .pdfOutletDoc1!,
                                                                          _model
                                                                              .pdfheaderDoc1!,
                                                                        );
                                                                        _shouldSetState =
                                                                            true;
                                                                        _model.apiResultjx33 =
                                                                            await SendWhatsappMsgBillPdfCall.call(
                                                                          userMobileNumber:
                                                                              FFAppState().setCustMobNo,
                                                                          link:
                                                                              _model.base64Link1,
                                                                          name:
                                                                              FFAppState().setCustName,
                                                                          filename:
                                                                              'invoice.pdf',
                                                                          outletName: _model
                                                                              .pdfOutletDoc1
                                                                              ?.name,
                                                                        );

                                                                        _shouldSetState =
                                                                            true;
                                                                        if ((_model.apiResultjx33?.succeeded ??
                                                                            true)) {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                title: Text('Success'),
                                                                                content: Text('WhatsApp Bill Send Successfully'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext),
                                                                                    child: Text('Ok'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          );
                                                                        } else {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                title: Text('Error'),
                                                                                content: Text('Something Went Wrong!'),
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
                                                                      } else {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              title: Text('Error'),
                                                                              content: Text('Customer is not set'),
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
                                                                    } else {
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                Text('Cancelled'),
                                                                            content:
                                                                                Text('You cancel to send bill to whatsapp.'),
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
                                                                  }
                                                                } else {
                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                  return;
                                                                }

                                                                if (productAndListlaundrybillingAppSettingsRecord!
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
                                                                          .prdlistsavebill!
                                                                          .length) {
                                                                    _model.stockupdateprd =
                                                                        await queryProductRecordOnce(
                                                                      parent: FFAppState()
                                                                          .outletIdRef,
                                                                      queryBuilder: (productRecord) => productRecord
                                                                          .where(
                                                                            'id',
                                                                            isEqualTo:
                                                                                (_model.prdlistsavebill?.elementAtOrNull(FFAppState().startLoop))?.id,
                                                                          )
                                                                          .where(
                                                                            'stockable',
                                                                            isEqualTo:
                                                                                true,
                                                                          ),
                                                                      singleRecord:
                                                                          true,
                                                                    ).then((s) =>
                                                                            s.firstOrNull);
                                                                    _shouldSetState =
                                                                        true;
                                                                    if (_model
                                                                            .stockupdateprd !=
                                                                        null) {
                                                                      await _model
                                                                          .stockupdateprd!
                                                                          .reference
                                                                          .update({
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'currentStock':
                                                                                FieldValue.increment(-(functions.doubleToInt((_model.prdlistsavebill?.elementAtOrNull(FFAppState().startLoop))?.quantity)!)),
                                                                          },
                                                                        ),
                                                                      });
                                                                      _model.itemprd =
                                                                          await actions
                                                                              .hivegetproductbyId(
                                                                        _model
                                                                            .stockupdateprd
                                                                            ?.reference
                                                                            .id,
                                                                        _model
                                                                            .prdlistsavebill
                                                                            ?.elementAtOrNull(FFAppState().startLoop),
                                                                        'get',
                                                                      );
                                                                      _shouldSetState =
                                                                          true;
                                                                      FFAppState()
                                                                          .updateProductHiveputStruct(
                                                                        (e) => e
                                                                          ..id = _model
                                                                              .itemprd
                                                                              ?.id
                                                                          ..price = _model
                                                                              .itemprd
                                                                              ?.price
                                                                          ..category = _model
                                                                              .itemprd
                                                                              ?.category
                                                                          ..code = _model
                                                                              .itemprd
                                                                              ?.code
                                                                          ..name = _model
                                                                              .itemprd
                                                                              ?.name
                                                                          ..sellingPrice = _model
                                                                              .itemprd
                                                                              ?.sellingPrice
                                                                          ..mrpPrice = _model
                                                                              .itemprd
                                                                              ?.mrpPrice
                                                                          ..purchasePrice = _model
                                                                              .itemprd
                                                                              ?.purchasePrice
                                                                          ..categoryId = _model
                                                                              .itemprd
                                                                              ?.categoryId
                                                                          ..taxId = _model
                                                                              .itemprd
                                                                              ?.taxId
                                                                          ..unitId = _model
                                                                              .itemprd
                                                                              ?.unitId
                                                                          ..regionalName = _model
                                                                              .itemprd
                                                                              ?.regionalName
                                                                          ..barcode = _model
                                                                              .itemprd
                                                                              ?.barcode
                                                                          ..hsncode = _model
                                                                              .itemprd
                                                                              ?.hsncode
                                                                          ..reorderLevel = _model
                                                                              .itemprd
                                                                              ?.reorderLevel
                                                                          ..searchcode = _model
                                                                              .itemprd
                                                                              ?.searchcode
                                                                          ..shortName = _model
                                                                              .itemprd
                                                                              ?.shortName
                                                                          ..weightable = _model
                                                                              .itemprd
                                                                              ?.weightable
                                                                          ..stockable = _model
                                                                              .itemprd
                                                                              ?.stockable
                                                                          ..discountPer = _model
                                                                              .itemprd
                                                                              ?.discountPer
                                                                          ..discountAmt = _model
                                                                              .itemprd
                                                                              ?.discountAmt
                                                                          ..productMasterId = _model
                                                                              .itemprd
                                                                              ?.productMasterId
                                                                          ..recipeRefId = _model
                                                                              .itemprd
                                                                              ?.recipeRefId
                                                                          ..imageUrl = _model
                                                                              .itemprd
                                                                              ?.imageUrl
                                                                          ..serviceOutletId = _model
                                                                              .itemprd
                                                                              ?.serviceOutletId
                                                                          ..type = _model
                                                                              .itemprd
                                                                              ?.type
                                                                          ..recipeId = _model
                                                                              .itemprd
                                                                              ?.recipeId
                                                                          ..stock =
                                                                              _model.itemprd!.stock - (functions.doubleToInt((_model.prdlistsavebill?.elementAtOrNull(FFAppState().startLoop))?.quantity)!)
                                                                          ..isDeleted = _model
                                                                              .itemprd
                                                                              ?.isDeleted
                                                                          ..keywords = _model
                                                                              .itemprd!
                                                                              .keywords
                                                                              .toList()
                                                                          ..synC = _model
                                                                              .itemprd
                                                                              ?.synC
                                                                          ..hivekey = _model
                                                                              .itemprd
                                                                              ?.hivekey
                                                                          ..version = _model
                                                                              .itemprd
                                                                              ?.version,
                                                                      );
                                                                      safeSetState(
                                                                          () {});
                                                                      _model.productupdated =
                                                                          await actions
                                                                              .hiveProductCrud(
                                                                        FFAppState()
                                                                            .productHiveput
                                                                            .hivekey,
                                                                        FFAppState()
                                                                            .productHiveput,
                                                                        'update',
                                                                      );
                                                                      _shouldSetState =
                                                                          true;
                                                                      FFAppState()
                                                                          .productHive = [];
                                                                      FFAppState()
                                                                              .productHiveput =
                                                                          ProductStructStruct();
                                                                      safeSetState(
                                                                          () {});
                                                                      _model.newupdatedproductlist2 =
                                                                          await actions
                                                                              .getProductlistHive();
                                                                      _shouldSetState =
                                                                          true;
                                                                      FFAppState().productHive = _model
                                                                          .newupdatedproductlist2!
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
                                                                }
                                                                await actions
                                                                    .removeFromAllBillList(
                                                                  FFAppState()
                                                                      .selBill,
                                                                );
                                                                safeSetState(
                                                                    () {
                                                                  _model.dropDownValueController
                                                                          ?.value =
                                                                      'CASH';
                                                                });
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
                                                            } else {
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            }

                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                          },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'z97kt69q' /* Save Bill */,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width:
                                                                double.infinity,
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
                                                                    .headlineSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBtnText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .headlineSmallIsCustom,
                                                                    ),
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ).animateOnActionTrigger(
                                                          animationsMap[
                                                              'containerOnActionTriggerAnimation9']!,
                                                          hasBeenTriggered:
                                                              hasContainerTriggered9),
                                                    ),
                                                  ),
                                                Expanded(
                                                  flex: 8,
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (animationsMap[
                                                              'containerOnActionTriggerAnimation10'] !=
                                                          null) {
                                                        safeSetState(() =>
                                                            hasContainerTriggered10 =
                                                                true);
                                                        SchedulerBinding
                                                            .instance
                                                            .addPostFrameCallback((_) async =>
                                                                await animationsMap[
                                                                        'containerOnActionTriggerAnimation10']!
                                                                    .controller
                                                                    .forward(
                                                                        from:
                                                                            0.0));
                                                      }
                                                    },
                                                    child: ClipRRect(
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.15,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.085,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                        child: StreamBuilder<
                                                            OutletRecord>(
                                                          stream: OutletRecord
                                                              .getDocument(
                                                                  FFAppState()
                                                                      .outletIdRef!),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 40.0,
                                                                  height: 40.0,
                                                                  child:
                                                                      SpinKitFadingCircle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 40.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }

                                                            final buttonOutletRecord =
                                                                snapshot.data!;

                                                            return FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                var _shouldSetState =
                                                                    false;
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
                                                                          .countLaundryForContinuesIncrement =
                                                                      FFAppState()
                                                                              .countLaundryForContinuesIncrement +
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
                                                                          .countLaundryForContinuesIncrement =
                                                                      FFAppState()
                                                                              .countLaundryForContinuesIncrement +
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
                                                                if (!isAndroid) {
                                                                  await actions
                                                                      .newCustomAction5();
                                                                }
                                                                if (_model
                                                                        .dropDownValue ==
                                                                    'CREDIT') {
                                                                  if (FFAppState()
                                                                              .setCustRef
                                                                              ?.id !=
                                                                          null &&
                                                                      FFAppState()
                                                                              .setCustRef
                                                                              ?.id !=
                                                                          '') {
                                                                    if (FFAppState()
                                                                            .oldBalance <
                                                                        FFAppState()
                                                                            .custCredit) {
                                                                      _model.totalcredit =
                                                                          await actions
                                                                              .oldbalanceplusamt(
                                                                        FFAppState()
                                                                            .oldBalance,
                                                                        FFAppState()
                                                                            .finalAmt,
                                                                      );
                                                                      _shouldSetState =
                                                                          true;

                                                                      await FFAppState()
                                                                          .setCustRef!
                                                                          .update(
                                                                              createPartyRecordData(
                                                                            credit:
                                                                                true,
                                                                            oldBalance:
                                                                                valueOrDefault<int>(
                                                                              _model.totalcredit,
                                                                              0,
                                                                            ),
                                                                            lastVisit:
                                                                                getCurrentTimestamp.millisecondsSinceEpoch.toString(),
                                                                          ));
                                                                    } else {
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            content:
                                                                                Text('Credit Limit Exceeded !'),
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
                                                                          content:
                                                                              Text('Select Customer '),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: Text('Ok'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                    scaffoldKey
                                                                        .currentState!
                                                                        .openEndDrawer();
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  }
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
                                                                      invoice: functions.genInvoiceNumLaundry(
                                                                          FFAppState()
                                                                              .countLaundryForContinuesIncrement,
                                                                          FFAppState()
                                                                              .shiftCount),
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
                                                                          _model
                                                                              .dropDownValue,
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
                                                                      weight: FFAppState()
                                                                          .weight,
                                                                      isDeleted:
                                                                          false,
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
                                                                      invoice: functions.genInvoiceNumLaundry(
                                                                          FFAppState()
                                                                              .countLaundryForContinuesIncrement,
                                                                          FFAppState()
                                                                              .shiftCount),
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
                                                                          _model
                                                                              .dropDownValue,
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
                                                                      weight: FFAppState()
                                                                          .weight,
                                                                      isDeleted:
                                                                          false,
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
                                                                  _model.hiveInvoiceData =
                                                                      await actions
                                                                          .addInvoiceBillhive(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      _model
                                                                          .invonline
                                                                          ?.reference
                                                                          .id,
                                                                      'NA',
                                                                    ),
                                                                    functions.genInvoiceNumLaundry(
                                                                        FFAppState()
                                                                            .countLaundryForContinuesIncrement,
                                                                        FFAppState()
                                                                            .shiftCount),
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
                                                                    _model
                                                                        .dropDownValue!,
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
                                                                        .prdlinstnewtx
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
                                                                  _model.shiftSummarResultsNew =
                                                                      await actions
                                                                          .calShiftSummaryNew(
                                                                    _model
                                                                        .hiveInvoiceData!,
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
                                                                        functions.lastBillCount(FFAppState()
                                                                            .shiftDetails
                                                                            .billCount),
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
                                                                      ..newIDShift = FFAppState()
                                                                          .shiftDetails
                                                                          .newIDShift
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
                                                                      ..version = FFAppState()
                                                                          .shiftDetails
                                                                          .version
                                                                      ..userId = FFAppState()
                                                                          .shiftDetails
                                                                          .userId
                                                                      ..deviceId = FFAppState()
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
                                                                        .shiftondataprint!
                                                                        .reference
                                                                        .update(
                                                                            createShiftRecordData(
                                                                      billCount:
                                                                          valueOrDefault<
                                                                              int>(
                                                                        functions.lastBillCount(FFAppState()
                                                                            .shiftDetails
                                                                            .billCount),
                                                                        0,
                                                                      ),
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
                                                                            .shiftSummarResultsNew,
                                                                        r'''$.shiftId''',
                                                                      ).toString(),
                                                                    ));
                                                                    _model.updatedShiftDetails =
                                                                        await actions
                                                                            .hiveShiftCrud(
                                                                      FFAppState()
                                                                          .shiftDetails
                                                                          .newIDShift,
                                                                      FFAppState()
                                                                          .shiftDetails,
                                                                      'update',
                                                                    );
                                                                    _shouldSetState =
                                                                        true;
                                                                    if (productAndListlaundrybillingAppSettingsRecord!
                                                                        .settingList
                                                                        .where((e) =>
                                                                            e.title ==
                                                                            'sendInvoiceToWhatsapp')
                                                                        .toList()
                                                                        .firstOrNull!
                                                                        .value) {
                                                                      var confirmDialogResponse = await showDialog<
                                                                              bool>(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                title: Text('Send Whatsapp Bill'),
                                                                                content: Text('You want to send bill to whatsapp.'),
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
                                                                        if (FFAppState().setCustMobNo !=
                                                                                null &&
                                                                            FFAppState().setCustMobNo !=
                                                                                '') {
                                                                          _model.pdfinvoiceDoc =
                                                                              await queryInvoiceRecordOnce(
                                                                            parent:
                                                                                FFAppState().outletIdRef,
                                                                            queryBuilder: (invoiceRecord) =>
                                                                                invoiceRecord.where(
                                                                              'id',
                                                                              isEqualTo: _model.invonline?.id,
                                                                            ),
                                                                            singleRecord:
                                                                                true,
                                                                          ).then((s) => s.firstOrNull);
                                                                          _shouldSetState =
                                                                              true;
                                                                          _model.pdfheaderDoc =
                                                                              await queryHeaderRecordOnce(
                                                                            parent:
                                                                                FFAppState().outletIdRef,
                                                                            singleRecord:
                                                                                true,
                                                                          ).then((s) => s.firstOrNull);
                                                                          _shouldSetState =
                                                                              true;
                                                                          _model.base64Link =
                                                                              await actions.genBillInvoicePdf(
                                                                            _model.pdfinvoiceDoc!,
                                                                            buttonOutletRecord,
                                                                            _model.pdfheaderDoc!,
                                                                          );
                                                                          _shouldSetState =
                                                                              true;
                                                                          _model.apiResultjx3 =
                                                                              await SendWhatsappMsgBillPdfCall.call(
                                                                            userMobileNumber:
                                                                                FFAppState().setCustMobNo,
                                                                            link:
                                                                                _model.base64Link,
                                                                            name:
                                                                                FFAppState().setCustName,
                                                                            filename:
                                                                                'invoice.pdf',
                                                                          );

                                                                          _shouldSetState =
                                                                              true;
                                                                          if ((_model.apiResultjx3?.succeeded ??
                                                                              true)) {
                                                                            await showDialog(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title: Text('Success'),
                                                                                  content: Text('WhatsApp Bill Send Successfully'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                      child: Text('Ok'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            );
                                                                          } else {
                                                                            await showDialog(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title: Text('Error'),
                                                                                  content: Text('Something Went Wrong!'),
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
                                                                        } else {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                title: Text('Customer'),
                                                                                content: Text('Select Customer'),
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
                                                                      }
                                                                    }
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
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: Text('Ok'),
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
                                                                      .laundryPrintBillnewhive(
                                                                    _model
                                                                        .returnedList2!
                                                                        .toList(),
                                                                    _model
                                                                        .device!
                                                                        .toList(),
                                                                    FFAppState()
                                                                        .isPrinterConnected,
                                                                    FFAppState()
                                                                        .printerName,
                                                                    getJsonField(
                                                                      functions
                                                                          .outletDocToJson(
                                                                              buttonOutletRecord),
                                                                      r'''$''',
                                                                    ),
                                                                    _model
                                                                        .hiveInvoiceData!,
                                                                    FFAppState()
                                                                        .paperSize,
                                                                    productAndListlaundrybillingAppSettingsRecord!,
                                                                  );
                                                                  _model.spoutlet =
                                                                      await queryServicePointOutletRecordOnce(
                                                                    parent: FFAppState()
                                                                        .outletIdRef,
                                                                  );
                                                                  _shouldSetState =
                                                                      true;
                                                                  if (productAndListlaundrybillingAppSettingsRecord!
                                                                      .settingList
                                                                      .where((e) =>
                                                                          e.title ==
                                                                          'printKotWithBill')
                                                                      .toList()
                                                                      .firstOrNull!
                                                                      .value) {
                                                                    await actions
                                                                        .printKOTwithusbkioskhive(
                                                                      _model
                                                                          .returnedList2!
                                                                          .toList(),
                                                                      _model
                                                                          .device!
                                                                          .toList(),
                                                                      FFAppState()
                                                                          .isPrinterConnected,
                                                                      FFAppState()
                                                                          .printerName,
                                                                      _model
                                                                          .invonlineprt!,
                                                                      FFAppState()
                                                                          .paperSize,
                                                                      productAndListlaundrybillingAppSettingsRecord!,
                                                                      FFAppState()
                                                                          .port,
                                                                      FFAppState()
                                                                          .ipAddresss,
                                                                      _model
                                                                          .spoutlet!
                                                                          .toList(),
                                                                    );
                                                                  }
                                                                  if (productAndListlaundrybillingAppSettingsRecord!
                                                                      .settingList
                                                                      .where((e) =>
                                                                          e.title ==
                                                                          'enableEthernetPrint')
                                                                      .toList()
                                                                      .firstOrNull!
                                                                      .value) {
                                                                    await actions
                                                                        .printEthernethive(
                                                                      _model
                                                                          .returnedList2!
                                                                          .toList(),
                                                                      _model
                                                                          .device!
                                                                          .toList(),
                                                                      FFAppState()
                                                                          .isPrinterConnected,
                                                                      FFAppState()
                                                                          .printerName,
                                                                      _model
                                                                          .invonlineprt!,
                                                                      FFAppState()
                                                                          .paperSize,
                                                                      FFAppState()
                                                                          .port,
                                                                      FFAppState()
                                                                          .ipAddresss,
                                                                      _model
                                                                          .spoutlet!
                                                                          .toList(),
                                                                      productAndListlaundrybillingAppSettingsRecord!,
                                                                    );
                                                                  }
                                                                  if (productAndListlaundrybillingAppSettingsRecord!
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
                                                                            .prdlinstnewtx!
                                                                            .length) {
                                                                      _model.stockupdateprdprt =
                                                                          await queryProductRecordOnce(
                                                                        parent:
                                                                            FFAppState().outletIdRef,
                                                                        queryBuilder: (productRecord) => productRecord
                                                                            .where(
                                                                              'id',
                                                                              isEqualTo: (_model.prdlinstnewtx?.elementAtOrNull(FFAppState().startLoop))?.id,
                                                                            )
                                                                            .where(
                                                                              'stockable',
                                                                              isEqualTo: true,
                                                                            ),
                                                                        singleRecord:
                                                                            true,
                                                                      ).then((s) =>
                                                                              s.firstOrNull);
                                                                      _shouldSetState =
                                                                          true;
                                                                      if (_model
                                                                              .stockupdateprdprt !=
                                                                          null) {
                                                                        await _model
                                                                            .stockupdateprdprt!
                                                                            .reference
                                                                            .update({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'currentStock': FieldValue.increment(-(functions.doubleToInt((_model.prdlinstnewtx?.elementAtOrNull(FFAppState().startLoop))?.quantity)!)),
                                                                            },
                                                                          ),
                                                                        });
                                                                        _model.itemprd2 =
                                                                            await actions.hivegetproductbyId(
                                                                          _model
                                                                              .stockupdateprdprt
                                                                              ?.reference
                                                                              .id,
                                                                          _model
                                                                              .prdlinstnewtx
                                                                              ?.elementAtOrNull(FFAppState().startLoop),
                                                                          'get',
                                                                        );
                                                                        _shouldSetState =
                                                                            true;
                                                                        FFAppState()
                                                                            .updateProductHiveputStruct(
                                                                          (e) => e
                                                                            ..id =
                                                                                _model.itemprd2?.id
                                                                            ..price =
                                                                                _model.itemprd2?.price
                                                                            ..category =
                                                                                _model.itemprd2?.category
                                                                            ..code =
                                                                                _model.itemprd2?.code
                                                                            ..name =
                                                                                _model.itemprd2?.name
                                                                            ..sellingPrice =
                                                                                _model.itemprd2?.sellingPrice
                                                                            ..mrpPrice =
                                                                                _model.itemprd2?.mrpPrice
                                                                            ..purchasePrice =
                                                                                _model.itemprd2?.purchasePrice
                                                                            ..categoryId =
                                                                                _model.itemprd2?.categoryId
                                                                            ..taxId =
                                                                                _model.itemprd2?.taxId
                                                                            ..unitId =
                                                                                _model.itemprd2?.unitId
                                                                            ..regionalName =
                                                                                _model.itemprd2?.regionalName
                                                                            ..barcode =
                                                                                _model.itemprd2?.barcode
                                                                            ..hsncode =
                                                                                _model.itemprd2?.hsncode
                                                                            ..reorderLevel =
                                                                                _model.itemprd2?.reorderLevel
                                                                            ..searchcode =
                                                                                _model.itemprd2?.searchcode
                                                                            ..shortName =
                                                                                _model.itemprd2?.shortName
                                                                            ..weightable =
                                                                                _model.itemprd2?.weightable
                                                                            ..stockable =
                                                                                _model.itemprd2?.stockable
                                                                            ..discountPer =
                                                                                _model.itemprd2?.discountPer
                                                                            ..discountAmt =
                                                                                _model.itemprd2?.discountAmt
                                                                            ..productMasterId =
                                                                                _model.itemprd2?.productMasterId
                                                                            ..recipeRefId =
                                                                                _model.itemprd2?.recipeRefId
                                                                            ..imageUrl =
                                                                                _model.itemprd2?.imageUrl
                                                                            ..serviceOutletId =
                                                                                _model.itemprd2?.serviceOutletId
                                                                            ..type =
                                                                                _model.itemprd2?.type
                                                                            ..recipeId =
                                                                                _model.itemprd2?.recipeId
                                                                            ..stock =
                                                                                _model.itemprd2!.stock - (functions.doubleToInt((_model.prdlinstnewtx?.elementAtOrNull(FFAppState().startLoop))?.quantity)!)
                                                                            ..isDeleted =
                                                                                _model.itemprd2?.isDeleted
                                                                            ..keywords =
                                                                                _model.itemprd2!.keywords.toList()
                                                                            ..synC =
                                                                                _model.itemprd2?.synC
                                                                            ..hivekey =
                                                                                _model.itemprd2?.hivekey
                                                                            ..version = _model.itemprd2?.version,
                                                                        );
                                                                        safeSetState(
                                                                            () {});
                                                                        _model.productupdated2 =
                                                                            await actions.hiveProductCrud(
                                                                          FFAppState()
                                                                              .productHiveput
                                                                              .hivekey,
                                                                          FFAppState()
                                                                              .productHiveput,
                                                                          'update',
                                                                        );
                                                                        _shouldSetState =
                                                                            true;
                                                                        FFAppState().productHive =
                                                                            [];
                                                                        FFAppState().productHiveput =
                                                                            ProductStructStruct();
                                                                        safeSetState(
                                                                            () {});
                                                                        _model.newupdatedproductlist22 =
                                                                            await actions.getProductlistHive();
                                                                        _shouldSetState =
                                                                            true;
                                                                        FFAppState().productHive = _model
                                                                            .newupdatedproductlist22!
                                                                            .toList()
                                                                            .cast<ProductStructStruct>();
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
                                                                  }
                                                                  await actions
                                                                      .removeFromAllBillList(
                                                                    FFAppState()
                                                                        .selBill,
                                                                  );
                                                                  safeSetState(
                                                                      () {
                                                                    _model.dropDownValueController
                                                                            ?.value =
                                                                        'CASH';
                                                                  });
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
                                                                      _model
                                                                          .updatedShiftDetails!
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
                                                                        content:
                                                                            Text('printer not connected'),
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

                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                              },
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'ibm1gs50' /* Print Bill */,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 130.0,
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBtnText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .headlineSmallIsCustom,
                                                                    ),
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'containerOnActionTriggerAnimation10']!,
                                                      hasBeenTriggered:
                                                          hasContainerTriggered10),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
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
            ));
      },
    );
  }
}
