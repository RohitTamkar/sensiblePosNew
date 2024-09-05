import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_busines_profile_model.dart';
export 'edit_busines_profile_model.dart';

class EditBusinesProfileWidget extends StatefulWidget {
  const EditBusinesProfileWidget({
    super.key,
    this.businessMRef,
    this.id,
  });

  final DocumentReference? businessMRef;
  final String? id;

  @override
  State<EditBusinesProfileWidget> createState() =>
      _EditBusinesProfileWidgetState();
}

class _EditBusinesProfileWidgetState extends State<EditBusinesProfileWidget> {
  late EditBusinesProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditBusinesProfileModel());

    _model.textBusinessNameFocusNode ??= FocusNode();

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

    return Title(
        title: 'editBusinesProfile',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).parkingPrimary,
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 100,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 45,
                                icon: Icon(
                                  Icons.chevron_left,
                                  color: FlutterFlowTheme.of(context).lineColor,
                                  size: 24,
                                ),
                                onPressed: () async {
                                  context.safePop();
                                },
                              ),
                              AutoSizeText(
                                FFLocalizations.of(context).getText(
                                  'eshlz76z' /* Edit Business Profile */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .headlineSmallFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .lineColor,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmallFamily),
                                    ),
                              ),
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 45,
                                icon: Icon(
                                  Icons.chevron_left,
                                  color: Colors.transparent,
                                  size: 30,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 24,
                  child: StreamBuilder<List<BusinesssMasterRecord>>(
                    stream: queryBusinesssMasterRecord(
                      queryBuilder: (businesssMasterRecord) =>
                          businesssMasterRecord.where(
                        'id',
                        isEqualTo: widget!.id,
                      ),
                      singleRecord: true,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: SpinKitFadingCircle(
                              color: FlutterFlowTheme.of(context).primary,
                              size: 40,
                            ),
                          ),
                        );
                      }
                      List<BusinesssMasterRecord>
                          containerBusinesssMasterRecordList = snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final containerBusinesssMasterRecord =
                          containerBusinesssMasterRecordList.isNotEmpty
                              ? containerBusinesssMasterRecordList.first
                              : null;

                      return Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: 100,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context)
                              .parkingPrimaryBackground,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                          ),
                        ),
                        child: Form(
                          key: _model.formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 30, 20, 30),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 25),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'jyxgzuqt' /* Business Details Form */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(FlutterFlowTheme
                                                            .of(context)
                                                        .headlineMediumFamily),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 5),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'ltk14v4n' /* Business Name */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmallFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(FlutterFlowTheme
                                                            .of(context)
                                                        .headlineSmallFamily),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 15),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.92,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.055,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: TextFormField(
                                        controller: _model
                                                .textBusinessNameTextController ??=
                                            TextEditingController(
                                          text: containerBusinesssMasterRecord
                                              ?.name,
                                        ),
                                        focusNode:
                                            _model.textBusinessNameFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodySmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmallFamily),
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMediumFamily),
                                            ),
                                        validator: _model
                                            .textBusinessNameTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 5),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '4hd4lmn4' /* Business Type */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmallFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(FlutterFlowTheme
                                                            .of(context)
                                                        .headlineSmallFamily),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 15),
                                    child: StreamBuilder<BusinessTypeRecord>(
                                      stream: BusinessTypeRecord.getDocument(
                                          containerBusinesssMasterRecord!
                                              .businessType!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 40,
                                              height: 40,
                                              child: SpinKitFadingCircle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 40,
                                              ),
                                            ),
                                          );
                                        }

                                        final containerBusinessTypeRecord =
                                            snapshot.data!;

                                        return Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.92,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.055,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: StreamBuilder<
                                              List<BusinessTypeRecord>>(
                                            stream: queryBusinessTypeRecord(
                                              queryBuilder:
                                                  (businessTypeRecord) =>
                                                      businessTypeRecord.where(
                                                'active',
                                                isEqualTo: true,
                                              ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 40,
                                                    height: 40,
                                                    child: SpinKitFadingCircle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 40,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<BusinessTypeRecord>
                                                  dropDownBusinessTypeBusinessTypeRecordList =
                                                  snapshot.data!;

                                              return FlutterFlowDropDown<
                                                  String>(
                                                controller: _model
                                                        .dropDownBusinessTypeValueController ??=
                                                    FormFieldController<String>(
                                                  _model.dropDownBusinessTypeValue ??=
                                                      containerBusinessTypeRecord
                                                          .name,
                                                ),
                                                options:
                                                    dropDownBusinessTypeBusinessTypeRecordList
                                                        .map((e) => e.name)
                                                        .toList(),
                                                onChanged: (val) =>
                                                    safeSetState(() => _model
                                                            .dropDownBusinessTypeValue =
                                                        val),
                                                width: 180,
                                                height: 50,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 2,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor2,
                                                borderWidth: 0,
                                                borderRadius: 8,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(12, 4, 12, 4),
                                                hidesUnderline: true,
                                                isSearchable: false,
                                                isMultiSelect: false,
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  StreamBuilder<List<BusinessTypeRecord>>(
                                    stream: queryBusinessTypeRecord(
                                      queryBuilder: (businessTypeRecord) =>
                                          businessTypeRecord.where(
                                        'name',
                                        isEqualTo:
                                            _model.dropDownBusinessTypeValue,
                                      ),
                                      singleRecord: true,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 40,
                                            height: 40,
                                            child: SpinKitFadingCircle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 40,
                                            ),
                                          ),
                                        );
                                      }
                                      List<BusinessTypeRecord>
                                          rowBusinessTypeRecordList =
                                          snapshot.data!;
                                      // Return an empty Container when the item does not exist.
                                      if (snapshot.data!.isEmpty) {
                                        return Container();
                                      }
                                      final rowBusinessTypeRecord =
                                          rowBusinessTypeRecordList.isNotEmpty
                                              ? rowBusinessTypeRecordList.first
                                              : null;

                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          StreamBuilder<
                                              List<UserProfileRecord>>(
                                            stream: queryUserProfileRecord(
                                              queryBuilder:
                                                  (userProfileRecord) =>
                                                      userProfileRecord.where(
                                                'mobile',
                                                isEqualTo: FFAppState()
                                                    .currentMobileString,
                                              ),
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 40,
                                                    height: 40,
                                                    child: SpinKitFadingCircle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 40,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<UserProfileRecord>
                                                  buttonUserProfileRecordList =
                                                  snapshot.data!;
                                              final buttonUserProfileRecord =
                                                  buttonUserProfileRecordList
                                                          .isNotEmpty
                                                      ? buttonUserProfileRecordList
                                                          .first
                                                      : null;

                                              return FFButtonWidget(
                                                onPressed: (_model
                                                            .textBusinessNameTextController
                                                            .text ==
                                                        containerBusinesssMasterRecord
                                                            ?.name)
                                                    ? null
                                                    : () async {
                                                        await containerBusinesssMasterRecord!
                                                            .reference
                                                            .update(
                                                                createBusinesssMasterRecordData(
                                                          name: functions
                                                              .toCapitalLetter1(
                                                                  _model
                                                                      .textBusinessNameTextController
                                                                      .text),
                                                          businessType:
                                                              rowBusinessTypeRecord
                                                                  ?.reference,
                                                          updatedDate: functions
                                                              .getcreatedDate(),
                                                          updatedBy:
                                                              buttonUserProfileRecord
                                                                  ?.reference,
                                                        ));
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Business Details'),
                                                              content: Text(
                                                                  'Business Details Updated'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );

                                                        context.pushNamed(
                                                          'businessProfileAdminfinal',
                                                          queryParameters: {
                                                            'mobileNo':
                                                                serializeParam(
                                                              FFAppState()
                                                                  .currentMobileString,
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'oksqi3qc' /* Update */,
                                                ),
                                                options: FFButtonOptions(
                                                  width: 140,
                                                  height: 40,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0, 0, 0, 0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .parkingSecondaryBackground,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily),
                                                      ),
                                                  elevation: 2,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  disabledColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
