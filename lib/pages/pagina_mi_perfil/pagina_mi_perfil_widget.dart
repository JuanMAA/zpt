import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/componentes/componente_menu/componente_menu_widget.dart';
import '/componentes/componente_perfil/componente_perfil_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pagina_mi_perfil_model.dart';
export 'pagina_mi_perfil_model.dart';

class PaginaMiPerfilWidget extends StatefulWidget {
  const PaginaMiPerfilWidget({
    Key? key,
    this.userProfile,
  }) : super(key: key);

  final DocumentReference? userProfile;

  @override
  _PaginaMiPerfilWidgetState createState() => _PaginaMiPerfilWidgetState();
}

class _PaginaMiPerfilWidgetState extends State<PaginaMiPerfilWidget> {
  late PaginaMiPerfilModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaginaMiPerfilModel());

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
        final paginaMiPerfilUsersRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                  child: Visibility(
                    visible: responsiveVisibility(
                      context: context,
                      phone: false,
                    ),
                    child: wrapWithModel(
                      model: _model.componenteMenuModel,
                      updateCallback: () => setState(() {}),
                      child: ComponenteMenuWidget(),
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
                  model: _model.componentePerfilModel,
                  updateCallback: () => setState(() {}),
                  child: ComponentePerfilWidget(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
