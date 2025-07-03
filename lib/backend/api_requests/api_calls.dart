import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class TeamsCall {
  static Future<ApiCallResponse> call({
    int? league = 1,
    int? season = 2023,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'teams',
      apiUrl: 'https://api-baseball.p.rapidapi.com/teams',
      callType: ApiCallType.GET,
      headers: {
        'X-Rapidapi-Key': 'WXETPocEXkmsh2NHiiN8xiBBr3oMp134CBYjsnA2JzU1s0TFWd',
        'X-Rapidapi-Host': 'api-baseball.p.rapidapi.com',
        'Host': 'api-baseball.p.rapidapi.com',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TeamsCopyCall {
  static Future<ApiCallResponse> call({
    int? league = 1,
    int? season = 2023,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'teams Copy',
      apiUrl: 'https://api-baseball.p.rapidapi.com/teams',
      callType: ApiCallType.GET,
      headers: {
        'X-Rapidapi-Key': 'WXETPocEXkmsh2NHiiN8xiBBr3oMp134CBYjsnA2JzU1s0TFWd',
        'X-Rapidapi-Host': 'api-baseball.p.rapidapi.com',
        'Host': 'api-baseball.p.rapidapi.com',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GamesCall {
  static Future<ApiCallResponse> call({
    List<int>? idList,
  }) async {
    final id = _serializeList(idList);

    return ApiManager.instance.makeApiCall(
      callName: 'games',
      apiUrl: 'https://api-baseball.p.rapidapi.com/games',
      callType: ApiCallType.GET,
      headers: {
        'X-Rapidapi-Key': 'WXETPocEXkmsh2NHiiN8xiBBr3oMp134CBYjsnA2JzU1s0TFWd',
        'X-Rapidapi-Host': 'api-baseball.p.rapidapi.com',
        'Host': 'api-baseball.p.rapidapi.com',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class HeadtoheadCall {
  static Future<ApiCallResponse> call({
    String? h2h = '5-6',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'headtohead',
      apiUrl: 'https://api-baseball.p.rapidapi.com/games/h2h',
      callType: ApiCallType.GET,
      headers: {
        'X-Rapidapi-Key': 'WXETPocEXkmsh2NHiiN8xiBBr3oMp134CBYjsnA2JzU1s0TFWd',
        'X-Rapidapi-Host': 'api-baseball.p.rapidapi.com',
        'Host': 'api-baseball.p.rapidapi.com',
      },
      params: {
        'h2h': h2h,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? teamAnames(dynamic response) => getJsonField(
        response,
        r'''$.response[:].teams.home.name''',
        true,
      ) as List?;
  static List? teamAlogos(dynamic response) => getJsonField(
        response,
        r'''$.response[:].teams.home.logo''',
        true,
      ) as List?;
  static List? teamBnames(dynamic response) => getJsonField(
        response,
        r'''$.response[:].teams.away.name''',
        true,
      ) as List?;
  static List? teamBlogos(dynamic response) => getJsonField(
        response,
        r'''$.response[:].teams.away.logo''',
        true,
      ) as List?;
}

class MySlambetsCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? tab = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'My Slambets',
      apiUrl: 'https://qa4yxn.buildship.run/my-slambets',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'userId': userId,
        'tab': tab,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? team1name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].match.team1.name''',
      ));
  static String? team1logo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].match.team1.logo''',
      ));
  static String? team1color(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].match.team1.color''',
      ));
  static String? team2name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].match.team2.name''',
      ));
  static String? team2logo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].match.team2.logo''',
      ));
  static String? team2color(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].match.team2.color''',
      ));
  static String? matchStartDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].match.start_date''',
      ));
  static String? user1fullname(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].slambets[:].user1.full_name''',
      ));
  static String? matchStatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].match.status''',
      ));
  static String? user2fullname(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].slambets[:].user2.full_name''',
      ));
  static String? slambetStatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].slambets[:].status''',
      ));
  static String? stakeTypeImg(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].slambets[:].stake_type.image''',
      ));
  static String? stakeTypeKey(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].slambets[:].stake_type.type_key''',
      ));
  static String? stakeTypeName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].slambets[:].stake_type.name''',
      ));
  static String? user2Thumbnail(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].slambets[:].user2.thumbnail''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
