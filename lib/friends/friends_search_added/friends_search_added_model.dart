import '/components/friends_i_card_accepted/friends_i_card_accepted_widget.dart';
import '/components/friends_i_card_add/friends_i_card_add_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'friends_search_added_widget.dart' show FriendsSearchAddedWidget;
import 'package:flutter/material.dart';

class FriendsSearchAddedModel
    extends FlutterFlowModel<FriendsSearchAddedWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for FriendsICardAdd component.
  late FriendsICardAddModel friendsICardAddModel;
  // Model for FriendsICardAccepted component.
  late FriendsICardAcceptedModel friendsICardAcceptedModel1;
  // Model for FriendsICardAccepted component.
  late FriendsICardAcceptedModel friendsICardAcceptedModel2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    friendsICardAddModel = createModel(context, () => FriendsICardAddModel());
    friendsICardAcceptedModel1 =
        createModel(context, () => FriendsICardAcceptedModel());
    friendsICardAcceptedModel2 =
        createModel(context, () => FriendsICardAcceptedModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    friendsICardAddModel.dispose();
    friendsICardAcceptedModel1.dispose();
    friendsICardAcceptedModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
