import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VotesRecord extends FirestoreRecord {
  VotesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "poll" field.
  DocumentReference? _poll;
  DocumentReference? get poll => _poll;
  bool hasPoll() => _poll != null;

  // "vote" field.
  String? _vote;
  String get vote => _vote ?? '';
  bool hasVote() => _vote != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _poll = snapshotData['poll'] as DocumentReference?;
    _vote = snapshotData['vote'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('votes');

  static Stream<VotesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VotesRecord.fromSnapshot(s));

  static Future<VotesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VotesRecord.fromSnapshot(s));

  static VotesRecord fromSnapshot(DocumentSnapshot snapshot) => VotesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VotesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VotesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VotesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VotesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVotesRecordData({
  DocumentReference? user,
  DocumentReference? poll,
  String? vote,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'poll': poll,
      'vote': vote,
    }.withoutNulls,
  );

  return firestoreData;
}

class VotesRecordDocumentEquality implements Equality<VotesRecord> {
  const VotesRecordDocumentEquality();

  @override
  bool equals(VotesRecord? e1, VotesRecord? e2) {
    return e1?.user == e2?.user && e1?.poll == e2?.poll && e1?.vote == e2?.vote;
  }

  @override
  int hash(VotesRecord? e) =>
      const ListEquality().hash([e?.user, e?.poll, e?.vote]);

  @override
  bool isValidKey(Object? o) => o is VotesRecord;
}
