/// verify_otp_cubit
import 'package:agora/export.dart';
import 'package:flutter/foundation.dart';

typedef VerifyOtpState = BaseBlocState<VerifyOtpResponse>;
class VerifyOtpCubit extends BaseBlocCubit<VerifyOtpResponse> {
  final AuthRepository repository;

  VerifyOtpCubit(this.repository);

  @override
  Future<BaseResponse<VerifyOtpResponse>> responseData([String? id, data, subData, bool isNetwork = true]) async {
    if (data is VerifyOtpRequest) {
      final response = await repository.verifyOtp(data);
      if (kDebugMode) {}
      return response;
    } else {
      throw const CustomException().toString();
    }
  }
}
