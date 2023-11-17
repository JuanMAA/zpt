import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'componente_menu_model.dart';
export 'componente_menu_model.dart';

class ComponenteMenuWidget extends StatefulWidget {
  const ComponenteMenuWidget({
    Key? key,
    String? currentPage,
  })  : this.currentPage = currentPage ?? 'ajustes',
        super(key: key);

  final String currentPage;

  @override
  _ComponenteMenuWidgetState createState() => _ComponenteMenuWidgetState();
}

class _ComponenteMenuWidgetState extends State<ComponenteMenuWidget> {
  late ComponenteMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponenteMenuModel());

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

    return Visibility(
      visible: responsiveVisibility(
        context: context,
        phone: false,
        tablet: false,
      ),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(0.0),
          border: Border.all(
            color: Color(0xFFE5E7EB),
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 12.0, 12.0, 12.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: SvgPicture.asset(
                              'assets/images/logo-svg-zippy.svg',
                              width: 150.0,
                              height: 50.0,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Color(0x4D9489F5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: CachedNetworkImage(
                              fadeInDuration: Duration(milliseconds: 500),
                              fadeOutDuration: Duration(milliseconds: 500),
                              imageUrl: currentUserPhoto,
                              width: 44.0,
                              height: 44.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AuthUserStreamWidget(
                              builder: (context) => Text(
                                currentUserDisplayName,
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: Text(
                                currentUserEmail,
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500,
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
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'ar1prl5e' /* Principal */,
                        ),
                        style: FlutterFlowTheme.of(context)
                            .labelMedium
                            .override(
                              fontFamily: 'Plus Jakarta Sans',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('paginaPrincipal');
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          width: double.infinity,
                          height: 44.0,
                          decoration: BoxDecoration(
                            color: functions.getCurrentPage(
                                    valueOrDefault<String>(
                                      widget.currentPage,
                                      'ajustes',
                                    ),
                                    'principal')!
                                ? FlutterFlowTheme.of(context).primary
                                : FlutterFlowTheme.of(context)
                                    .primaryBackground,
                            borderRadius: BorderRadius.circular(12.0),
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.home,
                                  color: functions.getCurrentPage(
                                          widget.currentPage, 'principal')!
                                      ? FlutterFlowTheme.of(context).textColor
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  size: 24.0,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'q38my9g6' /* Inicio */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: functions.getCurrentPage(
                                                    widget.currentPage,
                                                    'principal')!
                                                ? FlutterFlowTheme.of(context)
                                                    .textColor
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('paginaAgregarCuenta');
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          width: double.infinity,
                          height: 44.0,
                          decoration: BoxDecoration(
                            color: functions.getCurrentPage(
                                    valueOrDefault<String>(
                                      widget.currentPage,
                                      'ajustes',
                                    ),
                                    'agregar')!
                                ? FlutterFlowTheme.of(context).primary
                                : FlutterFlowTheme.of(context)
                                    .primaryBackground,
                            borderRadius: BorderRadius.circular(12.0),
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_circle,
                                  color: functions.getCurrentPage(
                                          widget.currentPage, 'agregar')!
                                      ? FlutterFlowTheme.of(context).textColor
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  size: 24.0,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'g8rx00ry' /* Agregar */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: functions.getCurrentPage(
                                                    widget.currentPage,
                                                    'agregar')!
                                                ? FlutterFlowTheme.of(context)
                                                    .textColor
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('paginaTransacciones');
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          width: double.infinity,
                          height: 44.0,
                          decoration: BoxDecoration(
                            color: functions.getCurrentPage(
                                    valueOrDefault<String>(
                                      widget.currentPage,
                                      'ajustes',
                                    ),
                                    'historial')!
                                ? FlutterFlowTheme.of(context).primary
                                : FlutterFlowTheme.of(context)
                                    .primaryBackground,
                            borderRadius: BorderRadius.circular(12.0),
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('paginaTransacciones');
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.view_list_sharp,
                                    color: functions.getCurrentPage(
                                            widget.currentPage, 'historial')!
                                        ? FlutterFlowTheme.of(context).textColor
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    size: 24.0,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'tsav548i' /* Historial */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Lexend',
                                              color: functions.getCurrentPage(
                                                      widget.currentPage,
                                                      'historial')!
                                                  ? FlutterFlowTheme.of(context)
                                                      .textColor
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('paginaTargetas');
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          width: double.infinity,
                          height: 44.0,
                          decoration: BoxDecoration(
                            color: functions.getCurrentPage(
                                    valueOrDefault<String>(
                                      widget.currentPage,
                                      'ajustes',
                                    ),
                                    'targetas')!
                                ? FlutterFlowTheme.of(context).primary
                                : FlutterFlowTheme.of(context)
                                    .primaryBackground,
                            borderRadius: BorderRadius.circular(12.0),
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_card,
                                  color: functions.getCurrentPage(
                                          widget.currentPage, 'targetas')!
                                      ? FlutterFlowTheme.of(context).textColor
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  size: 24.0,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '6sdfv6yx' /* Métodos de Pago */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: functions.getCurrentPage(
                                                    widget.currentPage,
                                                    'targetas')!
                                                ? FlutterFlowTheme.of(context)
                                                    .textColor
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'y4xnncnr' /* Tu Cuenta */,
                        ),
                        style: FlutterFlowTheme.of(context)
                            .labelMedium
                            .override(
                              fontFamily: 'Plus Jakarta Sans',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('paginaMiPerfil');
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeIn,
                          width: double.infinity,
                          height: 44.0,
                          decoration: BoxDecoration(
                            color: functions.getCurrentPage(
                                    valueOrDefault<String>(
                                      widget.currentPage,
                                      'ajustes',
                                    ),
                                    'ajustes')!
                                ? FlutterFlowTheme.of(context).primary
                                : FlutterFlowTheme.of(context)
                                    .primaryBackground,
                            borderRadius: BorderRadius.circular(12.0),
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.settings,
                                  color: functions.getCurrentPage(
                                          widget.currentPage, 'ajustes')!
                                      ? FlutterFlowTheme.of(context).textColor
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  size: 24.0,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '236tgx6u' /* Ajustes */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: functions.getCurrentPage(
                                                    widget.currentPage,
                                                    'ajustes')!
                                                ? FlutterFlowTheme.of(context)
                                                    .textColor
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          var confirmDialogResponse = await showDialog<bool>(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Cerrar sesión'),
                                    content: Text(
                                        '¿Estás seguro de que quieres cerrar la sesión?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, false),
                                        child: Text('Cancelar'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, true),
                                        child: Text('Si, cerrar la sesión'),
                                      ),
                                    ],
                                  );
                                },
                              ) ??
                              false;
                          if (confirmDialogResponse) {
                            GoRouter.of(context).prepareAuthEvent();
                            await authManager.signOut();
                            GoRouter.of(context).clearRedirectLocation();
                          }

                          context.goNamedAuth(
                              'paginaRegistro', context.mounted);
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          width: double.infinity,
                          height: 44.0,
                          decoration: BoxDecoration(
                            color: functions.getCurrentPage(
                                    valueOrDefault<String>(
                                      widget.currentPage,
                                      'ajustes',
                                    ),
                                    'logout')!
                                ? FlutterFlowTheme.of(context).primary
                                : FlutterFlowTheme.of(context)
                                    .primaryBackground,
                            borderRadius: BorderRadius.circular(12.0),
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.login_sharp,
                                  color: functions.getCurrentPage(
                                          widget.currentPage, 'logout')!
                                      ? FlutterFlowTheme.of(context).textColor
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  size: 24.0,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'npe64ggo' /* Cerrar Sesión */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: functions.getCurrentPage(
                                                    widget.currentPage,
                                                    'logout')!
                                                ? FlutterFlowTheme.of(context)
                                                    .textColor
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 12.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
