import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class AreasCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'areas',
      apiUrl: 'https://am.um.edu.mx/buzon/api/cuestionario/areas',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }
}

class PreguntasCall {
  static Future<ApiCallResponse> call({
    String? areaId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'preguntas',
      apiUrl:
          'https://am.um.edu.mx/buzon/api/cuestionario/preguntas/${areaId}/N',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'areaId': areaId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }

  static dynamic preguntas(dynamic response) => getJsonField(
        response,
        r'''$[:].descripcion''',
        true,
      );
  static dynamic departamento(dynamic response) => getJsonField(
        response,
        r'''$[:].area.nombre''',
        true,
      );
  static dynamic idPreguntaN(dynamic response) => getJsonField(
        response,
        r'''$[:].preguntaId''',
        true,
      );
}

class PreguntaTextoCall {
  static Future<ApiCallResponse> call({
    String? areaId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'PreguntaTexto',
      apiUrl:
          'https://am.um.edu.mx/buzon/api/cuestionario/preguntas/${areaId}/T',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'areaId': areaId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }

  static dynamic preguntaUltima(dynamic response) => getJsonField(
        response,
        r'''$[:].descripcion''',
      );
  static dynamic preguntaId(dynamic response) => getJsonField(
        response,
        r'''$[:].preguntaId''',
        true,
      );
}

class RespuestasCall {
  static Future<ApiCallResponse> call({
    String? preguntaId = '',
    double? respuestaNumero,
    String? respuestaTexto = '',
    int? codigo,
  }) {
    final body = '''
[
  {
    "pregunta": {
      "preguntaId": "${preguntaId}"
    },
    "respuestaNumero": ${respuestaNumero},
    "codigo": ${codigo}
  },
  {
    "pregunta": {
      "preguntaId": "${preguntaId}"
    },
    "respuestaTexto": "${respuestaTexto}",
    "codigo": ${codigo}
  }
]''';
    return ApiManager.instance.makeApiCall(
      callName: 'Respuestas',
      apiUrl: 'https://am.um.edu.mx/buzon/api/cuestionario/respuestas',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: false,
      cache: false,
    );
  }
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

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
