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

class DynamicFormWidget extends StatefulWidget {
  const DynamicFormWidget({
    Key? key,
    this.width,
    this.height,
    this.formData,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<Map<String, dynamic>>? formData;

  @override
  _DynamicFormWidgetState createState() => _DynamicFormWidgetState();
}

class _DynamicFormWidgetState extends State<DynamicFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Column(
        children: [
          ...buildFormFields(),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 16.0), // Adjust the padding as needed
            child: ElevatedButton(
              onPressed: () {
                // Handle the submit button click here
                // You can access the form data using 'widget.formData'
                // and perform any submission logic.
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
                elevation: MaterialStateProperty.all<double>(3),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              child: Container(
                height: 50,
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  "Continuar", // You can customize the button text
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildFormFields({List<Map<String, dynamic>>? multipleData}) {
    List<Widget> fields = [];
    List<Map<String, dynamic>>? newformData;

    if (multipleData != null) {
      newformData = multipleData;
    } else {
      newformData = widget.formData;
    }

    if (newformData != null) {
      for (var fieldData in newformData) {
        String fieldType = fieldData["type"].toString();
        String fieldPlaceholder = fieldData["placeholder"].toString();
        String fieldLabel =
            fieldData["label"].toString(); // Nueva clave "label"
        bool isRequired = fieldData["required"] ??
            false; // Campo requerido (predeterminado a falso)

        // Personalizar la etiqueta basada en si el campo es requerido
        String labelText = isRequired
            ? "$fieldLabel (Requerido)"
            : fieldLabel.isNotEmpty
                ? fieldLabel
                : fieldType == "number"
                    ? "Número"
                    : "Cadena";

        if (fieldType == "number") {
          fields.add(
            Column(
              children: [
                //Text(labelText),
                TextFormField(
                    decoration: InputDecoration(
                        //labelText: labelText,
                        hintText: fieldPlaceholder.isNotEmpty
                            ? fieldPlaceholder
                            : "Ingrese un número",
                        labelStyle: FlutterFlowTheme.of(context).bodySmall,
                        hintStyle: FlutterFlowTheme.of(context).bodySmall,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24)),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    keyboardType: TextInputType.number),
              ],
            ),
          );
        } else if (fieldType == "string") {
          fields.add(
            Column(
              children: [
                Text(labelText),
                TextFormField(
                    decoration: InputDecoration(
                      //labelText: labelText,
                      hintText: fieldPlaceholder.isNotEmpty
                          ? fieldPlaceholder
                          : "Ingrese una cadena",
                      labelStyle: FlutterFlowTheme.of(context).bodySmall,
                      hintStyle: FlutterFlowTheme.of(context).bodySmall,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    keyboardType: TextInputType.text),
              ],
            ),
          );
        } else if (fieldType == "multiple") {
          List<Map<String, dynamic>>? newMultipleData =
              fieldData["multipleData"];
          print(newMultipleData);
          if (newMultipleData != null) {
            fields.add(
              Column(
                children: [
                  // Include the list of form fields here.
                  if (fieldData["title"] !=
                      null) // Verificar si se proporcionó un título
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0,
                          0), // Ajusta el relleno según tus necesidades
                      child: Text(
                        fieldData["title"]!,
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodySmall,
                      ),
                    ),
                  ...buildFormFields(multipleData: newMultipleData),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0,
                        24), // Ajusta el relleno según tus necesidades
                    child: ElevatedButton(
                      onPressed: () {
                        // Add more fields when the "Add" button is pressed.
                        //addFields();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                        elevation: MaterialStateProperty.all<double>(3),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          fieldData["buttonText"] ?? "Añadir Item",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        }
      }
    }
    return fields;
  }
}
