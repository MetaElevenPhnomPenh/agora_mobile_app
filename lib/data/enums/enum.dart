export 'package:agora/export.dart';

enum AppStateStatus { none, initial, loading, failure, empty, success, pause, resume, noInternet }

enum AppHttpStatus { error, tokenExpired, refreshTokenExpired, noUrl, fetchDataError, internalServerError, timeout }

enum AppSellerType {individual, company}