import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CardsRecord extends FirestoreRecord {
  CardsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "card_type" field.
  String? _cardType;
  String get cardType => _cardType ?? '';
  bool hasCardType() => _cardType != null;

  // "card_number" field.
  int? _cardNumber;
  int get cardNumber => _cardNumber ?? 0;
  bool hasCardNumber() => _cardNumber != null;

  // "expiration_date" field.
  DateTime? _expirationDate;
  DateTime? get expirationDate => _expirationDate;
  bool hasExpirationDate() => _expirationDate != null;

  // "issuing_bank" field.
  String? _issuingBank;
  String get issuingBank => _issuingBank ?? '';
  bool hasIssuingBank() => _issuingBank != null;

  // "account_number" field.
  int? _accountNumber;
  int get accountNumber => _accountNumber ?? 0;
  bool hasAccountNumber() => _accountNumber != null;

  // "ccv" field.
  int? _ccv;
  int get ccv => _ccv ?? 0;
  bool hasCcv() => _ccv != null;

  // "card_issued_date" field.
  DateTime? _cardIssuedDate;
  DateTime? get cardIssuedDate => _cardIssuedDate;
  bool hasCardIssuedDate() => _cardIssuedDate != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as DocumentReference?;
    _cardType = snapshotData['card_type'] as String?;
    _cardNumber = castToType<int>(snapshotData['card_number']);
    _expirationDate = snapshotData['expiration_date'] as DateTime?;
    _issuingBank = snapshotData['issuing_bank'] as String?;
    _accountNumber = castToType<int>(snapshotData['account_number']);
    _ccv = castToType<int>(snapshotData['ccv']);
    _cardIssuedDate = snapshotData['card_issued_date'] as DateTime?;
    _note = snapshotData['note'] as String?;
    _status = snapshotData['status'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cards');

  static Stream<CardsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CardsRecord.fromSnapshot(s));

  static Future<CardsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CardsRecord.fromSnapshot(s));

  static CardsRecord fromSnapshot(DocumentSnapshot snapshot) => CardsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CardsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CardsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CardsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CardsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCardsRecordData({
  DocumentReference? userId,
  String? cardType,
  int? cardNumber,
  DateTime? expirationDate,
  String? issuingBank,
  int? accountNumber,
  int? ccv,
  DateTime? cardIssuedDate,
  String? note,
  bool? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'card_type': cardType,
      'card_number': cardNumber,
      'expiration_date': expirationDate,
      'issuing_bank': issuingBank,
      'account_number': accountNumber,
      'ccv': ccv,
      'card_issued_date': cardIssuedDate,
      'note': note,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class CardsRecordDocumentEquality implements Equality<CardsRecord> {
  const CardsRecordDocumentEquality();

  @override
  bool equals(CardsRecord? e1, CardsRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.cardType == e2?.cardType &&
        e1?.cardNumber == e2?.cardNumber &&
        e1?.expirationDate == e2?.expirationDate &&
        e1?.issuingBank == e2?.issuingBank &&
        e1?.accountNumber == e2?.accountNumber &&
        e1?.ccv == e2?.ccv &&
        e1?.cardIssuedDate == e2?.cardIssuedDate &&
        e1?.note == e2?.note &&
        e1?.status == e2?.status;
  }

  @override
  int hash(CardsRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.cardType,
        e?.cardNumber,
        e?.expirationDate,
        e?.issuingBank,
        e?.accountNumber,
        e?.ccv,
        e?.cardIssuedDate,
        e?.note,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is CardsRecord;
}
