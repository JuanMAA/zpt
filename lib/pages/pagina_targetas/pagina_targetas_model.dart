import '/componentes/componente_billetera/componente_billetera_widget.dart';
import '/componentes/componente_menu/componente_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'pagina_targetas_widget.dart' show PaginaTargetasWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaginaTargetasModel extends FlutterFlowModel<PaginaTargetasWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for componenteMenu component.
  late ComponenteMenuModel componenteMenuModel;
  // Model for componenteBilletera component.
  late ComponenteBilleteraModel componenteBilleteraModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    componenteMenuModel = createModel(context, () => ComponenteMenuModel());
    componenteBilleteraModel =
        createModel(context, () => ComponenteBilleteraModel());
  }

  void dispose() {
    componenteMenuModel.dispose();
    componenteBilleteraModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
