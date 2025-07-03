import '/flutter_flow/flutter_flow_util.dart';
import 'forgot_password_view_widget.dart' show ForgotPasswordViewWidget;
import 'package:flutter/material.dart';

class ForgotPasswordViewModel
    extends FlutterFlowModel<ForgotPasswordViewWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for txtEmail widget.
  FocusNode? txtEmailFocusNode;
  TextEditingController? txtEmailTextController;
  String? Function(BuildContext, String?)? txtEmailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtEmailFocusNode?.dispose();
    txtEmailTextController?.dispose();
  }
}
