import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

bool? getCurrentPage(
  String? currentPage,
  String? page,
) {
  if (currentPage == null) {
    return false;
  }

  switch (currentPage) {
    case 'pagos':
      return page == 'pagos' ? true : false;
    case 'ajustes':
      return page == 'ajustes' ? true : false;
    case 'targetas':
      return page == 'targetas' ? true : false;
    case 'transacciones':
      return page == 'transacciones' ? true : false;
    case 'historial':
      return page == 'historial' ? true : false;
    case 'principal':
      return page == 'principal' ? true : false;
    case 'agregar':
      return page == 'agregar' ? true : false;
    default:
      return false;
  }
}

dynamic jsonDataForm(
  String name,
  int? index,
  String? value,
  int? id,
) {
  Map<String, dynamic> jsonData = {
    'name': name,
    'index': index,
    'value': value,
    'type': index != null ? 'item' : 'multiple',
    'id': id ?? 0
  };

  return jsonEncode(jsonData);
}

bool? verifyFormStatus(List<bool>? formsStatus) {
  if (formsStatus == null) {
    return false;
  }

  for (bool status in formsStatus) {
    if (status == false) {
      return false;
    }
  }

  return true;
}

List<dynamic>? generateMultipleItemData(List<String>? inputJSON) {
  Set<String> uniqueIDs = Set<String>();
  List<dynamic> data = [];

  for (String jsonString in inputJSON!) {
    try {
      final dynamic item = jsonDecode(jsonString);
      if (item is Map && item.containsKey("id")) {
        String id = item["id"].toString();
        if (!uniqueIDs.contains(id)) {
          Map<String, dynamic> newItem = {"id": id};
          data.add(newItem);
          uniqueIDs.add(id);
        }
      }
    } catch (e) {
      print("error");
      print(e);

      // Handle any potential JSON parsing errors
      data.add({"error": "Invalid JSON: $jsonString"});
    }
  }

  return data;
}

String? validateErrorInputData(
  String? isRequired,
  int? minLength,
  int? maxLength,
  String? regex,
  String? inputData,
) {
  // Si isRequired es true y el campo está vacío, se muestra un mensaje de error.
  if (isRequired == true && (inputData == null || inputData.isEmpty)) {
    return 'El campo es obligatorio.';
  }

  // Validar longitud mínima si se proporciona.
  if (minLength != null && inputData != null && inputData.length < minLength) {
    return 'El campo debe tener al menos $minLength caracteres.';
  }

  // Validar longitud máxima si se proporciona.
  if (maxLength != null && inputData != null && inputData.length > maxLength) {
    return 'El campo no debe tener más de $maxLength caracteres.';
  }

  // Validar el formato con una expresión regular si se proporciona.
  if (regex != null && regex.isNotEmpty && inputData != null) {
    final RegExp regExp = RegExp(regex);
    if (!regExp.hasMatch(inputData)) {
      return 'El formato no es válido. Debe seguir el formato: $regex';
    }
  }

  // Retorna null si el dato es válido o si isRequired es false.
  return null;
}

String? getYearDafaultValue() {
  final now = DateTime.now();
  final formatter = DateFormat('y');
  return formatter.format(now);
}

bool validateInputData(String? inputData) {
  if (inputData == null || inputData.isEmpty || inputData.trim() == "") {
    return false;
  }

  return true; // Retorna true si el dato es válido.
}

String? arrayValuesToString(List<String> arrayJSON) {
  final List<String> resultStrings = [];

  for (String jsonString in arrayJSON) {
    try {
      final dynamic item = jsonDecode(jsonString);

      if (item is Map<String, dynamic> &&
          item.containsKey('name') &&
          item.containsKey('value')) {
        String name = item['name'];
        String value = item['value'];

        if (name == 'alias') {
          name = 'Alias';
        } else if (name == 'business') {
          name = 'Empresa';
        }

        if (value != null && value != 'n/a') {
          final formattedString = '$name: $value';
          resultStrings.add(formattedString);
        }
      }
    } catch (e) {
      // Handle JSON parsing errors for individual items.
      print(e);
    }
  }

  return resultStrings.join(', ');
}

String? getNameAndAlias(List<String>? jSONData) {
  if (jSONData == null) return null;

  String? businessValue;
  String? aliasValue;

  for (String jsonString in jSONData) {
    try {
      final dynamic item = jsonDecode(jsonString);

      if (item is Map<String, dynamic> &&
          item.containsKey('name') &&
          item.containsKey('value')) {
        final String name = item['name'];
        final String value = item['value'];

        if (name == 'business') {
          businessValue = value;
        } else if (name == 'alias') {
          aliasValue = value;
        }
      }
    } catch (e) {
      // Handle JSON parsing errors for individual items.
    }
  }

  if (businessValue != null && aliasValue != null) {
    return '$businessValue - $aliasValue';
  }

  return null;
}

