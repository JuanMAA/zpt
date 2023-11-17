import '/components/form_multiple_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'input_multiple_component_model.dart';
export 'input_multiple_component_model.dart';

class InputMultipleComponentWidget extends StatefulWidget {
  const InputMultipleComponentWidget({
    Key? key,
    this.fieldMultipleParam,
    this.valuesArray,
    required this.iterationIndex,
    required this.title,
  }) : super(key: key);

  final List<DocumentReference>? fieldMultipleParam;
  final List<String>? valuesArray;
  final int? iterationIndex;
  final String? title;

  @override
  _InputMultipleComponentWidgetState createState() =>
      _InputMultipleComponentWidgetState();
}

class _InputMultipleComponentWidgetState
    extends State<InputMultipleComponentWidget> {
  late InputMultipleComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InputMultipleComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (valueOrDefault<String>(
            widget.valuesArray?[0],
            '0',
          ) ==
          '0') {
        // Crear Formulario Multiple
        setState(() {
          _model.addToFieldsValuesList(
              functions.createInputObject('', '', 0, 0)!);
        });
      } else {
        // Rellenar Formulario Multiple
        setState(() {
          _model.fieldsValuesList = functions
              .generateMultipleItemData(widget.valuesArray?.toList())!
              .toList()
              .cast<dynamic>();
        });
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Builder(
            builder: (context) {
              final itemIndex = _model.fieldsValuesList.toList();
              return ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: itemIndex.length,
                itemBuilder: (context, itemIndexIndex) {
                  final itemIndexItem = itemIndex[itemIndexIndex];
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Divider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).accent4,
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.00, 0.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 10.0, 24.0, 0.0),
                          child: Text(
                            '${widget.title} ${(itemIndexIndex + 1).toString()}',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context).bodySmall,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.00, 0.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 10.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              setState(() {
                                _model.removeAtIndexFromFieldsValuesList(
                                    itemIndexIndex);
                              });
                            },
                            text: 'Quitar',
                            icon: Icon(
                              Icons.close,
                              size: 12.0,
                            ),
                            options: FFButtonOptions(
                              width: 110.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).error,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Lexend',
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          final fieldMutiple =
                              widget.fieldMultipleParam?.toList() ?? [];
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: fieldMutiple.length,
                            itemBuilder: (context, fieldMutipleIndex) {
                              final fieldMutipleItem =
                                  fieldMutiple[fieldMutipleIndex];
                              return Container(
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FormMultipleComponentWidget(
                                      key: Key(
                                          'Keyqh7_${fieldMutipleIndex}_of_${fieldMutiple.length}'),
                                      fieldReference: fieldMutipleItem,
                                      indexItem: itemIndexIndex,
                                      valuesArray: widget.valuesArray,
                                      iterationIndex: fieldMutipleIndex,
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
          Align(
            alignment: AlignmentDirectional(-1.00, 0.00),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  setState(() {
                    _model.addToFieldsValuesList(
                        functions.createInputObject('', '', 0, 0)!);
                  });
                },
                text: FFLocalizations.of(context).getText(
                  'flah2m29' /* Agregar Nuevo */,
                ),
                icon: Icon(
                  Icons.add,
                  size: 15.0,
                ),
                options: FFButtonOptions(
                  width: 150.0,
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFF005296),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Lexend',
                        color: FlutterFlowTheme.of(context).textColor,
                        fontSize: 12.0,
                      ),
                  elevation: 3.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
