import 'dart:async';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/Screenshot_2024-01-18_at_3.49.49_PM.png',
            fit: BoxFit.fill,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'splash': ParameterData.none(),
  'TrashTalk': ParameterData.none(),
  'HomePage': ParameterData.none(),
  'Login': ParameterData.none(),
  'Signup_old': ParameterData.none(),
  'CometChat': ParameterData.none(),
  'ChatPage': (data) async => ParameterData(
        allParams: {
          'chatUser': await getDocumentParameter<UsersRecord>(
              data, 'chatUser', UsersRecord.fromSnapshot),
          'chatRef': getParameter<DocumentReference>(data, 'chatRef'),
        },
      ),
  'AllChatsPage': ParameterData.none(),
  'CreateGroupChatPage': ParameterData.none(),
  'inviteUser': ParameterData.none(),
  'onboarding': ParameterData.none(),
  'Welcome': ParameterData.none(),
  'Profile': ParameterData.none(),
  'EditProfile': ParameterData.none(),
  'ForgotPassword': ParameterData.none(),
  'AboutMe': (data) async => ParameterData(
        allParams: {
          'userName': getParameter<String>(data, 'userName'),
        },
      ),
  'LogReg': ParameterData.none(),
  'FellowFilledin': (data) async => ParameterData(
        allParams: {
          'userName': getParameter<String>(data, 'userName'),
          'college': getParameter<String>(data, 'college'),
          'homeTowm': getParameter<String>(data, 'homeTowm'),
          'livesIn': getParameter<String>(data, 'livesIn'),
        },
      ),
  'InviteFriendA': ParameterData.none(),
  'OnboardingFavorite': ParameterData.none(),
  'ProfileCreation': ParameterData.none(),
  'OnboardingRivals': ParameterData.none(),
  'InviteFriendB': ParameterData.none(),
  'Home_new': ParameterData.none(),
  'SignIn': ParameterData.none(),
  'FriendAll_List': ParameterData.none(),
  'FriendsAcceptOptions': ParameterData.none(),
  'FriendsAdd_InviteOption': ParameterData.none(),
  'FriendsAddSearch': ParameterData.none(),
  'FriendsDecline': ParameterData.none(),
  'FriendsLeaderboard': ParameterData.none(),
  'FriendsMyBuddies': ParameterData.none(),
  'FriendsSearchAdded': ParameterData.none(),
  'FriendsSwipe': ParameterData.none(),
  'FriendsSwipe2': ParameterData.none(),
  'LeaderboradAdded': ParameterData.none(),
  'SignUp': ParameterData.none(),
  'SignUpCopy': ParameterData.none(),
  'ProfileCreationVIew': ParameterData.none(),
  'SignInCopy': ParameterData.none(),
  'WelcomeView': ParameterData.none(),
  'splashView': ParameterData.none(),
  'SignInView': ParameterData.none(),
  'SignUpView': ParameterData.none(),
  'ForgotPasswordView': ParameterData.none(),
  'AboutMeView': (data) async => ParameterData(
        allParams: {
          'userName': getParameter<String>(data, 'userName'),
        },
      ),
  'TapLeaguesView': (data) async => ParameterData(
        allParams: {
          'userName': getParameter<String>(data, 'userName'),
          'college': getParameter<String>(data, 'college'),
          'homeTowm': getParameter<String>(data, 'homeTowm'),
          'livesIn': getParameter<String>(data, 'livesIn'),
        },
      ),
  'ChooseFavouritesView': ParameterData.none(),
  'ChooseRivalsView': ParameterData.none(),
  'TapLeaguesViewCopy': (data) async => ParameterData(
        allParams: {
          'userName': getParameter<String>(data, 'userName'),
          'college': getParameter<String>(data, 'college'),
          'homeTowm': getParameter<String>(data, 'homeTowm'),
          'livesIn': getParameter<String>(data, 'livesIn'),
        },
      ),
  'TapLeaguesViewCopy2': (data) async => ParameterData(
        allParams: {
          'userName': getParameter<String>(data, 'userName'),
          'college': getParameter<String>(data, 'college'),
          'homeTowm': getParameter<String>(data, 'homeTowm'),
          'livesIn': getParameter<String>(data, 'livesIn'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
