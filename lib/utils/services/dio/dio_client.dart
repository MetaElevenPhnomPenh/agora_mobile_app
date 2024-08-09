import "dart:async";
import "dart:developer";
import "dart:io";
import "package:dio/dio.dart";
import 'package:agora/export.dart';
import "package:flutter/foundation.dart";
import 'package:path/path.dart' as path;

class DioClient {
  DioClient._();

  static Dio? _dio;

  static Dio get instance => _dio ??= getInstance();

  //header
  static Dio getInstance() {
    Dio httpClient = Dio(BaseOptions(
      receiveTimeout: 2000,
      sendTimeout: 2000,
      baseUrl: AppEnv.baseUrl,
      headers: {
        "Content-Type": "application/json",
        'Accept': '*/*',
        'Access-Control-Allow-Origin': '*',
      },
    ));

    httpClient.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (kDebugMode) {
            log(options.path, name: 'DioRequestPath');
          }
          final String? userToken = app.token?.accessToken;
          log('Token: $userToken');
          options.headers.addAll({
            "Authorization": "Bearer $userToken",
          });
          return handler.next(options);
        },
        onError: (error, handler) async {
          log('Debugger: ${error.requestOptions.baseUrl}${error.requestOptions.uri.path}', name: 'Error');
          return handler.next(error);
        },
        onResponse: (response, handler) async {
          handler.next(response);
        },
      ),
    );

    _dio = httpClient;
    return httpClient;
  }

  static Future<BaseResponse<K>> postMethod<K>({
    Map<String, dynamic>? request,
    required String path,
    void Function(int, int)? onSendProgress,
    void Function(dynamic)? onResponse,
    CancelToken? cancelToken,
    Map<String, File>? file,
    Map<String, List<File>>? files,
    int? receiveTimeout,
    int? sendTimeout,
  }) async {
    try {
      Dio dio = DioClient.instance;
      var res = await dio.post(
        path,
        options: Options(
          receiveTimeout: receiveTimeout,
          sendTimeout: sendTimeout,
        ),
        data: await _formData(request: request, file: file, files: files),
        onSendProgress: onSendProgress,
        cancelToken: cancelToken,
      );
      log('Response: $res', name: 'POST');
      return BaseResponse.fromMap(res, (data) {
        try {
          onResponse?.call(data);
        } catch (_) {}
        return deserialize<K>(data);
      });
    } catch (e) {
      if (kDebugMode) {}
      throw CustomException(e).toString();
    }
  }

  static Future<BaseResponse<K>> getMethod<K>({
    required String path,
    Map<String, dynamic>? queryParameters,
    void Function(dynamic)? onResponse,
    int? receiveTimeout,
    int? sendTimeout,
  }) async {
    try {
      /// Test slow performance 15s
      // await Future.delayed(const Duration(seconds: 15));
      Dio dio = DioClient.instance;
      var res = await dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(
          receiveTimeout: receiveTimeout,
          sendTimeout: sendTimeout,
        ),
      );
      log('Response: $res', name: 'GET');
      return BaseResponse.fromMap(res, (data) {
        try {
          onResponse?.call(data);
        } catch (_) {}
        return deserialize<K>(data);
      });
    } catch (e) {
      if (kDebugMode) {}
      throw CustomException(e).toString();
    }
  }

  static Future<BaseResponse<K>> putMethod<K>({
    Map<String, dynamic>? request,
    required String path,
    void Function(dynamic)? onResponse,
    Map<String, File>? file,
    Map<String, List<File>>? files,
    int? receiveTimeout,
    int? sendTimeout,
  }) async {
    try {
      Dio dio = DioClient.instance;
      var res = await dio.put(
        path,
        data: await _formData(request: request, file: file, files: files),
        options: Options(
          receiveTimeout: receiveTimeout,
          sendTimeout: sendTimeout,
        ),
      );
      log('Response: $res', name: 'PUT');
      return BaseResponse.fromMap(res, (data) {
        try {
          onResponse?.call(data);
        } catch (_) {}
        return deserialize<K>(data);
      });
    } catch (e) {
      if (kDebugMode) {}
      throw CustomException(e).toString();
    }
  }

  static Future<BaseResponse<K>> deleteMethod<K>({
    dynamic request,
    required String path,
    void Function(dynamic)? onResponse,
    int? receiveTimeout,
    int? sendTimeout,
  }) async {
    try {
      Dio dio = DioClient.instance;
      var res = await dio.delete(
        path,
        data: request,
        options: Options(
          receiveTimeout: receiveTimeout,
          sendTimeout: sendTimeout,
        ),
      );
      log('Response: $res', name: 'DELETE');
      return BaseResponse.fromMap(res, (data) {
        try {
          onResponse?.call(data);
        } catch (_) {}
        return deserialize<K>(data);
      });
    } catch (e) {
      if (kDebugMode) {}
      throw CustomException(e).toString();
    }
  }

  static Future<dynamic> _formData({
    Map<String, dynamic>? request,
    Map<String, File>? file,
    Map<String, List<File>>? files,
  }) async {
    if ((file?.isEmpty ?? true) && (files?.isEmpty ?? true)) {
      return request;
    }

    /// Single File :::::::::::::::::::::::::::::::
    Map<String, dynamic> fromFile = {};
    if (file?.isNotEmpty ?? false) {
      for (var v in file!.entries) {
        fromFile[v.key] = await MultipartFile.fromFile(v.value.path, filename: path.basename(v.value.path));
      }
      if (request == null) {
        return {...fromFile};
      } else {
        return {...fromFile, ...request};
      }
    }

    /// Multiple Files :::::::::::::::::::::::::::::::
    if (files?.isNotEmpty ?? false) {
      for (var v in files!.entries) {
        List<MultipartFile> fromFiles = [];
        for (var e in v.value) {
          fromFiles.add(await MultipartFile.fromFile(e.path, filename: path.basename(e.path)));
        }
        fromFile[v.key] = fromFiles;
      }
      if (request == null) {
        return {...fromFile};
      } else {
        return {...fromFile, ...request};
      }
    }
  }
}
