import '/components/invite_buddies/invite_buddies_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'invite_friend_a_widget.dart' show InviteFriendAWidget;
import 'package:flutter/material.dart';

class InviteFriendAModel extends FlutterFlowModel<InviteFriendAWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for inviteBuddies component.
  late InviteBuddiesModel inviteBuddiesModel;

  @override
  void initState(BuildContext context) {
    inviteBuddiesModel = createModel(context, () => InviteBuddiesModel());
  }

  @override
  void dispose() {
    inviteBuddiesModel.dispose();
  }
}
