// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class GenerateIcon extends StatefulWidget {
  const GenerateIcon({
    Key? key,
    this.width,
    this.height,
    this.icon,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? icon;

  @override
  _GenerateIconState createState() => _GenerateIconState();
}

class _GenerateIconState extends State<GenerateIcon> {
  @override
  Widget build(BuildContext context) {
    IconData? iconData;

    // Mapea el valor de widget.icon a un IconData
    if (widget.icon != null) {
      iconData = getIconDataFromString(widget.icon!);
    }

    return Icon(
      iconData ??
          Icons
              .error, // Usa un icono de error predeterminado si no se proporciona un icono válido
      color: FlutterFlowTheme.of(context).primaryBackground,
      size: widget.width ??
          50, // Establece el tamaño según el valor proporcionado o 50 por defecto
    );
  }

  // Función para obtener el IconData a partir de una cadena
  IconData getIconDataFromString(String iconString) {
    switch (iconString) {
      case 'home':
        return Icons.home;
      case 'wallet':
        return Icons.wallet;
      // Agrega más casos para otros iconos si es necesario
      default:
        return Icons.wallet;
    }
  }
}
