import '/backend/backend.dart';
import '/components/input_multiple_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'input_component_widget.dart' show InputComponentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InputComponentModel extends FlutterFlowModel<InputComponentWidget> {
  ///  Local state fields for this component.

  String? errorMessage = '';

  String? compareItem;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for textEdit widget.
  FocusNode? textEditFocusNode;
  TextEditingController? textEditController;
  String? Function(BuildContext, String?)? textEditControllerValidator;
  // State field(s) for numberEdit widget.
  FocusNode? numberEditFocusNode;
  TextEditingController? numberEditController;
  String? Function(BuildContext, String?)? numberEditControllerValidator;
  // Model for inputMultipleComponent component.
  late InputMultipleComponentModel inputMultipleComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    inputMultipleComponentModel =
        createModel(context, () => InputMultipleComponentModel());
  }

  void dispose() {
    textEditFocusNode?.dispose();
    textEditController?.dispose();

    numberEditFocusNode?.dispose();
    numberEditController?.dispose();

    inputMultipleComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
