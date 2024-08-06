import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:agora/export.dart';

class BaseResponseEntityMap {
  final BaseResponseMeta meta;
  final List<Map<String, dynamic>>? data;

  const BaseResponseEntityMap({required this.meta, required this.data});
}

class BaseResponseEntity<K> {
  final BaseResponseMeta meta;
  final List<K>? data;

  const BaseResponseEntity({required this.meta, required this.data});
}

class BaseResponseMeta {
  BaseResponseMeta({
    required this.totalPages,
    required this.currentPage,
    required this.hasNextPage,
  });

  final int totalPages;
  final int currentPage;
  final bool hasNextPage;

  factory BaseResponseMeta.fromMap(Map<String, dynamic> json) {
    try {
      return BaseResponseMeta(
        totalPages: json["totalPages"].toString().toAppInt(),
        currentPage: json["currentPage"].toString().toAppInt(),
        hasNextPage: checkKeyMap(json, "hasNextPage") ? json["hasNextPage"] == true : false,
      );
    } catch (e) {
      throw T.somethingUnexpectedWentWrong.r;
    }
  }
}

class BaseResponsePaginateData<K> {
  List<K>? list;
  K? data;

  BaseResponsePaginateData({
    required this.list,
    required this.data,
  });

  factory BaseResponsePaginateData.fromMap(List<dynamic> json, List<K>? t, K? tMap) {
    try {
      return BaseResponsePaginateData(
        list: t ?? [],
        data: tMap,
      );
    } catch (e) {
      throw T.somethingUnexpectedWentWrong.r;
    }
  }
}

class BaseResponse<K> {
  String message;
  bool success;
  List<K>? list;
  K? data;
  BaseResponseMeta meta;

  BaseResponse({
    required this.message,
    required this.data,
    required this.list,
    required this.success,
    required this.meta,
  });

  factory BaseResponse.fromMap(Response<dynamic> response, K Function(Map<String, dynamic>) create) {
    try {
      final json = AppHttpHelper.response(response);
      final _json = json["data"];
      final List<K>? itemList = _json != null && _json is List ? List<K>.from(_json.map((x) => create(x))) : null;
      final K? itemMap = _json != null && _json is Map ? create(_json as Map<String, dynamic>) : null;
      return BaseResponse<K>(
        success: true,
        message: json["message"].toString().toAppString()!,
        data: itemMap,
        list: itemList,
        meta: (!checkKeyMap(json, 'meta') ? false : json["meta"] != null)
            ? BaseResponseMeta.fromMap(
                json["meta"],
              )
            : getEmptyBaseResponsePaginateMeta,
      );
    } catch (e) {
      rethrow;
    }
  }
}

BaseResponseMeta get getEmptyBaseResponsePaginateMeta => BaseResponseMeta(
      totalPages: 0,
      hasNextPage: false,
      currentPage: 0,
    );
