// ignore_for_file: unused_element
import 'dart:convert';

import 'package:agora/export.dart';
import "package:dio/dio.dart";
class CustomException {
  const CustomException([this.error]);

  final dynamic error;

  @override
  String toString() {
    try {
      if (error is DioError) {
        final _error = error as DioError;
        if (_error.type == DioErrorType.response) {
          if (_error.response?.statusCode == 503 || _error.response?.statusCode == 502) {
            //appEventBus.fire(const EventBusUnderMaintenance(true));
            return 'app_is_under_maintenance';
          }
        }
        final response = _error.response;
        if (response != null) {
          Map<String, dynamic> result = json.decode(response.toString());
          return checkKeyMap(result, 'message') ? result['message'] : T.somethingUnexpectedWentWrong.r;
        }
      } else if (error is AppHttpError) {
        error.toString();
      }
      return T.somethingUnexpectedWentWrong.r;
    } catch (_) {
      return T.somethingUnexpectedWentWrong.r;
    }
  }
}