// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_store_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateStoreResponse _$CreateStoreResponseFromJson(Map<String, dynamic> json) =>
    CreateStoreResponse(
      contactNumber: json['contact_number'] as String,
      description: json['description'] as String,
      email: json['email'] as String,
      followerCount: (json['follower_count'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      isBanned: json['is_banned'] as bool,
      isDeleted: json['is_deleted'] as bool,
      isVerify: json['is_verify'] as bool,
      likeCount: (json['like_count'] as num).toInt(),
      name: json['name'] as String,
      type: json['type'] as String,
      unbannedAt: json['unbanned_at'] as String,
      updatedAt: json['updated_at'] as String,
      verifyType: json['verify_type'] as String,
      websiteUrl: json['website_url'] as String,
    );

Map<String, dynamic> _$CreateStoreResponseToJson(
        CreateStoreResponse instance) =>
    <String, dynamic>{
      'contact_number': instance.contactNumber,
      'description': instance.description,
      'email': instance.email,
      'follower_count': instance.followerCount,
      'id': instance.id,
      'is_banned': instance.isBanned,
      'is_deleted': instance.isDeleted,
      'is_verify': instance.isVerify,
      'like_count': instance.likeCount,
      'name': instance.name,
      'type': instance.type,
      'unbanned_at': instance.unbannedAt,
      'updated_at': instance.updatedAt,
      'verify_type': instance.verifyType,
      'website_url': instance.websiteUrl,
    };
