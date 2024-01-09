import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class UserTeamRivalsRecord extends FirestoreRecord {
  UserTeamRivalsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _logo = snapshotData['logo'] as String?;
    _status = snapshotData['status'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_team_rivals')
          : FirebaseFirestore.instance.collectionGroup('user_team_rivals');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('user_team_rivals').doc();

  static Stream<UserTeamRivalsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserTeamRivalsRecord.fromSnapshot(s));

  static Future<UserTeamRivalsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserTeamRivalsRecord.fromSnapshot(s));

  static UserTeamRivalsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserTeamRivalsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserTeamRivalsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserTeamRivalsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserTeamRivalsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserTeamRivalsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserTeamRivalsRecordData({
  String? name,
  String? logo,
  bool? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'logo': logo,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserTeamRivalsRecordDocumentEquality
    implements Equality<UserTeamRivalsRecord> {
  const UserTeamRivalsRecordDocumentEquality();

  @override
  bool equals(UserTeamRivalsRecord? e1, UserTeamRivalsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.logo == e2?.logo &&
        e1?.status == e2?.status;
  }

  @override
  int hash(UserTeamRivalsRecord? e) =>
      const ListEquality().hash([e?.name, e?.logo, e?.status]);

  @override
  bool isValidKey(Object? o) => o is UserTeamRivalsRecord;
}
