import '/componentes/componente_destinatario/componente_destinatario_widget.dart';
import '/componentes/componente_menu/componente_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'pagina_destinatario_widget.dart' show PaginaDestinatarioWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaginaDestinatarioModel
    extends FlutterFlowModel<PaginaDestinatarioWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for componenteMenu component.
  late ComponenteMenuModel componenteMenuModel;
  // Model for componenteDestinatario component.
  late ComponenteDestinatarioModel componenteDestinatarioModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    componenteMenuModel = createModel(context, () => ComponenteMenuModel());
    componenteDestinatarioModel =
        createModel(context, () => ComponenteDestinatarioModel());
  }

  void dispose() {
    componenteMenuModel.dispose();
    componenteDestinatarioModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