dynamic onChangeFormValidation(
  FieldsRecord? validacion,
  dynamic campoParaValidar,
) {
  dynamic name = campoParaValidar["name"];
  dynamic value = campoParaValidar["value"];
  dynamic type = campoParaValidar["type"];
  int index = campoParaValidar["index"] != null ? campoParaValidar["index"] : 0;
  int id = campoParaValidar["id"] != null ? campoParaValidar["id"] : 0;

  // Itera a través de la lista de campos
  final campo = validacion;
  dynamic returnItem = {
    "value": value,
    "error": null,
    "name": name,
    "index": index,
    "type": type,
    "id": id
  };

  // ignore: unnecessary_null_comparison
  if (campo?.required == true &&
      // ignore: unnecessary_null_comparison
      (value == null || value.trim().isEmpty || value == "")) {
    returnItem = {
      "value": value,
      "error": "$name es un campo obligatorio.",
      "name": name,
      "index": index,
      "type": type,
      "id": id
    };
  }

  // ignore: unnecessary_null_comparison
  if (campo!.maxLength != null &&
      campo.maxLength != 0 &&
      value.length > campo.maxLength) {
    returnItem = {
      "value": value,
      "error": "$name no puede exceder los ${campo.maxLength} caracteres.",
      "name": name,
      "index": index,
      "type": type,
      "id": id
    };
  }
  // ignore: unnecessary_null_comparison
  if (campo.minLength != null &&
      campo.minLength != 0 &&
      value.length < campo.minLength) {
    returnItem = {
      "value": value,
      "error": "$name debe tener al menos ${campo.minLength} caracteres.",
      "name": name,
      "index": index,
      "type": type,
      "id": id
    };
  }

  return returnItem;
}

String? getItemFromArrayByName(
  String? name,
  List<String>? jSONArray,
) {
  if (name == null || jSONArray == null) return null;

  for (String jsonString in jSONArray) {
    try {
      final dynamic item = jsonDecode(jsonString);

      if (item is Map<String, dynamic> &&
          item.containsKey('name') &&
          item.containsKey('value')) {
        final String itemName = item['name'];
        final String itemValue = item['value'];

        if (itemName == name) {
          return itemValue;
        }
      }
    } catch (e) {
      return null;
    }
  }

  return null;
}

String? getMonthDafaultValue() {
  final now = DateTime.now();
  return now.month.toString();
}

List<dynamic> submitFormValidation(
  List<FieldsRecord>? validaciones,
  List<dynamic>? camposParaValidar,
) {
  List<dynamic> validationErrors = [];
  print("antes");
  print(camposParaValidar);

  for (dynamic campoParaValidar in camposParaValidar!) {
    String name = campoParaValidar["name"];
    String value = campoParaValidar["value"];
    int index = campoParaValidar["index"] ?? 0;
    int id = campoParaValidar["id"] ?? 0;
    String type = campoParaValidar["type"];

    dynamic returnItem = {
      "value": value,
      "error": null,
      "name": name,
      "index": index,
      "type": type,
      "id": id
    };

    // Itera a través de la lista de campos
    for (int i = 0; i < validaciones!.length; i++) {
      final campo = validaciones[i];

      // ignore: unnecessary_null_comparison
      if (name == campo.label) {
        // ignore: unnecessary_null_comparison
        if (campo.required == true && (value == null || value.trim().isEmpty)) {
          returnItem = {
            "value": value,
            "error": "$name es un campo obligatorio.",
            "name": name,
            "index": index,
            "type": type,
            "id": id
          };
        }
        // ignore: unnecessary_null_comparison
        if (campo.maxLength != null &&
            campo.maxLength != 0 &&
            value.length > campo.maxLength) {
          returnItem = {
            "value": value,
            "error":
                "$name no puede exceder los ${campo.maxLength} caracteres.",
            "name": name,
            "index": index,
            "type": type,
            "id": id
          };
        }
        // ignore: unnecessary_null_comparison
        if (campo.minLength != null &&
            campo.minLength != 0 &&
            value.length < campo.minLength) {
          returnItem = {
            "value": value,
            "error": "$name debe tener al menos ${campo.minLength} caracteres.",
            "name": name,
            "index": index,
            "type": type,
            "id": id
          };
        }
      }
    }
    validationErrors.add(returnItem);
  }

  print("despues");
  print(validationErrors);
  return validationErrors;
}

bool? validateSubmutForm(
  List<dynamic>? camposParaValidar,
  List<FieldsRecord>? validaciones,
) {
  for (dynamic campoParaValidar in camposParaValidar!) {
    dynamic name = campoParaValidar["name"];
    dynamic value = campoParaValidar["value"];

    // Itera a través de la lista de campos
    for (int i = 0; i < validaciones!.length; i++) {
      final campo = validaciones[i];

      // ignore: unnecessary_null_comparison
      if (name == campo.label) {
        // Check if the field is required
        if (campo.required == true && (value == null || value.trim().isEmpty)) {
          return false;
        }

        // ignore: unnecessary_null_comparison
        if (campo.maxLength != null &&
            campo.maxLength != 0 &&
            value.length > campo.maxLength) {
          return false;
        }

        // ignore: unnecessary_null_comparison
        if (campo.minLength != null &&
            campo.minLength != 0 &&
            value.length < campo.minLength) {
          return false;
        }
      }
    }
  }

  return true;
}

