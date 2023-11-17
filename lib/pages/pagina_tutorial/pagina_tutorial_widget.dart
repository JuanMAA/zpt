import '/componentes/componente_tutorial/componente_tutorial_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pagina_tutorial_model.dart';
export 'pagina_tutorial_model.dart';

class PaginaTutorialWidget extends StatefulWidget {
  const PaginaTutorialWidget({Key? key}) : super(key: key);

  @override
  _PaginaTutorialWidgetState createState() => _PaginaTutorialWidgetState();
}

class _PaginaTutorialWidgetState extends State<PaginaTutorialWidget> {
  late PaginaTutorialModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaginaTutorialModel());

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
      body: SafeArea(
        top: true,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (responsiveVisibility(
              context: context,
              phone: false,
            ))
              Container(
                width: 500.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: Color(0x00FFFFFF),
                ),
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: wrapWithModel(
                        model: _model.componenteTutorialModel1,
                        updateCallback: () => setState(() {}),
                        child: ComponenteTutorialWidget(),
                      ),
                    ),
                  ],
                ),
              ),
            if (responsiveVisibility(
              context: context,
              tablet: false,
              tabletLandscape: false,
              desktop: false,
            ))
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: Color(0x00FFFFFF),
                ),
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    wrapWithModel(
                      model: _model.componenteTutorialModel2,
                      updateCallback: () => setState(() {}),
                      child: ComponenteTutorialWidget(),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
