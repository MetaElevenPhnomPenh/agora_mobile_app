// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_store_response.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

// From Json Method
CreateStoreResponse _$CreateStoreResponseFromJson(Map<String, dynamic> json) =>
    CreateStoreResponse(
      contactNumber: json['contact_number'].toString().toAppString()!,
      description: json['description'].toString().toAppString()!,
      email: json['email'].toString().toAppString()!,
      followerCount: json['follower_count'].toString().toAppString()!,
      id: json['id'].toString().toAppString()!,
      isBanned: json['is_banned'] == true,
      isDeleted: json['is_deleted'] == true,
      isVerify: json['is_verify'] == true,
      likeCount: json['like_count'].toString().toAppString()!,
      name: json['name'].toString().toAppString()!,
      type: json['type'].toString().toAppString()!,
      unbannedAt: json['unbanned_at'].toString().toAppString()!,
      updatedAt: json['updated_at'].toString().toAppString()!,
      verifyType: json['verify_type'].toString().toAppString()!,
      websiteUrl: json['website_url'].toString().toAppString()!,
    );

// To Json Method
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

// Extension for a CreateStoreResponse class to provide 'copyWith' method
extension $CreateStoreResponseExtension on CreateStoreResponse {
  CreateStoreResponse copyWith({
    String? contactNumber,
    String? description,
    String? email,
    String? followerCount,
    String? id,
    bool? isBanned,
    bool? isDeleted,
    bool? isVerify,
    String? likeCount,
    String? name,
    String? type,
    String? unbannedAt,
    String? updatedAt,
    String? verifyType,
    String? websiteUrl,
  }) {
    return CreateStoreResponse(
      contactNumber: contactNumber ?? this.contactNumber,
      description: description ?? this.description,
      email: email ?? this.email,
      followerCount: followerCount ?? this.followerCount,
      id: id ?? this.id,
      isBanned: isBanned ?? this.isBanned,
      isDeleted: isDeleted ?? this.isDeleted,
      isVerify: isVerify ?? this.isVerify,
      likeCount: likeCount ?? this.likeCount,
      name: name ?? this.name,
      type: type ?? this.type,
      unbannedAt: unbannedAt ?? this.unbannedAt,
      updatedAt: updatedAt ?? this.updatedAt,
      verifyType: verifyType ?? this.verifyType,
      websiteUrl: websiteUrl ?? this.websiteUrl,
    );
  }
}
