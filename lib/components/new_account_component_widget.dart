import '/backend/backend.dart';
import '/componentes/componente_mensaje/componente_mensaje_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'new_account_component_model.dart';
export 'new_account_component_model.dart';

class NewAccountComponentWidget extends StatefulWidget {
  const NewAccountComponentWidget({
    Key? key,
    int? gridQty,
    required this.accountTypeData,
  })  : this.gridQty = gridQty ?? 2,
        super(key: key);

  final int gridQty;
  final DocumentReference? accountTypeData;

  @override
  _NewAccountComponentWidgetState createState() =>
      _NewAccountComponentWidgetState();
}

class _NewAccountComponentWidgetState extends State<NewAccountComponentWidget>
    with TickerProviderStateMixin {
  late NewAccountComponentModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.linear,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewAccountComponentModel());

    _model.searchController ??= TextEditingController();

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
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 20.0, 0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.safePop();
                },
                child: Icon(
                  Icons.arrow_back_outlined,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 40.0,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 24.0, 0.0),
                    child: StreamBuilder<AccountTypesRecord>(
                      stream: AccountTypesRecord.getDocument(
                          widget.accountTypeData!),
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
                        final textAccountTypesRecord = snapshot.data!;
                        return Text(
                          FFLocalizations.of(context).getText(
                            '20fd5baa' /* ¿Listo para saldar cuentas? ¿C... */,
                          ),
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Lexend',
                                    fontSize: MediaQuery.sizeOf(context).width >
                                            kBreakpointSmall
                                        ? 15.0
                                        : 14.0,
                                  ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 10.0, 0.0),
                    child: StreamBuilder<AccountTypesRecord>(
                      stream: AccountTypesRecord.getDocument(
                          widget.accountTypeData!),
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
                        final textAccountTypesRecord = snapshot.data!;
                        return Text(
                          textAccountTypesRecord.name,
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Lexend',
                                    fontSize: MediaQuery.sizeOf(context).width >
                                            kBreakpointSmall
                                        ? 17.0
                                        : 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24.0, 15.0, 24.0, 7.0),
          child: StreamBuilder<List<AccountsRecord>>(
            stream: queryAccountsRecord(
              queryBuilder: (accountsRecord) => accountsRecord.where(
                'account_type',
                isEqualTo: widget.accountTypeData,
              ),
            ),
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
              List<AccountsRecord> searchAccountsRecordList = snapshot.data!;
              return Autocomplete<String>(
                initialValue: TextEditingValue(),
                optionsBuilder: (textEditingValue) {
                  if (textEditingValue.text == '') {
                    return const Iterable<String>.empty();
                  }
                  return searchAccountsRecordList
                      .map((e) => e.name)
                      .toList()
                      .where((option) {
                    final lowercaseOption = option.toLowerCase();
                    return lowercaseOption
                        .contains(textEditingValue.text.toLowerCase());
                  });
                },
                optionsViewBuilder: (context, onSelected, options) {
                  return AutocompleteOptionsList(
                    textFieldKey: _model.searchKey,
                    textController: _model.searchController!,
                    options: options.toList(),
                    onSelected: onSelected,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium,
                    textHighlightStyle: TextStyle(),
                    elevation: 4.0,
                    optionBackgroundColor:
                        FlutterFlowTheme.of(context).primaryBackground,
                    optionHighlightColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    maxHeight: 200.0,
                  );
                },
                onSelected: (String selection) {
                  setState(() => _model.searchSelectedOption = selection);
                  FocusScope.of(context).unfocus();
                },
                fieldViewBuilder: (
                  context,
                  textEditingController,
                  focusNode,
                  onEditingComplete,
                ) {
                  _model.searchFocusNode = focusNode;

                  _model.searchController = textEditingController;
                  return TextFormField(
                    key: _model.searchKey,
                    controller: textEditingController,
                    focusNode: focusNode,
                    onEditingComplete: onEditingComplete,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.searchController',
                      Duration(milliseconds: 2000),
                      () => setState(() {}),
                    ),
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: FFLocalizations.of(context).getText(
                        '0vflie9s' /* ¿Qué cuenta quieres pagar? */,
                      ),
                      labelStyle: FlutterFlowTheme.of(context).bodySmall,
                      hintText: FFLocalizations.of(context).getText(
                        'pylya0zb' /* Ingresa aquí el tipo de cuenta... */,
                      ),
                      hintStyle: FlutterFlowTheme.of(context).bodySmall,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                          20.0, 24.0, 20.0, 24.0),
                      suffixIcon: _model.searchController!.text.isNotEmpty
                          ? InkWell(
                              onTap: () async {
                                _model.searchController?.clear();
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
                    validator:
                        _model.searchControllerValidator.asValidator(context),
                  );
                },
              );
            },
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 10.0, 24.0, 0.0),
            child: StreamBuilder<List<AccountsRecord>>(
              stream: queryAccountsRecord(
                queryBuilder: (accountsRecord) => accountsRecord.where(
                  'account_type',
                  isEqualTo: widget.accountTypeData,
                ),
              ),
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
                List<AccountsRecord> gridViewAccountsRecordList =
                    snapshot.data!;
                if (gridViewAccountsRecordList.isEmpty) {
                  return ComponenteMensajeWidget();
                }
                return GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: widget.gridQty,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 1.0,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: gridViewAccountsRecordList.length,
                  itemBuilder: (context, gridViewIndex) {
                    final gridViewAccountsRecord =
                        gridViewAccountsRecordList[gridViewIndex];
                    return Visibility(
                      visible: functions.validateIncludes(
                              _model.searchController.text,
                              gridViewAccountsRecord.name) ??
                          true,
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            'paginaCuenta',
                            queryParameters: {
                              'accountsParam': serializeParam(
                                gridViewAccountsRecord.reference,
                                ParamType.DocumentReference,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.868,
                          height: 25.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            borderRadius: BorderRadius.circular(8.0),
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 12.0, 12.0, 12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  child: custom_widgets.GenerateIcon(
                                    width: 50.0,
                                    height: 50.0,
                                    icon: valueOrDefault<String>(
                                      gridViewAccountsRecord.name,
                                      'na',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Text(
                                    gridViewAccountsRecord.name,
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Lexend',
                                          fontSize: 14.0,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Text(
                                    gridViewAccountsRecord.description,
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Lexend',
                                          fontSize: 12.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation']!),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
