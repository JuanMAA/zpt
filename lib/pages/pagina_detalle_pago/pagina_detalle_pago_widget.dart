import '/componentes/componente_menu/componente_menu_widget.dart';
import '/componentes/componente_pago/componente_pago_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pagina_detalle_pago_model.dart';
export 'pagina_detalle_pago_model.dart';

class PaginaDetallePagoWidget extends StatefulWidget {
  const PaginaDetallePagoWidget({
    Key? key,
    this.userAccount,
  }) : super(key: key);

  final DocumentReference? userAccount;

  @override
  _PaginaDetallePagoWidgetState createState() =>
      _PaginaDetallePagoWidgetState();
}

class _PaginaDetallePagoWidgetState extends State<PaginaDetallePagoWidget> {
  late PaginaDetallePagoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaginaDetallePagoModel());

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
                  '6g6obt3a' /* Detalle de Pago */,
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (responsiveVisibility(
            context: context,
            phone: false,
          ))
            Container(
              width: 250.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: wrapWithModel(
                model: _model.componenteMenuModel,
                updateCallback: () => setState(() {}),
                child: ComponenteMenuWidget(
                  currentPage: 'agregar',
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
              model: _model.componentePagoModel,
              updateCallback: () => setState(() {}),
              child: ComponentePagoWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
