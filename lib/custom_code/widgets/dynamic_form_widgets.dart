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

class DynamicFormWidgets extends StatefulWidget {
  const DynamicFormWidgets({
    Key? key,
    this.width,
    this.height,
    required this.fieldsReferences,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<DocumentReference> fieldsReferences;

  @override
  _DynamicFormWidgetsState createState() => _DynamicFormWidgetsState();
}

class _DynamicFormWidgetsState extends State<DynamicFormWidgets> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Column(
        children: [
          if (widget.fieldsReferences != null)
            Column(
              children: widget.fieldsReferences!.map((reference) {
                return FutureBuilder<DocumentSnapshot>(
                  future: reference.get(), // Obtén el documento correspondiente
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      print("snapshot.data!");
                      print(snapshot.data!);
                      // Obtén los datos del documento
                      FieldsRecord record = snapshot.data!
                          as FieldsRecord; // Ya debería ser un objeto FieldsRecord

                      // Construye el elemento del formulario basado en los datos
                      return buildFormField(record);
                    } else {
                      return Text('No se encontraron datos.');
                    }
                  },
                );
              }).toList(),
            ),
        ],
      ),
    );
  }

  Widget buildFormField(FieldsRecord record) {
    String fieldType = record.type.toString();
    String fieldPlaceholder = record.placeholder.toString();
    String fieldLabel = record.label.toString();
    bool isRequired = record.required ?? false;

    String labelText = isRequired
        ? "$fieldLabel (Requerido)"
        : fieldLabel.isNotEmpty
            ? fieldLabel
            : fieldType == "number"
                ? "Número"
                : "Cadena";

    if (fieldType == "number") {
      return Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: fieldPlaceholder.isNotEmpty
                  ? fieldPlaceholder
                  : "Ingrese un número",
              labelText: labelText,
              // ...
            ),
            keyboardType: TextInputType.number,
          ),
        ],
      );
    } else if (fieldType == "string") {
      return Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: fieldPlaceholder.isNotEmpty
                  ? fieldPlaceholder
                  : "Ingrese una cadena",
              labelText: labelText,
              // ...
            ),
            keyboardType: TextInputType.text,
          ),
        ],
      );
    } else {
      return Container(); // Agrega manejo para otros tipos de campos si es necesario
    }
  }
}
