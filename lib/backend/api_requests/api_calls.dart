import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ObtenerTokenCardCall {
  static Future<ApiCallResponse> call({
    String? publicKey = '',
    String? accessToken = '',
    String? cardNumber = '',
    String? cardholderName = '',
    String? identificationType = '',
    String? identificationNumber = '',
    String? securityCode = '',
    int? cardExpirationMonth,
    int? cardExpirationYear,
  }) async {
    final ffApiRequestBody = '''
{
  "card_number": "${cardNumber}",
  "cardholder": {
    "name": "${cardholderName}",
    "identification": {
      "type": "${identificationType}",
      "number": "${identificationNumber}"
    }
  },
  "security_code": "${securityCode}",
  "expiration_month": "${cardExpirationMonth}",
  "expiration_year": "${cardExpirationYear}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Obtener token card',
      apiUrl:
          'https://api.mercadopago.com/v1/card_tokens?public_key=${publicKey}',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? tokenTarjeta(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  static String? ultimosDigitos(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.last_four_digits''',
      ));
  static String? mensjaeError(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class CrearPagoTarjetaCall {
  static Future<ApiCallResponse> call({
    String? accessToken = '',
    double? transactionAmount,
    String? firstName = '',
    String? lastName = '',
    String? email = '',
    String? identificationType = '',
    String? identificationNumber = '',
    String? zipCode = '',
    String? streetName = '',
    String? streetNumber = '',
    String? neighborhood = '',
    String? city = '',
    String? federalUnit = '',
    String? description = '',
    int? installments,
    String? tokenTarjeta = '',
  }) async {
    final ffApiRequestBody = '''
{
  "transaction_amount": ${transactionAmount},
  "token": "${tokenTarjeta}",
  "installments": ${installments},
  "payer": {
    "first_name": "${firstName}",
    "last_name": "${lastName}",
    "email": "${email}",
    "type": "customer",
    "identification": {
      "type": "${identificationType}",
      "number": "${identificationNumber}"
    },
    "address": {
      "zip_code": "${zipCode}",
      "street_name": "${streetName}",
      "street_number": "${streetNumber}",
      "neighborhood": "${neighborhood}",
      "city": "${city}",
      "federal_unit": "${federalUnit}"
    }
  },
  "description": "${description}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Crear Pago Tarjeta',
      apiUrl: 'https://api.mercadopago.com/v1/payments',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static int? iDPago(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.id''',
      ));
  static String? fechaCreacion(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.date_created''',
      ));
  static String? tipoOperacion(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.operation_type''',
      ));
  static String? tipoTarjeta(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.payment_method_id''',
      ));
  static String? estatus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? moneda(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.currency_id''',
      ));
  static String? mensajeError(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static String? fechadeactualizacion(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.date_last_updated''',
      ));
  static String? fechaAprobacion(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.date_approved''',
      ));
  static String? typeid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.payment_type_id''',
      ));
  static String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.payer.email''',
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
