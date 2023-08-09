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

  // "nullExpiry" field.
  String? _nullExpiry;
  String get nullExpiry => _nullExpiry ?? '';
  bool hasNullExpiry() => _nullExpiry != null;

  // "locationEnforced" field.
  bool? _locationEnforced;
  bool get locationEnforced => _locationEnforced ?? false;
  bool hasLocationEnforced() => _locationEnforced != null;

  // "pollLocation" field.
  LatLng? _pollLocation;
  LatLng? get pollLocation => _pollLocation;
  bool hasPollLocation() => _pollLocation != null;

  // "countVotes1" field.
  int? _countVotes1;
  int get countVotes1 => _countVotes1 ?? 0;
  bool hasCountVotes1() => _countVotes1 != null;

  // "countVotes2" field.
  int? _countVotes2;
  int get countVotes2 => _countVotes2 ?? 0;
  bool hasCountVotes2() => _countVotes2 != null;

  // "countVotes3" field.
  int? _countVotes3;
  int get countVotes3 => _countVotes3 ?? 0;
  bool hasCountVotes3() => _countVotes3 != null;

  // "countVotes4" field.
  int? _countVotes4;
  int get countVotes4 => _countVotes4 ?? 0;
  bool hasCountVotes4() => _countVotes4 != null;

  // "popVotes1" field.
  int? _popVotes1;
  int get popVotes1 => _popVotes1 ?? 0;
  bool hasPopVotes1() => _popVotes1 != null;

  // "popVotes2" field.
  int? _popVotes2;
  int get popVotes2 => _popVotes2 ?? 0;
  bool hasPopVotes2() => _popVotes2 != null;

  // "popVotes3" field.
  int? _popVotes3;
  int get popVotes3 => _popVotes3 ?? 0;
  bool hasPopVotes3() => _popVotes3 != null;

  // "popVotes4" field.
  int? _popVotes4;
  int get popVotes4 => _popVotes4 ?? 0;
  bool hasPopVotes4() => _popVotes4 != null;

  // "percentVotes1" field.
  String? _percentVotes1;
  String get percentVotes1 => _percentVotes1 ?? '';
  bool hasPercentVotes1() => _percentVotes1 != null;

  // "percentVotes2" field.
  String? _percentVotes2;
  String get percentVotes2 => _percentVotes2 ?? '';
  bool hasPercentVotes2() => _percentVotes2 != null;

  // "percentVotes3" field.
  String? _percentVotes3;
  String get percentVotes3 => _percentVotes3 ?? '';
  bool hasPercentVotes3() => _percentVotes3 != null;

  // "percentVotes4" field.
  String? _percentVotes4;
  String get percentVotes4 => _percentVotes4 ?? '';
  bool hasPercentVotes4() => _percentVotes4 != null;

  // "intPercentVotes" field.
  List<int>? _intPercentVotes;
  List<int> get intPercentVotes => _intPercentVotes ?? const [];
  bool hasIntPercentVotes() => _intPercentVotes != null;

  // "labelPercentVotes" field.
  List<String>? _labelPercentVotes;
  List<String> get labelPercentVotes => _labelPercentVotes ?? const [];
  bool hasLabelPercentVotes() => _labelPercentVotes != null;

  // "totalVotes1" field.
  int? _totalVotes1;
  int get totalVotes1 => _totalVotes1 ?? 0;
  bool hasTotalVotes1() => _totalVotes1 != null;

  // "totalVotes2" field.
  int? _totalVotes2;
  int get totalVotes2 => _totalVotes2 ?? 0;
  bool hasTotalVotes2() => _totalVotes2 != null;

  // "totalVotes3" field.
  int? _totalVotes3;
  int get totalVotes3 => _totalVotes3 ?? 0;
  bool hasTotalVotes3() => _totalVotes3 != null;

  // "totalVotes4" field.
  int? _totalVotes4;
  int get totalVotes4 => _totalVotes4 ?? 0;
  bool hasTotalVotes4() => _totalVotes4 != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "subcategory" field.
  List<String>? _subcategory;
  List<String> get subcategory => _subcategory ?? const [];
  bool hasSubcategory() => _subcategory != null;

  // "isTrending" field.
  String? _isTrending;
  String get isTrending => _isTrending ?? '';
  bool hasIsTrending() => _isTrending != null;

  // "engagementScore" field.
  int? _engagementScore;
  int get engagementScore => _engagementScore ?? 0;
  bool hasEngagementScore() => _engagementScore != null;

  void _initializeFields() {
    _postUser = snapshotData['postUser'] as DocumentReference?;
    _timePosted = snapshotData['timePosted'] as DateTime?;
    _likes = getDataList(snapshotData['likes']);
    _numComments = castToType<int>(snapshotData['numComments']);
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
    _nullExpiry = snapshotData['nullExpiry'] as String?;
    _locationEnforced = snapshotData['locationEnforced'] as bool?;
    _pollLocation = snapshotData['pollLocation'] as LatLng?;
    _countVotes1 = castToType<int>(snapshotData['countVotes1']);
    _countVotes2 = castToType<int>(snapshotData['countVotes2']);
    _countVotes3 = castToType<int>(snapshotData['countVotes3']);
    _countVotes4 = castToType<int>(snapshotData['countVotes4']);
    _popVotes1 = castToType<int>(snapshotData['popVotes1']);
    _popVotes2 = castToType<int>(snapshotData['popVotes2']);
    _popVotes3 = castToType<int>(snapshotData['popVotes3']);
    _popVotes4 = castToType<int>(snapshotData['popVotes4']);
    _percentVotes1 = snapshotData['percentVotes1'] as String?;
    _percentVotes2 = snapshotData['percentVotes2'] as String?;
    _percentVotes3 = snapshotData['percentVotes3'] as String?;
    _percentVotes4 = snapshotData['percentVotes4'] as String?;
    _intPercentVotes = getDataList(snapshotData['intPercentVotes']);
    _labelPercentVotes = getDataList(snapshotData['labelPercentVotes']);
    _totalVotes1 = castToType<int>(snapshotData['totalVotes1']);
    _totalVotes2 = castToType<int>(snapshotData['totalVotes2']);
    _totalVotes3 = castToType<int>(snapshotData['totalVotes3']);
    _totalVotes4 = castToType<int>(snapshotData['totalVotes4']);
    _category = snapshotData['category'] as String?;
    _subcategory = getDataList(snapshotData['subcategory']);
    _isTrending = snapshotData['isTrending'] as String?;
    _engagementScore = castToType<int>(snapshotData['engagementScore']);
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
  DocumentReference? postUser,
  DateTime? timePosted,
  int? numComments,
  bool? postOwner,
  String? postPoll,
  String? postAnswer1,
  String? postAnswer2,
  String? postAnswer3,
  String? postAnswer4,
  String? imageURL,
  DateTime? expiry,
  String? nullExpiry,
  bool? locationEnforced,
  LatLng? pollLocation,
  int? countVotes1,
  int? countVotes2,
  int? countVotes3,
  int? countVotes4,
  int? popVotes1,
  int? popVotes2,
  int? popVotes3,
  int? popVotes4,
  String? percentVotes1,
  String? percentVotes2,
  String? percentVotes3,
  String? percentVotes4,
  int? totalVotes1,
  int? totalVotes2,
  int? totalVotes3,
  int? totalVotes4,
  String? category,
  String? isTrending,
  int? engagementScore,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'postUser': postUser,
      'timePosted': timePosted,
      'numComments': numComments,
      'postOwner': postOwner,
      'postPoll': postPoll,
      'postAnswer1': postAnswer1,
      'postAnswer2': postAnswer2,
      'postAnswer3': postAnswer3,
      'postAnswer4': postAnswer4,
      'imageURL': imageURL,
      'expiry': expiry,
      'nullExpiry': nullExpiry,
      'locationEnforced': locationEnforced,
      'pollLocation': pollLocation,
      'countVotes1': countVotes1,
      'countVotes2': countVotes2,
      'countVotes3': countVotes3,
      'countVotes4': countVotes4,
      'popVotes1': popVotes1,
      'popVotes2': popVotes2,
      'popVotes3': popVotes3,
      'popVotes4': popVotes4,
      'percentVotes1': percentVotes1,
      'percentVotes2': percentVotes2,
      'percentVotes3': percentVotes3,
      'percentVotes4': percentVotes4,
      'totalVotes1': totalVotes1,
      'totalVotes2': totalVotes2,
      'totalVotes3': totalVotes3,
      'totalVotes4': totalVotes4,
      'category': category,
      'isTrending': isTrending,
      'engagementScore': engagementScore,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserPostsRecordDocumentEquality implements Equality<UserPostsRecord> {
  const UserPostsRecordDocumentEquality();

  @override
  bool equals(UserPostsRecord? e1, UserPostsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.postUser == e2?.postUser &&
        e1?.timePosted == e2?.timePosted &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        e1?.numComments == e2?.numComments &&
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
        e1?.expiry == e2?.expiry &&
        e1?.nullExpiry == e2?.nullExpiry &&
        e1?.locationEnforced == e2?.locationEnforced &&
        e1?.pollLocation == e2?.pollLocation &&
        e1?.countVotes1 == e2?.countVotes1 &&
        e1?.countVotes2 == e2?.countVotes2 &&
        e1?.countVotes3 == e2?.countVotes3 &&
        e1?.countVotes4 == e2?.countVotes4 &&
        e1?.popVotes1 == e2?.popVotes1 &&
        e1?.popVotes2 == e2?.popVotes2 &&
        e1?.popVotes3 == e2?.popVotes3 &&
        e1?.popVotes4 == e2?.popVotes4 &&
        e1?.percentVotes1 == e2?.percentVotes1 &&
        e1?.percentVotes2 == e2?.percentVotes2 &&
        e1?.percentVotes3 == e2?.percentVotes3 &&
        e1?.percentVotes4 == e2?.percentVotes4 &&
        listEquality.equals(e1?.intPercentVotes, e2?.intPercentVotes) &&
        listEquality.equals(e1?.labelPercentVotes, e2?.labelPercentVotes) &&
        e1?.totalVotes1 == e2?.totalVotes1 &&
        e1?.totalVotes2 == e2?.totalVotes2 &&
        e1?.totalVotes3 == e2?.totalVotes3 &&
        e1?.totalVotes4 == e2?.totalVotes4 &&
        e1?.category == e2?.category &&
        listEquality.equals(e1?.subcategory, e2?.subcategory) &&
        e1?.isTrending == e2?.isTrending &&
        e1?.engagementScore == e2?.engagementScore;
  }

  @override
  int hash(UserPostsRecord? e) => const ListEquality().hash([
        e?.postUser,
        e?.timePosted,
        e?.likes,
        e?.numComments,
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
        e?.expiry,
        e?.nullExpiry,
        e?.locationEnforced,
        e?.pollLocation,
        e?.countVotes1,
        e?.countVotes2,
        e?.countVotes3,
        e?.countVotes4,
        e?.popVotes1,
        e?.popVotes2,
        e?.popVotes3,
        e?.popVotes4,
        e?.percentVotes1,
        e?.percentVotes2,
        e?.percentVotes3,
        e?.percentVotes4,
        e?.intPercentVotes,
        e?.labelPercentVotes,
        e?.totalVotes1,
        e?.totalVotes2,
        e?.totalVotes3,
        e?.totalVotes4,
        e?.category,
        e?.subcategory,
        e?.isTrending,
        e?.engagementScore
      ]);

  @override
  bool isValidKey(Object? o) => o is UserPostsRecord;
}
