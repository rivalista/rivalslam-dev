import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class UserBuddiesRecord extends FirestoreRecord {
  UserBuddiesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "full_name" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  bool hasFullName() => _fullName != null;

  // "collage" field.
  String? _collage;
  String get collage => _collage ?? '';
  bool hasCollage() => _collage != null;

  // "home_town" field.
  String? _homeTown;
  String get homeTown => _homeTown ?? '';
  bool hasHomeTown() => _homeTown != null;

  // "lives_in" field.
  String? _livesIn;
  String get livesIn => _livesIn ?? '';
  bool hasLivesIn() => _livesIn != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _fullName = snapshotData['full_name'] as String?;
    _collage = snapshotData['collage'] as String?;
    _homeTown = snapshotData['home_town'] as String?;
    _livesIn = snapshotData['lives_in'] as String?;
    _status = snapshotData['status'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_buddies')
          : FirebaseFirestore.instance.collectionGroup('user_buddies');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('user_buddies').doc();

  static Stream<UserBuddiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserBuddiesRecord.fromSnapshot(s));

  static Future<UserBuddiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserBuddiesRecord.fromSnapshot(s));

  static UserBuddiesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserBuddiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserBuddiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserBuddiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserBuddiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserBuddiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserBuddiesRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? fullName,
  String? collage,
  String? homeTown,
  String? livesIn,
  bool? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'full_name': fullName,
      'collage': collage,
      'home_town': homeTown,
      'lives_in': livesIn,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserBuddiesRecordDocumentEquality implements Equality<UserBuddiesRecord> {
  const UserBuddiesRecordDocumentEquality();

  @override
  bool equals(UserBuddiesRecord? e1, UserBuddiesRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.fullName == e2?.fullName &&
        e1?.collage == e2?.collage &&
        e1?.homeTown == e2?.homeTown &&
        e1?.livesIn == e2?.livesIn &&
        e1?.status == e2?.status;
  }

  @override
  int hash(UserBuddiesRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.fullName,
        e?.collage,
        e?.homeTown,
        e?.livesIn,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is UserBuddiesRecord;
}
