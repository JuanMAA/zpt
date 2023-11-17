import '/componentes/componente_pago/componente_pago_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'componete_detinatario_pago_model.dart';
export 'componete_detinatario_pago_model.dart';

class ComponeteDetinatarioPagoWidget extends StatefulWidget {
  const ComponeteDetinatarioPagoWidget({Key? key}) : super(key: key);

  @override
  _ComponeteDetinatarioPagoWidgetState createState() =>
      _ComponeteDetinatarioPagoWidgetState();
}

class _ComponeteDetinatarioPagoWidgetState
    extends State<ComponeteDetinatarioPagoWidget> {
  late ComponeteDetinatarioPagoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponeteDetinatarioPagoModel());

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

    return Material(
      color: Colors.transparent,
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 0.879,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height * 0.84,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0.0),
          shape: BoxShape.rectangle,
        ),
        child: wrapWithModel(
          model: _model.componentePagoModel,
          updateCallback: () => setState(() {}),
          child: ComponentePagoWidget(),
        ),
      ),
    );
  }
}
