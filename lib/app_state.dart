import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  int _scoreX = 390;
  int get scoreX => _scoreX;
  set scoreX(int value) {
    _scoreX = value;
  }

  int _scoreY = 80;
  int get scoreY => _scoreY;
  set scoreY(int value) {
    _scoreY = value;
  }

  dynamic _teams;
  dynamic get teams => _teams;
  set teams(dynamic value) {
    _teams = value;
  }

  bool _home = false;
  bool get home => _home;
  set home(bool value) {
    _home = value;
  }

  bool _slambet = false;
  bool get slambet => _slambet;
  set slambet(bool value) {
    _slambet = value;
  }

  bool _trash = false;
  bool get trash => _trash;
  set trash(bool value) {
    _trash = value;
  }

  bool _games = false;
  bool get games => _games;
  set games(bool value) {
    _games = value;
  }

  dynamic _leagues;
  dynamic get leagues => _leagues;
  set leagues(dynamic value) {
    _leagues = value;
  }

  List<String> _teamAname = [];
  List<String> get teamAname => _teamAname;
  set teamAname(List<String> value) {
    _teamAname = value;
  }

  void addToTeamAname(String value) {
    _teamAname.add(value);
  }

  void removeFromTeamAname(String value) {
    _teamAname.remove(value);
  }

  void removeAtIndexFromTeamAname(int index) {
    _teamAname.removeAt(index);
  }

  void updateTeamAnameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _teamAname[index] = updateFn(_teamAname[index]);
  }

  void insertAtIndexInTeamAname(int index, String value) {
    _teamAname.insert(index, value);
  }

  List<String> _teamBname = [];
  List<String> get teamBname => _teamBname;
  set teamBname(List<String> value) {
    _teamBname = value;
  }

  void addToTeamBname(String value) {
    _teamBname.add(value);
  }

  void removeFromTeamBname(String value) {
    _teamBname.remove(value);
  }

  void removeAtIndexFromTeamBname(int index) {
    _teamBname.removeAt(index);
  }

  void updateTeamBnameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _teamBname[index] = updateFn(_teamBname[index]);
  }

  void insertAtIndexInTeamBname(int index, String value) {
    _teamBname.insert(index, value);
  }

  List<String> _teamALogos = [];
  List<String> get teamALogos => _teamALogos;
  set teamALogos(List<String> value) {
    _teamALogos = value;
  }

  void addToTeamALogos(String value) {
    _teamALogos.add(value);
  }

  void removeFromTeamALogos(String value) {
    _teamALogos.remove(value);
  }

  void removeAtIndexFromTeamALogos(int index) {
    _teamALogos.removeAt(index);
  }

  void updateTeamALogosAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _teamALogos[index] = updateFn(_teamALogos[index]);
  }

  void insertAtIndexInTeamALogos(int index, String value) {
    _teamALogos.insert(index, value);
  }

  List<String> _teamBlogos = [];
  List<String> get teamBlogos => _teamBlogos;
  set teamBlogos(List<String> value) {
    _teamBlogos = value;
  }

  void addToTeamBlogos(String value) {
    _teamBlogos.add(value);
  }

  void removeFromTeamBlogos(String value) {
    _teamBlogos.remove(value);
  }

  void removeAtIndexFromTeamBlogos(int index) {
    _teamBlogos.removeAt(index);
  }

  void updateTeamBlogosAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _teamBlogos[index] = updateFn(_teamBlogos[index]);
  }

  void insertAtIndexInTeamBlogos(int index, String value) {
    _teamBlogos.insert(index, value);
  }

  bool _groupChat = false;
  bool get groupChat => _groupChat;
  set groupChat(bool value) {
    _groupChat = value;
  }

  String _profileImg = '';
  String get profileImg => _profileImg;
  set profileImg(String value) {
    _profileImg = value;
  }

  List<String> _teamLogos = [];
  List<String> get teamLogos => _teamLogos;
  set teamLogos(List<String> value) {
    _teamLogos = value;
  }

  void addToTeamLogos(String value) {
    _teamLogos.add(value);
  }

  void removeFromTeamLogos(String value) {
    _teamLogos.remove(value);
  }

  void removeAtIndexFromTeamLogos(int index) {
    _teamLogos.removeAt(index);
  }

  void updateTeamLogosAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _teamLogos[index] = updateFn(_teamLogos[index]);
  }

  void insertAtIndexInTeamLogos(int index, String value) {
    _teamLogos.insert(index, value);
  }

  List<String> _teamNames = [];
  List<String> get teamNames => _teamNames;
  set teamNames(List<String> value) {
    _teamNames = value;
  }

  void addToTeamNames(String value) {
    _teamNames.add(value);
  }

  void removeFromTeamNames(String value) {
    _teamNames.remove(value);
  }

  void removeAtIndexFromTeamNames(int index) {
    _teamNames.removeAt(index);
  }

  void updateTeamNamesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _teamNames[index] = updateFn(_teamNames[index]);
  }

  void insertAtIndexInTeamNames(int index, String value) {
    _teamNames.insert(index, value);
  }

  dynamic _teamlogo;
  dynamic get teamlogo => _teamlogo;
  set teamlogo(dynamic value) {
    _teamlogo = value;
  }

  dynamic _teamName;
  dynamic get teamName => _teamName;
  set teamName(dynamic value) {
    _teamName = value;
  }

  List<bool> _favListCount = [];
  List<bool> get favListCount => _favListCount;
  set favListCount(List<bool> value) {
    _favListCount = value;
  }

  void addToFavListCount(bool value) {
    _favListCount.add(value);
  }

  void removeFromFavListCount(bool value) {
    _favListCount.remove(value);
  }

  void removeAtIndexFromFavListCount(int index) {
    _favListCount.removeAt(index);
  }

  void updateFavListCountAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    _favListCount[index] = updateFn(_favListCount[index]);
  }

  void insertAtIndexInFavListCount(int index, bool value) {
    _favListCount.insert(index, value);
  }

  List<bool> _rivalListCount = [];
  List<bool> get rivalListCount => _rivalListCount;
  set rivalListCount(List<bool> value) {
    _rivalListCount = value;
  }

  void addToRivalListCount(bool value) {
    _rivalListCount.add(value);
  }

  void removeFromRivalListCount(bool value) {
    _rivalListCount.remove(value);
  }

  void removeAtIndexFromRivalListCount(int index) {
    _rivalListCount.removeAt(index);
  }

  void updateRivalListCountAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    _rivalListCount[index] = updateFn(_rivalListCount[index]);
  }

  void insertAtIndexInRivalListCount(int index, bool value) {
    _rivalListCount.insert(index, value);
  }

  List<bool> _leageListCount = [];
  List<bool> get leageListCount => _leageListCount;
  set leageListCount(List<bool> value) {
    _leageListCount = value;
  }

  void addToLeageListCount(bool value) {
    _leageListCount.add(value);
  }

  void removeFromLeageListCount(bool value) {
    _leageListCount.remove(value);
  }

  void removeAtIndexFromLeageListCount(int index) {
    _leageListCount.removeAt(index);
  }

  void updateLeageListCountAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    _leageListCount[index] = updateFn(_leageListCount[index]);
  }

  void insertAtIndexInLeageListCount(int index, bool value) {
    _leageListCount.insert(index, value);
  }

  List<bool> _ddInvite = [];
  List<bool> get ddInvite => _ddInvite;
  set ddInvite(List<bool> value) {
    _ddInvite = value;
  }

  void addToDdInvite(bool value) {
    _ddInvite.add(value);
  }

  void removeFromDdInvite(bool value) {
    _ddInvite.remove(value);
  }

  void removeAtIndexFromDdInvite(int index) {
    _ddInvite.removeAt(index);
  }

  void updateDdInviteAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    _ddInvite[index] = updateFn(_ddInvite[index]);
  }

  void insertAtIndexInDdInvite(int index, bool value) {
    _ddInvite.insert(index, value);
  }

  List<String> _favList = [];
  List<String> get favList => _favList;
  set favList(List<String> value) {
    _favList = value;
  }

  void addToFavList(String value) {
    _favList.add(value);
  }

  void removeFromFavList(String value) {
    _favList.remove(value);
  }

  void removeAtIndexFromFavList(int index) {
    _favList.removeAt(index);
  }

  void updateFavListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _favList[index] = updateFn(_favList[index]);
  }

  void insertAtIndexInFavList(int index, String value) {
    _favList.insert(index, value);
  }

  List<String> _rivalList = [];
  List<String> get rivalList => _rivalList;
  set rivalList(List<String> value) {
    _rivalList = value;
  }

  void addToRivalList(String value) {
    _rivalList.add(value);
  }

  void removeFromRivalList(String value) {
    _rivalList.remove(value);
  }

  void removeAtIndexFromRivalList(int index) {
    _rivalList.removeAt(index);
  }

  void updateRivalListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _rivalList[index] = updateFn(_rivalList[index]);
  }

  void insertAtIndexInRivalList(int index, String value) {
    _rivalList.insert(index, value);
  }

  String _deleteAction = '';
  String get deleteAction => _deleteAction;
  set deleteAction(String value) {
    _deleteAction = value;
  }

  String _rivalSlamAction = '';
  String get rivalSlamAction => _rivalSlamAction;
  set rivalSlamAction(String value) {
    _rivalSlamAction = value;
  }

  String _targetAction = '';
  String get targetAction => _targetAction;
  set targetAction(String value) {
    _targetAction = value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
