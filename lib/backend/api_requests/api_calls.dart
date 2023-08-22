import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ApiTestCall {
  static Future<ApiCallResponse> call({
    String? poll = 'random',
    String? answer1 = '',
    String? answer2 = '',
    String? answer3 = '',
    String? answer4 = '',
  }) {
    final body = '''
{
  "poll": "${poll}",
  "answer1": "${answer1}",
  "answer2": "${answer2}",
  "answer3": "${answer3}",
  "answer4": "${answer4}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'apiTest',
      apiUrl: 'https://api.datadude.dev/execute_script',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic imageURL(dynamic response) => getJsonField(
        response,
        r'''$.url''',
      );
}

class GetURLCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getURL',
      apiUrl: 'https://api.datadude.dev/get_json_file',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic imageURL(dynamic response) => getJsonField(
        response,
        r'''$.url''',
      );
}

class AutoCompleteCall {
  static Future<ApiCallResponse> call({
    String? poll = '',
  }) {
    final body = '''
{
  "user_input": "${poll}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'autoComplete',
      apiUrl: 'https://api2.datadude.dev/autocomplete',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic autocomplete(dynamic response) => getJsonField(
        response,
        r'''$.autocomplete''',
      );
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
