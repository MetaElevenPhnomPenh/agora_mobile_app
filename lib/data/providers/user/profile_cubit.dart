/// profile_cubit
import 'package:agora/export.dart';
import 'package:flutter/foundation.dart';

typedef ProfileState = BaseBlocState<ProfileResponse>;

class ProfileCubit extends BaseBlocCubit<ProfileResponse> {
  final UserRepository repository;

  ProfileCubit(this.repository);

  @override
  Future<BaseResponse<ProfileResponse>> responseData([String? id, data, subData, bool isNetwork = true]) async {
    final response = await repository.profile(id: id);
    if (kDebugMode) {}
    return response;
  }
}
