import '/components/buddies/buddies_widget.dart';
import '/components/buddies_invite/buddies_invite_widget.dart';
import '/components/buddies_list/buddies_list_widget.dart';
import '/components/invite_buddies/invite_buddies_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'friends_my_buddies_widget.dart' show FriendsMyBuddiesWidget;
import 'package:flutter/material.dart';

class FriendsMyBuddiesModel extends FlutterFlowModel<FriendsMyBuddiesWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Model for buddies component.
  late BuddiesModel buddiesModel;
  // Model for buddiesInvite component.
  late BuddiesInviteModel buddiesInviteModel;
  // Model for inviteBuddies component.
  late InviteBuddiesModel inviteBuddiesModel;
  // Model for buddiesList component.
  late BuddiesListModel buddiesListModel1;
  // Model for buddiesList component.
  late BuddiesListModel buddiesListModel2;

  @override
  void initState(BuildContext context) {
    buddiesModel = createModel(context, () => BuddiesModel());
    buddiesInviteModel = createModel(context, () => BuddiesInviteModel());
    inviteBuddiesModel = createModel(context, () => InviteBuddiesModel());
    buddiesListModel1 = createModel(context, () => BuddiesListModel());
    buddiesListModel2 = createModel(context, () => BuddiesListModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    buddiesModel.dispose();
    buddiesInviteModel.dispose();
    inviteBuddiesModel.dispose();
    buddiesListModel1.dispose();
    buddiesListModel2.dispose();
  }
}
