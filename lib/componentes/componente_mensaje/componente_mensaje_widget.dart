import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'componente_mensaje_model.dart';
export 'componente_mensaje_model.dart';

class ComponenteMensajeWidget extends StatefulWidget {
  const ComponenteMensajeWidget({
    Key? key,
    String? message,
  })  : this.message = message ?? 'No se encuentran registros',
        super(key: key);

  final String message;

  @override
  _ComponenteMensajeWidgetState createState() =>
      _ComponenteMensajeWidgetState();
}

class _ComponenteMensajeWidgetState extends State<ComponenteMensajeWidget> {
  late ComponenteMensajeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponenteMensajeModel());

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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
          child: Icon(
            Icons.error_outline,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 200.0,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
          child: Text(
            widget.message,
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).titleMedium,
          ),
        ),
      ],
    );
  }
}
