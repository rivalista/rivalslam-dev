import '/components/friends_i_card_accepted/friends_i_card_accepted_widget.dart';
import '/components/friends_i_card_add/friends_i_card_add_widget.dart';
import '/components/friends_invite_waiting/friends_invite_waiting_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'friends_add_search_widget.dart' show FriendsAddSearchWidget;
import 'package:flutter/material.dart';

class FriendsAddSearchModel extends FlutterFlowModel<FriendsAddSearchWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for FriendsICardAdd component.
  late FriendsICardAddModel friendsICardAddModel;
  // Model for FriendsInviteWaiting component.
  late FriendsInviteWaitingModel friendsInviteWaitingModel;
  // Model for FriendsICardAccepted component.
  late FriendsICardAcceptedModel friendsICardAcceptedModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    friendsICardAddModel = createModel(context, () => FriendsICardAddModel());
    friendsInviteWaitingModel =
        createModel(context, () => FriendsInviteWaitingModel());
    friendsICardAcceptedModel =
        createModel(context, () => FriendsICardAcceptedModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    friendsICardAddModel.dispose();
    friendsInviteWaitingModel.dispose();
    friendsICardAcceptedModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
