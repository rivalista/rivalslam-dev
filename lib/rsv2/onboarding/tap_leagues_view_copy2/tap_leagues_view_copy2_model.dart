import '/components/common_pagination_app_bar/common_pagination_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'tap_leagues_view_copy2_widget.dart' show TapLeaguesViewCopy2Widget;
import 'package:flutter/material.dart';

class TapLeaguesViewCopy2Model
    extends FlutterFlowModel<TapLeaguesViewCopy2Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for CommonPaginationAppBar component.
  late CommonPaginationAppBarModel commonPaginationAppBarModel;

  @override
  void initState(BuildContext context) {
    commonPaginationAppBarModel =
        createModel(context, () => CommonPaginationAppBarModel());
  }

  @override
  void dispose() {
    commonPaginationAppBarModel.dispose();
  }
}
