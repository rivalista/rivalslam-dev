// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class LeagueStruct extends FFFirebaseStruct {
  LeagueStruct({
    int? id,
    String? name,
    String? logo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        _logo = logo,
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

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  set logo(String? val) => _logo = val;

  bool hasLogo() => _logo != null;

  static LeagueStruct fromMap(Map<String, dynamic> data) => LeagueStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        logo: data['logo'] as String?,
      );

  static LeagueStruct? maybeFromMap(dynamic data) =>
      data is Map ? LeagueStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'logo': _logo,
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
        'logo': serializeParam(
          _logo,
          ParamType.String,
        ),
      }.withoutNulls;

  static LeagueStruct fromSerializableMap(Map<String, dynamic> data) =>
      LeagueStruct(
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
        logo: deserializeParam(
          data['logo'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LeagueStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LeagueStruct &&
        id == other.id &&
        name == other.name &&
        logo == other.logo;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, logo]);
}

LeagueStruct createLeagueStruct({
  int? id,
  String? name,
  String? logo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LeagueStruct(
      id: id,
      name: name,
      logo: logo,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LeagueStruct? updateLeagueStruct(
  LeagueStruct? league, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    league
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLeagueStructData(
  Map<String, dynamic> firestoreData,
  LeagueStruct? league,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (league == null) {
    return;
  }
  if (league.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && league.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final leagueData = getLeagueFirestoreData(league, forFieldValue);
  final nestedData = leagueData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = league.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLeagueFirestoreData(
  LeagueStruct? league, [
  bool forFieldValue = false,
]) {
  if (league == null) {
    return {};
  }
  final firestoreData = mapToFirestore(league.toMap());

  // Add any Firestore field values
  league.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLeagueListFirestoreData(
  List<LeagueStruct>? leagues,
) =>
    leagues?.map((e) => getLeagueFirestoreData(e, true)).toList() ?? [];
