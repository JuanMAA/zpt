import '/auth/firebase_auth/auth_util.dart';
import '/componentes/componente_menu/componente_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'pagina_restablecer_widget.dart' show PaginaRestablecerWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaginaRestablecerModel extends FlutterFlowModel<PaginaRestablecerWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for componenteMenu component.
  late ComponenteMenuModel componenteMenuModel;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  String? _emailAddressControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'nfbgvad0' /* El campo es requerido */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '8jmmau8k' /* Introduzca una dirección de co... */,
      );
    }
    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    componenteMenuModel = createModel(context, () => ComponenteMenuModel());
    emailAddressControllerValidator = _emailAddressControllerValidator;
  }

  void dispose() {
    componenteMenuModel.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
