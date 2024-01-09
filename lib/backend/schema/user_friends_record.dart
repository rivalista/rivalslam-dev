import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class UserFriendsRecord extends FirestoreRecord {
  UserFriendsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "profile_pic" field.
  String? _profilePic;
  String get profilePic => _profilePic ?? '';
  bool hasProfilePic() => _profilePic != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _location = snapshotData['location'] as String?;
    _profilePic = snapshotData['profile_pic'] as String?;
    _status = snapshotData['status'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_friends')
          : FirebaseFirestore.instance.collectionGroup('user_friends');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('user_friends').doc();

  static Stream<UserFriendsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserFriendsRecord.fromSnapshot(s));

  static Future<UserFriendsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserFriendsRecord.fromSnapshot(s));

  static UserFriendsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserFriendsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserFriendsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserFriendsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserFriendsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserFriendsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserFriendsRecordData({
  String? name,
  String? location,
  String? profilePic,
  bool? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'location': location,
      'profile_pic': profilePic,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserFriendsRecordDocumentEquality implements Equality<UserFriendsRecord> {
  const UserFriendsRecordDocumentEquality();

  @override
  bool equals(UserFriendsRecord? e1, UserFriendsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.location == e2?.location &&
        e1?.profilePic == e2?.profilePic &&
        e1?.status == e2?.status;
  }

  @override
  int hash(UserFriendsRecord? e) => const ListEquality()
      .hash([e?.name, e?.location, e?.profilePic, e?.status]);

  @override
  bool isValidKey(Object? o) => o is UserFriendsRecord;
}
