import 'package:agora/export.dart';

////////////////// Interface

abstract class AuthInterface {
  Future<BaseResponse<String>> login();
}

////////////////// Repository

class AuthRepository implements AuthInterface{
  final AuthService _service = AuthService();

  Future<BaseResponse<String>> login() async {
    return _service.login();
  }
}

////////////////// Service

class AuthService implements AuthInterface{
  Future<BaseResponse<String>> login() {
    return DioClient.getMethod<String>(path: '/posts');
  }
}
