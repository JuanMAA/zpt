import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BanksRecord extends FirestoreRecord {
  BanksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "bank_name" field.
  String? _bankName;
  String get bankName => _bankName ?? '';
  bool hasBankName() => _bankName != null;

  void _initializeFields() {
    _bankName = snapshotData['bank_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('banks');

  static Stream<BanksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BanksRecord.fromSnapshot(s));

  static Future<BanksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BanksRecord.fromSnapshot(s));

  static BanksRecord fromSnapshot(DocumentSnapshot snapshot) => BanksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BanksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BanksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BanksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BanksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBanksRecordData({
  String? bankName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'bank_name': bankName,
    }.withoutNulls,
  );

  return firestoreData;
}

class BanksRecordDocumentEquality implements Equality<BanksRecord> {
  const BanksRecordDocumentEquality();

  @override
  bool equals(BanksRecord? e1, BanksRecord? e2) {
    return e1?.bankName == e2?.bankName;
  }

  @override
  int hash(BanksRecord? e) => const ListEquality().hash([e?.bankName]);

  @override
  bool isValidKey(Object? o) => o is BanksRecord;
}
