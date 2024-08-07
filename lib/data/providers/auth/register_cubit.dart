import 'package:agora/export.dart';
import 'package:flutter/foundation.dart';

typedef RegisterState = BaseBlocState<RegisterResponse>;
class RegisterCubit extends BaseBlocCubit<RegisterResponse> {
  final AuthRepository repository;

  RegisterCubit(this.repository);

  @override
  Future<BaseResponse<RegisterResponse>> responseData([String? id, data, subData, bool isNetwork = true]) async {
    if (data is RegisterRequest) {
      final response = await repository.register(data);
      if (kDebugMode) {}
      return response;
    } else {
      throw const CustomException().toString();
    }
  }
}
