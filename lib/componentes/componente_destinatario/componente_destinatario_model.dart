import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'componente_destinatario_widget.dart' show ComponenteDestinatarioWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ComponenteDestinatarioModel
    extends FlutterFlowModel<ComponenteDestinatarioWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for rutRecipient widget.
  FocusNode? rutRecipientFocusNode;
  TextEditingController? rutRecipientController;
  String? Function(BuildContext, String?)? rutRecipientControllerValidator;
  String? _rutRecipientControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '8b064d7v' /* El campo es requerido */,
      );
    }

    return null;
  }

  // State field(s) for nameRecipient widget.
  FocusNode? nameRecipientFocusNode;
  TextEditingController? nameRecipientController;
  String? Function(BuildContext, String?)? nameRecipientControllerValidator;
  String? _nameRecipientControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '7qswbt5f' /* El campo es requerido */,
      );
    }

    if (val.length > 30) {
      return 'Maximum 30 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for bankRecipient widget.
  String? bankRecipientValue;
  FormFieldController<String>? bankRecipientValueController;
  // State field(s) for typeAccountRecipient widget.
  FormFieldController<String>? typeAccountRecipientValueController;
  // State field(s) for numberAcountRecipient widget.
  FocusNode? numberAcountRecipientFocusNode;
  TextEditingController? numberAcountRecipientController;
  String? Function(BuildContext, String?)?
      numberAcountRecipientControllerValidator;
  String? _numberAcountRecipientControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'd4y09a5n' /* El campo es requerido */,
      );
    }

    if (val.length > 40) {
      return 'Maximum 40 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for emailAddressRecipient widget.
  FocusNode? emailAddressRecipientFocusNode;
  TextEditingController? emailAddressRecipientController;
  String? Function(BuildContext, String?)?
      emailAddressRecipientControllerValidator;
  String? _emailAddressRecipientControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ef5d6svt' /* El campo es requerido */,
      );
    }

    if (val.length > 100) {
      return 'Maximum 100 characters allowed, currently ${val.length}.';
    }
    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'ab2afnki' /* Introduzca una dirección de co... */,
      );
    }
    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button-Login widget.
  UserAccountsRecord? userAccountCreated;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    rutRecipientControllerValidator = _rutRecipientControllerValidator;
    nameRecipientControllerValidator = _nameRecipientControllerValidator;
    numberAcountRecipientControllerValidator =
        _numberAcountRecipientControllerValidator;
    emailAddressRecipientControllerValidator =
        _emailAddressRecipientControllerValidator;
  }

  void dispose() {
    rutRecipientFocusNode?.dispose();
    rutRecipientController?.dispose();

    nameRecipientFocusNode?.dispose();
    nameRecipientController?.dispose();

    numberAcountRecipientFocusNode?.dispose();
    numberAcountRecipientController?.dispose();

    emailAddressRecipientFocusNode?.dispose();
    emailAddressRecipientController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get typeAccountRecipientValue =>
      typeAccountRecipientValueController?.value;
}
