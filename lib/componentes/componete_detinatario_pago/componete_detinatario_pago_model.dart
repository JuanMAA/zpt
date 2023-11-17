import '/componentes/componente_pago/componente_pago_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'componete_detinatario_pago_widget.dart'
    show ComponeteDetinatarioPagoWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ComponeteDetinatarioPagoModel
    extends FlutterFlowModel<ComponeteDetinatarioPagoWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for componentePago component.
  late ComponentePagoModel componentePagoModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    componentePagoModel = createModel(context, () => ComponentePagoModel());
  }

  void dispose() {
    componentePagoModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
