import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FieldsRecord extends FirestoreRecord {
  FieldsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "dafault_value" field.
  String? _dafaultValue;
  String get dafaultValue => _dafaultValue ?? '';
  bool hasDafaultValue() => _dafaultValue != null;

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  bool hasLabel() => _label != null;

  // "placeholder" field.
  String? _placeholder;
  String get placeholder => _placeholder ?? '';
  bool hasPlaceholder() => _placeholder != null;

  // "max" field.
  int? _max;
  int get max => _max ?? 0;
  bool hasMax() => _max != null;

  // "min" field.
  int? _min;
  int get min => _min ?? 0;
  bool hasMin() => _min != null;

  // "max_length" field.
  int? _maxLength;
  int get maxLength => _maxLength ?? 0;
  bool hasMaxLength() => _maxLength != null;

  // "min_length" field.
  int? _minLength;
  int get minLength => _minLength ?? 0;
  bool hasMinLength() => _minLength != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "required" field.
  bool? _required;
  bool get required => _required ?? false;
  bool hasRequired() => _required != null;

  // "multiple_title" field.
  String? _multipleTitle;
  String get multipleTitle => _multipleTitle ?? '';
  bool hasMultipleTitle() => _multipleTitle != null;

  // "multiple_field" field.
  List<DocumentReference>? _multipleField;
  List<DocumentReference> get multipleField => _multipleField ?? const [];
  bool hasMultipleField() => _multipleField != null;

  void _initializeFields() {
    _dafaultValue = snapshotData['dafault_value'] as String?;
    _label = snapshotData['label'] as String?;
    _placeholder = snapshotData['placeholder'] as String?;
    _max = castToType<int>(snapshotData['max']);
    _min = castToType<int>(snapshotData['min']);
    _maxLength = castToType<int>(snapshotData['max_length']);
    _minLength = castToType<int>(snapshotData['min_length']);
    _type = snapshotData['type'] as String?;
    _required = snapshotData['required'] as bool?;
    _multipleTitle = snapshotData['multiple_title'] as String?;
    _multipleField = getDataList(snapshotData['multiple_field']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('fields');

  static Stream<FieldsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FieldsRecord.fromSnapshot(s));

  static Future<FieldsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FieldsRecord.fromSnapshot(s));

  static FieldsRecord fromSnapshot(DocumentSnapshot snapshot) => FieldsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FieldsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FieldsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FieldsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FieldsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFieldsRecordData({
  String? dafaultValue,
  String? label,
  String? placeholder,
  int? max,
  int? min,
  int? maxLength,
  int? minLength,
  String? type,
  bool? required,
  String? multipleTitle,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'dafault_value': dafaultValue,
      'label': label,
      'placeholder': placeholder,
      'max': max,
      'min': min,
      'max_length': maxLength,
      'min_length': minLength,
      'type': type,
      'required': required,
      'multiple_title': multipleTitle,
    }.withoutNulls,
  );

  return firestoreData;
}

class FieldsRecordDocumentEquality implements Equality<FieldsRecord> {
  const FieldsRecordDocumentEquality();

  @override
  bool equals(FieldsRecord? e1, FieldsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.dafaultValue == e2?.dafaultValue &&
        e1?.label == e2?.label &&
        e1?.placeholder == e2?.placeholder &&
        e1?.max == e2?.max &&
        e1?.min == e2?.min &&
        e1?.maxLength == e2?.maxLength &&
        e1?.minLength == e2?.minLength &&
        e1?.type == e2?.type &&
        e1?.required == e2?.required &&
        e1?.multipleTitle == e2?.multipleTitle &&
        listEquality.equals(e1?.multipleField, e2?.multipleField);
  }

  @override
  int hash(FieldsRecord? e) => const ListEquality().hash([
        e?.dafaultValue,
        e?.label,
        e?.placeholder,
        e?.max,
        e?.min,
        e?.maxLength,
        e?.minLength,
        e?.type,
        e?.required,
        e?.multipleTitle,
        e?.multipleField
      ]);

  @override
  bool isValidKey(Object? o) => o is FieldsRecord;
}
