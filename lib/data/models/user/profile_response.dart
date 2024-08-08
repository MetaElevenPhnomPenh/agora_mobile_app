/// profile_response
import 'package:agora/export.dart';
import 'package:json_annotation/json_annotation.dart';
part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  ProfileResponse({
    required this.email,
    required this.id,
    required this.isVerify,
    required this.phoneNumber,
    required this.profile,
    required this.registerCount,
    required this.totalBalance,
    required this.totalSpend,
    required this.type,
    required this.username,
  });

  final String email;
  final String id;

  @JsonKey(name: 'is_verify')
  final bool isVerify;

  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  final String profile;

  @JsonKey(name: 'register_count')
  final int registerCount;

  @JsonKey(name: 'total_balance')
  final int totalBalance;

  @JsonKey(name: 'total_spend')
  final int totalSpend;
  final String type;
  final String username;

  ProfileResponse copyWith({
    String? email,
    String? id,
    bool? isVerify,
    String? phoneNumber,
    String? profile,
    int? registerCount,
    int? totalBalance,
    int? totalSpend,
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

  factory ProfileResponse.fromJson(Map<String, dynamic> json) => _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);

}

