import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'form_multiple_component_widget.dart' show FormMultipleComponentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FormMultipleComponentModel
    extends FlutterFlowModel<FormMultipleComponentWidget> {
  ///  Local state fields for this component.

  FieldsRecord? fieldDocument;

  int? uniqueKey;

  bool loadingForm = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in formMultipleComponent widget.
  FieldsRecord? getDataField;
  // State field(s) for createNumber widget.
  FocusNode? createNumberFocusNode;
  TextEditingController? createNumberController;
  String? Function(BuildContext, String?)? createNumberControllerValidator;
  // State field(s) for createText widget.
  FocusNode? createTextFocusNode;
  TextEditingController? createTextController;
  String? Function(BuildContext, String?)? createTextControllerValidator;
  // State field(s) for editText widget.
  FocusNode? editTextFocusNode;
  TextEditingController? editTextController;
  String? Function(BuildContext, String?)? editTextControllerValidator;
  // State field(s) for editNumber widget.
  FocusNode? editNumberFocusNode;
  TextEditingController? editNumberController;
  String? Function(BuildContext, String?)? editNumberControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    createNumberFocusNode?.dispose();
    createNumberController?.dispose();

    createTextFocusNode?.dispose();
    createTextController?.dispose();

    editTextFocusNode?.dispose();
    editTextController?.dispose();

    editNumberFocusNode?.dispose();
    editNumberController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
