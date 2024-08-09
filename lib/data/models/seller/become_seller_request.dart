/// become_seller_request
import 'package:agora/export.dart';

class BecomeSellerRequest {
  final AppSellerType sellerType;

  BecomeSellerRequest({
    required this.sellerType,
  });

  Map<String, dynamic> toJson() =>
      {
        "id": sellerType.name,
      };
}