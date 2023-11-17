import '/componentes/componente_tutorial/componente_tutorial_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'pagina_tutorial_widget.dart' show PaginaTutorialWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaginaTutorialModel extends FlutterFlowModel<PaginaTutorialWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for componenteTutorial component.
  late ComponenteTutorialModel componenteTutorialModel1;
  // Model for componenteTutorial component.
  late ComponenteTutorialModel componenteTutorialModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    componenteTutorialModel1 =
        createModel(context, () => ComponenteTutorialModel());
    componenteTutorialModel2 =
        createModel(context, () => ComponenteTutorialModel());
  }

  void dispose() {
    componenteTutorialModel1.dispose();
    componenteTutorialModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
