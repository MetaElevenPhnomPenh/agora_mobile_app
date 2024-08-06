import 'package:agora/data/_.dart';

typedef LoginState = BaseBlocState<String>;

class LoginCubit extends BaseBlocCubit<String> {
  LoginCubit(this.repository);

  final AuthRepository repository;

  @override
  Future<BaseResponse<String>> responseData([String? id, data, subData, bool isNetwork = true]) async {
    final response = await repository.login();
    return response;
  }
}
