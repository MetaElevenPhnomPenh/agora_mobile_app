/// seller_service
import 'package:agora/export.dart';

////////////////// Interface

abstract class SellerInterface {
  Future<BaseResponse<BecomeSellerResponse>> becomeSeller({required BecomeSellerRequest request});
}

////////////////// Repository

class SellerRepository implements SellerInterface {
  final SellerService _service = SellerService();

  @override
  Future<BaseResponse<BecomeSellerResponse>> becomeSeller({required BecomeSellerRequest request}) {
    return _service.becomeSeller(request: request);
  }
}

////////////////// Service

class SellerService implements SellerInterface {
  @override
  Future<BaseResponse<BecomeSellerResponse>> becomeSeller({required BecomeSellerRequest request}) {
    return DioClient.postMethod(
      path: '/api/req-become-seller',
      request: request.toJson(),
    );
  }
}
