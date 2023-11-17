import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'componente_pago_widget.dart' show ComponentePagoWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ComponentePagoModel extends FlutterFlowModel<ComponentePagoWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for accountsList widget.
  String? accountsListValue;
  FormFieldController<String>? accountsListValueController;
  // State field(s) for currency widget.
  String? currencyValue;
  FormFieldController<String>? currencyValueController;
  // State field(s) for amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountController;
  String? Function(BuildContext, String?)? amountControllerValidator;
  String? _amountControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'c523py1d' /* El campo es requerido */,
      );
    }

    return null;
  }

  // State field(s) for year widget.
  String? yearValue;
  FormFieldController<String>? yearValueController;
  // State field(s) for month widget.
  String? monthValue;
  FormFieldController<String>? monthValueController;
  // State field(s) for commentary widget.
  FocusNode? commentaryFocusNode;
  TextEditingController? commentaryController;
  String? Function(BuildContext, String?)? commentaryControllerValidator;
  String? _commentaryControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'mwkxbsil' /* El campo es requerido */,
      );
    }

    return null;
  }

  // State field(s) for notifyRecipient widget.
  bool? notifyRecipientValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    amountControllerValidator = _amountControllerValidator;
    commentaryControllerValidator = _commentaryControllerValidator;
  }

  void dispose() {
    amountFocusNode?.dispose();
    amountController?.dispose();

    commentaryFocusNode?.dispose();
    commentaryController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
