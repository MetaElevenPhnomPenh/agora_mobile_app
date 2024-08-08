// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    ProfileResponse(
      email: json['email'] as String,
      id: json['id'] as String,
      isVerify: json['is_verify'] as bool,
      phoneNumber: json['phone_number'] as String,
      profile: json['profile'] as String,
      registerCount: (json['register_count'] as num).toInt(),
      totalBalance: (json['total_balance'] as num).toInt(),
      totalSpend: (json['total_spend'] as num).toInt(),
      type: json['type'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{
      'email': instance.email,
      'id': instance.id,
      'is_verify': instance.isVerify,
      'phone_number': instance.phoneNumber,
      'profile': instance.profile,
      'register_count': instance.registerCount,
      'total_balance': instance.totalBalance,
      'total_spend': instance.totalSpend,
      'type': instance.type,
      'username': instance.username,
    };
