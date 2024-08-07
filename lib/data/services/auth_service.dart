import 'package:agora/export.dart';

////////////////// Interface

abstract class AuthInterface {
  Future<BaseResponse<String>> login();
  Future<BaseResponse<RegisterResponse>> register(RegisterRequest request);
  Future<BaseResponse<VerifyOtpResponse>> verifyOtp(VerifyOtpRequest request);
}

////////////////// Repository

class AuthRepository implements AuthInterface {
  final AuthService _service = AuthService();

  Future<BaseResponse<String>> login() async {
    return _service.login();
  }

  @override
  Future<BaseResponse<RegisterResponse>> register(RegisterRequest request) {
    return _service.register(request);
  }

  @override
  Future<BaseResponse<VerifyOtpResponse>> verifyOtp(VerifyOtpRequest request) {
    return _service.verifyOtp(request);
  }
}

////////////////// Service

class AuthService implements AuthInterface {
  Future<BaseResponse<String>> login() {
    return DioClient.getMethod<String>(
      path: '/posts',
    );
  }

  @override
  Future<BaseResponse<RegisterResponse>> register(RegisterRequest request) {
    return DioClient.postMethod<RegisterResponse>(
      path: '/api/auth/register',
      request: request.toJson(),
    );
  }

  @override
  Future<BaseResponse<VerifyOtpResponse>> verifyOtp(VerifyOtpRequest request) {
    return DioClient.postMethod<VerifyOtpResponse>(
      path: '/api/auth/verify-otp',
      request: request.toJson(),
    );
  }
}
