// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

// From Json Method
ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    ProfileResponse(
      email: json['email'].toString().toAppString()!,
      id: json['id'].toString().toAppString()!,
      isVerify: json['is_verify'] == true,
      phoneNumber: json['phone_number'].toString().toAppString()!,
      profile: json['profile'].toString().toAppString()!,
      registerCount: json['register_count'].toString().toAppString()!,
      totalBalance: json['total_balance'].toString().toAppString()!,
      totalSpend: json['total_spend'].toString().toAppString()!,
      type: json['type'].toString().toAppString()!,
      username: json['username'].toString().toAppString()!,
    );

// To Json Method
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

// Extension for a ProfileResponse class to provide 'copyWith' method
extension $ProfileResponseExtension on ProfileResponse {
  ProfileResponse copyWith({
    String? email,
    String? id,
    bool? isVerify,
    String? phoneNumber,
    String? profile,
    String? registerCount,
    String? totalBalance,
    String? totalSpend,
    String? type,
    String? username,
  }) {
    return ProfileResponse(
      email: email ?? this.email,
      id: id ?? this.id,
      isVerify: isVerify ?? this.isVerify,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profile: profile ?? this.profile,
      registerCount: registerCount ?? this.registerCount,
      totalBalance: totalBalance ?? this.totalBalance,
      totalSpend: totalSpend ?? this.totalSpend,
      type: type ?? this.type,
      username: username ?? this.username,
    );
  }
}
