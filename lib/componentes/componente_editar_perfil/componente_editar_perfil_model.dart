import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'componente_editar_perfil_widget.dart' show ComponenteEditarPerfilWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ComponenteEditarPerfilModel
    extends FlutterFlowModel<ComponenteEditarPerfilWidget> {
  ///  Local state fields for this component.

  String formattedRut = '';

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for firstNameInput widget.
  FocusNode? firstNameInputFocusNode;
  TextEditingController? firstNameInputController;
  String? Function(BuildContext, String?)? firstNameInputControllerValidator;
  String? _firstNameInputControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '28j7behd' /* El campo es requerido */,
      );
    }

    return null;
  }

  // State field(s) for lastNameInput widget.
  FocusNode? lastNameInputFocusNode;
  TextEditingController? lastNameInputController;
  String? Function(BuildContext, String?)? lastNameInputControllerValidator;
  String? _lastNameInputControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'd6x72ss8' /* El campo es requerido */,
      );
    }

    return null;
  }

  // State field(s) for documentIdInput widget.
  FocusNode? documentIdInputFocusNode;
  TextEditingController? documentIdInputController;
  String? Function(BuildContext, String?)? documentIdInputControllerValidator;
  String? _documentIdInputControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'fp0kx1i1' /* El campo es requerido */,
      );
    }

    return null;
  }

  // State field(s) for emailInput widget.
  FocusNode? emailInputFocusNode;
  TextEditingController? emailInputController;
  String? Function(BuildContext, String?)? emailInputControllerValidator;
  String? _emailInputControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'kt3b0rff' /* El campo es requerido */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '22u7tbnl' /* Introduzca una dirección de co... */,
      );
    }
    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    firstNameInputControllerValidator = _firstNameInputControllerValidator;
    lastNameInputControllerValidator = _lastNameInputControllerValidator;
    documentIdInputControllerValidator = _documentIdInputControllerValidator;
    emailInputControllerValidator = _emailInputControllerValidator;
  }

  void dispose() {
    firstNameInputFocusNode?.dispose();
    firstNameInputController?.dispose();

    lastNameInputFocusNode?.dispose();
    lastNameInputController?.dispose();

    documentIdInputFocusNode?.dispose();
    documentIdInputController?.dispose();

    emailInputFocusNode?.dispose();
    emailInputController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
