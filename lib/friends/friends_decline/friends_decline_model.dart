import '/components/friends_i_card_invite_request/friends_i_card_invite_request_widget.dart';
import '/components/invite_buddies/invite_buddies_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'friends_decline_widget.dart' show FriendsDeclineWidget;
import 'package:flutter/material.dart';

class FriendsDeclineModel extends FlutterFlowModel<FriendsDeclineWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for inviteBuddies component.
  late InviteBuddiesModel inviteBuddiesModel;
  // Model for FriendsICardInviteRequest component.
  late FriendsICardInviteRequestModel friendsICardInviteRequestModel1;
  // Model for FriendsICardInviteRequest component.
  late FriendsICardInviteRequestModel friendsICardInviteRequestModel2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    inviteBuddiesModel = createModel(context, () => InviteBuddiesModel());
    friendsICardInviteRequestModel1 =
        createModel(context, () => FriendsICardInviteRequestModel());
    friendsICardInviteRequestModel2 =
        createModel(context, () => FriendsICardInviteRequestModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    inviteBuddiesModel.dispose();
    friendsICardInviteRequestModel1.dispose();
    friendsICardInviteRequestModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
