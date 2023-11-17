import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _categorySelected = '';
  String get categorySelected => _categorySelected;
  set categorySelected(String _value) {
    _categorySelected = _value;
  }

  dynamic _accountInputJson;
  dynamic get accountInputJson => _accountInputJson;
  set accountInputJson(dynamic _value) {
    _accountInputJson = _value;
  }

  List<DocumentReference> _fieldsState = [];
  List<DocumentReference> get fieldsState => _fieldsState;
  set fieldsState(List<DocumentReference> _value) {
    _fieldsState = _value;
  }

  void addToFieldsState(DocumentReference _value) {
    _fieldsState.add(_value);
  }

  void removeFromFieldsState(DocumentReference _value) {
    _fieldsState.remove(_value);
  }

  void removeAtIndexFromFieldsState(int _index) {
    _fieldsState.removeAt(_index);
  }

  void updateFieldsStateAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _fieldsState[_index] = updateFn(_fieldsState[_index]);
  }

  void insertAtIndexInFieldsState(int _index, DocumentReference _value) {
    _fieldsState.insert(_index, _value);
  }

  List<DocumentReference> _multipleState = [];
  List<DocumentReference> get multipleState => _multipleState;
  set multipleState(List<DocumentReference> _value) {
    _multipleState = _value;
  }

  void addToMultipleState(DocumentReference _value) {
    _multipleState.add(_value);
  }

  void removeFromMultipleState(DocumentReference _value) {
    _multipleState.remove(_value);
  }

  void removeAtIndexFromMultipleState(int _index) {
    _multipleState.removeAt(_index);
  }

  void updateMultipleStateAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _multipleState[_index] = updateFn(_multipleState[_index]);
  }

  void insertAtIndexInMultipleState(int _index, DocumentReference _value) {
    _multipleState.insert(_index, _value);
  }

  String _selectedBusiness = '';
  String get selectedBusiness => _selectedBusiness;
  set selectedBusiness(String _value) {
    _selectedBusiness = _value;
  }

  bool _validateForms = false;
  bool get validateForms => _validateForms;
  set validateForms(bool _value) {
    _validateForms = _value;
  }

  List<String> _valuesForm = [];
  List<String> get valuesForm => _valuesForm;
  set valuesForm(List<String> _value) {
    _valuesForm = _value;
  }

  void addToValuesForm(String _value) {
    _valuesForm.add(_value);
  }

  void removeFromValuesForm(String _value) {
    _valuesForm.remove(_value);
  }

  void removeAtIndexFromValuesForm(int _index) {
    _valuesForm.removeAt(_index);
  }

  void updateValuesFormAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _valuesForm[_index] = updateFn(_valuesForm[_index]);
  }

  void insertAtIndexInValuesForm(int _index, String _value) {
    _valuesForm.insert(_index, _value);
  }

  List<bool> _statusForm = [];
  List<bool> get statusForm => _statusForm;
  set statusForm(List<bool> _value) {
    _statusForm = _value;
  }

  void addToStatusForm(bool _value) {
    _statusForm.add(_value);
  }

  void removeFromStatusForm(bool _value) {
    _statusForm.remove(_value);
  }

  void removeAtIndexFromStatusForm(int _index) {
    _statusForm.removeAt(_index);
  }

  void updateStatusFormAtIndex(
    int _index,
    bool Function(bool) updateFn,
  ) {
    _statusForm[_index] = updateFn(_statusForm[_index]);
  }

  void insertAtIndexInStatusForm(int _index, bool _value) {
    _statusForm.insert(_index, _value);
  }

  bool _loaderForm = false;
  bool get loaderForm => _loaderForm;
  set loaderForm(bool _value) {
    _loaderForm = _value;
  }

  List<dynamic> _valuesAndErrorsData = [];
  List<dynamic> get valuesAndErrorsData => _valuesAndErrorsData;
  set valuesAndErrorsData(List<dynamic> _value) {
    _valuesAndErrorsData = _value;
  }

  void addToValuesAndErrorsData(dynamic _value) {
    _valuesAndErrorsData.add(_value);
  }

  void removeFromValuesAndErrorsData(dynamic _value) {
    _valuesAndErrorsData.remove(_value);
  }

  void removeAtIndexFromValuesAndErrorsData(int _index) {
    _valuesAndErrorsData.removeAt(_index);
  }

  void updateValuesAndErrorsDataAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _valuesAndErrorsData[_index] = updateFn(_valuesAndErrorsData[_index]);
  }

  void insertAtIndexInValuesAndErrorsData(int _index, dynamic _value) {
    _valuesAndErrorsData.insert(_index, _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
