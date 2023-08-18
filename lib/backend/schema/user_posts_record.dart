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

  // "popVotesMale" field.
  int? _popVotesMale;
  int get popVotesMale => _popVotesMale ?? 0;
  bool hasPopVotesMale() => _popVotesMale != null;

  // "popVotesFemale" field.
  int? _popVotesFemale;
  int get popVotesFemale => _popVotesFemale ?? 0;
  bool hasPopVotesFemale() => _popVotesFemale != null;

  // "intPercentVotesFemale" field.
  List<int>? _intPercentVotesFemale;
  List<int> get intPercentVotesFemale => _intPercentVotesFemale ?? const [];
  bool hasIntPercentVotesFemale() => _intPercentVotesFemale != null;

  // "intPercentVotesMale" field.
  List<int>? _intPercentVotesMale;
  List<int> get intPercentVotesMale => _intPercentVotesMale ?? const [];
  bool hasIntPercentVotesMale() => _intPercentVotesMale != null;

  // "intPercentVotes1" field.
  List<int>? _intPercentVotes1;
  List<int> get intPercentVotes1 => _intPercentVotes1 ?? const [];
  bool hasIntPercentVotes1() => _intPercentVotes1 != null;

  // "intPercentVotes2" field.
  List<int>? _intPercentVotes2;
  List<int> get intPercentVotes2 => _intPercentVotes2 ?? const [];
  bool hasIntPercentVotes2() => _intPercentVotes2 != null;

  // "intPercentVotes3" field.
  List<int>? _intPercentVotes3;
  List<int> get intPercentVotes3 => _intPercentVotes3 ?? const [];
  bool hasIntPercentVotes3() => _intPercentVotes3 != null;

  // "intPercentVotes4" field.
  List<int>? _intPercentVotes4;
  List<int> get intPercentVotes4 => _intPercentVotes4 ?? const [];
  bool hasIntPercentVotes4() => _intPercentVotes4 != null;

  // "votesMale1" field.
  List<int>? _votesMale1;
  List<int> get votesMale1 => _votesMale1 ?? const [];
  bool hasVotesMale1() => _votesMale1 != null;

  // "votesMale2" field.
  List<int>? _votesMale2;
  List<int> get votesMale2 => _votesMale2 ?? const [];
  bool hasVotesMale2() => _votesMale2 != null;

  // "votesMale3" field.
  List<int>? _votesMale3;
  List<int> get votesMale3 => _votesMale3 ?? const [];
  bool hasVotesMale3() => _votesMale3 != null;

  // "votesMale4" field.
  List<int>? _votesMale4;
  List<int> get votesMale4 => _votesMale4 ?? const [];
  bool hasVotesMale4() => _votesMale4 != null;

  // "votesFemale1" field.
  List<int>? _votesFemale1;
  List<int> get votesFemale1 => _votesFemale1 ?? const [];
  bool hasVotesFemale1() => _votesFemale1 != null;

  // "votesFemale2" field.
  List<int>? _votesFemale2;
  List<int> get votesFemale2 => _votesFemale2 ?? const [];
  bool hasVotesFemale2() => _votesFemale2 != null;

  // "votesFemale3" field.
  List<int>? _votesFemale3;
  List<int> get votesFemale3 => _votesFemale3 ?? const [];
  bool hasVotesFemale3() => _votesFemale3 != null;

  // "votesFemale4" field.
  List<int>? _votesFemale4;
  List<int> get votesFemale4 => _votesFemale4 ?? const [];
  bool hasVotesFemale4() => _votesFemale4 != null;

  // "totalVotesMale" field.
  int? _totalVotesMale;
  int get totalVotesMale => _totalVotesMale ?? 0;
  bool hasTotalVotesMale() => _totalVotesMale != null;

  // "totalVotesFemale" field.
  int? _totalVotesFemale;
  int get totalVotesFemale => _totalVotesFemale ?? 0;
  bool hasTotalVotesFemale() => _totalVotesFemale != null;

  // "totalVotesMale1" field.
  int? _totalVotesMale1;
  int get totalVotesMale1 => _totalVotesMale1 ?? 0;
  bool hasTotalVotesMale1() => _totalVotesMale1 != null;

  // "totalVotesMale2" field.
  int? _totalVotesMale2;
  int get totalVotesMale2 => _totalVotesMale2 ?? 0;
  bool hasTotalVotesMale2() => _totalVotesMale2 != null;

  // "totalVotesMale3" field.
  int? _totalVotesMale3;
  int get totalVotesMale3 => _totalVotesMale3 ?? 0;
  bool hasTotalVotesMale3() => _totalVotesMale3 != null;

  // "totalVotesMale4" field.
  int? _totalVotesMale4;
  int get totalVotesMale4 => _totalVotesMale4 ?? 0;
  bool hasTotalVotesMale4() => _totalVotesMale4 != null;

  // "totalVotesFemale1" field.
  int? _totalVotesFemale1;
  int get totalVotesFemale1 => _totalVotesFemale1 ?? 0;
  bool hasTotalVotesFemale1() => _totalVotesFemale1 != null;

  // "totalVotesFemale2" field.
  int? _totalVotesFemale2;
  int get totalVotesFemale2 => _totalVotesFemale2 ?? 0;
  bool hasTotalVotesFemale2() => _totalVotesFemale2 != null;

  // "totalVotesFemale3" field.
  int? _totalVotesFemale3;
  int get totalVotesFemale3 => _totalVotesFemale3 ?? 0;
  bool hasTotalVotesFemale3() => _totalVotesFemale3 != null;

  // "totalVotesFemale4" field.
  int? _totalVotesFemale4;
  int get totalVotesFemale4 => _totalVotesFemale4 ?? 0;
  bool hasTotalVotesFemale4() => _totalVotesFemale4 != null;

  // "lineVotes1" field.
  List<int>? _lineVotes1;
  List<int> get lineVotes1 => _lineVotes1 ?? const [];
  bool hasLineVotes1() => _lineVotes1 != null;

  // "lineDates" field.
  List<int>? _lineDates;
  List<int> get lineDates => _lineDates ?? const [];
  bool hasLineDates() => _lineDates != null;

  // "lineVotes2" field.
  List<int>? _lineVotes2;
  List<int> get lineVotes2 => _lineVotes2 ?? const [];
  bool hasLineVotes2() => _lineVotes2 != null;

  // "lineVotes3" field.
  List<int>? _lineVotes3;
  List<int> get lineVotes3 => _lineVotes3 ?? const [];
  bool hasLineVotes3() => _lineVotes3 != null;

  // "lineVotes4" field.
  List<int>? _lineVotes4;
  List<int> get lineVotes4 => _lineVotes4 ?? const [];
  bool hasLineVotes4() => _lineVotes4 != null;

  // "lineVotesMale" field.
  List<int>? _lineVotesMale;
  List<int> get lineVotesMale => _lineVotesMale ?? const [];
  bool hasLineVotesMale() => _lineVotesMale != null;

  // "lineVotesMale1" field.
  List<int>? _lineVotesMale1;
  List<int> get lineVotesMale1 => _lineVotesMale1 ?? const [];
  bool hasLineVotesMale1() => _lineVotesMale1 != null;

  // "lineVotesMale2" field.
  List<int>? _lineVotesMale2;
  List<int> get lineVotesMale2 => _lineVotesMale2 ?? const [];
  bool hasLineVotesMale2() => _lineVotesMale2 != null;

  // "lineVotesMale3" field.
  List<int>? _lineVotesMale3;
  List<int> get lineVotesMale3 => _lineVotesMale3 ?? const [];
  bool hasLineVotesMale3() => _lineVotesMale3 != null;

  // "lineVotesMale4" field.
  List<int>? _lineVotesMale4;
  List<int> get lineVotesMale4 => _lineVotesMale4 ?? const [];
  bool hasLineVotesMale4() => _lineVotesMale4 != null;

  // "lineVotesFemale" field.
  List<int>? _lineVotesFemale;
  List<int> get lineVotesFemale => _lineVotesFemale ?? const [];
  bool hasLineVotesFemale() => _lineVotesFemale != null;

  // "lineVotesFemale1" field.
  List<int>? _lineVotesFemale1;
  List<int> get lineVotesFemale1 => _lineVotesFemale1 ?? const [];
  bool hasLineVotesFemale1() => _lineVotesFemale1 != null;

  // "lineVotesFemale2" field.
  List<int>? _lineVotesFemale2;
  List<int> get lineVotesFemale2 => _lineVotesFemale2 ?? const [];
  bool hasLineVotesFemale2() => _lineVotesFemale2 != null;

  // "lineVotesFemale3" field.
  List<int>? _lineVotesFemale3;
  List<int> get lineVotesFemale3 => _lineVotesFemale3 ?? const [];
  bool hasLineVotesFemale3() => _lineVotesFemale3 != null;

  // "lineVotesFemale4" field.
  List<int>? _lineVotesFemale4;
  List<int> get lineVotesFemale4 => _lineVotesFemale4 ?? const [];
  bool hasLineVotesFemale4() => _lineVotesFemale4 != null;

  // "timeVoted" field.
  List<DateTime>? _timeVoted;
  List<DateTime> get timeVoted => _timeVoted ?? const [];
  bool hasTimeVoted() => _timeVoted != null;

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
    _popVotesMale = castToType<int>(snapshotData['popVotesMale']);
    _popVotesFemale = castToType<int>(snapshotData['popVotesFemale']);
    _intPercentVotesFemale = getDataList(snapshotData['intPercentVotesFemale']);
    _intPercentVotesMale = getDataList(snapshotData['intPercentVotesMale']);
    _intPercentVotes1 = getDataList(snapshotData['intPercentVotes1']);
    _intPercentVotes2 = getDataList(snapshotData['intPercentVotes2']);
    _intPercentVotes3 = getDataList(snapshotData['intPercentVotes3']);
    _intPercentVotes4 = getDataList(snapshotData['intPercentVotes4']);
    _votesMale1 = getDataList(snapshotData['votesMale1']);
    _votesMale2 = getDataList(snapshotData['votesMale2']);
    _votesMale3 = getDataList(snapshotData['votesMale3']);
    _votesMale4 = getDataList(snapshotData['votesMale4']);
    _votesFemale1 = getDataList(snapshotData['votesFemale1']);
    _votesFemale2 = getDataList(snapshotData['votesFemale2']);
    _votesFemale3 = getDataList(snapshotData['votesFemale3']);
    _votesFemale4 = getDataList(snapshotData['votesFemale4']);
    _totalVotesMale = castToType<int>(snapshotData['totalVotesMale']);
    _totalVotesFemale = castToType<int>(snapshotData['totalVotesFemale']);
    _totalVotesMale1 = castToType<int>(snapshotData['totalVotesMale1']);
    _totalVotesMale2 = castToType<int>(snapshotData['totalVotesMale2']);
    _totalVotesMale3 = castToType<int>(snapshotData['totalVotesMale3']);
    _totalVotesMale4 = castToType<int>(snapshotData['totalVotesMale4']);
    _totalVotesFemale1 = castToType<int>(snapshotData['totalVotesFemale1']);
    _totalVotesFemale2 = castToType<int>(snapshotData['totalVotesFemale2']);
    _totalVotesFemale3 = castToType<int>(snapshotData['totalVotesFemale3']);
    _totalVotesFemale4 = castToType<int>(snapshotData['totalVotesFemale4']);
    _lineVotes1 = getDataList(snapshotData['lineVotes1']);
    _lineDates = getDataList(snapshotData['lineDates']);
    _lineVotes2 = getDataList(snapshotData['lineVotes2']);
    _lineVotes3 = getDataList(snapshotData['lineVotes3']);
    _lineVotes4 = getDataList(snapshotData['lineVotes4']);
    _lineVotesMale = getDataList(snapshotData['lineVotesMale']);
    _lineVotesMale1 = getDataList(snapshotData['lineVotesMale1']);
    _lineVotesMale2 = getDataList(snapshotData['lineVotesMale2']);
    _lineVotesMale3 = getDataList(snapshotData['lineVotesMale3']);
    _lineVotesMale4 = getDataList(snapshotData['lineVotesMale4']);
    _lineVotesFemale = getDataList(snapshotData['lineVotesFemale']);
    _lineVotesFemale1 = getDataList(snapshotData['lineVotesFemale1']);
    _lineVotesFemale2 = getDataList(snapshotData['lineVotesFemale2']);
    _lineVotesFemale3 = getDataList(snapshotData['lineVotesFemale3']);
    _lineVotesFemale4 = getDataList(snapshotData['lineVotesFemale4']);
    _timeVoted = getDataList(snapshotData['timeVoted']);
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
  int? totalVotes1,
  int? totalVotes2,
  int? totalVotes3,
  int? totalVotes4,
  String? category,
  String? isTrending,
  int? engagementScore,
  int? popVotesMale,
  int? popVotesFemale,
  int? totalVotesMale,
  int? totalVotesFemale,
  int? totalVotesMale1,
  int? totalVotesMale2,
  int? totalVotesMale3,
  int? totalVotesMale4,
  int? totalVotesFemale1,
  int? totalVotesFemale2,
  int? totalVotesFemale3,
  int? totalVotesFemale4,
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
      'totalVotes1': totalVotes1,
      'totalVotes2': totalVotes2,
      'totalVotes3': totalVotes3,
      'totalVotes4': totalVotes4,
      'category': category,
      'isTrending': isTrending,
      'engagementScore': engagementScore,
      'popVotesMale': popVotesMale,
      'popVotesFemale': popVotesFemale,
      'totalVotesMale': totalVotesMale,
      'totalVotesFemale': totalVotesFemale,
      'totalVotesMale1': totalVotesMale1,
      'totalVotesMale2': totalVotesMale2,
      'totalVotesMale3': totalVotesMale3,
      'totalVotesMale4': totalVotesMale4,
      'totalVotesFemale1': totalVotesFemale1,
      'totalVotesFemale2': totalVotesFemale2,
      'totalVotesFemale3': totalVotesFemale3,
      'totalVotesFemale4': totalVotesFemale4,
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
        listEquality.equals(e1?.intPercentVotes, e2?.intPercentVotes) &&
        listEquality.equals(e1?.labelPercentVotes, e2?.labelPercentVotes) &&
        e1?.totalVotes1 == e2?.totalVotes1 &&
        e1?.totalVotes2 == e2?.totalVotes2 &&
        e1?.totalVotes3 == e2?.totalVotes3 &&
        e1?.totalVotes4 == e2?.totalVotes4 &&
        e1?.category == e2?.category &&
        listEquality.equals(e1?.subcategory, e2?.subcategory) &&
        e1?.isTrending == e2?.isTrending &&
        e1?.engagementScore == e2?.engagementScore &&
        e1?.popVotesMale == e2?.popVotesMale &&
        e1?.popVotesFemale == e2?.popVotesFemale &&
        listEquality.equals(
            e1?.intPercentVotesFemale, e2?.intPercentVotesFemale) &&
        listEquality.equals(e1?.intPercentVotesMale, e2?.intPercentVotesMale) &&
        listEquality.equals(e1?.intPercentVotes1, e2?.intPercentVotes1) &&
        listEquality.equals(e1?.intPercentVotes2, e2?.intPercentVotes2) &&
        listEquality.equals(e1?.intPercentVotes3, e2?.intPercentVotes3) &&
        listEquality.equals(e1?.intPercentVotes4, e2?.intPercentVotes4) &&
        listEquality.equals(e1?.votesMale1, e2?.votesMale1) &&
        listEquality.equals(e1?.votesMale2, e2?.votesMale2) &&
        listEquality.equals(e1?.votesMale3, e2?.votesMale3) &&
        listEquality.equals(e1?.votesMale4, e2?.votesMale4) &&
        listEquality.equals(e1?.votesFemale1, e2?.votesFemale1) &&
        listEquality.equals(e1?.votesFemale2, e2?.votesFemale2) &&
        listEquality.equals(e1?.votesFemale3, e2?.votesFemale3) &&
        listEquality.equals(e1?.votesFemale4, e2?.votesFemale4) &&
        e1?.totalVotesMale == e2?.totalVotesMale &&
        e1?.totalVotesFemale == e2?.totalVotesFemale &&
        e1?.totalVotesMale1 == e2?.totalVotesMale1 &&
        e1?.totalVotesMale2 == e2?.totalVotesMale2 &&
        e1?.totalVotesMale3 == e2?.totalVotesMale3 &&
        e1?.totalVotesMale4 == e2?.totalVotesMale4 &&
        e1?.totalVotesFemale1 == e2?.totalVotesFemale1 &&
        e1?.totalVotesFemale2 == e2?.totalVotesFemale2 &&
        e1?.totalVotesFemale3 == e2?.totalVotesFemale3 &&
        e1?.totalVotesFemale4 == e2?.totalVotesFemale4 &&
        listEquality.equals(e1?.lineVotes1, e2?.lineVotes1) &&
        listEquality.equals(e1?.lineDates, e2?.lineDates) &&
        listEquality.equals(e1?.lineVotes2, e2?.lineVotes2) &&
        listEquality.equals(e1?.lineVotes3, e2?.lineVotes3) &&
        listEquality.equals(e1?.lineVotes4, e2?.lineVotes4) &&
        listEquality.equals(e1?.lineVotesMale, e2?.lineVotesMale) &&
        listEquality.equals(e1?.lineVotesMale1, e2?.lineVotesMale1) &&
        listEquality.equals(e1?.lineVotesMale2, e2?.lineVotesMale2) &&
        listEquality.equals(e1?.lineVotesMale3, e2?.lineVotesMale3) &&
        listEquality.equals(e1?.lineVotesMale4, e2?.lineVotesMale4) &&
        listEquality.equals(e1?.lineVotesFemale, e2?.lineVotesFemale) &&
        listEquality.equals(e1?.lineVotesFemale1, e2?.lineVotesFemale1) &&
        listEquality.equals(e1?.lineVotesFemale2, e2?.lineVotesFemale2) &&
        listEquality.equals(e1?.lineVotesFemale3, e2?.lineVotesFemale3) &&
        listEquality.equals(e1?.lineVotesFemale4, e2?.lineVotesFemale4) &&
        listEquality.equals(e1?.timeVoted, e2?.timeVoted);
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
        e?.intPercentVotes,
        e?.labelPercentVotes,
        e?.totalVotes1,
        e?.totalVotes2,
        e?.totalVotes3,
        e?.totalVotes4,
        e?.category,
        e?.subcategory,
        e?.isTrending,
        e?.engagementScore,
        e?.popVotesMale,
        e?.popVotesFemale,
        e?.intPercentVotesFemale,
        e?.intPercentVotesMale,
        e?.intPercentVotes1,
        e?.intPercentVotes2,
        e?.intPercentVotes3,
        e?.intPercentVotes4,
        e?.votesMale1,
        e?.votesMale2,
        e?.votesMale3,
        e?.votesMale4,
        e?.votesFemale1,
        e?.votesFemale2,
        e?.votesFemale3,
        e?.votesFemale4,
        e?.totalVotesMale,
        e?.totalVotesFemale,
        e?.totalVotesMale1,
        e?.totalVotesMale2,
        e?.totalVotesMale3,
        e?.totalVotesMale4,
        e?.totalVotesFemale1,
        e?.totalVotesFemale2,
        e?.totalVotesFemale3,
        e?.totalVotesFemale4,
        e?.lineVotes1,
        e?.lineDates,
        e?.lineVotes2,
        e?.lineVotes3,
        e?.lineVotes4,
        e?.lineVotesMale,
        e?.lineVotesMale1,
        e?.lineVotesMale2,
        e?.lineVotesMale3,
        e?.lineVotesMale4,
        e?.lineVotesFemale,
        e?.lineVotesFemale1,
        e?.lineVotesFemale2,
        e?.lineVotesFemale3,
        e?.lineVotesFemale4,
        e?.timeVoted
      ]);

  @override
  bool isValidKey(Object? o) => o is UserPostsRecord;
}
