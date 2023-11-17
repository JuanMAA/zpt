import '/componentes/componente_home/componente_home_widget.dart';
import '/componentes/componente_menu/componente_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'pagina_principal_widget.dart' show PaginaPrincipalWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaginaPrincipalModel extends FlutterFlowModel<PaginaPrincipalWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for componenteMenu component.
  late ComponenteMenuModel componenteMenuModel;
  // Model for componenteHome component.
  late ComponenteHomeModel componenteHomeModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    componenteMenuModel = createModel(context, () => ComponenteMenuModel());
    componenteHomeModel = createModel(context, () => ComponenteHomeModel());
  }

  void dispose() {
    componenteMenuModel.dispose();
    componenteHomeModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
