import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'componente_registro_widget.dart' show ComponenteRegistroWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ComponenteRegistroModel
    extends FlutterFlowModel<ComponenteRegistroWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for emailAddress-login widget.
  FocusNode? emailAddressLoginFocusNode;
  TextEditingController? emailAddressLoginController;
  String? Function(BuildContext, String?)? emailAddressLoginControllerValidator;
  String? _emailAddressLoginControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'deifasn4' /* El campo es requerido */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '97re45i0' /* Introduzca una dirección de co... */,
      );
    }
    return null;
  }

  // State field(s) for password-login widget.
  FocusNode? passwordLoginFocusNode;
  TextEditingController? passwordLoginController;
  late bool passwordLoginVisibility;
  String? Function(BuildContext, String?)? passwordLoginControllerValidator;
  String? _passwordLoginControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'kx4bjlep' /* El campo es requerido */,
      );
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    emailAddressLoginControllerValidator =
        _emailAddressLoginControllerValidator;
    passwordLoginVisibility = false;
    passwordLoginControllerValidator = _passwordLoginControllerValidator;
  }

  void dispose() {
    emailAddressLoginFocusNode?.dispose();
    emailAddressLoginController?.dispose();

    passwordLoginFocusNode?.dispose();
    passwordLoginController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
