import '/componentes/componente_categorias/componente_categorias_widget.dart';
import '/componentes/componente_menu/componente_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'pagina_agregar_cuenta_widget.dart' show PaginaAgregarCuentaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaginaAgregarCuentaModel
    extends FlutterFlowModel<PaginaAgregarCuentaWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for componenteMenu component.
  late ComponenteMenuModel componenteMenuModel;
  // Model for componenteCategorias component.
  late ComponenteCategoriasModel componenteCategoriasModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    componenteMenuModel = createModel(context, () => ComponenteMenuModel());
    componenteCategoriasModel =
        createModel(context, () => ComponenteCategoriasModel());
  }

  void dispose() {
    componenteMenuModel.dispose();
    componenteCategoriasModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
