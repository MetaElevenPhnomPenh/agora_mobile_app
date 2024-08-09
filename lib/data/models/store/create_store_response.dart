/// create_store_response
import 'package:agora/export.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_store_response.g.dart';


@JsonSerializable()
class CreateStoreResponse {
  CreateStoreResponse({
    required this.contactNumber,
    required this.description,
    required this.email,
    required this.followerCount,
    required this.id,
    required this.isBanned,
    required this.isDeleted,
    required this.isVerify,
    required this.likeCount,
    required this.name,
    required this.type,
    required this.unbannedAt,
    required this.updatedAt,
    required this.verifyType,
    required this.websiteUrl,
  });

  @JsonKey(name: 'contact_number')
  final String contactNumber;
  final String description;
  final String email;

  @JsonKey(name: 'follower_count')
  final int followerCount;
  final int id;

  @JsonKey(name: 'is_banned')
  final bool isBanned;

  @JsonKey(name: 'is_deleted')
  final bool isDeleted;

  @JsonKey(name: 'is_verify')
  final bool isVerify;

  @JsonKey(name: 'like_count')
  final int likeCount;
  final String name;
  final String type;

  @JsonKey(name: 'unbanned_at')
  final String unbannedAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @JsonKey(name: 'verify_type')
  final String verifyType;

  @JsonKey(name: 'website_url')
  final String websiteUrl;

  factory CreateStoreResponse.fromJson(Map<String, dynamic> json) => _$CreateStoreResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateStoreResponseToJson(this);

}
