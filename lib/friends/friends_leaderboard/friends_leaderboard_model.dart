import '/components/buddies/buddies_widget.dart';
import '/components/buddies_list/buddies_list_widget.dart';
import '/components/invite_buddies/invite_buddies_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'friends_leaderboard_widget.dart' show FriendsLeaderboardWidget;
import 'package:flutter/material.dart';

class FriendsLeaderboardModel
    extends FlutterFlowModel<FriendsLeaderboardWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Model for buddies component.
  late BuddiesModel buddiesModel1;
  // Model for buddies component.
  late BuddiesModel buddiesModel2;
  // Model for inviteBuddies component.
  late InviteBuddiesModel inviteBuddiesModel;
  // Model for buddiesList component.
  late BuddiesListModel buddiesListModel1;
  // Model for buddiesList component.
  late BuddiesListModel buddiesListModel2;

  @override
  void initState(BuildContext context) {
    buddiesModel1 = createModel(context, () => BuddiesModel());
    buddiesModel2 = createModel(context, () => BuddiesModel());
    inviteBuddiesModel = createModel(context, () => InviteBuddiesModel());
    buddiesListModel1 = createModel(context, () => BuddiesListModel());
    buddiesListModel2 = createModel(context, () => BuddiesListModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    buddiesModel1.dispose();
    buddiesModel2.dispose();
    inviteBuddiesModel.dispose();
    buddiesListModel1.dispose();
    buddiesListModel2.dispose();
  }
}
