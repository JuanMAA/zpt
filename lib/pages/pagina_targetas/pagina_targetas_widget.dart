import '/componentes/componente_billetera/componente_billetera_widget.dart';
import '/componentes/componente_menu/componente_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pagina_targetas_model.dart';
export 'pagina_targetas_model.dart';

class PaginaTargetasWidget extends StatefulWidget {
  const PaginaTargetasWidget({
    Key? key,
    this.camposDinamicos,
  }) : super(key: key);

  final List<dynamic>? camposDinamicos;

  @override
  _PaginaTargetasWidgetState createState() => _PaginaTargetasWidgetState();
}

class _PaginaTargetasWidgetState extends State<PaginaTargetasWidget> {
  late PaginaTargetasModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaginaTargetasModel());

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FloatingActionButton pressed ...');
        },
        backgroundColor: FlutterFlowTheme.of(context).tertiary,
        elevation: 8.0,
        child: Icon(
          Icons.add_rounded,
          color: FlutterFlowTheme.of(context).textColor,
          size: 36.0,
        ),
      ),
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
                  'jsbctd7o' /* Mis Targetas */,
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
                    currentPage: 'targetas',
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
              model: _model.componenteBilleteraModel,
              updateCallback: () => setState(() {}),
              child: ComponenteBilleteraWidget(
                gridQty:
                    MediaQuery.sizeOf(context).width < kBreakpointSmall ? 1 : 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
