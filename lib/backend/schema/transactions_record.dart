import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransactionsRecord extends FirestoreRecord {
  TransactionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "transaction_date" field.
  DateTime? _transactionDate;
  DateTime? get transactionDate => _transactionDate;
  bool hasTransactionDate() => _transactionDate != null;

  // "transaction_type" field.
  String? _transactionType;
  String get transactionType => _transactionType ?? '';
  bool hasTransactionType() => _transactionType != null;

  // "transaction_amount" field.
  double? _transactionAmount;
  double get transactionAmount => _transactionAmount ?? 0.0;
  bool hasTransactionAmount() => _transactionAmount != null;

  // "transaction_description" field.
  String? _transactionDescription;
  String get transactionDescription => _transactionDescription ?? '';
  bool hasTransactionDescription() => _transactionDescription != null;

  // "transaction_status" field.
  String? _transactionStatus;
  String get transactionStatus => _transactionStatus ?? '';
  bool hasTransactionStatus() => _transactionStatus != null;

  // "transaction_source" field.
  String? _transactionSource;
  String get transactionSource => _transactionSource ?? '';
  bool hasTransactionSource() => _transactionSource != null;

  // "transaction_currency" field.
  String? _transactionCurrency;
  String get transactionCurrency => _transactionCurrency ?? '';
  bool hasTransactionCurrency() => _transactionCurrency != null;

  // "card" field.
  DocumentReference? _card;
  DocumentReference? get card => _card;
  bool hasCard() => _card != null;

  // "reminder" field.
  bool? _reminder;
  bool get reminder => _reminder ?? false;
  bool hasReminder() => _reminder != null;

  // "user_account" field.
  DocumentReference? _userAccount;
  DocumentReference? get userAccount => _userAccount;
  bool hasUserAccount() => _userAccount != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _transactionDate = snapshotData['transaction_date'] as DateTime?;
    _transactionType = snapshotData['transaction_type'] as String?;
    _transactionAmount = castToType<double>(snapshotData['transaction_amount']);
    _transactionDescription =
        snapshotData['transaction_description'] as String?;
    _transactionStatus = snapshotData['transaction_status'] as String?;
    _transactionSource = snapshotData['transaction_source'] as String?;
    _transactionCurrency = snapshotData['transaction_currency'] as String?;
    _card = snapshotData['card'] as DocumentReference?;
    _reminder = snapshotData['reminder'] as bool?;
    _userAccount = snapshotData['user_account'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transactions');

  static Stream<TransactionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransactionsRecord.fromSnapshot(s));

  static Future<TransactionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransactionsRecord.fromSnapshot(s));

  static TransactionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransactionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransactionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransactionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransactionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransactionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransactionsRecordData({
  DocumentReference? user,
  DateTime? transactionDate,
  String? transactionType,
  double? transactionAmount,
  String? transactionDescription,
  String? transactionStatus,
  String? transactionSource,
  String? transactionCurrency,
  DocumentReference? card,
  bool? reminder,
  DocumentReference? userAccount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'transaction_date': transactionDate,
      'transaction_type': transactionType,
      'transaction_amount': transactionAmount,
      'transaction_description': transactionDescription,
      'transaction_status': transactionStatus,
      'transaction_source': transactionSource,
      'transaction_currency': transactionCurrency,
      'card': card,
      'reminder': reminder,
      'user_account': userAccount,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransactionsRecordDocumentEquality
    implements Equality<TransactionsRecord> {
  const TransactionsRecordDocumentEquality();

  @override
  bool equals(TransactionsRecord? e1, TransactionsRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.transactionDate == e2?.transactionDate &&
        e1?.transactionType == e2?.transactionType &&
        e1?.transactionAmount == e2?.transactionAmount &&
        e1?.transactionDescription == e2?.transactionDescription &&
        e1?.transactionStatus == e2?.transactionStatus &&
        e1?.transactionSource == e2?.transactionSource &&
        e1?.transactionCurrency == e2?.transactionCurrency &&
        e1?.card == e2?.card &&
        e1?.reminder == e2?.reminder &&
        e1?.userAccount == e2?.userAccount;
  }

  @override
  int hash(TransactionsRecord? e) => const ListEquality().hash([
        e?.user,
        e?.transactionDate,
        e?.transactionType,
        e?.transactionAmount,
        e?.transactionDescription,
        e?.transactionStatus,
        e?.transactionSource,
        e?.transactionCurrency,
        e?.card,
        e?.reminder,
        e?.userAccount
      ]);

  @override
  bool isValidKey(Object? o) => o is TransactionsRecord;
}
