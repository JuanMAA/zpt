import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/input_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dynamic_component_widget.dart' show DynamicComponentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DynamicComponentModel extends FlutterFlowModel<DynamicComponentWidget> {
  ///  Local state fields for this component.

  DocumentReference? fieldsParam;

  List<dynamic> validationValues = [];
  void addToValidationValues(dynamic item) => validationValues.add(item);
  void removeFromValidationValues(dynamic item) =>
      validationValues.remove(item);
  void removeAtIndexFromValidationValues(int index) =>
      validationValues.removeAt(index);
  void insertAtIndexInValidationValues(int index, dynamic item) =>
      validationValues.insert(index, item);
  void updateValidationValuesAtIndex(int index, Function(dynamic) updateFn) =>
      validationValues[index] = updateFn(validationValues[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for businessEdit widget.
  String? businessEditValue;
  FormFieldController<String>? businessEditValueController;
  // State field(s) for aliasEdit widget.
  FocusNode? aliasEditFocusNode;
  TextEditingController? aliasEditController;
  String? Function(BuildContext, String?)? aliasEditControllerValidator;
  // State field(s) for businessCreate widget.
  String? businessCreateValue;
  FormFieldController<String>? businessCreateValueController;
  // State field(s) for aliasCreate widget.
  FocusNode? aliasCreateFocusNode;
  TextEditingController? aliasCreateController;
  String? Function(BuildContext, String?)? aliasCreateControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    aliasEditFocusNode?.dispose();
    aliasEditController?.dispose();

    aliasCreateFocusNode?.dispose();
    aliasCreateController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
