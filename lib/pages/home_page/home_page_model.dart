import '/backend/api_requests/api_calls.dart';
import '/components/main/main_widget.dart';
import '/components/menu_bar/menu_bar_widget.dart';
import '/components/score_board/score_board_widget.dart';
import '/components/score_board2/score_board2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (headtohead)] action in HomePage widget.
  ApiCallResponse? success;
  // Model for main component.
  late MainModel mainModel;
  // Model for scoreBoard component.
  late ScoreBoardModel scoreBoardModel;
  // Model for scoreBoard2 component.
  late ScoreBoard2Model scoreBoard2Model;
  // Model for menuBar component.
  late MenuBarModel menuBarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    mainModel = createModel(context, () => MainModel());
    scoreBoardModel = createModel(context, () => ScoreBoardModel());
    scoreBoard2Model = createModel(context, () => ScoreBoard2Model());
    menuBarModel = createModel(context, () => MenuBarModel());
  }

  @override
  void dispose() {
    mainModel.dispose();
    scoreBoardModel.dispose();
    scoreBoard2Model.dispose();
    menuBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
