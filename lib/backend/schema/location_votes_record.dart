import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocationVotesRecord extends FirestoreRecord {
  LocationVotesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userPost" field.
  DocumentReference? _userPost;
  DocumentReference? get userPost => _userPost;
  bool hasUserPost() => _userPost != null;

  // "voter" field.
  DocumentReference? _voter;
  DocumentReference? get voter => _voter;
  bool hasVoter() => _voter != null;

  // "voteLocation" field.
  LatLng? _voteLocation;
  LatLng? get voteLocation => _voteLocation;
  bool hasVoteLocation() => _voteLocation != null;

  // "voteAnswer" field.
  int? _voteAnswer;
  int get voteAnswer => _voteAnswer ?? 0;
  bool hasVoteAnswer() => _voteAnswer != null;

  void _initializeFields() {
    _userPost = snapshotData['userPost'] as DocumentReference?;
    _voter = snapshotData['voter'] as DocumentReference?;
    _voteLocation = snapshotData['voteLocation'] as LatLng?;
    _voteAnswer = castToType<int>(snapshotData['voteAnswer']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('locationVotes');

  static Stream<LocationVotesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LocationVotesRecord.fromSnapshot(s));

  static Future<LocationVotesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LocationVotesRecord.fromSnapshot(s));

  static LocationVotesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LocationVotesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LocationVotesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LocationVotesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LocationVotesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LocationVotesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLocationVotesRecordData({
  DocumentReference? userPost,
  DocumentReference? voter,
  LatLng? voteLocation,
  int? voteAnswer,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userPost': userPost,
      'voter': voter,
      'voteLocation': voteLocation,
      'voteAnswer': voteAnswer,
    }.withoutNulls,
  );

  return firestoreData;
}

class LocationVotesRecordDocumentEquality
    implements Equality<LocationVotesRecord> {
  const LocationVotesRecordDocumentEquality();

  @override
  bool equals(LocationVotesRecord? e1, LocationVotesRecord? e2) {
    return e1?.userPost == e2?.userPost &&
        e1?.voter == e2?.voter &&
        e1?.voteLocation == e2?.voteLocation &&
        e1?.voteAnswer == e2?.voteAnswer;
  }

  @override
  int hash(LocationVotesRecord? e) => const ListEquality()
      .hash([e?.userPost, e?.voter, e?.voteLocation, e?.voteAnswer]);

  @override
  bool isValidKey(Object? o) => o is LocationVotesRecord;
}
