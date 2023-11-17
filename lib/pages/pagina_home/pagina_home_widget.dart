import '/componentes/componente_registro/componente_registro_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pagina_home_model.dart';
export 'pagina_home_model.dart';

class PaginaHomeWidget extends StatefulWidget {
  const PaginaHomeWidget({Key? key}) : super(key: key);

  @override
  _PaginaHomeWidgetState createState() => _PaginaHomeWidgetState();
}

class _PaginaHomeWidgetState extends State<PaginaHomeWidget> {
  late PaginaHomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaginaHomeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 400.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.00, 1.00),
                  child: wrapWithModel(
                    model: _model.componenteRegistroModel,
                    updateCallback: () => setState(() {}),
                    child: ComponenteRegistroWidget(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
