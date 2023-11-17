import '/componentes/componente_login/componente_login_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'pagina_registro_widget.dart' show PaginaRegistroWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaginaRegistroModel extends FlutterFlowModel<PaginaRegistroWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for componenteLogin component.
  late ComponenteLoginModel componenteLoginModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    componenteLoginModel = createModel(context, () => ComponenteLoginModel());
  }

  void dispose() {
    componenteLoginModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
