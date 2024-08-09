/// become_seller_response
import 'package:agora/export.dart';
import 'package:json_annotation/json_annotation.dart';

part 'become_seller_response.g.dart';

@JsonSerializable()
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