import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/componentes/componente_mensaje/componente_mensaje_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'componente_transacciones_model.dart';
export 'componente_transacciones_model.dart';

class ComponenteTransaccionesWidget extends StatefulWidget {
  const ComponenteTransaccionesWidget({Key? key}) : super(key: key);

  @override
  _ComponenteTransaccionesWidgetState createState() =>
      _ComponenteTransaccionesWidgetState();
}

class _ComponenteTransaccionesWidgetState
    extends State<ComponenteTransaccionesWidget> {
  late ComponenteTransaccionesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponenteTransaccionesModel());

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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24.0, 20.0, 24.0, 20.0),
          child: Text(
            FFLocalizations.of(context).getText(
              '09xeljiv' /* Aquí tienes un informe detalla... */,
            ),
            textAlign: TextAlign.start,
            style: FlutterFlowTheme.of(context).bodySmall,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: StreamBuilder<List<TransactionsRecord>>(
              stream: queryTransactionsRecord(
                queryBuilder: (transactionsRecord) => transactionsRecord.where(
                  'user',
                  isEqualTo: currentUserReference,
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
                List<TransactionsRecord> dataTableTransactionsRecordList =
                    snapshot.data!;
                if (dataTableTransactionsRecordList.isEmpty) {
                  return ComponenteMensajeWidget();
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 3.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    child: DataTable2(
                      columns: [
                        DataColumn2(
                          label: DefaultTextStyle.merge(
                            softWrap: true,
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'pvqw94u0' /* Tipo de cuenta */,
                              ),
                              style: FlutterFlowTheme.of(context).labelLarge,
                            ),
                          ),
                        ),
                        DataColumn2(
                          label: DefaultTextStyle.merge(
                            softWrap: true,
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'tycyk4px' /* Detalle del pago */,
                              ),
                              style: FlutterFlowTheme.of(context).labelLarge,
                            ),
                          ),
                        ),
                        DataColumn2(
                          label: DefaultTextStyle.merge(
                            softWrap: true,
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '23g8ffx4' /* Monto */,
                              ),
                              style: FlutterFlowTheme.of(context).labelLarge,
                            ),
                          ),
                        ),
                        DataColumn2(
                          label: DefaultTextStyle.merge(
                            softWrap: true,
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'fj171d1u' /* Fecha de depósito */,
                              ),
                              style: FlutterFlowTheme.of(context).labelLarge,
                            ),
                          ),
                        ),
                        DataColumn2(
                          label: DefaultTextStyle.merge(
                            softWrap: true,
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '6so8ii1q' /* Estado */,
                              ),
                              style: FlutterFlowTheme.of(context).labelLarge,
                            ),
                          ),
                        ),
                        DataColumn2(
                          label: DefaultTextStyle.merge(
                            softWrap: true,
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'kz22nlov' /* Acciones */,
                              ),
                              style: FlutterFlowTheme.of(context).labelLarge,
                            ),
                          ),
                        ),
                      ],
                      rows: dataTableTransactionsRecordList
                          .mapIndexed((dataTableIndex,
                                  dataTableTransactionsRecord) =>
                              [
                                Text(
                                  dataTableTransactionsRecord.transactionType,
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                Text(
                                  dataTableTransactionsRecord
                                      .transactionDescription,
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                Text(
                                  dataTableTransactionsRecord.transactionAmount
                                      .toString(),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                Text(
                                  dateTimeFormat(
                                    'yMMMd',
                                    dataTableTransactionsRecord
                                        .transactionDate!,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                Text(
                                  dataTableTransactionsRecord.transactionStatus,
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                FFButtonWidget(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '60fuwjg6' /* Ver Mas */,
                                  ),
                                  icon: Icon(
                                    Icons.remove_red_eye,
                                    size: 15.0,
                                  ),
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Lexend',
                                          color: Colors.white,
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ].map((c) => DataCell(c)).toList())
                          .map((e) => DataRow(cells: e))
                          .toList(),
                      headingRowColor: MaterialStateProperty.all(
                        FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      headingRowHeight: 56.0,
                      dataRowColor: MaterialStateProperty.all(
                        FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      dataRowHeight: 56.0,
                      border: TableBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      dividerThickness: 1.0,
                      showBottomBorder: true,
                      minWidth: 49.0,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
