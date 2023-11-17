import '/backend/backend.dart';
import '/componentes/componente_menu/componente_menu_widget.dart';
import '/components/dynamic_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'pagina_cuenta_widget.dart' show PaginaCuentaWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaginaCuentaModel extends FlutterFlowModel<PaginaCuentaWidget> {
  ///  Local state fields for this page.

  List<String> valuesArray = [];
  void addToValuesArray(String item) => valuesArray.add(item);
  void removeFromValuesArray(String item) => valuesArray.remove(item);
  void removeAtIndexFromValuesArray(int index) => valuesArray.removeAt(index);
  void insertAtIndexInValuesArray(int index, String item) =>
      valuesArray.insert(index, item);
  void updateValuesArrayAtIndex(int index, Function(String) updateFn) =>
      valuesArray[index] = updateFn(valuesArray[index]);

  ///  State fields for stateful widgets in this page.

  // Model for componenteMenu component.
  late ComponenteMenuModel componenteMenuModel;
  // Model for dynamicComponent component.
  late DynamicComponentModel dynamicComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    componenteMenuModel = createModel(context, () => ComponenteMenuModel());
    dynamicComponentModel = createModel(context, () => DynamicComponentModel());
  }

  void dispose() {
    componenteMenuModel.dispose();
    dynamicComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
