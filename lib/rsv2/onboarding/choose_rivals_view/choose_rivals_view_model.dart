import '/components/common_pagination_app_bar/common_pagination_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'choose_rivals_view_widget.dart' show ChooseRivalsViewWidget;
import 'package:flutter/material.dart';

class ChooseRivalsViewModel extends FlutterFlowModel<ChooseRivalsViewWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for CommonPaginationAppBar component.
  late CommonPaginationAppBarModel commonPaginationAppBarModel;

  @override
  void initState(BuildContext context) {
    commonPaginationAppBarModel =
        createModel(context, () => CommonPaginationAppBarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    commonPaginationAppBarModel.dispose();
  }
}
