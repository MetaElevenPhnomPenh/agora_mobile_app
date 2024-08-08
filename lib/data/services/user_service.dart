/// user_service
import 'package:agora/export.dart';

////////////////// Interface

abstract class UserInterface {
  Future<BaseResponse<ProfileResponse>> profile({String? id});
}

////////////////// Repository

class UserRepository implements UserInterface {
  final UserService _service = UserService();

  @override
  Future<BaseResponse<ProfileResponse>> profile({String? id}) {
    return _service.profile(id: id);
  }
}

////////////////// Service

class UserService implements UserInterface {
  @override
  Future<BaseResponse<ProfileResponse>> profile({String? id}) {
    return DioClient.postMethod<ProfileResponse>(path: '/api/user/profile', request: {if (id != null) 'id': id});
  }
}
