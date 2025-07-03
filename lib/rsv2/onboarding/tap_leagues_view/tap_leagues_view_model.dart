import '/components/common_pagination_app_bar/common_pagination_app_bar_widget.dart';
import '/components/game_card/game_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'tap_leagues_view_widget.dart' show TapLeaguesViewWidget;
import 'package:flutter/material.dart';

class TapLeaguesViewModel extends FlutterFlowModel<TapLeaguesViewWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for GameCard dynamic component.
  late FlutterFlowDynamicModels<GameCardModel> gameCardModels;
  // Model for CommonPaginationAppBar component.
  late CommonPaginationAppBarModel commonPaginationAppBarModel;

  @override
  void initState(BuildContext context) {
    gameCardModels = FlutterFlowDynamicModels(() => GameCardModel());
    commonPaginationAppBarModel =
        createModel(context, () => CommonPaginationAppBarModel());
  }

  @override
  void dispose() {
    gameCardModels.dispose();
    commonPaginationAppBarModel.dispose();
  }
}
