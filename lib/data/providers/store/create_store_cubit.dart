/// create_store_cubit
import 'package:agora/export.dart';
import 'package:flutter/foundation.dart';

typedef CreateStoreState = BaseBlocState<CreateStoreResponse>;

class CreateStoreCubit extends BaseBlocCubit<CreateStoreResponse> {
  final StoreRepository repository;

  CreateStoreCubit(this.repository);

  @override
  Future<BaseResponse<CreateStoreResponse>> responseData([String? id, data, subData, bool isNetwork = true]) async {
    if (data is CreateStoreRequest) {
      final response = await repository.createStore(request: data);
      if (kDebugMode) {}
      return response;
    } else {
      throw const CustomException().toString();
    }
  }
}
