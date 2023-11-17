import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/input_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dynamic_component_model.dart';
export 'dynamic_component_model.dart';

class DynamicComponentWidget extends StatefulWidget {
  const DynamicComponentWidget({
    Key? key,
    this.fieldsReferences,
    required this.accountReference,
    this.userAccountReference,
    this.jsonEmpty,
    this.aliasIndex,
  }) : super(key: key);

  final List<DocumentReference>? fieldsReferences;
  final AccountsRecord? accountReference;
  final DocumentReference? userAccountReference;
  final List<String>? jsonEmpty;
  final int? aliasIndex;

  @override
  _DynamicComponentWidgetState createState() => _DynamicComponentWidgetState();
}

class _DynamicComponentWidgetState extends State<DynamicComponentWidget>
    with TickerProviderStateMixin {
  late DynamicComponentModel _model;

  final animationsMap = {
    'dropDownOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 140.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 140.ms,
          duration: 600.ms,
          begin: Offset(0.0, 70.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 140.ms,
          duration: 600.ms,
          begin: Offset(1.0, 0.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'textFieldOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 140.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 140.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 140.ms,
          duration: 600.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'dropDownOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 140.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 140.ms,
          duration: 600.ms,
          begin: Offset(0.0, 70.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 140.ms,
          duration: 600.ms,
          begin: Offset(1.0, 0.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'textFieldOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 140.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 140.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 140.ms,
          duration: 600.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DynamicComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().insertAtIndexInValuesAndErrorsData(
            0, functions.createInputObject('', 'business', 0, 0)!);
      });
      setState(() {
        FFAppState().insertAtIndexInValuesAndErrorsData(
            1, functions.createInputObject('', 'alias', 0, 0)!);
      });
    });

    _model.aliasEditFocusNode ??= FocusNode();

    _model.aliasCreateController ??= TextEditingController();
    _model.aliasCreateFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<BusinessRecord>>(
      stream: queryBusinessRecord(
        queryBuilder: (businessRecord) => businessRecord.where(
          'business_name',
          isEqualTo: _model.businessEditValue,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: SpinKitFoldingCube(
                color: FlutterFlowTheme.of(context).primary,
                size: 50.0,
              ),
            ),
          );
        }
        List<BusinessRecord> columnBusinessRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final columnBusinessRecord = columnBusinessRecordList.isNotEmpty
            ? columnBusinessRecordList.first
            : null;
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 20.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.safePop();
                      },
                      child: Icon(
                        Icons.arrow_back_outlined,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 40.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 24.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '0slcaof7' /* Rellena el siguiente formulari... */,
                            ),
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodySmall
                                .override(
                                  fontFamily: 'Lexend',
                                  fontSize: MediaQuery.sizeOf(context).width >
                                          kBreakpointSmall
                                      ? 15.0
                                      : 14.0,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 10.0, 0.0),
                          child: StreamBuilder<AccountsRecord>(
                            stream: AccountsRecord.getDocument(
                                widget.accountReference!.reference),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: SpinKitFoldingCube(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              final textAccountsRecord = snapshot.data!;
                              return Text(
                                textAccountsRecord.name,
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Lexend',
                                      fontSize:
                                          MediaQuery.sizeOf(context).width >
                                                  kBreakpointSmall
                                              ? 17.0
                                              : 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                child: Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (widget.userAccountReference != null)
                        StreamBuilder<UserAccountsRecord>(
                          stream: UserAccountsRecord.getDocument(
                              widget.userAccountReference!),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 40.0,
                                  height: 40.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            final editColumnUserAccountsRecord = snapshot.data!;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (widget.accountReference?.operation ==
                                    'inscribir')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 20.0, 24.0, 0.0),
                                    child: StreamBuilder<List<BusinessRecord>>(
                                      stream: queryBusinessRecord(
                                        queryBuilder: (businessRecord) =>
                                            businessRecord.where(
                                          'business_category',
                                          isEqualTo: widget
                                              .accountReference?.reference,
                                        ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: SpinKitFoldingCube(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 50.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<BusinessRecord>
                                            businessEditBusinessRecordList =
                                            snapshot.data!;
                                        return FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .businessEditValueController ??=
                                              FormFieldController<String>(
                                            _model.businessEditValue ??=
                                                functions.getValueFromJsonArray(
                                                    editColumnUserAccountsRecord
                                                        .values
                                                        .toList(),
                                                    'business'),
                                          ),
                                          options:
                                              businessEditBusinessRecordList
                                                  .map((e) => e.businessName)
                                                  .toList(),
                                          onChanged: (val) async {
                                            setState(() =>
                                                _model.businessEditValue = val);
                                            setState(() {
                                              FFAppState()
                                                  .updateValuesAndErrorsDataAtIndex(
                                                0,
                                                (_) =>
                                                    functions.createInputObject(
                                                        _model
                                                            .businessEditValue,
                                                        'business',
                                                        0,
                                                        0)!,
                                              );
                                            });
                                          },
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 60.0,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                          hintText:
                                              'Seleccione una empresa (${widget.accountReference?.name})',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .grayLight,
                                            size: 15.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2.0,
                                          borderColor: Colors.transparent,
                                          borderWidth: 2.0,
                                          borderRadius: 8.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 20.0, 12.0, 20.0),
                                          hidesUnderline: true,
                                          disabled: true,
                                          isSearchable: true,
                                          isMultiSelect: false,
                                        ).animateOnPageLoad(animationsMap[
                                            'dropDownOnPageLoadAnimation1']!);
                                      },
                                    ),
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 20.0, 24.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.aliasEditController ??=
                                        TextEditingController(
                                      text: functions.getValueFromJsonArray(
                                          editColumnUserAccountsRecord.values
                                              .toList(),
                                          'alias'),
                                    ),
                                    focusNode: _model.aliasEditFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.aliasEditController',
                                      Duration(milliseconds: 2000),
                                      () async {
                                        setState(() {
                                          FFAppState()
                                              .updateValuesAndErrorsDataAtIndex(
                                            1,
                                            (_) => functions.createInputObject(
                                                _model.aliasEditController.text,
                                                'alias',
                                                0,
                                                0)!,
                                          );
                                        });
                                      },
                                    ),
                                    textCapitalization: TextCapitalization.none,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText:
                                          'Alias Ej: Cuenta ${columnBusinessRecord?.businessName}',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20.0, 24.0, 20.0, 24.0),
                                      suffixIcon: _model.aliasEditController!
                                              .text.isNotEmpty
                                          ? InkWell(
                                              onTap: () async {
                                                _model.aliasEditController
                                                    ?.clear();
                                                setState(() {
                                                  FFAppState()
                                                      .updateValuesAndErrorsDataAtIndex(
                                                    1,
                                                    (_) => functions
                                                        .createInputObject(
                                                            _model
                                                                .aliasEditController
                                                                .text,
                                                            'alias',
                                                            0,
                                                            0)!,
                                                  );
                                                });
                                                setState(() {});
                                              },
                                              child: Icon(
                                                Icons.clear,
                                                color: Color(0xFF757575),
                                                size: 22.0,
                                              ),
                                            )
                                          : null,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    validator: _model
                                        .aliasEditControllerValidator
                                        .asValidator(context),
                                  ).animateOnPageLoad(animationsMap[
                                      'textFieldOnPageLoadAnimation1']!),
                                ),
                                Builder(
                                  builder: (context) {
                                    final fieldReferences = widget
                                            .fieldsReferences
                                            ?.map((e) => e)
                                            .toList()
                                            ?.toList() ??
                                        [];
                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: fieldReferences.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 0.0),
                                      itemBuilder:
                                          (context, fieldReferencesIndex) {
                                        final fieldReferencesItem =
                                            fieldReferences[
                                                fieldReferencesIndex];
                                        return Container(
                                          decoration: BoxDecoration(),
                                          child: StreamBuilder<FieldsRecord>(
                                            stream: FieldsRecord.getDocument(
                                                fieldReferencesItem),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child: SpinKitFoldingCube(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              final inputComponentFieldsRecord =
                                                  snapshot.data!;
                                              return InputComponentWidget(
                                                key: Key(
                                                    'Keygtn_${fieldReferencesIndex}_of_${fieldReferences.length}'),
                                                fieldReferenceParam:
                                                    fieldReferencesItem,
                                                currentIndex:
                                                    fieldReferencesIndex + 2,
                                                documentParam:
                                                    inputComponentFieldsRecord,
                                                valuesArray:
                                                    editColumnUserAccountsRecord
                                                        .values,
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (columnBusinessRecord
                                                ?.instructionsText !=
                                            null &&
                                        columnBusinessRecord
                                                ?.instructionsText !=
                                            '')
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.00, 0.00),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          child: Text(
                                            columnBusinessRecord!
                                                .instructionsText,
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ),
                                        ),
                                      ),
                                    if (columnBusinessRecord
                                                ?.instructionsImage !=
                                            null &&
                                        columnBusinessRecord
                                                ?.instructionsImage !=
                                            '')
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 20.0, 24.0, 0.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              columnBusinessRecord!
                                                  .instructionsImage,
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.551,
                                              height: 300.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 24.0, 24.0, 24.0),
                                  child: StreamBuilder<List<FieldsRecord>>(
                                    stream: queryFieldsRecord(),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: SpinKitFoldingCube(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 50.0,
                                            ),
                                          ),
                                        );
                                      }
                                      List<FieldsRecord>
                                          editButtonFieldsRecordList =
                                          snapshot.data!;
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onDoubleTap: () async {
                                          // Limpiar Variable Local
                                          setState(() {
                                            _model.validationValues = [];
                                          });
                                          // Asignar Datos App a local
                                          setState(() {
                                            _model.validationValues =
                                                FFAppState()
                                                    .valuesAndErrorsData
                                                    .toList()
                                                    .cast<dynamic>();
                                          });
                                          if (widget.accountReference
                                                  ?.operation !=
                                              'inscribir') {
                                            if (functions.validateSubmutForm(
                                                FFAppState()
                                                    .valuesAndErrorsData
                                                    .toList(),
                                                editButtonFieldsRecordList
                                                    .toList())!) {
                                              // saverObjects

                                              await UserAccountsRecord
                                                  .collection
                                                  .doc()
                                                  .set({
                                                ...createUserAccountsRecordData(
                                                  user: currentUserReference,
                                                  account: widget
                                                      .accountReference
                                                      ?.reference,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'values':
                                                        FFAppState().valuesForm,
                                                  },
                                                ),
                                              });

                                              context
                                                  .pushNamed('paginaPrincipal');

                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('Correcto!'),
                                                    content: Text(
                                                        'Cuenta inscrita correctamente'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            } else {
                                              // Limpiar Variable App
                                              setState(() {
                                                FFAppState()
                                                    .valuesAndErrorsData = [];
                                              });
                                              // Actualizar Variable App
                                              setState(() {
                                                FFAppState()
                                                        .valuesAndErrorsData =
                                                    functions
                                                        .submitFormValidation(
                                                            editButtonFieldsRecordList
                                                                .toList(),
                                                            _model
                                                                .validationValues
                                                                .toList())
                                                        .toList()
                                                        .cast<dynamic>();
                                              });
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('cwecwec'),
                                                    content: Text('wecwecwec'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            }
                                          } else {
                                            if (functions.validateSubmutForm(
                                                FFAppState()
                                                    .valuesAndErrorsData
                                                    .toList(),
                                                editButtonFieldsRecordList
                                                    .toList())!) {
                                              context.pushNamed(
                                                'paginaDestinatario',
                                                queryParameters: {
                                                  'accoutParam': serializeParam(
                                                    widget.accountReference
                                                        ?.reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else {
                                              // Limpiar Variable App
                                              setState(() {
                                                FFAppState()
                                                    .valuesAndErrorsData = [];
                                              });
                                              // Actualizar Variable App
                                              setState(() {
                                                FFAppState()
                                                        .valuesAndErrorsData =
                                                    functions
                                                        .submitFormValidation(
                                                            editButtonFieldsRecordList
                                                                .toList(),
                                                            _model
                                                                .validationValues
                                                                .toList())
                                                        .toList()
                                                        .cast<dynamic>();
                                              });
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('cwecwec'),
                                                    content: Text('wecwecwec'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            }
                                          }
                                        },
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            // Limpiar Variable Local
                                            setState(() {
                                              _model.validationValues = [];
                                            });
                                            // Asignar Datos App a local
                                            setState(() {
                                              _model.validationValues =
                                                  FFAppState()
                                                      .valuesAndErrorsData
                                                      .toList()
                                                      .cast<dynamic>();
                                            });
                                            if (widget.accountReference
                                                    ?.operation !=
                                                'inscribir') {
                                              if (functions.validateSubmutForm(
                                                  FFAppState()
                                                      .valuesAndErrorsData
                                                      .toList(),
                                                  editButtonFieldsRecordList
                                                      .toList())!) {
                                                // saverObjects

                                                await UserAccountsRecord
                                                    .collection
                                                    .doc()
                                                    .set({
                                                  ...createUserAccountsRecordData(
                                                    user: currentUserReference,
                                                    account: widget
                                                        .accountReference
                                                        ?.reference,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'values': FFAppState()
                                                          .valuesForm,
                                                    },
                                                  ),
                                                });

                                                context.pushNamed(
                                                    'paginaPrincipal');

                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text('Correcto!'),
                                                      content: Text(
                                                          'Cuenta inscrita correctamente'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: Text('Ok'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              } else {
                                                // Limpiar Variable App
                                                setState(() {
                                                  FFAppState()
                                                      .valuesAndErrorsData = [];
                                                });
                                                // Actualizar Variable App
                                                setState(() {
                                                  FFAppState()
                                                          .valuesAndErrorsData =
                                                      functions
                                                          .submitFormValidation(
                                                              editButtonFieldsRecordList
                                                                  .toList(),
                                                              _model
                                                                  .validationValues
                                                                  .toList())
                                                          .toList()
                                                          .cast<dynamic>();
                                                });
                                              }
                                            } else {
                                              if (functions.validateSubmutForm(
                                                  FFAppState()
                                                      .valuesAndErrorsData
                                                      .toList(),
                                                  editButtonFieldsRecordList
                                                      .toList())!) {
                                                context.pushNamed(
                                                  'paginaDestinatario',
                                                  queryParameters: {
                                                    'accoutParam':
                                                        serializeParam(
                                                      widget.accountReference
                                                          ?.reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                // Limpiar Variable App
                                                setState(() {
                                                  FFAppState()
                                                      .valuesAndErrorsData = [];
                                                });
                                                // Actualizar Variable App
                                                setState(() {
                                                  FFAppState()
                                                          .valuesAndErrorsData =
                                                      functions
                                                          .submitFormValidation(
                                                              editButtonFieldsRecordList
                                                                  .toList(),
                                                              _model
                                                                  .validationValues
                                                                  .toList())
                                                          .toList()
                                                          .cast<dynamic>();
                                                });
                                              }
                                            }
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '73pjqr4l' /* Actualizar Datos */,
                                          ),
                                          icon: Icon(
                                            Icons.save_as,
                                            size: 15.0,
                                          ),
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 56.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Lexend',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .textColor,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      if (widget.userAccountReference == null)
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (widget.accountReference?.operation ==
                                'inscribir')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 20.0, 24.0, 0.0),
                                child: StreamBuilder<List<BusinessRecord>>(
                                  stream: queryBusinessRecord(
                                    queryBuilder: (businessRecord) =>
                                        businessRecord.where(
                                      'business_category',
                                      isEqualTo:
                                          widget.accountReference?.reference,
                                    ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: SpinKitFoldingCube(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<BusinessRecord>
                                        businessCreateBusinessRecordList =
                                        snapshot.data!;
                                    return FlutterFlowDropDown<String>(
                                      controller: _model
                                              .businessCreateValueController ??=
                                          FormFieldController<String>(null),
                                      options: businessCreateBusinessRecordList
                                          .map((e) => e.businessName)
                                          .toList(),
                                      onChanged: (val) async {
                                        setState(() =>
                                            _model.businessCreateValue = val);
                                        setState(() {
                                          FFAppState()
                                              .updateValuesAndErrorsDataAtIndex(
                                            0,
                                            (_) => functions.createInputObject(
                                                _model.businessCreateValue,
                                                'business',
                                                0,
                                                0)!,
                                          );
                                        });
                                      },
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 60.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      hintText: 'Seleccione una empresa ',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .grayLight,
                                        size: 15.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: Colors.transparent,
                                      borderWidth: 2.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 20.0, 12.0, 20.0),
                                      hidesUnderline: true,
                                      isSearchable: true,
                                      isMultiSelect: false,
                                    ).animateOnPageLoad(animationsMap[
                                        'dropDownOnPageLoadAnimation2']!);
                                  },
                                ),
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 20.0, 24.0, 0.0),
                              child: TextFormField(
                                controller: _model.aliasCreateController,
                                focusNode: _model.aliasCreateFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.aliasCreateController',
                                  Duration(milliseconds: 2000),
                                  () async {
                                    setState(() {
                                      FFAppState()
                                          .updateValuesAndErrorsDataAtIndex(
                                        1,
                                        (_) => functions.createInputObject(
                                            _model.aliasCreateController.text,
                                            'alias',
                                            0,
                                            0)!,
                                      );
                                    });
                                  },
                                ),
                                textCapitalization: TextCapitalization.none,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Alias Ej: Cuenta ',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).bodySmall,
                                  hintStyle:
                                      FlutterFlowTheme.of(context).bodySmall,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          20.0, 24.0, 20.0, 24.0),
                                  suffixIcon: _model.aliasCreateController!.text
                                          .isNotEmpty
                                      ? InkWell(
                                          onTap: () async {
                                            _model.aliasCreateController
                                                ?.clear();
                                            setState(() {
                                              FFAppState()
                                                  .updateValuesAndErrorsDataAtIndex(
                                                1,
                                                (_) =>
                                                    functions.createInputObject(
                                                        _model
                                                            .aliasCreateController
                                                            .text,
                                                        'alias',
                                                        0,
                                                        0)!,
                                              );
                                            });
                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.clear,
                                            color: Color(0xFF757575),
                                            size: 22.0,
                                          ),
                                        )
                                      : null,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                validator: _model.aliasCreateControllerValidator
                                    .asValidator(context),
                              ).animateOnPageLoad(animationsMap[
                                  'textFieldOnPageLoadAnimation2']!),
                            ),
                            Builder(
                              builder: (context) {
                                final fieldReferences = widget.fieldsReferences
                                        ?.map((e) => e)
                                        .toList()
                                        ?.toList() ??
                                    [];
                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: fieldReferences.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 0.0),
                                  itemBuilder: (context, fieldReferencesIndex) {
                                    final fieldReferencesItem =
                                        fieldReferences[fieldReferencesIndex];
                                    return Container(
                                      decoration: BoxDecoration(),
                                      child: StreamBuilder<FieldsRecord>(
                                        stream: FieldsRecord.getDocument(
                                            fieldReferencesItem),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child: SpinKitFoldingCube(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 50.0,
                                                ),
                                              ),
                                            );
                                          }
                                          final inputComponentFieldsRecord =
                                              snapshot.data!;
                                          return InputComponentWidget(
                                            key: Key(
                                                'Keyegk_${fieldReferencesIndex}_of_${fieldReferences.length}'),
                                            fieldReferenceParam:
                                                fieldReferencesItem,
                                            currentIndex:
                                                fieldReferencesIndex + 2,
                                            documentParam:
                                                inputComponentFieldsRecord,
                                            valuesArray: widget.jsonEmpty,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 24.0, 24.0, 24.0),
                              child: StreamBuilder<List<FieldsRecord>>(
                                stream: queryFieldsRecord(),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: SpinKitFoldingCube(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 50.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<FieldsRecord>
                                      creatButtonFieldsRecordList =
                                      snapshot.data!;
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onDoubleTap: () async {
                                      // Limpiar Variable Local
                                      setState(() {
                                        _model.validationValues = [];
                                      });
                                      // Asignar Datos App a local
                                      setState(() {
                                        _model.validationValues = FFAppState()
                                            .valuesAndErrorsData
                                            .toList()
                                            .cast<dynamic>();
                                      });
                                      if (widget.accountReference?.operation !=
                                          'inscribir') {
                                        if (functions.validateSubmutForm(
                                            FFAppState()
                                                .valuesAndErrorsData
                                                .toList(),
                                            creatButtonFieldsRecordList
                                                .toList())!) {
                                          // saverObjects

                                          await UserAccountsRecord.collection
                                              .doc()
                                              .set({
                                            ...createUserAccountsRecordData(
                                              user: currentUserReference,
                                              account: widget
                                                  .accountReference?.reference,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'values':
                                                    FFAppState().valuesForm,
                                              },
                                            ),
                                          });

                                          context.pushNamed('paginaPrincipal');

                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Correcto!'),
                                                content: Text(
                                                    'Cuenta inscrita correctamente'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        } else {
                                          // Limpiar Variable App
                                          setState(() {
                                            FFAppState().valuesAndErrorsData =
                                                [];
                                          });
                                          // Actualizar Variable App
                                          setState(() {
                                            FFAppState().valuesAndErrorsData =
                                                functions
                                                    .submitFormValidation(
                                                        creatButtonFieldsRecordList
                                                            .toList(),
                                                        _model.validationValues
                                                            .toList())
                                                    .toList()
                                                    .cast<dynamic>();
                                          });
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('cwecwec'),
                                                content: Text('wecwecwec'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      } else {
                                        if (functions.validateSubmutForm(
                                            FFAppState()
                                                .valuesAndErrorsData
                                                .toList(),
                                            creatButtonFieldsRecordList
                                                .toList())!) {
                                          context.pushNamed(
                                            'paginaDestinatario',
                                            queryParameters: {
                                              'accoutParam': serializeParam(
                                                widget.accountReference
                                                    ?.reference,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                          );
                                        } else {
                                          // Limpiar Variable App
                                          setState(() {
                                            FFAppState().valuesAndErrorsData =
                                                [];
                                          });
                                          // Actualizar Variable App
                                          setState(() {
                                            FFAppState().valuesAndErrorsData =
                                                functions
                                                    .submitFormValidation(
                                                        creatButtonFieldsRecordList
                                                            .toList(),
                                                        _model.validationValues
                                                            .toList())
                                                    .toList()
                                                    .cast<dynamic>();
                                          });
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('cwecwec'),
                                                content: Text('wecwecwec'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      }
                                    },
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await Future.delayed(
                                            const Duration(milliseconds: 3000));
                                        // Limpiar Variable Local
                                        setState(() {
                                          _model.validationValues = [];
                                        });
                                        // Asignar Datos App a local
                                        setState(() {
                                          _model.validationValues = FFAppState()
                                              .valuesAndErrorsData
                                              .toList()
                                              .cast<dynamic>();
                                        });
                                        if (widget
                                                .accountReference?.operation ==
                                            'inscribir') {
                                          if (functions.validateSubmutForm(
                                              FFAppState()
                                                  .valuesAndErrorsData
                                                  .toList(),
                                              creatButtonFieldsRecordList
                                                  .toList())!) {
                                            // saverObjects

                                            await UserAccountsRecord.collection
                                                .doc()
                                                .set({
                                              ...createUserAccountsRecordData(
                                                user: currentUserReference,
                                                account: widget.accountReference
                                                    ?.reference,
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'values': functions
                                                      .generateSendData(
                                                          FFAppState()
                                                              .valuesAndErrorsData
                                                              .toList()),
                                                },
                                              ),
                                            });

                                            context
                                                .pushNamed('paginaPrincipal');

                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Correcto!'),
                                                  content: Text(
                                                      'Cuenta inscrita correctamente'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          } else {
                                            // Limpiar Variable App
                                            setState(() {
                                              FFAppState().valuesAndErrorsData =
                                                  [];
                                            });
                                            // Actualizar Variable App
                                            setState(() {
                                              FFAppState().valuesAndErrorsData =
                                                  functions
                                                      .submitFormValidation(
                                                          creatButtonFieldsRecordList
                                                              .toList(),
                                                          _model
                                                              .validationValues
                                                              .toList())
                                                      .toList()
                                                      .cast<dynamic>();
                                            });
                                          }
                                        } else {
                                          if (functions.validateSubmutForm(
                                              FFAppState()
                                                  .valuesAndErrorsData
                                                  .toList(),
                                              creatButtonFieldsRecordList
                                                  .toList())!) {
                                            context.pushNamed(
                                              'paginaDestinatario',
                                              queryParameters: {
                                                'accoutParam': serializeParam(
                                                  widget.accountReference
                                                      ?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          } else {
                                            // Limpiar Variable App
                                            setState(() {
                                              FFAppState().valuesAndErrorsData =
                                                  [];
                                            });
                                            // Actualizar Variable App
                                            setState(() {
                                              FFAppState().valuesAndErrorsData =
                                                  functions
                                                      .submitFormValidation(
                                                          creatButtonFieldsRecordList
                                                              .toList(),
                                                          _model
                                                              .validationValues
                                                              .toList())
                                                      .toList()
                                                      .cast<dynamic>();
                                            });
                                          }
                                        }
                                      },
                                      text:
                                          widget.accountReference?.operation ==
                                                  'inscribir'
                                              ? 'Inscribir Cuenta'
                                              : 'Continuar',
                                      options: FFButtonOptions(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 56.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Lexend',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .textColor,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                    ),
                                  );
                                },
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
        );
      },
    );
  }
}
