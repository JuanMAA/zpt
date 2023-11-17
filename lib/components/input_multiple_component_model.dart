import '/components/form_multiple_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'input_multiple_component_widget.dart' show InputMultipleComponentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InputMultipleComponentModel
    extends FlutterFlowModel<InputMultipleComponentWidget> {
  ///  Local state fields for this component.

  List<dynamic> fieldsValuesList = [];
  void addToFieldsValuesList(dynamic item) => fieldsValuesList.add(item);
  void removeFromFieldsValuesList(dynamic item) =>
      fieldsValuesList.remove(item);
  void removeAtIndexFromFieldsValuesList(int index) =>
      fieldsValuesList.removeAt(index);
  void insertAtIndexInFieldsValuesList(int index, dynamic item) =>
      fieldsValuesList.insert(index, item);
  void updateFieldsValuesListAtIndex(int index, Function(dynamic) updateFn) =>
      fieldsValuesList[index] = updateFn(fieldsValuesList[index]);

  dynamic emptyObject;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
