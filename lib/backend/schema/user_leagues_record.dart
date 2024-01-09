import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class UserLeaguesRecord extends FirestoreRecord {
  UserLeaguesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "game" field.
  String? _game;
  String get game => _game ?? '';
  bool hasGame() => _game != null;

  // "teamName" field.
  String? _teamName;
  String get teamName => _teamName ?? '';
  bool hasTeamName() => _teamName != null;

  // "teamLogo" field.
  String? _teamLogo;
  String get teamLogo => _teamLogo ?? '';
  bool hasTeamLogo() => _teamLogo != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _game = snapshotData['game'] as String?;
    _teamName = snapshotData['teamName'] as String?;
    _teamLogo = snapshotData['teamLogo'] as String?;
    _status = snapshotData['status'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_leagues')
          : FirebaseFirestore.instance.collectionGroup('user_leagues');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('user_leagues').doc();

  static Stream<UserLeaguesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserLeaguesRecord.fromSnapshot(s));

  static Future<UserLeaguesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserLeaguesRecord.fromSnapshot(s));

  static UserLeaguesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserLeaguesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserLeaguesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserLeaguesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserLeaguesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserLeaguesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserLeaguesRecordData({
  String? game,
  String? teamName,
  String? teamLogo,
  bool? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'game': game,
      'teamName': teamName,
      'teamLogo': teamLogo,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserLeaguesRecordDocumentEquality implements Equality<UserLeaguesRecord> {
  const UserLeaguesRecordDocumentEquality();

  @override
  bool equals(UserLeaguesRecord? e1, UserLeaguesRecord? e2) {
    return e1?.game == e2?.game &&
        e1?.teamName == e2?.teamName &&
        e1?.teamLogo == e2?.teamLogo &&
        e1?.status == e2?.status;
  }

  @override
  int hash(UserLeaguesRecord? e) =>
      const ListEquality().hash([e?.game, e?.teamName, e?.teamLogo, e?.status]);

  @override
  bool isValidKey(Object? o) => o is UserLeaguesRecord;
}
