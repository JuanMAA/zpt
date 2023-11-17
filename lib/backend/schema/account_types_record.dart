import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AccountTypesRecord extends FirestoreRecord {
  AccountTypesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  bool hasIcon() => _icon != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _icon = snapshotData['icon'] as String?;
    _description = snapshotData['description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('accountTypes');

  static Stream<AccountTypesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AccountTypesRecord.fromSnapshot(s));

  static Future<AccountTypesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AccountTypesRecord.fromSnapshot(s));

  static AccountTypesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AccountTypesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AccountTypesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AccountTypesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AccountTypesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AccountTypesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAccountTypesRecordData({
  String? name,
  String? icon,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'icon': icon,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class AccountTypesRecordDocumentEquality
    implements Equality<AccountTypesRecord> {
  const AccountTypesRecordDocumentEquality();

  @override
  bool equals(AccountTypesRecord? e1, AccountTypesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.icon == e2?.icon &&
        e1?.description == e2?.description;
  }

  @override
  int hash(AccountTypesRecord? e) =>
      const ListEquality().hash([e?.name, e?.icon, e?.description]);

  @override
  bool isValidKey(Object? o) => o is AccountTypesRecord;
}
