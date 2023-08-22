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

  // "poll" field.
  DocumentReference? _poll;
  DocumentReference? get poll => _poll;
  bool hasPoll() => _poll != null;

  // "timeVoted" field.
  DateTime? _timeVoted;
  DateTime? get timeVoted => _timeVoted;
  bool hasTimeVoted() => _timeVoted != null;

  // "voteChoice" field.
  int? _voteChoice;
  int get voteChoice => _voteChoice ?? 0;
  bool hasVoteChoice() => _voteChoice != null;

  // "voter" field.
  DocumentReference? _voter;
  DocumentReference? get voter => _voter;
  bool hasVoter() => _voter != null;

  void _initializeFields() {
    _poll = snapshotData['poll'] as DocumentReference?;
    _timeVoted = snapshotData['timeVoted'] as DateTime?;
    _voteChoice = castToType<int>(snapshotData['voteChoice']);
    _voter = snapshotData['voter'] as DocumentReference?;
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
  DocumentReference? poll,
  DateTime? timeVoted,
  int? voteChoice,
  DocumentReference? voter,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'poll': poll,
      'timeVoted': timeVoted,
      'voteChoice': voteChoice,
      'voter': voter,
    }.withoutNulls,
  );

  return firestoreData;
}

class VotesRecordDocumentEquality implements Equality<VotesRecord> {
  const VotesRecordDocumentEquality();

  @override
  bool equals(VotesRecord? e1, VotesRecord? e2) {
    return e1?.poll == e2?.poll &&
        e1?.timeVoted == e2?.timeVoted &&
        e1?.voteChoice == e2?.voteChoice &&
        e1?.voter == e2?.voter;
  }

  @override
  int hash(VotesRecord? e) => const ListEquality()
      .hash([e?.poll, e?.timeVoted, e?.voteChoice, e?.voter]);

  @override
  bool isValidKey(Object? o) => o is VotesRecord;
}
