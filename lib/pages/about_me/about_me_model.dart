import '/flutter_flow/flutter_flow_util.dart';
import 'about_me_widget.dart' show AboutMeWidget;
import 'package:flutter/material.dart';

class AboutMeModel extends FlutterFlowModel<AboutMeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for txtusername widget.
  FocusNode? txtusernameFocusNode;
  TextEditingController? txtusernameController;
  String? Function(BuildContext, String?)? txtusernameControllerValidator;
  // State field(s) for txtcollage widget.
  FocusNode? txtcollageFocusNode;
  TextEditingController? txtcollageController;
  String? Function(BuildContext, String?)? txtcollageControllerValidator;
  // State field(s) for txthomeTown widget.
  FocusNode? txthomeTownFocusNode;
  TextEditingController? txthomeTownController;
  String? Function(BuildContext, String?)? txthomeTownControllerValidator;
  // State field(s) for txtlivesIn widget.
  FocusNode? txtlivesInFocusNode;
  TextEditingController? txtlivesInController;
  String? Function(BuildContext, String?)? txtlivesInControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    txtusernameFocusNode?.dispose();
    txtusernameController?.dispose();

    txtcollageFocusNode?.dispose();
    txtcollageController?.dispose();

    txthomeTownFocusNode?.dispose();
    txthomeTownController?.dispose();

    txtlivesInFocusNode?.dispose();
    txtlivesInController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
