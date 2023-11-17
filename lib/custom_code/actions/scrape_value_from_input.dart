// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:html';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart';

Future<String?> scrapeValueFromInput(
    String url, String type, String value) async {
  try {
    print("scrapeValueFromInput");
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final document = htmlParser.parse(response.body);
      print(document);
      dynamic element;

      if (type == 'classname') {
        element = document.querySelector('.$value');
      } else if (type == 'id') {
        element = document.getElementById(value);
      } else if (type == 'tag') {
        element = document.querySelector(value);
      }

      if (element != null) {
        if (element is InputElement) {
          return element.attributes['value'];
        } else if (element is AnchorElement) {
          return element.text;
        } else {
          return element.text;
        }
      } else {
        return null; // No se encontró el elemento especificado.
      }
    } else {
      return null; // La solicitud HTTP no fue exitosa.
    }
  } catch (e) {
    print('Error: $e');
    return null; // Ocurrió un error al realizar la solicitud HTTP o al analizar el HTML.
  }
}
