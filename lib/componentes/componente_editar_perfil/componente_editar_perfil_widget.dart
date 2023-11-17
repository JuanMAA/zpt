import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'componente_editar_perfil_model.dart';
export 'componente_editar_perfil_model.dart';

class ComponenteEditarPerfilWidget extends StatefulWidget {
  const ComponenteEditarPerfilWidget({Key? key}) : super(key: key);

  @override
  _ComponenteEditarPerfilWidgetState createState() =>
      _ComponenteEditarPerfilWidgetState();
}

class _ComponenteEditarPerfilWidgetState
    extends State<ComponenteEditarPerfilWidget> {
  late ComponenteEditarPerfilModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponenteEditarPerfilModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.formattedRut = functions
            .formatterRut(valueOrDefault(currentUserDocument?.documentId, ''))!;
      });
    });

    _model.firstNameInputController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.firstName, ''));
    _model.firstNameInputFocusNode ??= FocusNode();

    _model.lastNameInputController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.lastName, ''));
    _model.lastNameInputFocusNode ??= FocusNode();

    _model.documentIdInputController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.documentId, ''));
    _model.documentIdInputFocusNode ??= FocusNode();

    _model.emailInputController ??=
        TextEditingController(text: currentUserEmail);
    _model.emailInputFocusNode ??= FocusNode();

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
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24.0, 20.0, 24.0, 15.0),
          child: Text(
            FFLocalizations.of(context).getText(
              'b7t2rcd4' /* Administra tus datos personale... */,
            ),
            textAlign: TextAlign.start,
            style: FlutterFlowTheme.of(context).bodySmall.override(
                  fontFamily: 'Lexend',
                  fontSize: 14.0,
                ),
          ),
        ),
        Form(
          key: _model.formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                child: AuthUserStreamWidget(
                  builder: (context) => TextFormField(
                    controller: _model.firstNameInputController,
                    focusNode: _model.firstNameInputFocusNode,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: FFLocalizations.of(context).getText(
                        '55ncaw18' /* Primer Nombre */,
                      ),
                      labelStyle: FlutterFlowTheme.of(context).bodySmall,
                      hintText: FFLocalizations.of(context).getText(
                        'm4xj14ly' /* Por favor ingrese un número va... */,
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
                    validator: _model.firstNameInputControllerValidator
                        .asValidator(context),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                child: AuthUserStreamWidget(
                  builder: (context) => TextFormField(
                    controller: _model.lastNameInputController,
                    focusNode: _model.lastNameInputFocusNode,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: FFLocalizations.of(context).getText(
                        'hy7fknxu' /* Segundo Nombre */,
                      ),
                      labelStyle: FlutterFlowTheme.of(context).bodySmall,
                      hintText: FFLocalizations.of(context).getText(
                        'h4thihkr' /* Por favor ingrese un número va... */,
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
                    validator: _model.lastNameInputControllerValidator
                        .asValidator(context),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                child: AuthUserStreamWidget(
                  builder: (context) => TextFormField(
                    controller: _model.documentIdInputController,
                    focusNode: _model.documentIdInputFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.documentIdInputController',
                      Duration(milliseconds: 1000),
                      () async {
                        setState(() {
                          _model.formattedRut = functions.formatterRut(
                              _model.documentIdInputController.text)!;
                        });
                      },
                    ),
                    textCapitalization: TextCapitalization.none,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: FFLocalizations.of(context).getText(
                        'o7ccwtqf' /* RUT */,
                      ),
                      labelStyle: FlutterFlowTheme.of(context).bodySmall,
                      hintText: FFLocalizations.of(context).getText(
                        'hrlsflwt' /* Por favor ingrese un número va... */,
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
                    validator: _model.documentIdInputControllerValidator
                        .asValidator(context),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                child: TextFormField(
                  controller: _model.emailInputController,
                  focusNode: _model.emailInputFocusNode,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: FFLocalizations.of(context).getText(
                      '4de3rn2q' /* Email */,
                    ),
                    labelStyle: FlutterFlowTheme.of(context).bodySmall,
                    hintText: FFLocalizations.of(context).getText(
                      'elk1qgvh' /* Email */,
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
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  keyboardType: TextInputType.emailAddress,
                  validator:
                      _model.emailInputControllerValidator.asValidator(context),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (_model.formKey.currentState == null ||
                        !_model.formKey.currentState!.validate()) {
                      return;
                    }

                    await currentUserReference!.update(createUsersRecordData(
                      displayName: '',
                      email: _model.emailInputController.text,
                      firstName: _model.firstNameInputController.text,
                      lastName: _model.lastNameInputController.text,
                      documentId: _model.documentIdInputController.text,
                    ));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Tus datos se han actualizado correctamente',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                      ),
                    );
                  },
                  text: FFLocalizations.of(context).getText(
                    'fwotfu86' /* Actualizar Datos */,
                  ),
                  icon: Icon(
                    Icons.refresh_sharp,
                    size: 15.0,
                  ),
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 50.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '3nf27gv7' /* Otras acciones */,
                  ),
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodySmall,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          var confirmDialogResponse = await showDialog<bool>(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Confirmacion'),
                                    content: Text(
                                        '¿Estas seguro de que deseas eliminar tu cuenta?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, false),
                                        child: Text('Cancelar'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, true),
                                        child: Text('Confirmar'),
                                      ),
                                    ],
                                  );
                                },
                              ) ??
                              false;
                          if (confirmDialogResponse) {
                            await authManager.deleteUser(context);
                          }

                          context.goNamedAuth(
                              'paginaPrincipal', context.mounted);
                        },
                        text: FFLocalizations.of(context).getText(
                          'iycgzwq5' /* Eliminar Cuenta */,
                        ),
                        icon: Icon(
                          Icons.delete,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.5,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFFAA333A),
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
                  ),
                  if (!currentUserEmailVerified)
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => FFButtonWidget(
                            onPressed: () async {
                              await authManager.sendEmailVerification();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Se envio a su correo las instrucciones para continuar con la verificacion.',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 6000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                            },
                            text: FFLocalizations.of(context).getText(
                              '9em3rfaw' /* Validar Cuenta */,
                            ),
                            icon: Icon(
                              Icons.check,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 0.5,
                              height: 50.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).info,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Lexend',
                                    color:
                                        FlutterFlowTheme.of(context).textColor,
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
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
