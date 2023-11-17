import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/componentes/componente_editar_perfil/componente_editar_perfil_widget.dart';
import '/componentes/componente_menu/componente_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pagina_editar_perfil_model.dart';
export 'pagina_editar_perfil_model.dart';

class PaginaEditarPerfilWidget extends StatefulWidget {
  const PaginaEditarPerfilWidget({
    Key? key,
    this.userProfile,
  }) : super(key: key);

  final DocumentReference? userProfile;

  @override
  _PaginaEditarPerfilWidgetState createState() =>
      _PaginaEditarPerfilWidgetState();
}

class _PaginaEditarPerfilWidgetState extends State<PaginaEditarPerfilWidget> {
  late PaginaEditarPerfilModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaginaEditarPerfilModel());

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

    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitFoldingCube(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        final paginaEditarPerfilUsersRecord = snapshot.data!;
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
                  backgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
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
                      '4rzqov3y' /* Editar Perfil */,
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
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: wrapWithModel(
                    model: _model.componenteMenuModel,
                    updateCallback: () => setState(() {}),
                    child: ComponenteMenuWidget(
                      currentPage: 'ajustes',
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
                  model: _model.componenteEditarPerfilModel,
                  updateCallback: () => setState(() {}),
                  child: ComponenteEditarPerfilWidget(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
