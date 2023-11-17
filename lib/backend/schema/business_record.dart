import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BusinessRecord extends FirestoreRecord {
  BusinessRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "business_category" field.
  DocumentReference? _businessCategory;
  DocumentReference? get businessCategory => _businessCategory;
  bool hasBusinessCategory() => _businessCategory != null;

  // "Instructions_text" field.
  String? _instructionsText;
  String get instructionsText => _instructionsText ?? '';
  bool hasInstructionsText() => _instructionsText != null;

  // "validation_url" field.
  String? _validationUrl;
  String get validationUrl => _validationUrl ?? '';
  bool hasValidationUrl() => _validationUrl != null;

  // "validation_field" field.
  String? _validationField;
  String get validationField => _validationField ?? '';
  bool hasValidationField() => _validationField != null;

  // "verification_url" field.
  String? _verificationUrl;
  String get verificationUrl => _verificationUrl ?? '';
  bool hasVerificationUrl() => _verificationUrl != null;

  // "business_name" field.
  String? _businessName;
  String get businessName => _businessName ?? '';
  bool hasBusinessName() => _businessName != null;

  // "instructions_image" field.
  String? _instructionsImage;
  String get instructionsImage => _instructionsImage ?? '';
  bool hasInstructionsImage() => _instructionsImage != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _businessCategory = snapshotData['business_category'] as DocumentReference?;
    _instructionsText = snapshotData['Instructions_text'] as String?;
    _validationUrl = snapshotData['validation_url'] as String?;
    _validationField = snapshotData['validation_field'] as String?;
    _verificationUrl = snapshotData['verification_url'] as String?;
    _businessName = snapshotData['business_name'] as String?;
    _instructionsImage = snapshotData['instructions_image'] as String?;
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('business');

  static Stream<BusinessRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BusinessRecord.fromSnapshot(s));

  static Future<BusinessRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BusinessRecord.fromSnapshot(s));

  static BusinessRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BusinessRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BusinessRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BusinessRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BusinessRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BusinessRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBusinessRecordData({
  DocumentReference? businessCategory,
  String? instructionsText,
  String? validationUrl,
  String? validationField,
  String? verificationUrl,
  String? businessName,
  String? instructionsImage,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'business_category': businessCategory,
      'Instructions_text': instructionsText,
      'validation_url': validationUrl,
      'validation_field': validationField,
      'verification_url': verificationUrl,
      'business_name': businessName,
      'instructions_image': instructionsImage,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class BusinessRecordDocumentEquality implements Equality<BusinessRecord> {
  const BusinessRecordDocumentEquality();

  @override
  bool equals(BusinessRecord? e1, BusinessRecord? e2) {
    return e1?.businessCategory == e2?.businessCategory &&
        e1?.instructionsText == e2?.instructionsText &&
        e1?.validationUrl == e2?.validationUrl &&
        e1?.validationField == e2?.validationField &&
        e1?.verificationUrl == e2?.verificationUrl &&
        e1?.businessName == e2?.businessName &&
        e1?.instructionsImage == e2?.instructionsImage &&
        e1?.image == e2?.image;
  }

  @override
  int hash(BusinessRecord? e) => const ListEquality().hash([
        e?.businessCategory,
        e?.instructionsText,
        e?.validationUrl,
        e?.validationField,
        e?.verificationUrl,
        e?.businessName,
        e?.instructionsImage,
        e?.image
      ]);

  @override
  bool isValidKey(Object? o) => o is BusinessRecord;
}
