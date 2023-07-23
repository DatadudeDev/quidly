import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class Votes4Record extends FirestoreRecord {
  Votes4Record._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  bool hasCount() => _count != null;

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  bool hasLabel() => _label != null;

  void _initializeFields() {
    _count = castToType<int>(snapshotData['count']);
    _label = snapshotData['label'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('votes4');

  static Stream<Votes4Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Votes4Record.fromSnapshot(s));

  static Future<Votes4Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Votes4Record.fromSnapshot(s));

  static Votes4Record fromSnapshot(DocumentSnapshot snapshot) => Votes4Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Votes4Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Votes4Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Votes4Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Votes4Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVotes4RecordData({
  int? count,
  String? label,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'count': count,
      'label': label,
    }.withoutNulls,
  );

  return firestoreData;
}

class Votes4RecordDocumentEquality implements Equality<Votes4Record> {
  const Votes4RecordDocumentEquality();

  @override
  bool equals(Votes4Record? e1, Votes4Record? e2) {
    return e1?.count == e2?.count && e1?.label == e2?.label;
  }

  @override
  int hash(Votes4Record? e) => const ListEquality().hash([e?.count, e?.label]);

  @override
  bool isValidKey(Object? o) => o is Votes4Record;
}
