import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class TeamsCall {
  static Future<ApiCallResponse> call({
    int? league = 1,
    int? season = 2020,
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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
