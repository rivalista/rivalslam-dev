import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'log_reg_widget.dart' show LogRegWidget;
import 'package:flutter/material.dart';

class LogRegModel extends FlutterFlowModel<LogRegWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for EmailLog widget.
  FocusNode? emailLogFocusNode;
  TextEditingController? emailLogTextController;
  String? Function(BuildContext, String?)? emailLogTextControllerValidator;
  // State field(s) for PasswordLog widget.
  FocusNode? passwordLogFocusNode;
  TextEditingController? passwordLogTextController;
  late bool passwordLogVisibility;
  String? Function(BuildContext, String?)? passwordLogTextControllerValidator;
  // State field(s) for EmailReg widget.
  FocusNode? emailRegFocusNode;
  TextEditingController? emailRegTextController;
  String? Function(BuildContext, String?)? emailRegTextControllerValidator;
  // State field(s) for PasswordReg widget.
  FocusNode? passwordRegFocusNode;
  TextEditingController? passwordRegTextController;
  late bool passwordRegVisibility;
  String? Function(BuildContext, String?)? passwordRegTextControllerValidator;
  // State field(s) for PasswordRegCheck widget.
  FocusNode? passwordRegCheckFocusNode;
  TextEditingController? passwordRegCheckTextController;
  late bool passwordRegCheckVisibility;
  String? Function(BuildContext, String?)?
      passwordRegCheckTextControllerValidator;
  // Stores action output result for [Custom Action - userLeagueTeam] action in Button widget.
  String? leagueSuccess;
  // Stores action output result for [Custom Action - userTeamFav] action in Button widget.
  String? favSuccess;

  @override
  void initState(BuildContext context) {
    passwordLogVisibility = false;
    passwordRegVisibility = false;
    passwordRegCheckVisibility = false;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    emailLogFocusNode?.dispose();
    emailLogTextController?.dispose();

    passwordLogFocusNode?.dispose();
    passwordLogTextController?.dispose();

    emailRegFocusNode?.dispose();
    emailRegTextController?.dispose();

    passwordRegFocusNode?.dispose();
    passwordRegTextController?.dispose();

    passwordRegCheckFocusNode?.dispose();
    passwordRegCheckTextController?.dispose();
  }
}
