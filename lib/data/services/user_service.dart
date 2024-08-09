/// user_service
import 'package:agora/export.dart';

////////////////// Interface

abstract class UserInterface {
  Future<BaseResponse<UserProfileHivebox>> profile({String? id});
}

////////////////// Repository

class UserRepository implements UserInterface {
  final UserService _service = UserService();

  @override
  Future<BaseResponse<UserProfileHivebox>> profile({String? id}) {
    return _service.profile(id: id);
  }
}

////////////////// Service

class UserService implements UserInterface {
  @override
  Future<BaseResponse<UserProfileHivebox>> profile({String? id}) {
    return DioClient.getMethod<UserProfileHivebox>(path: '/api/user/profile', queryParameters: {if (id != null) 'id': id});
  }
}
