import 'package:agora/export.dart';
import 'package:flutter/foundation.dart';

////////////////// Interface

abstract class AuthInterface {
  Future<BaseResponse<RegisterResponse>> register(RegisterRequest request);

  Future<BaseResponse<TokenHivebox>> verifyOtp(VerifyOtpRequest request);

  Future<BaseResponse<RegisterResponse>> login(RegisterRequest request);
}

////////////////// Repository

class AuthRepository implements AuthInterface {
  final AuthService _service = AuthService();

  @override
  Future<BaseResponse<RegisterResponse>> register(RegisterRequest request) {
    return _service.register(request);
  }

  @override
  Future<BaseResponse<TokenHivebox>> verifyOtp(VerifyOtpRequest request) {
    return _service.verifyOtp(request);
  }

  @override
  Future<BaseResponse<RegisterResponse>> login(RegisterRequest request) {
    return _service.login(request);
  }
}

////////////////// Service

class AuthService implements AuthInterface {
  @override
  Future<BaseResponse<RegisterResponse>> register(RegisterRequest request) {
    return DioClient.postMethod<RegisterResponse>(
      path: '/api/auth/register',
      request: request.toJson(),
    );
  }

  @override
  Future<BaseResponse<TokenHivebox>> verifyOtp(VerifyOtpRequest request) {
    return DioClient.postMethod<TokenHivebox>(
      path: '/api/auth/verify-otp',
      request: request.toJson(),
    );
  }

  @override
  Future<BaseResponse<RegisterResponse>> login(RegisterRequest request) {
    return DioClient.postMethod<RegisterResponse>(
      path: '/api/auth/login',
      request: request.toJson(),
    );
  }
}
