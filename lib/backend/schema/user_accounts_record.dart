import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserAccountsRecord extends FirestoreRecord {
  UserAccountsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fields" field.
  DocumentReference? _fields;
  DocumentReference? get fields => _fields;
  bool hasFields() => _fields != null;

  // "recipient_document_id" field.
  String? _recipientDocumentId;
  String get recipientDocumentId => _recipientDocumentId ?? '';
  bool hasRecipientDocumentId() => _recipientDocumentId != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "bank" field.
  DocumentReference? _bank;
  DocumentReference? get bank => _bank;
  bool hasBank() => _bank != null;

  // "account_number" field.
  int? _accountNumber;
  int get accountNumber => _accountNumber ?? 0;
  bool hasAccountNumber() => _accountNumber != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "account" field.
  DocumentReference? _account;
  DocumentReference? get account => _account;
  bool hasAccount() => _account != null;

  // "values" field.
  List<String>? _values;
  List<String> get values => _values ?? const [];
  bool hasValues() => _values != null;

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  bool hasAmount() => _amount != null;

  // "currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  bool hasCurrency() => _currency != null;

  void _initializeFields() {
    _fields = snapshotData['fields'] as DocumentReference?;
    _recipientDocumentId = snapshotData['recipient_document_id'] as String?;
    _name = snapshotData['name'] as String?;
    _bank = snapshotData['bank'] as DocumentReference?;
    _accountNumber = castToType<int>(snapshotData['account_number']);
    _user = snapshotData['user'] as DocumentReference?;
    _account = snapshotData['account'] as DocumentReference?;
    _values = getDataList(snapshotData['values']);
    _amount = castToType<int>(snapshotData['amount']);
    _currency = snapshotData['currency'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userAccounts');

  static Stream<UserAccountsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserAccountsRecord.fromSnapshot(s));

  static Future<UserAccountsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserAccountsRecord.fromSnapshot(s));

  static UserAccountsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserAccountsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserAccountsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserAccountsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserAccountsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserAccountsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserAccountsRecordData({
  DocumentReference? fields,
  String? recipientDocumentId,
  String? name,
  DocumentReference? bank,
  int? accountNumber,
  DocumentReference? user,
  DocumentReference? account,
  int? amount,
  String? currency,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fields': fields,
      'recipient_document_id': recipientDocumentId,
      'name': name,
      'bank': bank,
      'account_number': accountNumber,
      'user': user,
      'account': account,
      'amount': amount,
      'currency': currency,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserAccountsRecordDocumentEquality
    implements Equality<UserAccountsRecord> {
  const UserAccountsRecordDocumentEquality();

  @override
  bool equals(UserAccountsRecord? e1, UserAccountsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.fields == e2?.fields &&
        e1?.recipientDocumentId == e2?.recipientDocumentId &&
        e1?.name == e2?.name &&
        e1?.bank == e2?.bank &&
        e1?.accountNumber == e2?.accountNumber &&
        e1?.user == e2?.user &&
        e1?.account == e2?.account &&
        listEquality.equals(e1?.values, e2?.values) &&
        e1?.amount == e2?.amount &&
        e1?.currency == e2?.currency;
  }

  @override
  int hash(UserAccountsRecord? e) => const ListEquality().hash([
        e?.fields,
        e?.recipientDocumentId,
        e?.name,
        e?.bank,
        e?.accountNumber,
        e?.user,
        e?.account,
        e?.values,
        e?.amount,
        e?.currency
      ]);

  @override
  bool isValidKey(Object? o) => o is UserAccountsRecord;
}
