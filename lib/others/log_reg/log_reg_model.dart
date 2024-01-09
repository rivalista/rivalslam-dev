import '/flutter_flow/flutter_flow_util.dart';
import 'log_reg_widget.dart' show LogRegWidget;
import 'package:flutter/material.dart';

class LogRegModel extends FlutterFlowModel<LogRegWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for EmailLog widget.
  FocusNode? emailLogFocusNode;
  TextEditingController? emailLogController;
  String? Function(BuildContext, String?)? emailLogControllerValidator;
  // State field(s) for PasswordLog widget.
  FocusNode? passwordLogFocusNode;
  TextEditingController? passwordLogController;
  late bool passwordLogVisibility;
  String? Function(BuildContext, String?)? passwordLogControllerValidator;
  // State field(s) for EmailReg widget.
  FocusNode? emailRegFocusNode;
  TextEditingController? emailRegController;
  String? Function(BuildContext, String?)? emailRegControllerValidator;
  // State field(s) for PasswordReg widget.
  FocusNode? passwordRegFocusNode;
  TextEditingController? passwordRegController;
  late bool passwordRegVisibility;
  String? Function(BuildContext, String?)? passwordRegControllerValidator;
  // State field(s) for PasswordRegCheck widget.
  FocusNode? passwordRegCheckFocusNode;
  TextEditingController? passwordRegCheckController;
  late bool passwordRegCheckVisibility;
  String? Function(BuildContext, String?)? passwordRegCheckControllerValidator;
  // Stores action output result for [Custom Action - userLeagueTeam] action in Button widget.
  String? leagueSuccess;
  // Stores action output result for [Custom Action - userTeamFav] action in Button widget.
  String? favSuccess;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passwordLogVisibility = false;
    passwordRegVisibility = false;
    passwordRegCheckVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    emailLogFocusNode?.dispose();
    emailLogController?.dispose();

    passwordLogFocusNode?.dispose();
    passwordLogController?.dispose();

    emailRegFocusNode?.dispose();
    emailRegController?.dispose();

    passwordRegFocusNode?.dispose();
    passwordRegController?.dispose();

    passwordRegCheckFocusNode?.dispose();
    passwordRegCheckController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
