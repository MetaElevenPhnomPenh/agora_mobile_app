import 'package:agora/export.dart';
import 'package:flutter/foundation.dart';

typedef BecomeSellerState = BaseBlocState<BecomeSellerResponse>;

class BecomeSellerCubit extends BaseBlocCubit<BecomeSellerResponse> {
  final SellerRepository repository;

  BecomeSellerCubit(this.repository);

  @override
  Future<BaseResponse<BecomeSellerResponse>> responseData([String? id, data, subData, bool isNetwork = true]) async {
    if (data is BecomeSellerRequest) {
      final response = await repository.becomeSeller(request: data);
      if (kDebugMode) {}
      return response;
    } else {
      throw const CustomException().toString();
    }
  }
}
