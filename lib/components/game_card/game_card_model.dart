import '/components/league_card/league_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'game_card_widget.dart' show GameCardWidget;
import 'package:flutter/material.dart';

class GameCardModel extends FlutterFlowModel<GameCardWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for LeagueCard dynamic component.
  late FlutterFlowDynamicModels<LeagueCardModel> leagueCardModels;

  @override
  void initState(BuildContext context) {
    leagueCardModels = FlutterFlowDynamicModels(() => LeagueCardModel());
  }

  @override
  void dispose() {
    leagueCardModels.dispose();
  }
}
