// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GameStruct extends FFFirebaseStruct {
  GameStruct({
    int? id,
    String? name,
    List<LeagueStruct>? leagues,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        _leagues = leagues,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "leagues" field.
  List<LeagueStruct>? _leagues;
  List<LeagueStruct> get leagues => _leagues ?? const [];
  set leagues(List<LeagueStruct>? val) => _leagues = val;

  void updateLeagues(Function(List<LeagueStruct>) updateFn) {
    updateFn(_leagues ??= []);
  }

  bool hasLeagues() => _leagues != null;

  static GameStruct fromMap(Map<String, dynamic> data) => GameStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        leagues: getStructList(
          data['leagues'],
          LeagueStruct.fromMap,
        ),
      );

  static GameStruct? maybeFromMap(dynamic data) =>
      data is Map ? GameStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'leagues': _leagues?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'leagues': serializeParam(
          _leagues,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static GameStruct fromSerializableMap(Map<String, dynamic> data) =>
      GameStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        leagues: deserializeStructParam<LeagueStruct>(
          data['leagues'],
          ParamType.DataStruct,
          true,
          structBuilder: LeagueStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'GameStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is GameStruct &&
        id == other.id &&
        name == other.name &&
        listEquality.equals(leagues, other.leagues);
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, leagues]);
}

GameStruct createGameStruct({
  int? id,
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GameStruct(
      id: id,
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GameStruct? updateGameStruct(
  GameStruct? game, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    game
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGameStructData(
  Map<String, dynamic> firestoreData,
  GameStruct? game,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (game == null) {
    return;
  }
  if (game.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && game.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final gameData = getGameFirestoreData(game, forFieldValue);
  final nestedData = gameData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = game.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGameFirestoreData(
  GameStruct? game, [
  bool forFieldValue = false,
]) {
  if (game == null) {
    return {};
  }
  final firestoreData = mapToFirestore(game.toMap());

  // Add any Firestore field values
  game.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGameListFirestoreData(
  List<GameStruct>? games,
) =>
    games?.map((e) => getGameFirestoreData(e, true)).toList() ?? [];
