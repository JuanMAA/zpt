import '/backend/backend.dart';
import '/componentes/componente_menu/componente_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'pagina_editar_cuenta_widget.dart' show PaginaEditarCuentaWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaginaEditarCuentaModel
    extends FlutterFlowModel<PaginaEditarCuentaWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for componenteMenu component.
  late ComponenteMenuModel componenteMenuModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    componenteMenuModel = createModel(context, () => ComponenteMenuModel());
  }

  void dispose() {
    componenteMenuModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
