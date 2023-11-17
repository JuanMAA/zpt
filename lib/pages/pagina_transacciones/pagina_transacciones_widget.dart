import '/componentes/componente_menu/componente_menu_widget.dart';
import '/componentes/componente_transacciones/componente_transacciones_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pagina_transacciones_model.dart';
export 'pagina_transacciones_model.dart';

class PaginaTransaccionesWidget extends StatefulWidget {
  const PaginaTransaccionesWidget({
    Key? key,
    this.camposDinamicos,
  }) : super(key: key);

  final List<dynamic>? camposDinamicos;

  @override
  _PaginaTransaccionesWidgetState createState() =>
      _PaginaTransaccionesWidgetState();
}

class _PaginaTransaccionesWidgetState extends State<PaginaTransaccionesWidget> {
  late PaginaTransaccionesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaginaTransaccionesModel());

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
              title: Text(
                FFLocalizations.of(context).getText(
                  'snhexwkk' /* Mis Transacciones */,
                ),
                style: FlutterFlowTheme.of(context).headlineSmall,
              ),
              actions: [],
              centerTitle: false,
              elevation: 0.0,
            )
          : null,
      body: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (responsiveVisibility(
            context: context,
            phone: false,
          ))
            Container(
              width: 250.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              child: Visibility(
                visible: responsiveVisibility(
                  context: context,
                  phone: false,
                ),
                child: wrapWithModel(
                  model: _model.componenteMenuModel,
                  updateCallback: () => setState(() {}),
                  child: ComponenteMenuWidget(
                    currentPage: 'historial',
                  ),
                ),
              ),
            ),
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            constraints: BoxConstraints(
              maxWidth: 600.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: wrapWithModel(
              model: _model.componenteTransaccionesModel,
              updateCallback: () => setState(() {}),
              child: ComponenteTransaccionesWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
