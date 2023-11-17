import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AccountsRecord extends FirestoreRecord {
  AccountsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "fields" field.
  List<DocumentReference>? _fields;
  List<DocumentReference> get fields => _fields ?? const [];
  bool hasFields() => _fields != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "validation" field.
  bool? _validation;
  bool get validation => _validation ?? false;
  bool hasValidation() => _validation != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  // "account_type" field.
  DocumentReference? _accountType;
  DocumentReference? get accountType => _accountType;
  bool hasAccountType() => _accountType != null;

  // "operation" field.
  String? _operation;
  String get operation => _operation ?? '';
  bool hasOperation() => _operation != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _fields = getDataList(snapshotData['fields']);
    _description = snapshotData['description'] as String?;
    _validation = snapshotData['validation'] as bool?;
    _logo = snapshotData['logo'] as String?;
    _accountType = snapshotData['account_type'] as DocumentReference?;
    _operation = snapshotData['operation'] as String?;
    _email = snapshotData['email'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('accounts');

  static Stream<AccountsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AccountsRecord.fromSnapshot(s));

  static Future<AccountsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AccountsRecord.fromSnapshot(s));

  static AccountsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AccountsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AccountsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AccountsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AccountsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AccountsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAccountsRecordData({
  String? name,
  String? description,
  bool? validation,
  String? logo,
  DocumentReference? accountType,
  String? operation,
  String? email,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'validation': validation,
      'logo': logo,
      'account_type': accountType,
      'operation': operation,
      'email': email,
    }.withoutNulls,
  );

  return firestoreData;
}

class AccountsRecordDocumentEquality implements Equality<AccountsRecord> {
  const AccountsRecordDocumentEquality();

  @override
  bool equals(AccountsRecord? e1, AccountsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        listEquality.equals(e1?.fields, e2?.fields) &&
        e1?.description == e2?.description &&
        e1?.validation == e2?.validation &&
        e1?.logo == e2?.logo &&
        e1?.accountType == e2?.accountType &&
        e1?.operation == e2?.operation &&
        e1?.email == e2?.email;
  }

  @override
  int hash(AccountsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.fields,
        e?.description,
        e?.validation,
        e?.logo,
        e?.accountType,
        e?.operation,
        e?.email
      ]);

  @override
  bool isValidKey(Object? o) => o is AccountsRecord;
}
