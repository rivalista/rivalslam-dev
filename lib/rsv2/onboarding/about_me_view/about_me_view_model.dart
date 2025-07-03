import '/components/common_pagination_app_bar/common_pagination_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'about_me_view_widget.dart' show AboutMeViewWidget;
import 'package:flutter/material.dart';

class AboutMeViewModel extends FlutterFlowModel<AboutMeViewWidget> {
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
  // Model for CommonPaginationAppBar component.
  late CommonPaginationAppBarModel commonPaginationAppBarModel;

  @override
  void initState(BuildContext context) {
    commonPaginationAppBarModel =
        createModel(context, () => CommonPaginationAppBarModel());
  }

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

    commonPaginationAppBarModel.dispose();
  }
}
