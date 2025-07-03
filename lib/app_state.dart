import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

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
    teamAname.add(value);
  }

  void removeFromTeamAname(String value) {
    teamAname.remove(value);
  }

  void removeAtIndexFromTeamAname(int index) {
    teamAname.removeAt(index);
  }

  void updateTeamAnameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    teamAname[index] = updateFn(_teamAname[index]);
  }

  void insertAtIndexInTeamAname(int index, String value) {
    teamAname.insert(index, value);
  }

  List<String> _teamBname = [];
  List<String> get teamBname => _teamBname;
  set teamBname(List<String> value) {
    _teamBname = value;
  }

  void addToTeamBname(String value) {
    teamBname.add(value);
  }

  void removeFromTeamBname(String value) {
    teamBname.remove(value);
  }

  void removeAtIndexFromTeamBname(int index) {
    teamBname.removeAt(index);
  }

  void updateTeamBnameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    teamBname[index] = updateFn(_teamBname[index]);
  }

  void insertAtIndexInTeamBname(int index, String value) {
    teamBname.insert(index, value);
  }

  List<String> _teamALogos = [];
  List<String> get teamALogos => _teamALogos;
  set teamALogos(List<String> value) {
    _teamALogos = value;
  }

  void addToTeamALogos(String value) {
    teamALogos.add(value);
  }

  void removeFromTeamALogos(String value) {
    teamALogos.remove(value);
  }

  void removeAtIndexFromTeamALogos(int index) {
    teamALogos.removeAt(index);
  }

  void updateTeamALogosAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    teamALogos[index] = updateFn(_teamALogos[index]);
  }

  void insertAtIndexInTeamALogos(int index, String value) {
    teamALogos.insert(index, value);
  }

  List<String> _teamBlogos = [];
  List<String> get teamBlogos => _teamBlogos;
  set teamBlogos(List<String> value) {
    _teamBlogos = value;
  }

  void addToTeamBlogos(String value) {
    teamBlogos.add(value);
  }

  void removeFromTeamBlogos(String value) {
    teamBlogos.remove(value);
  }

  void removeAtIndexFromTeamBlogos(int index) {
    teamBlogos.removeAt(index);
  }

  void updateTeamBlogosAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    teamBlogos[index] = updateFn(_teamBlogos[index]);
  }

  void insertAtIndexInTeamBlogos(int index, String value) {
    teamBlogos.insert(index, value);
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
    teamLogos.add(value);
  }

  void removeFromTeamLogos(String value) {
    teamLogos.remove(value);
  }

  void removeAtIndexFromTeamLogos(int index) {
    teamLogos.removeAt(index);
  }

  void updateTeamLogosAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    teamLogos[index] = updateFn(_teamLogos[index]);
  }

  void insertAtIndexInTeamLogos(int index, String value) {
    teamLogos.insert(index, value);
  }

  List<String> _teamNames = [];
  List<String> get teamNames => _teamNames;
  set teamNames(List<String> value) {
    _teamNames = value;
  }

  void addToTeamNames(String value) {
    teamNames.add(value);
  }

  void removeFromTeamNames(String value) {
    teamNames.remove(value);
  }

  void removeAtIndexFromTeamNames(int index) {
    teamNames.removeAt(index);
  }

  void updateTeamNamesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    teamNames[index] = updateFn(_teamNames[index]);
  }

  void insertAtIndexInTeamNames(int index, String value) {
    teamNames.insert(index, value);
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
    favListCount.add(value);
  }

  void removeFromFavListCount(bool value) {
    favListCount.remove(value);
  }

  void removeAtIndexFromFavListCount(int index) {
    favListCount.removeAt(index);
  }

  void updateFavListCountAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    favListCount[index] = updateFn(_favListCount[index]);
  }

  void insertAtIndexInFavListCount(int index, bool value) {
    favListCount.insert(index, value);
  }

  List<bool> _rivalListCount = [];
  List<bool> get rivalListCount => _rivalListCount;
  set rivalListCount(List<bool> value) {
    _rivalListCount = value;
  }

  void addToRivalListCount(bool value) {
    rivalListCount.add(value);
  }

  void removeFromRivalListCount(bool value) {
    rivalListCount.remove(value);
  }

  void removeAtIndexFromRivalListCount(int index) {
    rivalListCount.removeAt(index);
  }

  void updateRivalListCountAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    rivalListCount[index] = updateFn(_rivalListCount[index]);
  }

  void insertAtIndexInRivalListCount(int index, bool value) {
    rivalListCount.insert(index, value);
  }

  List<bool> _leageListCount = [];
  List<bool> get leageListCount => _leageListCount;
  set leageListCount(List<bool> value) {
    _leageListCount = value;
  }

  void addToLeageListCount(bool value) {
    leageListCount.add(value);
  }

  void removeFromLeageListCount(bool value) {
    leageListCount.remove(value);
  }

  void removeAtIndexFromLeageListCount(int index) {
    leageListCount.removeAt(index);
  }

  void updateLeageListCountAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    leageListCount[index] = updateFn(_leageListCount[index]);
  }

  void insertAtIndexInLeageListCount(int index, bool value) {
    leageListCount.insert(index, value);
  }

  List<bool> _ddInvite = [];
  List<bool> get ddInvite => _ddInvite;
  set ddInvite(List<bool> value) {
    _ddInvite = value;
  }

  void addToDdInvite(bool value) {
    ddInvite.add(value);
  }

  void removeFromDdInvite(bool value) {
    ddInvite.remove(value);
  }

  void removeAtIndexFromDdInvite(int index) {
    ddInvite.removeAt(index);
  }

  void updateDdInviteAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    ddInvite[index] = updateFn(_ddInvite[index]);
  }

  void insertAtIndexInDdInvite(int index, bool value) {
    ddInvite.insert(index, value);
  }

  List<String> _favList = [];
  List<String> get favList => _favList;
  set favList(List<String> value) {
    _favList = value;
  }

  void addToFavList(String value) {
    favList.add(value);
  }

  void removeFromFavList(String value) {
    favList.remove(value);
  }

  void removeAtIndexFromFavList(int index) {
    favList.removeAt(index);
  }

  void updateFavListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    favList[index] = updateFn(_favList[index]);
  }

  void insertAtIndexInFavList(int index, String value) {
    favList.insert(index, value);
  }

  List<String> _rivalList = [];
  List<String> get rivalList => _rivalList;
  set rivalList(List<String> value) {
    _rivalList = value;
  }

  void addToRivalList(String value) {
    rivalList.add(value);
  }

  void removeFromRivalList(String value) {
    rivalList.remove(value);
  }

  void removeAtIndexFromRivalList(int index) {
    rivalList.removeAt(index);
  }

  void updateRivalListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    rivalList[index] = updateFn(_rivalList[index]);
  }

  void insertAtIndexInRivalList(int index, String value) {
    rivalList.insert(index, value);
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

  List<GameStruct> _allGames = [
    GameStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"0\",\"name\":\"Football\",\"leagues\":\"[\\\"{\\\\\\\"id\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"name\\\\\\\":\\\\\\\"NFL\\\\\\\",\\\\\\\"logo\\\\\\\":\\\\\\\"https://firebasestorage.googleapis.com/v0/b/test-project-acx4a7.appspot.com/o/nFL.png?alt=media&token=f318a03e-b8ba-4256-a7ea-ce23b02b863b\\\\\\\"}\\\",\\\"{\\\\\\\"id\\\\\\\":\\\\\\\"12\\\\\\\",\\\\\\\"name\\\\\\\":\\\\\\\"NCAA\\\\\\\",\\\\\\\"logo\\\\\\\":\\\\\\\"https://firebasestorage.googleapis.com/v0/b/test-project-acx4a7.appspot.com/o/nCAA%20.png?alt=media&token=dcd2fe8e-7f6f-4ad4-bacc-397ed21897e3\\\\\\\"}\\\"]\"}')),
    GameStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"1\",\"name\":\"Basketball\",\"leagues\":\"[\\\"{\\\\\\\"id\\\\\\\":\\\\\\\"11\\\\\\\",\\\\\\\"name\\\\\\\":\\\\\\\"NBA\\\\\\\",\\\\\\\"logo\\\\\\\":\\\\\\\"https://firebasestorage.googleapis.com/v0/b/test-project-acx4a7.appspot.com/o/nBA.png?alt=media&token=e9b8005e-4e16-4de5-96d9-414b40e1caa6\\\\\\\"}\\\",\\\"{\\\\\\\"id\\\\\\\":\\\\\\\"12\\\\\\\",\\\\\\\"name\\\\\\\":\\\\\\\"WNBA\\\\\\\",\\\\\\\"logo\\\\\\\":\\\\\\\"https://firebasestorage.googleapis.com/v0/b/test-project-acx4a7.appspot.com/o/wNBA.png?alt=media&token=299d8a55-56dd-4592-8ffa-d6d84a75e588\\\\\\\"}\\\",\\\"{\\\\\\\"id\\\\\\\":\\\\\\\"13\\\\\\\",\\\\\\\"name\\\\\\\":\\\\\\\"NCAA (M)\\\\\\\",\\\\\\\"logo\\\\\\\":\\\\\\\"https://firebasestorage.googleapis.com/v0/b/test-project-acx4a7.appspot.com/o/nBANCAAM.png?alt=media&token=3d6906dc-1c3f-4cc2-b78f-89f09d5b8fec\\\\\\\"}\\\"]\"}')),
    GameStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"2\",\"name\":\"BaseBall\",\"leagues\":\"[\\\"{\\\\\\\"id\\\\\\\":\\\\\\\"21\\\\\\\",\\\\\\\"name\\\\\\\":\\\\\\\"MLB\\\\\\\",\\\\\\\"logo\\\\\\\":\\\\\\\"https://firebasestorage.googleapis.com/v0/b/test-project-acx4a7.appspot.com/o/mLB.png?alt=media&token=bdd29f65-fefc-4693-863c-3453b81597e1\\\\\\\"}\\\",\\\"{\\\\\\\"id\\\\\\\":\\\\\\\"22\\\\\\\",\\\\\\\"name\\\\\\\":\\\\\\\"NCAA (M)\\\\\\\",\\\\\\\"logo\\\\\\\":\\\\\\\"https://firebasestorage.googleapis.com/v0/b/test-project-acx4a7.appspot.com/o/mlbNcaa.png?alt=media&token=c3d9c14f-4d28-42f4-83ec-468732f28e41\\\\\\\"}\\\",\\\"{\\\\\\\"id\\\\\\\":\\\\\\\"23\\\\\\\",\\\\\\\"name\\\\\\\":\\\\\\\"NCAA (w)\\\\\\\",\\\\\\\"logo\\\\\\\":\\\\\\\"https://firebasestorage.googleapis.com/v0/b/test-project-acx4a7.appspot.com/o/mlbNcaa.png?alt=media&token=c3d9c14f-4d28-42f4-83ec-468732f28e41\\\\\\\"}\\\"]\"}')),
    GameStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"3\",\"name\":\"Ice Hockey\",\"leagues\":\"[\\\"{\\\\\\\"id\\\\\\\":\\\\\\\"31\\\\\\\",\\\\\\\"name\\\\\\\":\\\\\\\"MLB\\\\\\\",\\\\\\\"logo\\\\\\\":\\\\\\\"https://firebasestorage.googleapis.com/v0/b/test-project-acx4a7.appspot.com/o/mLB.png?alt=media&token=bdd29f65-fefc-4693-863c-3453b81597e1\\\\\\\"}\\\",\\\"{\\\\\\\"id\\\\\\\":\\\\\\\"32\\\\\\\",\\\\\\\"name\\\\\\\":\\\\\\\"NCAA (M)\\\\\\\",\\\\\\\"logo\\\\\\\":\\\\\\\"https://firebasestorage.googleapis.com/v0/b/test-project-acx4a7.appspot.com/o/nHLNCAA.png?alt=media&token=eeb70aae-b0ec-4810-8989-2a671507276d\\\\\\\"}\\\",\\\"{\\\\\\\"id\\\\\\\":\\\\\\\"33\\\\\\\",\\\\\\\"name\\\\\\\":\\\\\\\"NCAA (w)\\\\\\\",\\\\\\\"logo\\\\\\\":\\\\\\\"https://firebasestorage.googleapis.com/v0/b/test-project-acx4a7.appspot.com/o/nHLNCAA.png?alt=media&token=eeb70aae-b0ec-4810-8989-2a671507276d\\\\\\\"}\\\"]\"}')),
    GameStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"4\",\"name\":\"Soccer\",\"leagues\":\"[\\\"{\\\\\\\"id\\\\\\\":\\\\\\\"41\\\\\\\",\\\\\\\"name\\\\\\\":\\\\\\\"MLS\\\\\\\",\\\\\\\"logo\\\\\\\":\\\\\\\"https://firebasestorage.googleapis.com/v0/b/test-project-acx4a7.appspot.com/o/mLS.png?alt=media&token=872e2c8a-fe81-4c21-9073-c079d778b477\\\\\\\"}\\\",\\\"{\\\\\\\"id\\\\\\\":\\\\\\\"42\\\\\\\",\\\\\\\"name\\\\\\\":\\\\\\\"WMLS\\\\\\\",\\\\\\\"logo\\\\\\\":\\\\\\\"https://firebasestorage.googleapis.com/v0/b/test-project-acx4a7.appspot.com/o/wMLS.png?alt=media&token=b79c26c8-0e7d-423a-b63e-30200e15bcfc\\\\\\\"}\\\",\\\"{\\\\\\\"id\\\\\\\":\\\\\\\"43\\\\\\\",\\\\\\\"name\\\\\\\":\\\\\\\"NCAA(M)\\\\\\\",\\\\\\\"logo\\\\\\\":\\\\\\\"https://firebasestorage.googleapis.com/v0/b/test-project-acx4a7.appspot.com/o/nCAASoccer.png?alt=media&token=a942c0c4-0bbc-4051-8cc1-a13deb7eb91c\\\\\\\"}\\\"]\"}'))
  ];
  List<GameStruct> get allGames => _allGames;
  set allGames(List<GameStruct> value) {
    _allGames = value;
  }

  void addToAllGames(GameStruct value) {
    allGames.add(value);
  }

  void removeFromAllGames(GameStruct value) {
    allGames.remove(value);
  }

  void removeAtIndexFromAllGames(int index) {
    allGames.removeAt(index);
  }

  void updateAllGamesAtIndex(
    int index,
    GameStruct Function(GameStruct) updateFn,
  ) {
    allGames[index] = updateFn(_allGames[index]);
  }

  void insertAtIndexInAllGames(int index, GameStruct value) {
    allGames.insert(index, value);
  }

  List<int> _SelectedLeague = [];
  List<int> get SelectedLeague => _SelectedLeague;
  set SelectedLeague(List<int> value) {
    _SelectedLeague = value;
  }

  void addToSelectedLeague(int value) {
    SelectedLeague.add(value);
  }

  void removeFromSelectedLeague(int value) {
    SelectedLeague.remove(value);
  }

  void removeAtIndexFromSelectedLeague(int index) {
    SelectedLeague.removeAt(index);
  }

  void updateSelectedLeagueAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    SelectedLeague[index] = updateFn(_SelectedLeague[index]);
  }

  void insertAtIndexInSelectedLeague(int index, int value) {
    SelectedLeague.insert(index, value);
  }
}
