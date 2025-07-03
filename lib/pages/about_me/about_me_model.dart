import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'about_me_widget.dart' show AboutMeWidget;
import 'package:flutter/material.dart';

class AboutMeModel extends FlutterFlowModel<AboutMeWidget> {
  ///  Local state fields for this page.

  String title = '';

  ///  State fields for stateful widgets in this page.

  // State field(s) for txtusername widget.
  FocusNode? txtusernameFocusNode;
  TextEditingController? txtusernameTextController;
  String? Function(BuildContext, String?)? txtusernameTextControllerValidator;
  // State field(s) for txtcollage widget.
  FocusNode? txtcollageFocusNode;
  TextEditingController? txtcollageTextController;
  String? Function(BuildContext, String?)? txtcollageTextControllerValidator;
  // State field(s) for txthomeTown widget.
  FocusNode? txthomeTownFocusNode;
  TextEditingController? txthomeTownTextController;
  String? Function(BuildContext, String?)? txthomeTownTextControllerValidator;
  // State field(s) for txtlivesIn widget.
  FocusNode? txtlivesInFocusNode;
  TextEditingController? txtlivesInTextController;
  String? Function(BuildContext, String?)? txtlivesInTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtusernameFocusNode?.dispose();
    txtusernameTextController?.dispose();

    txtcollageFocusNode?.dispose();
    txtcollageTextController?.dispose();

    txthomeTownFocusNode?.dispose();
    txthomeTownTextController?.dispose();

    txtlivesInFocusNode?.dispose();
    txtlivesInTextController?.dispose();
  }
}
