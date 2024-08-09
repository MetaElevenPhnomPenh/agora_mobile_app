/// create_store_response
import 'package:agora/export.dart';
import 'package:annotations/annotations.dart';

part 'create_store_response.g.dart';


@JsonAnnotation()
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

  final String contactNumber;
  final String description;
  final String email;
  final String followerCount;
  final String id;
  final bool isBanned;
  final bool isDeleted;
  final bool isVerify;
  final String likeCount;
  final String name;
  final String type;
  final String unbannedAt;
  final String updatedAt;
  final String verifyType;
  final String websiteUrl;

  factory CreateStoreResponse.fromJson(Map<String, dynamic> json) => _$CreateStoreResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateStoreResponseToJson(this);

}
