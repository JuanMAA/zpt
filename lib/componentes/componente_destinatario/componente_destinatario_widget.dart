import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
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
import 'componente_destinatario_model.dart';
export 'componente_destinatario_model.dart';

class ComponenteDestinatarioWidget extends StatefulWidget {
  const ComponenteDestinatarioWidget({
    Key? key,
    required this.accounParam,
  }) : super(key: key);

  final DocumentReference? accounParam;

  @override
  _ComponenteDestinatarioWidgetState createState() =>
      _ComponenteDestinatarioWidgetState();
}

class _ComponenteDestinatarioWidgetState
    extends State<ComponenteDestinatarioWidget> with TickerProviderStateMixin {
  late ComponenteDestinatarioModel _model;

  final animationsMap = {
    'dropDownOnPageLoadAnimation': AnimationInfo(
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
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponenteDestinatarioModel());

    _model.rutRecipientController ??= TextEditingController();
    _model.rutRecipientFocusNode ??= FocusNode();

    _model.nameRecipientController ??= TextEditingController();
    _model.nameRecipientFocusNode ??= FocusNode();

    _model.numberAcountRecipientController ??= TextEditingController();
    _model.numberAcountRecipientFocusNode ??= FocusNode();

    _model.emailAddressRecipientController ??= TextEditingController();
    _model.emailAddressRecipientFocusNode ??= FocusNode();

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 0.0, 0.0),
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 24.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '4ndkun6a' /* ¿Cuáles son los datos bancario... */,
                      ),
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Lexend',
                            fontSize: MediaQuery.sizeOf(context).width >
                                    kBreakpointSmall
                                ? 17.0
                                : 14.0,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: _model.formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 20.0, 24.0, 0.0),
                    child: TextFormField(
                      controller: _model.rutRecipientController,
                      focusNode: _model.rutRecipientFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.rutRecipientController',
                        Duration(milliseconds: 2000),
                        () => setState(() {}),
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: FFLocalizations.of(context).getText(
                          's789fo0f' /* RUT Destinatario */,
                        ),
                        labelStyle: FlutterFlowTheme.of(context).bodySmall,
                        hintText: FFLocalizations.of(context).getText(
                          'ljboi5nr' /* Ej: 9.999.999-9 */,
                        ),
                        hintStyle: FlutterFlowTheme.of(context).bodySmall,
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
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 24.0, 20.0, 24.0),
                        suffixIcon:
                            _model.rutRecipientController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.rutRecipientController?.clear();
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
                      validator: _model.rutRecipientControllerValidator
                          .asValidator(context),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 20.0, 24.0, 0.0),
                    child: TextFormField(
                      controller: _model.nameRecipientController,
                      focusNode: _model.nameRecipientFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.nameRecipientController',
                        Duration(milliseconds: 2000),
                        () => setState(() {}),
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: FFLocalizations.of(context).getText(
                          'og89hzvy' /* Nombre */,
                        ),
                        labelStyle: FlutterFlowTheme.of(context).bodySmall,
                        hintText: FFLocalizations.of(context).getText(
                          'euxg5eno' /* Ej: Juan Mansilla */,
                        ),
                        hintStyle: FlutterFlowTheme.of(context).bodySmall,
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
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 24.0, 20.0, 24.0),
                        suffixIcon:
                            _model.nameRecipientController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.nameRecipientController?.clear();
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
                      validator: _model.nameRecipientControllerValidator
                          .asValidator(context),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 20.0, 24.0, 0.0),
                    child: StreamBuilder<List<BanksRecord>>(
                      stream: queryBanksRecord(),
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
                        List<BanksRecord> bankRecipientBanksRecordList =
                            snapshot.data!;
                        return FlutterFlowDropDown<String>(
                          controller: _model.bankRecipientValueController ??=
                              FormFieldController<String>(null),
                          options: bankRecipientBanksRecordList
                              .map((e) => e.bankName)
                              .toList(),
                          onChanged: (val) async {
                            setState(() => _model.bankRecipientValue = val);
                            setState(() {
                              FFAppState().selectedBusiness =
                                  _model.bankRecipientValue!;
                            });
                          },
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 60.0,
                          searchHintTextStyle: TextStyle(),
                          textStyle: FlutterFlowTheme.of(context).bodyMedium,
                          hintText: FFLocalizations.of(context).getText(
                            '8kbk6jpj' /* Seleccione un banco */,
                          ),
                          searchHintText: FFLocalizations.of(context).getText(
                            'm8p6l8pr' /* Buscar un banco */,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).grayLight,
                            size: 15.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: Colors.transparent,
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 12.0, 20.0),
                          hidesUnderline: true,
                          isSearchable: true,
                          isMultiSelect: false,
                        ).animateOnPageLoad(
                            animationsMap['dropDownOnPageLoadAnimation']!);
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 15.0, 0.0, 0.0),
                    child: FlutterFlowRadioButton(
                      options: [
                        FFLocalizations.of(context).getText(
                          '04n6ol8m' /* Cuenta Corriente */,
                        ),
                        FFLocalizations.of(context).getText(
                          'dl3g2jjn' /* Cuenta Vista */,
                        )
                      ].toList(),
                      onChanged: (val) => setState(() {}),
                      controller: _model.typeAccountRecipientValueController ??=
                          FormFieldController<String>(
                              FFLocalizations.of(context).getText(
                        'bjv6b07y' /* Cuenta Corriente */,
                      )),
                      optionHeight: 32.0,
                      textStyle: FlutterFlowTheme.of(context).labelMedium,
                      selectedTextStyle:
                          FlutterFlowTheme.of(context).bodyMedium,
                      buttonPosition: RadioButtonPosition.left,
                      direction: Axis.horizontal,
                      radioButtonColor: FlutterFlowTheme.of(context).primary,
                      inactiveRadioButtonColor:
                          FlutterFlowTheme.of(context).secondaryText,
                      toggleable: false,
                      horizontalAlignment: WrapAlignment.start,
                      verticalAlignment: WrapCrossAlignment.start,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 20.0, 24.0, 0.0),
                    child: TextFormField(
                      controller: _model.numberAcountRecipientController,
                      focusNode: _model.numberAcountRecipientFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.numberAcountRecipientController',
                        Duration(milliseconds: 2000),
                        () => setState(() {}),
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: FFLocalizations.of(context).getText(
                          '641uypkf' /* Número de Cuenta */,
                        ),
                        labelStyle: FlutterFlowTheme.of(context).bodySmall,
                        hintText: FFLocalizations.of(context).getText(
                          'igwfl4vy' /* Ej: 099999999 */,
                        ),
                        hintStyle: FlutterFlowTheme.of(context).bodySmall,
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
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 24.0, 20.0, 24.0),
                        suffixIcon: _model.numberAcountRecipientController!.text
                                .isNotEmpty
                            ? InkWell(
                                onTap: () async {
                                  _model.numberAcountRecipientController
                                      ?.clear();
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
                      keyboardType: TextInputType.number,
                      validator: _model.numberAcountRecipientControllerValidator
                          .asValidator(context),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 20.0, 24.0, 0.0),
                    child: TextFormField(
                      controller: _model.emailAddressRecipientController,
                      focusNode: _model.emailAddressRecipientFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.emailAddressRecipientController',
                        Duration(milliseconds: 2000),
                        () => setState(() {}),
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: FFLocalizations.of(context).getText(
                          'a9qm1ujr' /* Email */,
                        ),
                        labelStyle: FlutterFlowTheme.of(context).bodySmall,
                        hintText: FFLocalizations.of(context).getText(
                          'hmjea2s1' /* Ej: juan@zippypay.com */,
                        ),
                        hintStyle: FlutterFlowTheme.of(context).bodySmall,
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
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 24.0, 20.0, 24.0),
                        suffixIcon: _model.emailAddressRecipientController!.text
                                .isNotEmpty
                            ? InkWell(
                                onTap: () async {
                                  _model.emailAddressRecipientController
                                      ?.clear();
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
                      keyboardType: TextInputType.emailAddress,
                      validator: _model.emailAddressRecipientControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            if (_model.formKey.currentState == null ||
                !_model.formKey.currentState!.validate()) {
              return;
            }
            if (_model.bankRecipientValue == null) {
              return;
            }
            if (_model.typeAccountRecipientValue == null) {
              return;
            }

            context.pushNamed('paginaPrincipal');
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 20.0, 24.0, 5.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    var userAccountsRecordReference =
                        UserAccountsRecord.collection.doc();
                    await userAccountsRecordReference.set({
                      ...createUserAccountsRecordData(
                        user: currentUserReference,
                        name: _model.nameRecipientController.text,
                        accountNumber: int.tryParse(
                            _model.numberAcountRecipientController.text),
                        account: widget.accounParam,
                      ),
                      ...mapToFirestore(
                        {
                          'values': functions.generateSendData(
                              FFAppState().valuesAndErrorsData.toList()),
                        },
                      ),
                    });
                    _model.userAccountCreated =
                        UserAccountsRecord.getDocumentFromData({
                      ...createUserAccountsRecordData(
                        user: currentUserReference,
                        name: _model.nameRecipientController.text,
                        accountNumber: int.tryParse(
                            _model.numberAcountRecipientController.text),
                        account: widget.accounParam,
                      ),
                      ...mapToFirestore(
                        {
                          'values': functions.generateSendData(
                              FFAppState().valuesAndErrorsData.toList()),
                        },
                      ),
                    }, userAccountsRecordReference);

                    context.pushNamed(
                      'paginaDetallePago',
                      queryParameters: {
                        'userAccount': serializeParam(
                          _model.userAccountCreated?.reference,
                          ParamType.DocumentReference,
                        ),
                      }.withoutNulls,
                    );

                    setState(() {});
                  },
                  text: FFLocalizations.of(context).getText(
                    'e3y6o7dr' /* Continuar */,
                  ),
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 50.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall,
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
