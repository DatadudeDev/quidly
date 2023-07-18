import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImagesRecord extends FirestoreRecord {
  ImagesRecord._(
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

  // "imageURL" field.
  String? _imageURL;
  String get imageURL => _imageURL ?? '';
  bool hasImageURL() => _imageURL != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _poll = snapshotData['poll'] as DocumentReference?;
    _imageURL = snapshotData['imageURL'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('images');

  static Stream<ImagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ImagesRecord.fromSnapshot(s));

  static Future<ImagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ImagesRecord.fromSnapshot(s));

  static ImagesRecord fromSnapshot(DocumentSnapshot snapshot) => ImagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ImagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ImagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ImagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ImagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createImagesRecordData({
  DocumentReference? user,
  DocumentReference? poll,
  String? imageURL,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'poll': poll,
      'imageURL': imageURL,
    }.withoutNulls,
  );

  return firestoreData;
}

class ImagesRecordDocumentEquality implements Equality<ImagesRecord> {
  const ImagesRecordDocumentEquality();

  @override
  bool equals(ImagesRecord? e1, ImagesRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.poll == e2?.poll &&
        e1?.imageURL == e2?.imageURL;
  }

  @override
  int hash(ImagesRecord? e) =>
      const ListEquality().hash([e?.user, e?.poll, e?.imageURL]);

  @override
  bool isValidKey(Object? o) => o is ImagesRecord;
}
