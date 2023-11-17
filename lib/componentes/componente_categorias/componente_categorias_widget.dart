import '/backend/backend.dart';
import '/componentes/componente_mensaje/componente_mensaje_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'componente_categorias_model.dart';
export 'componente_categorias_model.dart';

class ComponenteCategoriasWidget extends StatefulWidget {
  const ComponenteCategoriasWidget({
    Key? key,
    int? gridQty,
  })  : this.gridQty = gridQty ?? 4,
        super(key: key);

  final int gridQty;

  @override
  _ComponenteCategoriasWidgetState createState() =>
      _ComponenteCategoriasWidgetState();
}

class _ComponenteCategoriasWidgetState extends State<ComponenteCategoriasWidget>
    with TickerProviderStateMixin {
  late ComponenteCategoriasModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.linear,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
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
    _model = createModel(context, () => ComponenteCategoriasModel());

    _model.searchController ??= TextEditingController();
    _model.searchFocusNode ??= FocusNode();

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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  '4nhwqjis' /* ¿Listo para saldar cuentas? ¿C... */,
                ),
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Lexend',
                      fontSize:
                          MediaQuery.sizeOf(context).width > kBreakpointSmall
                              ? 17.0
                              : 14.0,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 15.0, 24.0, 7.0),
              child: TextFormField(
                controller: _model.searchController,
                focusNode: _model.searchFocusNode,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: FFLocalizations.of(context).getText(
                    'l9uiwndn' /* ¿Qué cuenta quieres pagar? */,
                  ),
                  labelStyle: FlutterFlowTheme.of(context).bodySmall,
                  hintText: FFLocalizations.of(context).getText(
                    'ob7ynz4c' /* Ingresa aquí el tipo de cuenta... */,
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
                validator:
                    _model.searchControllerValidator.asValidator(context),
              ),
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 10.0, 24.0, 0.0),
            child: StreamBuilder<List<AccountTypesRecord>>(
              stream: queryAccountTypesRecord(),
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
                List<AccountTypesRecord> gridViewAccountTypesRecordList =
                    snapshot.data!;
                if (gridViewAccountTypesRecordList.isEmpty) {
                  return ComponenteMensajeWidget();
                }
                return GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: widget.gridQty,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 1.0,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: gridViewAccountTypesRecordList.length,
                  itemBuilder: (context, gridViewIndex) {
                    final gridViewAccountTypesRecord =
                        gridViewAccountTypesRecordList[gridViewIndex];
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'newAccount',
                          queryParameters: {
                            'accountTypeSelected': serializeParam(
                              gridViewAccountTypesRecord.reference,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                        );
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.868,
                        height: 25.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          borderRadius: BorderRadius.circular(8.0),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 12.0, 12.0, 12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 50.0,
                                height: 50.0,
                                child: custom_widgets.GenerateIcon(
                                  width: 50.0,
                                  height: 50.0,
                                  icon: valueOrDefault<String>(
                                    gridViewAccountTypesRecord.icon,
                                    'n/a',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  gridViewAccountTypesRecord.name,
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Lexend',
                                        fontSize: 14.0,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  gridViewAccountTypesRecord.description,
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Lexend',
                                        fontSize: 12.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation']!);
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
