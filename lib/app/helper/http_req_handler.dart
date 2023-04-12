import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';

class HttpRequestHandler {
  static Future<void> statusCodeHandler(dio.Response response, Uri url) async {
    final int statusCode = response.statusCode!;
    switch (statusCode) {
      case 200:
        break;
      case 400:
      case 404:
        break;
      case 500:
        break;

      default:
        break;
    }
  }

  static void showResponse(Uri uri, dio.Response response) {
    debugPrint(uri.toString());
    debugPrint(response.statusCode.toString());
    debugPrint(response.data.toString(), wrapWidth: 1000);
    debugPrint(response.headers.toString());
  }

  static Future<dio.Response> get(
    Uri url, {
    Object? body,
    bool isVisibleError = true,
    bool isShowSuccessResponse = false,
  }) async {
    try {
      final dioRequest = dio.Dio();

      dio.Response response = await dioRequest.get(
        url.toString(),
      );

      if (isShowSuccessResponse) {
        showResponse(url, response);
      }

      return response;
    } on dio.DioError catch (e) {
      showResponse(url, e.response!);
      if (isVisibleError) {
        statusCodeHandler(e.response!, url);
      }
      return e.response!;
    }
  }
}
