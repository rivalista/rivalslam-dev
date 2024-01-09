import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class LeaguesRecord extends FirestoreRecord {
  LeaguesRecord._(
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

  void _initializeFields() {
    _game = snapshotData['game'] as String?;
    _teamName = snapshotData['teamName'] as String?;
    _teamLogo = snapshotData['teamLogo'] as String?;
    _status = snapshotData['status'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('leagues');

  static Stream<LeaguesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LeaguesRecord.fromSnapshot(s));

  static Future<LeaguesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LeaguesRecord.fromSnapshot(s));

  static LeaguesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LeaguesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LeaguesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LeaguesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LeaguesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LeaguesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLeaguesRecordData({
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

class LeaguesRecordDocumentEquality implements Equality<LeaguesRecord> {
  const LeaguesRecordDocumentEquality();

  @override
  bool equals(LeaguesRecord? e1, LeaguesRecord? e2) {
    return e1?.game == e2?.game &&
        e1?.teamName == e2?.teamName &&
        e1?.teamLogo == e2?.teamLogo &&
        e1?.status == e2?.status;
  }

  @override
  int hash(LeaguesRecord? e) =>
      const ListEquality().hash([e?.game, e?.teamName, e?.teamLogo, e?.status]);

  @override
  bool isValidKey(Object? o) => o is LeaguesRecord;
}
