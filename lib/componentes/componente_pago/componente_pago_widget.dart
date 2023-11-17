import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'componente_pago_model.dart';
export 'componente_pago_model.dart';

class ComponentePagoWidget extends StatefulWidget {
  const ComponentePagoWidget({
    Key? key,
    this.userAccountParam,
  }) : super(key: key);

  final UserAccountsRecord? userAccountParam;

  @override
  _ComponentePagoWidgetState createState() => _ComponentePagoWidgetState();
}

class _ComponentePagoWidgetState extends State<ComponentePagoWidget>
    with TickerProviderStateMixin {
  late ComponentePagoModel _model;

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
    'dropDownOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 600.ms,
          begin: Offset(0.0, 60.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 600.ms,
          begin: Offset(1.0, 0.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'dropDownOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 600.ms,
          begin: Offset(0.0, 60.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 600.ms,
          begin: Offset(1.0, 0.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'dropDownOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 600.ms,
          begin: Offset(0.0, 60.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 600.ms,
          begin: Offset(1.0, 0.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'textFieldOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: Offset(0.0, 60.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
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
    _model = createModel(context, () => ComponentePagoModel());

    _model.amountController ??= TextEditingController();
    _model.amountFocusNode ??= FocusNode();

    _model.commentaryController ??= TextEditingController();
    _model.commentaryFocusNode ??= FocusNode();

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
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
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 24.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'sobj1s3z' /* Detalles del pago y destinatar... */,
                            ),
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodySmall
                                .override(
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
                  ],
                ),
              ],
            ),
          ),
          Form(
            key: _model.formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: StreamBuilder<List<CardsRecord>>(
              stream: queryCardsRecord(
                queryBuilder: (cardsRecord) => cardsRecord.where(
                  'status',
                  isEqualTo: true,
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
                List<CardsRecord> columnCardsRecordList = snapshot.data!;
                // Return an empty Container when the item does not exist.
                if (snapshot.data!.isEmpty) {
                  return Container();
                }
                final columnCardsRecord = columnCardsRecordList.isNotEmpty
                    ? columnCardsRecordList.first
                    : null;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                      child: StreamBuilder<List<CardsRecord>>(
                        stream: queryCardsRecord(
                          queryBuilder: (cardsRecord) => cardsRecord.where(
                            'user_id',
                            isEqualTo: currentUserReference,
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
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 50.0,
                                ),
                              ),
                            );
                          }
                          List<CardsRecord> accountsListCardsRecordList =
                              snapshot.data!;
                          return FlutterFlowDropDown<String>(
                            controller: _model.accountsListValueController ??=
                                FormFieldController<String>(
                              _model.accountsListValue ??=
                                  columnCardsRecord?.cardNumber?.toString(),
                            ),
                            options: List<String>.from(
                                accountsListCardsRecordList
                                    .map((e) => e.cardNumber.toString())
                                    .toList()),
                            optionLabels: accountsListCardsRecordList
                                .map((e) => e.cardNumber.toString())
                                .toList(),
                            onChanged: (val) =>
                                setState(() => _model.accountsListValue = val),
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 60.0,
                            textStyle: FlutterFlowTheme.of(context).bodyMedium,
                            hintText: FFLocalizations.of(context).getText(
                              'gaj4tsyd' /* Selecciona una cuenta */,
                            ),
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).grayLight,
                              size: 15.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 2.0,
                            borderColor: FlutterFlowTheme.of(context).alternate,
                            borderWidth: 2.0,
                            borderRadius: 8.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 12.0, 20.0),
                            hidesUnderline: true,
                            isSearchable: true,
                            isMultiSelect: false,
                          ).animateOnPageLoad(
                              animationsMap['dropDownOnPageLoadAnimation1']!);
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: FlutterFlowDropDown<String>(
                        controller: _model.currencyValueController ??=
                            FormFieldController<String>(
                          _model.currencyValue ??= 'CLP',
                        ),
                        options: List<String>.from(['CLP', 'UF']),
                        optionLabels: [
                          FFLocalizations.of(context).getText(
                            'guq0qsxj' /* CLP */,
                          ),
                          FFLocalizations.of(context).getText(
                            'illc8mw9' /* UF */,
                          )
                        ],
                        onChanged: (val) =>
                            setState(() => _model.currencyValue = val),
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 60.0,
                        textStyle: FlutterFlowTheme.of(context).bodyMedium,
                        hintText: FFLocalizations.of(context).getText(
                          'e3cqmr5k' /* Tipo de Moneda */,
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).grayLight,
                          size: 15.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 2.0,
                        borderColor: FlutterFlowTheme.of(context).alternate,
                        borderWidth: 2.0,
                        borderRadius: 8.0,
                        margin: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 12.0, 20.0),
                        hidesUnderline: true,
                        isSearchable: true,
                        isMultiSelect: false,
                      ).animateOnPageLoad(
                          animationsMap['dropDownOnPageLoadAnimation2']!),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(2.0, 20.0, 0.0, 0.0),
                      child: TextFormField(
                        controller: _model.amountController,
                        focusNode: _model.amountFocusNode,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: FFLocalizations.of(context).getText(
                            '8hybnvxf' /* Monto a pagar */,
                          ),
                          labelStyle: FlutterFlowTheme.of(context).bodySmall,
                          hintText: FFLocalizations.of(context).getText(
                            'vumkk8b8' /* Ej: 200000 */,
                          ),
                          hintStyle: FlutterFlowTheme.of(context).bodySmall,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 24.0, 20.0, 24.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        keyboardType: TextInputType.number,
                        validator: _model.amountControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: FlutterFlowDropDown<String>(
                        controller: _model.yearValueController ??=
                            FormFieldController<String>(
                          _model.yearValue ??= functions.getYearDafaultValue(),
                        ),
                        options: [
                          FFLocalizations.of(context).getText(
                            '8jedhw5d' /* 2023 */,
                          ),
                          FFLocalizations.of(context).getText(
                            'xlwtzwdr' /* 2024 */,
                          ),
                          FFLocalizations.of(context).getText(
                            'h6uad5by' /* 2025 */,
                          ),
                          FFLocalizations.of(context).getText(
                            'gymiitia' /* 2026 */,
                          )
                        ],
                        onChanged: (val) =>
                            setState(() => _model.yearValue = val),
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 60.0,
                        searchHintTextStyle: TextStyle(),
                        textStyle: FlutterFlowTheme.of(context).bodyMedium,
                        hintText: FFLocalizations.of(context).getText(
                          'eibuflb9' /* Seleccionar Año */,
                        ),
                        searchHintText: FFLocalizations.of(context).getText(
                          'ap5epi6t' /* Buscar Año */,
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).grayLight,
                          size: 15.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 2.0,
                        borderColor: FlutterFlowTheme.of(context).alternate,
                        borderWidth: 2.0,
                        borderRadius: 8.0,
                        margin: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 12.0, 20.0),
                        hidesUnderline: true,
                        isSearchable: true,
                        isMultiSelect: false,
                      ).animateOnPageLoad(
                          animationsMap['dropDownOnPageLoadAnimation3']!),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: FlutterFlowDropDown<String>(
                        controller: _model.monthValueController ??=
                            FormFieldController<String>(
                          _model.monthValue ??=
                              functions.getMonthDafaultValue(),
                        ),
                        options: List<String>.from([
                          '1',
                          '2',
                          '3',
                          '4',
                          '5',
                          '6',
                          '7',
                          '8',
                          '9',
                          '10',
                          '11',
                          '12'
                        ]),
                        optionLabels: [
                          FFLocalizations.of(context).getText(
                            '8uhs48l9' /* Enero */,
                          ),
                          FFLocalizations.of(context).getText(
                            '0le40g9z' /* Febrero */,
                          ),
                          FFLocalizations.of(context).getText(
                            '6alr0y4m' /* Marzo */,
                          ),
                          FFLocalizations.of(context).getText(
                            'miypsi7z' /* Abril */,
                          ),
                          FFLocalizations.of(context).getText(
                            'l11ctk13' /* Mayo */,
                          ),
                          FFLocalizations.of(context).getText(
                            '7d1ftgqe' /* Junio */,
                          ),
                          FFLocalizations.of(context).getText(
                            'mxvhujau' /* Julio */,
                          ),
                          FFLocalizations.of(context).getText(
                            'yrq32gl1' /* Agosto */,
                          ),
                          FFLocalizations.of(context).getText(
                            'yiu4ml2v' /* Septiembre */,
                          ),
                          FFLocalizations.of(context).getText(
                            '5a9mgyac' /* Octubre */,
                          ),
                          FFLocalizations.of(context).getText(
                            'qpwis29s' /* Noviembre */,
                          ),
                          FFLocalizations.of(context).getText(
                            '3herpr7b' /* Diciembre */,
                          )
                        ],
                        onChanged: (val) =>
                            setState(() => _model.monthValue = val),
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 60.0,
                        textStyle: FlutterFlowTheme.of(context).bodyMedium,
                        hintText: FFLocalizations.of(context).getText(
                          'b1c5uqv0' /* Buscar Mes */,
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).grayLight,
                          size: 15.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 2.0,
                        borderColor: FlutterFlowTheme.of(context).alternate,
                        borderWidth: 2.0,
                        borderRadius: 8.0,
                        margin: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 12.0, 20.0),
                        hidesUnderline: true,
                        isSearchable: true,
                        isMultiSelect: false,
                      ).animateOnPageLoad(
                          animationsMap['dropDownOnPageLoadAnimation4']!),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(2.0, 20.0, 0.0, 0.0),
                      child: TextFormField(
                        controller: _model.commentaryController,
                        focusNode: _model.commentaryFocusNode,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: FFLocalizations.of(context).getText(
                            'eaennovt' /* Agregar un comentario */,
                          ),
                          labelStyle: FlutterFlowTheme.of(context).bodySmall,
                          hintText: FFLocalizations.of(context).getText(
                            '8p1gdbh4' /* Ejemplo: residencia de mayores... */,
                          ),
                          hintStyle: FlutterFlowTheme.of(context).bodySmall,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 24.0, 20.0, 24.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        maxLines: 3,
                        validator: _model.commentaryControllerValidator
                            .asValidator(context),
                      ).animateOnPageLoad(
                          animationsMap['textFieldOnPageLoadAnimation']!),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                      child: SwitchListTile.adaptive(
                        value: _model.notifyRecipientValue ??= true,
                        onChanged: (newValue) async {
                          setState(
                              () => _model.notifyRecipientValue = newValue!);
                        },
                        title: Text(
                          FFLocalizations.of(context).getText(
                            '4sjf00xh' /* Avisar al destinatario  */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .titleLarge
                              .override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                        ),
                        subtitle: Text(
                          FFLocalizations.of(context).getText(
                            'rbth2l35' /* Cuando el pago esté en proceso */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                        ),
                        activeColor: FlutterFlowTheme.of(context).primary,
                        activeTrackColor: FlutterFlowTheme.of(context).accent1,
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            return;
                          }
                          if (_model.accountsListValue == null) {
                            return;
                          }
                          if (_model.currencyValue == null) {
                            return;
                          }
                          if (_model.yearValue == null) {
                            return;
                          }
                          if (_model.monthValue == null) {
                            return;
                          }

                          context.pushNamed('paginaPrincipal');
                        },
                        text: FFLocalizations.of(context).getText(
                          'lo9cshdc' /* Pagar */,
                        ),
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 56.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Lexend',
                                color: FlutterFlowTheme.of(context).textColor,
                              ),
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
