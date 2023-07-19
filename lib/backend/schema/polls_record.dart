import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PollsRecord extends FirestoreRecord {
  PollsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "pollID" field.
  String? _pollID;
  String get pollID => _pollID ?? '';
  bool hasPollID() => _pollID != null;

  void _initializeFields() {
    _pollID = snapshotData['pollID'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('polls');

  static Stream<PollsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PollsRecord.fromSnapshot(s));

  static Future<PollsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PollsRecord.fromSnapshot(s));

  static PollsRecord fromSnapshot(DocumentSnapshot snapshot) => PollsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PollsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PollsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PollsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PollsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPollsRecordData({
  String? pollID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'pollID': pollID,
    }.withoutNulls,
  );

  return firestoreData;
}

class PollsRecordDocumentEquality implements Equality<PollsRecord> {
  const PollsRecordDocumentEquality();

  @override
  bool equals(PollsRecord? e1, PollsRecord? e2) {
    return e1?.pollID == e2?.pollID;
  }

  @override
  int hash(PollsRecord? e) => const ListEquality().hash([e?.pollID]);

  @override
  bool isValidKey(Object? o) => o is PollsRecord;
}
