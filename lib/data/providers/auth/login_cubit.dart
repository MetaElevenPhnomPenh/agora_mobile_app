/// login_cubit
import 'package:agora/export.dart';
import 'package:flutter/foundation.dart';

typedef LoginState = BaseBlocState<RegisterResponse>;

class LoginCubit extends BaseBlocCubit<RegisterResponse> {
  final AuthRepository repository;

  LoginCubit(this.repository);

  @override
  Future<BaseResponse<RegisterResponse>> responseData([String? id, data, subData, bool isNetwork = true]) async {
    if (data is RegisterRequest) {
      final response = await repository.login(data);
      if (kDebugMode) {}
      return response;
    } else {
      throw const CustomException().toString();
    }
  }
}
