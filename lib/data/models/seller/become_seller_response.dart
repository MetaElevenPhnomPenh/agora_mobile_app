/// become_seller_response
import 'package:agora/export.dart';
import 'package:annotations/annotations.dart';

part 'become_seller_response.g.dart';

@JsonAnnotation()
class BecomeSellerResponse {
  BecomeSellerResponse({
    required this.status,
    required this.type,
  });

  final String status;
  final String type;

  factory BecomeSellerResponse.fromJson(Map<String, dynamic> json) => _$BecomeSellerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BecomeSellerResponseToJson(this);

}