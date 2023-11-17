import '/componentes/componente_menu/componente_menu_widget.dart';
import '/componentes/componente_transacciones/componente_transacciones_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'pagina_transacciones_widget.dart' show PaginaTransaccionesWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaginaTransaccionesModel
    extends FlutterFlowModel<PaginaTransaccionesWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for componenteMenu component.
  late ComponenteMenuModel componenteMenuModel;
  // Model for componenteTransacciones component.
  late ComponenteTransaccionesModel componenteTransaccionesModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    componenteMenuModel = createModel(context, () => ComponenteMenuModel());
    componenteTransaccionesModel =
        createModel(context, () => ComponenteTransaccionesModel());
  }

  void dispose() {
    componenteMenuModel.dispose();
    componenteTransaccionesModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
