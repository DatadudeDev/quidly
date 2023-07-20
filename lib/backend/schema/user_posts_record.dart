import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserPostsRecord extends FirestoreRecord {
  UserPostsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "postPhoto" field.
  String? _postPhoto;
  String get postPhoto => _postPhoto ?? '';
  bool hasPostPhoto() => _postPhoto != null;

  // "postTitle" field.
  String? _postTitle;
  String get postTitle => _postTitle ?? '';
  bool hasPostTitle() => _postTitle != null;

  // "postDescription" field.
  String? _postDescription;
  String get postDescription => _postDescription ?? '';
  bool hasPostDescription() => _postDescription != null;

  // "postUser" field.
  DocumentReference? _postUser;
  DocumentReference? get postUser => _postUser;
  bool hasPostUser() => _postUser != null;

  // "timePosted" field.
  DateTime? _timePosted;
  DateTime? get timePosted => _timePosted;
  bool hasTimePosted() => _timePosted != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "numComments" field.
  int? _numComments;
  int get numComments => _numComments ?? 0;
  bool hasNumComments() => _numComments != null;

  // "dogProfile" field.
  DocumentReference? _dogProfile;
  DocumentReference? get dogProfile => _dogProfile;
  bool hasDogProfile() => _dogProfile != null;

  // "postOwner" field.
  bool? _postOwner;
  bool get postOwner => _postOwner ?? false;
  bool hasPostOwner() => _postOwner != null;

  // "shits" field.
  List<DocumentReference>? _shits;
  List<DocumentReference> get shits => _shits ?? const [];
  bool hasShits() => _shits != null;

  // "postPoll" field.
  String? _postPoll;
  String get postPoll => _postPoll ?? '';
  bool hasPostPoll() => _postPoll != null;

  // "postAnswer1" field.
  String? _postAnswer1;
  String get postAnswer1 => _postAnswer1 ?? '';
  bool hasPostAnswer1() => _postAnswer1 != null;

  // "postAnswer2" field.
  String? _postAnswer2;
  String get postAnswer2 => _postAnswer2 ?? '';
  bool hasPostAnswer2() => _postAnswer2 != null;

  // "postAnswer3" field.
  String? _postAnswer3;
  String get postAnswer3 => _postAnswer3 ?? '';
  bool hasPostAnswer3() => _postAnswer3 != null;

  // "postAnswer4" field.
  String? _postAnswer4;
  String get postAnswer4 => _postAnswer4 ?? '';
  bool hasPostAnswer4() => _postAnswer4 != null;

  // "imageURL" field.
  String? _imageURL;
  String get imageURL => _imageURL ?? '';
  bool hasImageURL() => _imageURL != null;

  // "votes1" field.
  List<DocumentReference>? _votes1;
  List<DocumentReference> get votes1 => _votes1 ?? const [];
  bool hasVotes1() => _votes1 != null;

  // "votes2" field.
  List<DocumentReference>? _votes2;
  List<DocumentReference> get votes2 => _votes2 ?? const [];
  bool hasVotes2() => _votes2 != null;

  // "votes3" field.
  List<DocumentReference>? _votes3;
  List<DocumentReference> get votes3 => _votes3 ?? const [];
  bool hasVotes3() => _votes3 != null;

  // "votes4" field.
  List<DocumentReference>? _votes4;
  List<DocumentReference> get votes4 => _votes4 ?? const [];
  bool hasVotes4() => _votes4 != null;

  // "expiry" field.
  DateTime? _expiry;
  DateTime? get expiry => _expiry;
  bool hasExpiry() => _expiry != null;

  void _initializeFields() {
    _postPhoto = snapshotData['postPhoto'] as String?;
    _postTitle = snapshotData['postTitle'] as String?;
    _postDescription = snapshotData['postDescription'] as String?;
    _postUser = snapshotData['postUser'] as DocumentReference?;
    _timePosted = snapshotData['timePosted'] as DateTime?;
    _likes = getDataList(snapshotData['likes']);
    _numComments = castToType<int>(snapshotData['numComments']);
    _dogProfile = snapshotData['dogProfile'] as DocumentReference?;
    _postOwner = snapshotData['postOwner'] as bool?;
    _shits = getDataList(snapshotData['shits']);
    _postPoll = snapshotData['postPoll'] as String?;
    _postAnswer1 = snapshotData['postAnswer1'] as String?;
    _postAnswer2 = snapshotData['postAnswer2'] as String?;
    _postAnswer3 = snapshotData['postAnswer3'] as String?;
    _postAnswer4 = snapshotData['postAnswer4'] as String?;
    _imageURL = snapshotData['imageURL'] as String?;
    _votes1 = getDataList(snapshotData['votes1']);
    _votes2 = getDataList(snapshotData['votes2']);
    _votes3 = getDataList(snapshotData['votes3']);
    _votes4 = getDataList(snapshotData['votes4']);
    _expiry = snapshotData['expiry'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userPosts');

  static Stream<UserPostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserPostsRecord.fromSnapshot(s));

  static Future<UserPostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserPostsRecord.fromSnapshot(s));

  static UserPostsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserPostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserPostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserPostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserPostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserPostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserPostsRecordData({
  String? postPhoto,
  String? postTitle,
  String? postDescription,
  DocumentReference? postUser,
  DateTime? timePosted,
  int? numComments,
  DocumentReference? dogProfile,
  bool? postOwner,
  String? postPoll,
  String? postAnswer1,
  String? postAnswer2,
  String? postAnswer3,
  String? postAnswer4,
  String? imageURL,
  DateTime? expiry,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'postPhoto': postPhoto,
      'postTitle': postTitle,
      'postDescription': postDescription,
      'postUser': postUser,
      'timePosted': timePosted,
      'numComments': numComments,
      'dogProfile': dogProfile,
      'postOwner': postOwner,
      'postPoll': postPoll,
      'postAnswer1': postAnswer1,
      'postAnswer2': postAnswer2,
      'postAnswer3': postAnswer3,
      'postAnswer4': postAnswer4,
      'imageURL': imageURL,
      'expiry': expiry,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserPostsRecordDocumentEquality implements Equality<UserPostsRecord> {
  const UserPostsRecordDocumentEquality();

  @override
  bool equals(UserPostsRecord? e1, UserPostsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.postPhoto == e2?.postPhoto &&
        e1?.postTitle == e2?.postTitle &&
        e1?.postDescription == e2?.postDescription &&
        e1?.postUser == e2?.postUser &&
        e1?.timePosted == e2?.timePosted &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        e1?.numComments == e2?.numComments &&
        e1?.dogProfile == e2?.dogProfile &&
        e1?.postOwner == e2?.postOwner &&
        listEquality.equals(e1?.shits, e2?.shits) &&
        e1?.postPoll == e2?.postPoll &&
        e1?.postAnswer1 == e2?.postAnswer1 &&
        e1?.postAnswer2 == e2?.postAnswer2 &&
        e1?.postAnswer3 == e2?.postAnswer3 &&
        e1?.postAnswer4 == e2?.postAnswer4 &&
        e1?.imageURL == e2?.imageURL &&
        listEquality.equals(e1?.votes1, e2?.votes1) &&
        listEquality.equals(e1?.votes2, e2?.votes2) &&
        listEquality.equals(e1?.votes3, e2?.votes3) &&
        listEquality.equals(e1?.votes4, e2?.votes4) &&
        e1?.expiry == e2?.expiry;
  }

  @override
  int hash(UserPostsRecord? e) => const ListEquality().hash([
        e?.postPhoto,
        e?.postTitle,
        e?.postDescription,
        e?.postUser,
        e?.timePosted,
        e?.likes,
        e?.numComments,
        e?.dogProfile,
        e?.postOwner,
        e?.shits,
        e?.postPoll,
        e?.postAnswer1,
        e?.postAnswer2,
        e?.postAnswer3,
        e?.postAnswer4,
        e?.imageURL,
        e?.votes1,
        e?.votes2,
        e?.votes3,
        e?.votes4,
        e?.expiry
      ]);

  @override
  bool isValidKey(Object? o) => o is UserPostsRecord;
}