dynamic createInputObject(
  String? value,
  String? name,
  int? index,
  int? id,
) {
  return {
    "type": index != null && index != 0 ? 'item' : 'multiple',
    "value": value != null ? value : null,
    "error": null,
    "name": name != null ? name : null,
    "index": index != null ? index : null,
    "id": id != null ? id : 0,
  };
}

String? getValueFromJsonArray(
  List<String>? jsonArray,
  String? name,
) {
  if (jsonArray != null) {
    // Recorremos cada elemento del array JSON
    for (String jsonStr in jsonArray) {
      try {
        // Convertimos el string JSON a un mapa (objeto)
        dynamic jsonObject = jsonDecode(jsonStr);

        // Verificamos si el objeto tiene una propiedad "name" igual al parámetro "name"
        if (jsonObject.containsKey("name") && jsonObject["name"] == name) {
          // Si encontramos una coincidencia, retornamos el valor asociado a "value"
          if (jsonObject.containsKey("value")) {
            return jsonObject["value"];
          }
        }
      } catch (e) {
        // Manejo de errores en caso de que el JSON no sea válido
        print("Error decoding JSON: $e");
      }
    }
  }

  // Si no encontramos coincidencias o el array está vacío, retornamos una cadena vacía
  return null;
}

bool? validateIncludes(
  String compare,
  String includesitem,
) {
  /// Elimina los espacios y convierte las cadenas a minúsculas
  final compareLowerCase = compare.replaceAll(" ", "").toLowerCase();
  final includesitemLowerCase = includesitem.replaceAll(" ", "").toLowerCase();

  /// Realiza la comparación
  return includesitemLowerCase.contains(compareLowerCase);
}

List<String>? generateSendData(List<dynamic>? inputJSON) {
  List<String> validationErrorsAsString = [];

  for (dynamic jsonString in inputJSON!) {
    try {
      String name = jsonString["name"] ?? null;
      ;
      String value = jsonString["value"] ?? null;
      ;
      String type = jsonString["type"];
      int id = jsonString["id"];

      // ignore: unnecessary_null_comparison
      if (value == null) {
        validationErrorsAsString.add(
            '{"name": "$name", "value": null, "type": "$type", "id": $id}');
      } else {
        String valueString = value.toString();
        validationErrorsAsString.add(
            '{"name": "$name", "value": "$valueString", "type": "$type", "id": $id}');
      }
    } catch (e) {
      print("error");
      print(e);

      // Handle any potential JSON parsing errors
      validationErrorsAsString.add(jsonString);
    }
  }

  return validationErrorsAsString;
}

int? generateUniqueKey() {
  return DateTime.now().millisecondsSinceEpoch;
}

int? getItemByIndexArray(
  List<dynamic>? dataJSON,
  int? index,
) {
  if (dataJSON == null || index == null) {
    return null;
  }

  for (int i = 0; i < dataJSON.length; i++) {
    dynamic jsonItem = dataJSON[i];
    int? itemIndex = jsonItem["index"];

    if (itemIndex == index) {
      return i;
    }
  }

  return null;
}

String? getValueMultipleArray(
  List<String>? jSONArray,
  int? id,
  String? inputName,
) {
  print("getValueMultipleArray");
  print(id);
  print(inputName);

  for (String jsonString in jSONArray!) {
    try {
      final dynamic item = jsonDecode(jsonString);
      if (item is Map && item.containsKey("name") && item.containsKey("id")) {
        String label = item["name"];
        int itemId = item["id"];

        if (label == inputName && itemId == id) {
          return item["value"];
        }
      }
    } catch (e) {
      print("error");
      print(e);
    }
  }

  return ""; // Si no se encuentra coincidencia, retorna null.
}

String? formatterRut(String? rut) {
  if (rut == null || rut.isEmpty) {
    return null; // o el valor que desees en caso de entrada vacía
  }

  // Eliminar puntos y guiones del RUT
  rut = rut.replaceAll('.', '').replaceAll('-', '');

  // Verificar si el RUT tiene el formato correcto
  final RegExp rutRegExp = RegExp(r'^(\d{1,2})(\d{3})(\d{3})(\d{1}|K|k)?$');
  final Match? match = rutRegExp.firstMatch(rut);

  if (match == null) {
    return null; // o el valor que desees en caso de formato incorrecto
  }

  // Obtener los grupos de dígitos
  final String digits = match.group(1)! + match.group(2)! + match.group(3)!;
  final String verifier = match.group(4) ?? '';

  // Formatear el RUT
  final String formattedRut = '${digits}.${verifier.toUpperCase()}';

  return formattedRut;
}
