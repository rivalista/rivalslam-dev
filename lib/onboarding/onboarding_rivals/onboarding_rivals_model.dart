import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'onboarding_rivals_widget.dart' show OnboardingRivalsWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';

class OnboardingRivalsModel extends FlutterFlowModel<OnboardingRivalsWidget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? testController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    testController?.finish();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
