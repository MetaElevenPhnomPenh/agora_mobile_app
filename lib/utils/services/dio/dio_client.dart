import "dart:async";
import "dart:developer";
import "package:dio/dio.dart";
import 'package:agora/export.dart';
import "package:flutter/foundation.dart";

class DioClient {
  DioClient._();

  static Dio? _dio;

  static Dio get instance => _dio ??= getInstance();

  //header
  static Dio getInstance() {
    Dio httpClient = Dio(BaseOptions(
      receiveTimeout: 5000,
      sendTimeout: null,
      baseUrl: AppEnv.baseUrl,
      headers: {
        "Content-Type": "application/json",
        'Accept': '*/*',
        'Access-Control-Allow-Origin': '*',
      },
    ));

    _dio = httpClient;
    return httpClient;
  }

  static Future<BaseResponse<K>> postMethod<K>({
    dynamic request,
    required String path,
    void Function(int, int)? onSendProgress,
    CancelToken? cancelToken,
  }) async {
    try {
      Dio dio = DioClient.instance;
      var response = await dio.post(
        path,
        data: request,
        onSendProgress: onSendProgress,
        cancelToken: cancelToken,
      );
      return BaseResponse.fromMap(response, (data) => deserialize<K>(data));
    } catch (e) {
      if (kDebugMode) {}
      throw CustomException(e).toString();
    }
  }

  static Future<BaseResponse<K>> getMethod<K>({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      /// Test slow performance 15s
      // await Future.delayed(const Duration(seconds: 15));
      Dio dio = DioClient.instance;
      var response = await dio.get(
        path,
        queryParameters: queryParameters,
      );
      log('Response: $response', name: 'GET');
      return BaseResponse.fromMap(response, (data) => deserialize<K>(data));
    } catch (e) {
      if (kDebugMode) {}
      throw CustomException(e).toString();
    }
  }

  static Future<BaseResponse<K>> putMethod<K>({
    dynamic request,
    required String path,
  }) async {
    try {
      Dio dio = DioClient.instance;
      var response = await dio.put(path, data: request);
      log('Response: $response', name: 'PUT');
      return BaseResponse.fromMap(response, (data) => deserialize<K>(data));
    } catch (e) {
      if (kDebugMode) {}
      throw CustomException(e).toString();
    }
  }

  static Future<BaseResponse<K>> deleteMethod<K>({
    dynamic request,
    required String path,
  }) async {
    try {
      Dio dio = DioClient.instance;
      var response = await dio.delete(path, data: request);
      log('Response: $response', name: 'DELETE');
      return BaseResponse.fromMap(response, (data) => deserialize<K>(data));
    } catch (e) {
      if (kDebugMode) {}
      throw CustomException(e).toString();
    }
  }
}
