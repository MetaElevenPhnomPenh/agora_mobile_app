/// profile_cubit
import 'package:agora/export.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef ProfileState = BaseBlocState<UserProfileHivebox>;

class ProfileCubit extends BaseBlocCubit<UserProfileHivebox> {
  final UserRepository repository;

  ProfileCubit(this.repository);

  @override
  Future<BaseResponse<UserProfileHivebox>> responseData([String? id, data, subData, bool isNetwork = true]) async {
    if (kDebugMode) {}
    final response = await repository.profile(id: id);
    if (kDebugMode) {}
    if (response.data != null) {
      app.userStorage.put(data: response.data!);
    }
    return response;
  }

  void pastFromStorage() {
    final v = app.userStorage.get();
    if (v != null) {
      emit(state.copyWith(
        data: v,
        stateStatus: AppStateStatus.success,
      ));
    }
  }
}
