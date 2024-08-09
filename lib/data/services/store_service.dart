/// store_service
import 'package:agora/export.dart';

////////////////// Interface

abstract class StoreInterface {
  Future<BaseResponse<CreateStoreResponse>> createStore({required CreateStoreRequest request});
}

////////////////// Repository

class StoreRepository implements StoreInterface {
  final StoreService _service = StoreService();

  @override
  Future<BaseResponse<CreateStoreResponse>> createStore({required CreateStoreRequest request}) {
    return _service.createStore(request: request);
  }
}

////////////////// Service

class StoreService implements StoreInterface {
  @override
  Future<BaseResponse<CreateStoreResponse>> createStore({required CreateStoreRequest request}) {
    return DioClient.postMethod<CreateStoreResponse>(
      path: '/api/store/create',
      request: request.toJson(),
    );
  }
}
