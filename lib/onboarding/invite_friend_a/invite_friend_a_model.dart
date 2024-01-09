import '/components/invite_buddies/invite_buddies_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'invite_friend_a_widget.dart' show InviteFriendAWidget;
import 'package:flutter/material.dart';

class InviteFriendAModel extends FlutterFlowModel<InviteFriendAWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for inviteBuddies component.
  late InviteBuddiesModel inviteBuddiesModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    inviteBuddiesModel = createModel(context, () => InviteBuddiesModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    inviteBuddiesModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
