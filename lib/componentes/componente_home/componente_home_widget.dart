import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/componentes/componente_mensaje/componente_mensaje_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'componente_home_model.dart';
export 'componente_home_model.dart';

class ComponenteHomeWidget extends StatefulWidget {
  const ComponenteHomeWidget({Key? key}) : super(key: key);

  @override
  _ComponenteHomeWidgetState createState() => _ComponenteHomeWidgetState();
}

class _ComponenteHomeWidgetState extends State<ComponenteHomeWidget>
    with TickerProviderStateMixin {
  late ComponenteHomeModel _model;

  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 60.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(1.0, 0.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'listViewOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 150.ms,
          duration: 150.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 150.ms,
          duration: 150.ms,
          begin: Offset(0.0, 26.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 150.ms,
          duration: 150.ms,
          begin: Offset(1.0, 0.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'listViewOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 160.ms,
          duration: 150.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 160.ms,
          duration: 150.ms,
          begin: Offset(0.0, 26.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 160.ms,
          duration: 150.ms,
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
    _model = createModel(context, () => ComponenteHomeModel());

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

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (responsiveVisibility(
                                  context: context,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'vfyqjx4f' /* Bienvenido, */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall,
                                  ),
                                if (responsiveVisibility(
                                  context: context,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        currentUserDisplayName,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Lexend',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                            ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            if (responsiveVisibility(
                              context: context,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '8480rtdf' /* Tus actualizaciones más recien... */,
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 5.0, 5.0, 5.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.5,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: _model.currentMenu == 'cuentas'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 10.0, 10.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setState(() {
                                    _model.currentMenu = 'cuentas';
                                  });
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: Icon(
                                        Icons.swap_horiz_rounded,
                                        color: _model.currentMenu == 'cuentas'
                                            ? FlutterFlowTheme.of(context)
                                                .textColor
                                            : FlutterFlowTheme.of(context)
                                                .primaryText,
                                        size: 40.0,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'lq1z3iql' /* Cuentas que Transfiero */,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lexend',
                                                color: _model.currentMenu ==
                                                        'cuentas'
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .textColor
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                fontSize: 13.0,
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
                      Expanded(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            setState(() {
                              _model.currentMenu = 'servicios';
                            });
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.5,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: _model.currentMenu == 'servicios'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 10.0, 10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Icon(
                                      Icons.room_service,
                                      color: _model.currentMenu == 'servicios'
                                          ? FlutterFlowTheme.of(context)
                                              .textColor
                                          : FlutterFlowTheme.of(context)
                                              .primaryText,
                                      size: 40.0,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '9tuqiqo6' /* Servicios que pago */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lexend',
                                              color: _model.currentMenu ==
                                                      'servicios'
                                                  ? FlutterFlowTheme.of(context)
                                                      .textColor
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 13.0,
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
                    ],
                  ),
                ),
              ],
            ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
          ),
          Align(
            alignment: AlignmentDirectional(-1.00, 0.00),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 5.0, 24.0, 20.0),
              child: Text(
                _model.currentMenu == 'cuentas'
                    ? 'Nosotros transferimos tu pago al destinatario, a nombre tuyo, y con toda la información del pago incluida.'
                    : 'Puedes pagar varias al mismo tiempo, y queda pagada el mismo día.',
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).bodySmall,
              ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation']!),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(1.00, 0.00),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 24.0),
              child: FFButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: FFLocalizations.of(context).getText(
                  '4bhdvzga' /* Seleccionar todas las cuentas */,
                ),
                icon: Icon(
                  Icons.check_sharp,
                  size: 15.0,
                ),
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Lexend',
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                  elevation: 3.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          if (_model.currentMenu == 'servicios')
            StreamBuilder<List<UserAccountsRecord>>(
              stream: queryUserAccountsRecord(
                queryBuilder: (userAccountsRecord) => userAccountsRecord.where(
                  'user',
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
                List<UserAccountsRecord> listViewServiceUserAccountsRecordList =
                    snapshot.data!;
                if (listViewServiceUserAccountsRecordList.isEmpty) {
                  return ComponenteMensajeWidget();
                }
                return ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewServiceUserAccountsRecordList.length,
                  separatorBuilder: (_, __) => SizedBox(height: 1.0),
                  itemBuilder: (context, listViewServiceIndex) {
                    final listViewServiceUserAccountsRecord =
                        listViewServiceUserAccountsRecordList[
                            listViewServiceIndex];
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                      child: Container(
                        width: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 12.0, 12.0, 12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        listViewServiceUserAccountsRecord.name,
                                        'Sin Nombre',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 18.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        listViewServiceUserAccountsRecord
                                            .currency,
                                        '\$',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 20.0,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        listViewServiceUserAccountsRecord.amount
                                            .toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 20.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: Text(
                                  functions.arrayValuesToString(
                                      listViewServiceUserAccountsRecord.values
                                          .toList())!,
                                  style: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .override(
                                        fontFamily: 'Lexend',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 13.0,
                                      ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2.0, 2.0, 2.0, 2.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed(
                                            'paginaEditarCuenta',
                                            queryParameters: {
                                              'userAccount': serializeParam(
                                                listViewServiceUserAccountsRecord
                                                    .reference,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'arv5o1f6' /* Ver Más */,
                                        ),
                                        options: FFButtonOptions(
                                          width: 100.0,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Lexend',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .textColor,
                                                fontSize: 10.0,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2.0, 2.0, 2.0, 2.0),
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'x3gdd5uj' /* Pagar */,
                                        ),
                                        icon: Icon(
                                          Icons.payment,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: 140.0,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
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
                                                    color: Colors.white,
                                                    fontSize: 10.0,
                                                  ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ).animateOnPageLoad(
                    animationsMap['listViewOnPageLoadAnimation1']!);
              },
            ),
          if (_model.currentMenu == 'cuentas')
            StreamBuilder<List<UserAccountsRecord>>(
              stream: queryUserAccountsRecord(
                queryBuilder: (userAccountsRecord) => userAccountsRecord.where(
                  'user',
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
                List<UserAccountsRecord> listViewAccountUserAccountsRecordList =
                    snapshot.data!;
                if (listViewAccountUserAccountsRecordList.isEmpty) {
                  return ComponenteMensajeWidget();
                }
                return ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewAccountUserAccountsRecordList.length,
                  separatorBuilder: (_, __) => SizedBox(height: 1.0),
                  itemBuilder: (context, listViewAccountIndex) {
                    final listViewAccountUserAccountsRecord =
                        listViewAccountUserAccountsRecordList[
                            listViewAccountIndex];
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('paginaDetallePago');
                        },
                        child: Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 12.0, 12.0, 12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          functions.getNameAndAlias(
                                              listViewAccountUserAccountsRecord
                                                  .values
                                                  .toList()),
                                          'Sin Nombre',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Lexend',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 18.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Text(
                                    functions.arrayValuesToString(
                                        listViewAccountUserAccountsRecord.values
                                            .toList())!,
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'Lexend',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 13.0,
                                        ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            2.0, 2.0, 2.0, 2.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            context.pushNamed(
                                              'paginaEditarCuenta',
                                              queryParameters: {
                                                'userAccount': serializeParam(
                                                  listViewAccountUserAccountsRecord
                                                      .reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '9s50t61n' /* Ver Mas */,
                                          ),
                                          options: FFButtonOptions(
                                            width: 100.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Lexend',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .textColor,
                                                      fontSize: 12.0,
                                                    ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            2.0, 2.0, 2.0, 2.0),
                                        child: FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '7jqjpuxh' /* Actualizar */,
                                          ),
                                          icon: Icon(
                                            Icons.refresh,
                                            size: 15.0,
                                          ),
                                          options: FFButtonOptions(
                                            width: 140.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
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
                                                      color: Colors.white,
                                                      fontSize: 12.0,
                                                    ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).accent3,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            visualDensity:
                                                VisualDensity.compact,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                          ),
                                          unselectedWidgetColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                        ),
                                        child: CheckboxListTile(
                                          value: _model
                                                      .checkboxListTileValueMap[
                                                  listViewAccountUserAccountsRecord] ??=
                                              false,
                                          onChanged: (newValue) async {
                                            setState(() => _model
                                                        .checkboxListTileValueMap[
                                                    listViewAccountUserAccountsRecord] =
                                                newValue!);
                                          },
                                          title: Text(
                                            FFLocalizations.of(context).getText(
                                              'dkkq3ocw' /* Sin deuda */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 17.0,
                                                ),
                                          ),
                                          subtitle: Text(
                                            FFLocalizations.of(context).getText(
                                              'tx5qy83m' /* Seleccionar para pagar */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium,
                                          ),
                                          tileColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          checkColor:
                                              FlutterFlowTheme.of(context)
                                                  .textColor,
                                          dense: true,
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ).animateOnPageLoad(
                    animationsMap['listViewOnPageLoadAnimation2']!);
              },
            ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4.0,
                    color: Color(0x34000000),
                    offset: Offset(0.0, -2.0),
                  )
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
