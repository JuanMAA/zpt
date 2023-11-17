import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pagina_notificationes_model.dart';
export 'pagina_notificationes_model.dart';

class PaginaNotificationesWidget extends StatefulWidget {
  const PaginaNotificationesWidget({Key? key}) : super(key: key);

  @override
  _PaginaNotificationesWidgetState createState() =>
      _PaginaNotificationesWidgetState();
}

class _PaginaNotificationesWidgetState
    extends State<PaginaNotificationesWidget> {
  late PaginaNotificationesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaginaNotificationesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: responsiveVisibility(
        context: context,
        tablet: false,
        tabletLandscape: false,
        desktop: false,
      )
          ? AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pop();
                },
                child: Icon(
                  Icons.chevron_left_rounded,
                  color: FlutterFlowTheme.of(context).grayLight,
                  size: 32.0,
                ),
              ),
              title: Align(
                alignment: AlignmentDirectional(-1.00, 0.00),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'sc4ff4ce' /* Configurar notificaciones */,
                  ),
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).headlineSmall,
                ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 0.0,
            )
          : null,
      body: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 1.0,
        decoration: BoxDecoration(),
        child: Visibility(
          visible: responsiveVisibility(
            context: context,
            tablet: false,
            tabletLandscape: false,
            desktop: false,
          ),
          child: StreamBuilder<UsersRecord>(
            stream: UsersRecord.getDocument(currentUserReference!),
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
              final columnUsersRecord = snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'r72zvrv5' /* Seleccione las notificaciones ... */,
                              ),
                              style: FlutterFlowTheme.of(context).bodySmall,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: SwitchListTile.adaptive(
                      value: _model.switchListTileValue1 ??= true,
                      onChanged: (newValue) async {
                        setState(() => _model.switchListTileValue1 = newValue!);
                      },
                      title: Text(
                        FFLocalizations.of(context).getText(
                          'gjygkr0n' /* Notificaciones push */,
                        ),
                        style: FlutterFlowTheme.of(context).headlineSmall,
                      ),
                      subtitle: Text(
                        FFLocalizations.of(context).getText(
                          '3y3yhxbk' /* Recibir notificaciones push de... */,
                        ),
                        style: FlutterFlowTheme.of(context).bodySmall,
                      ),
                      activeColor: FlutterFlowTheme.of(context).tertiary,
                      activeTrackColor: FlutterFlowTheme.of(context).primary,
                      dense: false,
                      controlAffinity: ListTileControlAffinity.trailing,
                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                          24.0, 12.0, 24.0, 12.0),
                    ),
                  ),
                  SwitchListTile.adaptive(
                    value: _model.switchListTileValue2 ??= true,
                    onChanged: (newValue) async {
                      setState(() => _model.switchListTileValue2 = newValue!);
                    },
                    title: Text(
                      FFLocalizations.of(context).getText(
                        '1ytebj35' /* Notificaciones email  */,
                      ),
                      style: FlutterFlowTheme.of(context).headlineSmall,
                    ),
                    subtitle: Text(
                      FFLocalizations.of(context).getText(
                        '9lvh5nst' /* Recibir notificaciones por cor... */,
                      ),
                      style: FlutterFlowTheme.of(context).bodySmall,
                    ),
                    activeColor: FlutterFlowTheme.of(context).tertiary,
                    activeTrackColor: FlutterFlowTheme.of(context).primary,
                    dense: false,
                    controlAffinity: ListTileControlAffinity.trailing,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pop();
                      },
                      text: FFLocalizations.of(context).getText(
                        'isgrgbfs' /* Guardar Cambios */,
                      ),
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
      ),
    );
  }
}
