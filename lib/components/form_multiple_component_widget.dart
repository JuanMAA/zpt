import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
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
import 'form_multiple_component_model.dart';
export 'form_multiple_component_model.dart';

class FormMultipleComponentWidget extends StatefulWidget {
  const FormMultipleComponentWidget({
    Key? key,
    this.fieldReference,
    required this.indexItem,
    this.valuesArray,
    required this.iterationIndex,
  }) : super(key: key);

  final DocumentReference? fieldReference;
  final int? indexItem;
  final List<String>? valuesArray;
  final int? iterationIndex;

  @override
  _FormMultipleComponentWidgetState createState() =>
      _FormMultipleComponentWidgetState();
}

class _FormMultipleComponentWidgetState
    extends State<FormMultipleComponentWidget> {
  late FormMultipleComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormMultipleComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.getDataField =
          await FieldsRecord.getDocumentOnce(widget.fieldReference!);
      setState(() {
        _model.uniqueKey = functions.generateUniqueKey()! +
            (widget.iterationIndex! * widget.iterationIndex!);
      });
      setState(() {
        FFAppState().addToValuesAndErrorsData(functions.createInputObject('',
            _model.getDataField?.label, _model.uniqueKey, widget.indexItem)!);
      });
      setState(() {
        _model.loadingForm = false;
      });
    });

    _model.createNumberController ??= TextEditingController();
    _model.createNumberFocusNode ??= FocusNode();

    _model.createTextController ??= TextEditingController();
    _model.createTextFocusNode ??= FocusNode();

    _model.editTextFocusNode ??= FocusNode();

    _model.editNumberFocusNode ??= FocusNode();

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        StreamBuilder<FieldsRecord>(
          stream: FieldsRecord.getDocument(widget.fieldReference!),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 40.0,
                  height: 40.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              );
            }
            final columnFieldsRecord = snapshot.data!;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.valuesArray?.length != 0)
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (_model.getDataField?.type == 'number')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 20.0, 24.0, 0.0),
                            child: TextFormField(
                              controller: _model.createNumberController,
                              focusNode: _model.createNumberFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.createNumberController',
                                Duration(milliseconds: 2000),
                                () async {
                                  setState(() {
                                    FFAppState()
                                        .updateValuesAndErrorsDataAtIndex(
                                      functions.getItemByIndexArray(
                                          FFAppState()
                                              .valuesAndErrorsData
                                              .toList(),
                                          _model.uniqueKey)!,
                                      (_) => functions.onChangeFormValidation(
                                          _model.getDataField,
                                          functions.createInputObject(
                                              _model
                                                  .createNumberController.text,
                                              _model.getDataField?.label,
                                              _model.uniqueKey,
                                              widget.indexItem)),
                                    );
                                  });
                                },
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: valueOrDefault<String>(
                                  '${valueOrDefault<String>(
                                    _model.getDataField?.label,
                                    'n/a',
                                  )} ${(widget.indexItem! + 1).toString()}${_model.getDataField!.required ? ' (Requerido)' : ''}',
                                  '0',
                                ),
                                labelStyle:
                                    FlutterFlowTheme.of(context).bodySmall,
                                hintText: '${valueOrDefault<String>(
                                  _model.getDataField?.label,
                                  'n/a',
                                )} ${(widget.indexItem! + 1).toString()}',
                                hintStyle:
                                    FlutterFlowTheme.of(context).bodySmall,
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
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              validator: _model.createNumberControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        if (_model.getDataField?.type == 'text')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 20.0, 24.0, 0.0),
                            child: TextFormField(
                              controller: _model.createTextController,
                              focusNode: _model.createTextFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.createTextController',
                                Duration(milliseconds: 2000),
                                () async {
                                  setState(() {
                                    FFAppState()
                                        .updateValuesAndErrorsDataAtIndex(
                                      functions.getItemByIndexArray(
                                          FFAppState()
                                              .valuesAndErrorsData
                                              .toList(),
                                          _model.uniqueKey)!,
                                      (_) => functions.onChangeFormValidation(
                                          _model.getDataField,
                                          functions.createInputObject(
                                              _model.createTextController.text,
                                              _model.getDataField?.label,
                                              _model.uniqueKey,
                                              widget.indexItem)),
                                    );
                                  });
                                },
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: '${valueOrDefault<String>(
                                  _model.getDataField?.label,
                                  'n/a',
                                )} ${(widget.indexItem! + 1).toString()}${_model.getDataField!.required ? ' (Requerido)' : ''}',
                                labelStyle:
                                    FlutterFlowTheme.of(context).bodySmall,
                                hintText: '${valueOrDefault<String>(
                                  _model.getDataField?.placeholder,
                                  'n/a',
                                )} ${(widget.indexItem! + 1).toString()}',
                                hintStyle:
                                    FlutterFlowTheme.of(context).bodySmall,
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
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              validator: _model.createTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                      ],
                    ),
                  ),
                if (widget.valuesArray?.length == 0)
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (_model.getDataField?.type == 'text')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 20.0, 24.0, 0.0),
                            child: TextFormField(
                              controller: _model.editTextController ??=
                                  TextEditingController(
                                text: functions.getValueMultipleArray(
                                    widget.valuesArray?.toList(),
                                    widget.indexItem,
                                    columnFieldsRecord.label),
                              ),
                              focusNode: _model.editTextFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.editTextController',
                                Duration(milliseconds: 2000),
                                () async {
                                  setState(() {
                                    FFAppState()
                                        .updateValuesAndErrorsDataAtIndex(
                                      functions.getItemByIndexArray(
                                          FFAppState()
                                              .valuesAndErrorsData
                                              .toList(),
                                          _model.uniqueKey)!,
                                      (_) => functions.onChangeFormValidation(
                                          _model.getDataField,
                                          functions.createInputObject(
                                              _model.editTextController.text,
                                              _model.getDataField?.label,
                                              _model.uniqueKey,
                                              widget.indexItem)),
                                    );
                                  });
                                },
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: '${valueOrDefault<String>(
                                  _model.getDataField?.label,
                                  'n/a',
                                )} ${(widget.indexItem! + 1).toString()}${_model.getDataField!.required ? ' (Requerido)' : ''}',
                                labelStyle:
                                    FlutterFlowTheme.of(context).bodySmall,
                                hintText: '${valueOrDefault<String>(
                                  _model.getDataField?.placeholder,
                                  'n/a',
                                )} ${(widget.indexItem! + 1).toString()}',
                                hintStyle:
                                    FlutterFlowTheme.of(context).bodySmall,
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
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              validator: _model.editTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        if (_model.getDataField?.type == 'number')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 20.0, 24.0, 0.0),
                            child: TextFormField(
                              controller: _model.editNumberController ??=
                                  TextEditingController(
                                text: functions.getValueMultipleArray(
                                    widget.valuesArray?.toList(),
                                    widget.indexItem,
                                    columnFieldsRecord.label),
                              ),
                              focusNode: _model.editNumberFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.editNumberController',
                                Duration(milliseconds: 2000),
                                () async {
                                  setState(() {
                                    FFAppState()
                                        .updateValuesAndErrorsDataAtIndex(
                                      functions.getItemByIndexArray(
                                          FFAppState()
                                              .valuesAndErrorsData
                                              .toList(),
                                          _model.uniqueKey)!,
                                      (_) => functions.onChangeFormValidation(
                                          _model.getDataField,
                                          functions.createInputObject(
                                              _model.editNumberController.text,
                                              _model.getDataField?.label,
                                              _model.uniqueKey,
                                              widget.indexItem)),
                                    );
                                  });
                                },
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: valueOrDefault<String>(
                                  '${valueOrDefault<String>(
                                    _model.getDataField?.label,
                                    'n/a',
                                  )} ${(widget.indexItem! + 1).toString()}${_model.getDataField!.required ? ' (Requerido)' : ''}',
                                  '0',
                                ),
                                labelStyle:
                                    FlutterFlowTheme.of(context).bodySmall,
                                hintText: '${valueOrDefault<String>(
                                  _model.getDataField?.label,
                                  'n/a',
                                )} ${(widget.indexItem! + 1).toString()}',
                                hintStyle:
                                    FlutterFlowTheme.of(context).bodySmall,
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
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              validator: _model.editNumberControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                      ],
                    ),
                  ),
                if (getJsonField(
                      FFAppState().valuesAndErrorsData[
                          functions.getItemByIndexArray(
                              FFAppState().valuesAndErrorsData.toList(),
                              _model.uniqueKey)!],
                      r'''$.error''',
                    ) !=
                    null)
                  Container(
                    decoration: BoxDecoration(),
                    child: Align(
                      alignment: AlignmentDirectional(-1.00, 0.00),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(24.0, 5.0, 0.0, 0.0),
                        child: Text(
                          getJsonField(
                            FFAppState().valuesAndErrorsData[
                                functions.getItemByIndexArray(
                                    FFAppState().valuesAndErrorsData.toList(),
                                    _model.uniqueKey)!],
                            r'''$.error''',
                          ).toString(),
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lexend',
                                    color: FlutterFlowTheme.of(context).error,
                                  ),
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
