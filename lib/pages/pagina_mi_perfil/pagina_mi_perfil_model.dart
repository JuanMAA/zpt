import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/componentes/componente_menu/componente_menu_widget.dart';
import '/componentes/componente_perfil/componente_perfil_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'pagina_mi_perfil_widget.dart' show PaginaMiPerfilWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaginaMiPerfilModel extends FlutterFlowModel<PaginaMiPerfilWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for componenteMenu component.
  late ComponenteMenuModel componenteMenuModel;
  // Model for componentePerfil component.
  late ComponentePerfilModel componentePerfilModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    componenteMenuModel = createModel(context, () => ComponenteMenuModel());
    componentePerfilModel = createModel(context, () => ComponentePerfilModel());
  }

  void dispose() {
    componenteMenuModel.dispose();
    componentePerfilModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
