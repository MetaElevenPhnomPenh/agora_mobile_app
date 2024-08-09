/// verify_otp_cubit
import 'package:agora/export.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef VerifyOtpState = BaseBlocState<TokenHivebox>;

class VerifyOtpCubit extends BaseBlocCubit<TokenHivebox> {
  final AuthRepository repository;

  VerifyOtpCubit(this.repository);

  @override
  Future<BaseResponse<TokenHivebox>> responseData([String? id, data, subData, bool isNetwork = true]) async {
    if (data is VerifyOtpRequest) {
      final response = await repository.verifyOtp(data);
      if (kDebugMode) {}
      if (response.data != null) {
        app.tokenStorage.put(data: response.data!);
        app.context.read<ProfileCubit>().request();
      }
      return response;
    } else {
      throw const CustomException().toString();
    }
  }
}
