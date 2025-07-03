import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? HomePageWidget() : WelcomeViewWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? HomePageWidget()
              : WelcomeViewWidget(),
        ),
        FFRoute(
          name: SplashWidget.routeName,
          path: SplashWidget.routePath,
          builder: (context, params) => SplashWidget(),
        ),
        FFRoute(
          name: TrashTalkWidget.routeName,
          path: TrashTalkWidget.routePath,
          builder: (context, params) => TrashTalkWidget(),
        ),
        FFRoute(
          name: HomePageWidget.routeName,
          path: HomePageWidget.routePath,
          builder: (context, params) => HomePageWidget(),
        ),
        FFRoute(
          name: LoginWidget.routeName,
          path: LoginWidget.routePath,
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: SignupOldWidget.routeName,
          path: SignupOldWidget.routePath,
          builder: (context, params) => SignupOldWidget(),
        ),
        FFRoute(
          name: CometChatWidget.routeName,
          path: CometChatWidget.routePath,
          builder: (context, params) => CometChatWidget(),
        ),
        FFRoute(
          name: ChatPageWidget.routeName,
          path: ChatPageWidget.routePath,
          asyncParams: {
            'chatUser': getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => ChatPageWidget(
            chatUser: params.getParam(
              'chatUser',
              ParamType.Document,
            ),
            chatRef: params.getParam(
              'chatRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['chats'],
            ),
          ),
        ),
        FFRoute(
          name: AllChatsPageWidget.routeName,
          path: AllChatsPageWidget.routePath,
          builder: (context, params) => AllChatsPageWidget(),
        ),
        FFRoute(
          name: CreateGroupChatPageWidget.routeName,
          path: CreateGroupChatPageWidget.routePath,
          builder: (context, params) => CreateGroupChatPageWidget(),
        ),
        FFRoute(
          name: InviteUserWidget.routeName,
          path: InviteUserWidget.routePath,
          builder: (context, params) => InviteUserWidget(),
        ),
        FFRoute(
          name: OnboardingWidget.routeName,
          path: OnboardingWidget.routePath,
          builder: (context, params) => OnboardingWidget(),
        ),
        FFRoute(
          name: WelcomeWidget.routeName,
          path: WelcomeWidget.routePath,
          builder: (context, params) => WelcomeWidget(),
        ),
        FFRoute(
          name: ProfileWidget.routeName,
          path: ProfileWidget.routePath,
          builder: (context, params) => ProfileWidget(),
        ),
        FFRoute(
          name: EditProfileWidget.routeName,
          path: EditProfileWidget.routePath,
          builder: (context, params) => EditProfileWidget(),
        ),
        FFRoute(
          name: ForgotPasswordWidget.routeName,
          path: ForgotPasswordWidget.routePath,
          builder: (context, params) => ForgotPasswordWidget(),
        ),
        FFRoute(
          name: AboutMeWidget.routeName,
          path: AboutMeWidget.routePath,
          builder: (context, params) => AboutMeWidget(
            userName: params.getParam(
              'userName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: LogRegWidget.routeName,
          path: LogRegWidget.routePath,
          builder: (context, params) => LogRegWidget(),
        ),
        FFRoute(
          name: FellowFilledinWidget.routeName,
          path: FellowFilledinWidget.routePath,
          builder: (context, params) => FellowFilledinWidget(
            userName: params.getParam(
              'userName',
              ParamType.String,
            ),
            college: params.getParam(
              'college',
              ParamType.String,
            ),
            homeTowm: params.getParam(
              'homeTowm',
              ParamType.String,
            ),
            livesIn: params.getParam(
              'livesIn',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: InviteFriendAWidget.routeName,
          path: InviteFriendAWidget.routePath,
          builder: (context, params) => InviteFriendAWidget(),
        ),
        FFRoute(
          name: OnboardingFavoriteWidget.routeName,
          path: OnboardingFavoriteWidget.routePath,
          builder: (context, params) => OnboardingFavoriteWidget(),
        ),
        FFRoute(
          name: ProfileCreationWidget.routeName,
          path: ProfileCreationWidget.routePath,
          builder: (context, params) => ProfileCreationWidget(),
        ),
        FFRoute(
          name: OnboardingRivalsWidget.routeName,
          path: OnboardingRivalsWidget.routePath,
          builder: (context, params) => OnboardingRivalsWidget(),
        ),
        FFRoute(
          name: InviteFriendBWidget.routeName,
          path: InviteFriendBWidget.routePath,
          builder: (context, params) => InviteFriendBWidget(),
        ),
        FFRoute(
          name: HomeNewWidget.routeName,
          path: HomeNewWidget.routePath,
          builder: (context, params) => HomeNewWidget(),
        ),
        FFRoute(
          name: SignInWidget.routeName,
          path: SignInWidget.routePath,
          builder: (context, params) => SignInWidget(),
        ),
        FFRoute(
          name: FriendAllListWidget.routeName,
          path: FriendAllListWidget.routePath,
          builder: (context, params) => FriendAllListWidget(),
        ),
        FFRoute(
          name: FriendsAcceptOptionsWidget.routeName,
          path: FriendsAcceptOptionsWidget.routePath,
          builder: (context, params) => FriendsAcceptOptionsWidget(),
        ),
        FFRoute(
          name: FriendsAddInviteOptionWidget.routeName,
          path: FriendsAddInviteOptionWidget.routePath,
          builder: (context, params) => FriendsAddInviteOptionWidget(),
        ),
        FFRoute(
          name: FriendsAddSearchWidget.routeName,
          path: FriendsAddSearchWidget.routePath,
          builder: (context, params) => FriendsAddSearchWidget(),
        ),
        FFRoute(
          name: FriendsDeclineWidget.routeName,
          path: FriendsDeclineWidget.routePath,
          builder: (context, params) => FriendsDeclineWidget(),
        ),
        FFRoute(
          name: FriendsLeaderboardWidget.routeName,
          path: FriendsLeaderboardWidget.routePath,
          builder: (context, params) => FriendsLeaderboardWidget(),
        ),
        FFRoute(
          name: FriendsMyBuddiesWidget.routeName,
          path: FriendsMyBuddiesWidget.routePath,
          builder: (context, params) => FriendsMyBuddiesWidget(),
        ),
        FFRoute(
          name: FriendsSearchAddedWidget.routeName,
          path: FriendsSearchAddedWidget.routePath,
          builder: (context, params) => FriendsSearchAddedWidget(),
        ),
        FFRoute(
          name: FriendsSwipeWidget.routeName,
          path: FriendsSwipeWidget.routePath,
          builder: (context, params) => FriendsSwipeWidget(),
        ),
        FFRoute(
          name: FriendsSwipe2Widget.routeName,
          path: FriendsSwipe2Widget.routePath,
          builder: (context, params) => FriendsSwipe2Widget(),
        ),
        FFRoute(
          name: LeaderboradAddedWidget.routeName,
          path: LeaderboradAddedWidget.routePath,
          builder: (context, params) => LeaderboradAddedWidget(),
        ),
        FFRoute(
          name: SignUpWidget.routeName,
          path: SignUpWidget.routePath,
          builder: (context, params) => SignUpWidget(),
        ),
        FFRoute(
          name: SignUpCopyWidget.routeName,
          path: SignUpCopyWidget.routePath,
          builder: (context, params) => SignUpCopyWidget(),
        ),
        FFRoute(
          name: ProfileCreationVIewWidget.routeName,
          path: ProfileCreationVIewWidget.routePath,
          builder: (context, params) => ProfileCreationVIewWidget(),
        ),
        FFRoute(
          name: SignInCopyWidget.routeName,
          path: SignInCopyWidget.routePath,
          builder: (context, params) => SignInCopyWidget(),
        ),
        FFRoute(
          name: WelcomeViewWidget.routeName,
          path: WelcomeViewWidget.routePath,
          builder: (context, params) => WelcomeViewWidget(),
        ),
        FFRoute(
          name: SplashViewWidget.routeName,
          path: SplashViewWidget.routePath,
          builder: (context, params) => SplashViewWidget(),
        ),
        FFRoute(
          name: SignInViewWidget.routeName,
          path: SignInViewWidget.routePath,
          builder: (context, params) => SignInViewWidget(),
        ),
        FFRoute(
          name: SignUpViewWidget.routeName,
          path: SignUpViewWidget.routePath,
          builder: (context, params) => SignUpViewWidget(),
        ),
        FFRoute(
          name: ForgotPasswordViewWidget.routeName,
          path: ForgotPasswordViewWidget.routePath,
          builder: (context, params) => ForgotPasswordViewWidget(),
        ),
        FFRoute(
          name: AboutMeViewWidget.routeName,
          path: AboutMeViewWidget.routePath,
          builder: (context, params) => AboutMeViewWidget(
            userName: params.getParam(
              'userName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: TapLeaguesViewWidget.routeName,
          path: TapLeaguesViewWidget.routePath,
          builder: (context, params) => TapLeaguesViewWidget(
            userName: params.getParam(
              'userName',
              ParamType.String,
            ),
            college: params.getParam(
              'college',
              ParamType.String,
            ),
            homeTowm: params.getParam(
              'homeTowm',
              ParamType.String,
            ),
            livesIn: params.getParam(
              'livesIn',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ChooseFavouritesViewWidget.routeName,
          path: ChooseFavouritesViewWidget.routePath,
          builder: (context, params) => ChooseFavouritesViewWidget(),
        ),
        FFRoute(
          name: ChooseRivalsViewWidget.routeName,
          path: ChooseRivalsViewWidget.routePath,
          builder: (context, params) => ChooseRivalsViewWidget(),
        ),
        FFRoute(
          name: TapLeaguesViewCopyWidget.routeName,
          path: TapLeaguesViewCopyWidget.routePath,
          builder: (context, params) => TapLeaguesViewCopyWidget(
            userName: params.getParam(
              'userName',
              ParamType.String,
            ),
            college: params.getParam(
              'college',
              ParamType.String,
            ),
            homeTowm: params.getParam(
              'homeTowm',
              ParamType.String,
            ),
            livesIn: params.getParam(
              'livesIn',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: TapLeaguesViewCopy2Widget.routeName,
          path: TapLeaguesViewCopy2Widget.routePath,
          builder: (context, params) => TapLeaguesViewCopy2Widget(
            userName: params.getParam(
              'userName',
              ParamType.String,
            ),
            college: params.getParam(
              'college',
              ParamType.String,
            ),
            homeTowm: params.getParam(
              'homeTowm',
              ParamType.String,
            ),
            livesIn: params.getParam(
              'livesIn',
              ParamType.String,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/welcomeView';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/Screenshot_2024-01-18_at_3.49.49_PM.png',
                    fit: BoxFit.fill,
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
