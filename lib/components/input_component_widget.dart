import '/backend/backend.dart';
import '/components/input_multiple_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'input_component_model.dart';
export 'input_component_model.dart';

class InputComponentWidget extends StatefulWidget {
  const InputComponentWidget({
    Key? key,
    required this.fieldReferenceParam,
    required this.currentIndex,
    required this.documentParam,
    this.valuesArray,
  }) : super(key: key);

  final DocumentReference? fieldReferenceParam;
  final int? currentIndex;
  final FieldsRecord? documentParam;
  final List<String>? valuesArray;

  @override
  _InputComponentWidgetState createState() => _InputComponentWidgetState();
}

class _InputComponentWidgetState extends State<InputComponentWidget> {
  late InputComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InputComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.fieldReferenceParam != null) {
        // registerForm
        setState(() {
          FFAppState().insertAtIndexInValuesAndErrorsData(
              widget.currentIndex!,
              functions.createInputObject(
                  '', widget.documentParam?.label, 0, 0)!);
        });
      } else {
        // registerForm
        setState(() {
          FFAppState().insertAtIndexInValuesAndErrorsData(
              widget.currentIndex!,
              functions.createInputObject(
                  '', widget.documentParam?.label, 0, 0)!);
        });
      }
    });

    _model.textEditFocusNode ??= FocusNode();

    _model.numberEditFocusNode ??= FocusNode();

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

    return StreamBuilder<FieldsRecord>(
      stream: FieldsRecord.getDocument(widget.fieldReferenceParam!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: SpinKitFoldingCube(
                color: FlutterFlowTheme.of(context).primary,
                size: 50.0,
              ),
            ),
          );
        }
        final columnFieldsFieldsRecord = snapshot.data!;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
              key: _model.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (columnFieldsFieldsRecord.type == 'text')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 20.0, 24.0, 0.0),
                          child: TextFormField(
                            controller: _model.textEditController ??=
                                TextEditingController(
                              text: functions.getValueFromJsonArray(
                                  widget.valuesArray?.toList(),
                                  columnFieldsFieldsRecord.label),
                            ),
                            focusNode: _model.textEditFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textEditController',
                              Duration(milliseconds: 2000),
                              () async {
                                setState(() {
                                  FFAppState().updateValuesAndErrorsDataAtIndex(
                                    widget.currentIndex!,
                                    (_) => functions.onChangeFormValidation(
                                        columnFieldsFieldsRecord,
                                        functions.createInputObject(
                                            _model.textEditController.text,
                                            columnFieldsFieldsRecord.label,
                                            0,
                                            0)),
                                  );
                                });
                              },
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText:
                                  '${columnFieldsFieldsRecord.label}${columnFieldsFieldsRecord.required ? ' (Requerido)' : ''}',
                              labelStyle:
                                  FlutterFlowTheme.of(context).bodySmall,
                              hintText:
                                  '${columnFieldsFieldsRecord.placeholder}',
                              hintStyle: FlutterFlowTheme.of(context).bodySmall,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 24.0, 20.0, 24.0),
                              suffixIcon:
                                  _model.textEditController!.text.isNotEmpty
                                      ? InkWell(
                                          onTap: () async {
                                            _model.textEditController?.clear();
                                            setState(() {
                                              FFAppState()
                                                  .updateValuesAndErrorsDataAtIndex(
                                                widget.currentIndex!,
                                                (_) => functions.onChangeFormValidation(
                                                    columnFieldsFieldsRecord,
                                                    functions.createInputObject(
                                                        _model
                                                            .textEditController
                                                            .text,
                                                        columnFieldsFieldsRecord
                                                            .label,
                                                        0,
                                                        0)),
                                              );
                                            });
                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.clear,
                                            color: Color(0xFF757575),
                                            size: 22.0,
                                          ),
                                        )
                                      : null,
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: _model.textEditControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      if (columnFieldsFieldsRecord.type == 'number')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 20.0, 24.0, 0.0),
                          child: TextFormField(
                            controller: _model.numberEditController ??=
                                TextEditingController(
                              text: functions.getValueFromJsonArray(
                                  widget.valuesArray?.toList(),
                                  columnFieldsFieldsRecord.label),
                            ),
                            focusNode: _model.numberEditFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.numberEditController',
                              Duration(milliseconds: 2000),
                              () async {
                                setState(() {
                                  FFAppState().updateValuesAndErrorsDataAtIndex(
                                    widget.currentIndex!,
                                    (_) => functions.onChangeFormValidation(
                                        columnFieldsFieldsRecord,
                                        functions.createInputObject(
                                            _model.numberEditController.text,
                                            columnFieldsFieldsRecord.label,
                                            0,
                                            0)),
                                  );
                                });
                              },
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: columnFieldsFieldsRecord.label,
                              labelStyle:
                                  FlutterFlowTheme.of(context).bodySmall,
                              hintText: columnFieldsFieldsRecord.placeholder,
                              hintStyle: FlutterFlowTheme.of(context).bodySmall,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 24.0, 20.0, 24.0),
                              suffixIcon:
                                  _model.numberEditController!.text.isNotEmpty
                                      ? InkWell(
                                          onTap: () async {
                                            _model.numberEditController
                                                ?.clear();
                                            setState(() {
                                              FFAppState()
                                                  .updateValuesAndErrorsDataAtIndex(
                                                widget.currentIndex!,
                                                (_) => functions.onChangeFormValidation(
                                                    columnFieldsFieldsRecord,
                                                    functions.createInputObject(
                                                        _model
                                                            .numberEditController
                                                            .text,
                                                        columnFieldsFieldsRecord
                                                            .label,
                                                        0,
                                                        0)),
                                              );
                                            });
                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.clear,
                                            color: Color(0xFF757575),
                                            size: 22.0,
                                          ),
                                        )
                                      : null,
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: _model.numberEditControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      if (getJsonField(
                            FFAppState()
                                .valuesAndErrorsData[widget.currentIndex!],
                            r'''$.error''',
                          ) !=
                          null)
                        Align(
                          alignment: AlignmentDirectional(-1.00, 0.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 5.0, 0.0, 0.0),
                            child: Text(
                              getJsonField(
                                FFAppState()
                                    .valuesAndErrorsData[widget.currentIndex!],
                                r'''$.error''',
                              ).toString(),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lexend',
                                    color: FlutterFlowTheme.of(context).error,
                                  ),
                            ),
                          ),
                        ),
                      if (columnFieldsFieldsRecord.type == 'multiple')
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: wrapWithModel(
                                      model: _model.inputMultipleComponentModel,
                                      updateCallback: () => setState(() {}),
                                      child: InputMultipleComponentWidget(
                                        fieldMultipleParam:
                                            columnFieldsFieldsRecord
                                                .multipleField,
                                        valuesArray: widget.valuesArray,
                                        iterationIndex: widget.currentIndex!,
                                        title: columnFieldsFieldsRecord
                                            .multipleTitle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
