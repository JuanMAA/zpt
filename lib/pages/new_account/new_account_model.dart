import '/componentes/componente_menu/componente_menu_widget.dart';
import '/components/new_account_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'new_account_widget.dart' show NewAccountWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewAccountModel extends FlutterFlowModel<NewAccountWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for componenteMenu component.
  late ComponenteMenuModel componenteMenuModel;
  // Model for newAccountComponent component.
  late NewAccountComponentModel newAccountComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    componenteMenuModel = createModel(context, () => ComponenteMenuModel());
    newAccountComponentModel =
        createModel(context, () => NewAccountComponentModel());
  }

  void dispose() {
    componenteMenuModel.dispose();
    newAccountComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
