import '/componentes/componente_registro/componente_registro_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'pagina_home_widget.dart' show PaginaHomeWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaginaHomeModel extends FlutterFlowModel<PaginaHomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for componenteRegistro component.
  late ComponenteRegistroModel componenteRegistroModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    componenteRegistroModel =
        createModel(context, () => ComponenteRegistroModel());
  }

  void dispose() {
    componenteRegistroModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
