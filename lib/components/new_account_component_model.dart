import '/backend/backend.dart';
import '/componentes/componente_mensaje/componente_mensaje_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'new_account_component_widget.dart' show NewAccountComponentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewAccountComponentModel
    extends FlutterFlowModel<NewAccountComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for search widget.
  final searchKey = GlobalKey();
  FocusNode? searchFocusNode;
  TextEditingController? searchController;
  String? searchSelectedOption;
  String? Function(BuildContext, String?)? searchControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    searchFocusNode?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
