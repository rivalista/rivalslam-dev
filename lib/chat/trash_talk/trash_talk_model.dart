import '/components/score_board/score_board_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'trash_talk_widget.dart' show TrashTalkWidget;
import 'package:flutter/material.dart';

class TrashTalkModel extends FlutterFlowModel<TrashTalkWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for scoreBoard component.
  late ScoreBoardModel scoreBoardModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    scoreBoardModel = createModel(context, () => ScoreBoardModel());
  }

  @override
  void dispose() {
    scoreBoardModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
