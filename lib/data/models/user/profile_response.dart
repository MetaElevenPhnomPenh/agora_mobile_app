/// profile_response
import 'package:agora/export.dart';
import 'package:json_annotation/json_annotation.dart';
part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  final String email;
  final String id;
  @JsonKey(name: 'is_deleted')
  final bool isDeleted;
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

  ProfileResponse({
    required this.email,
    required this.id,
    required this.isDeleted,
    required this.isVerify,
    required this.phoneNumber,
    required this.profile,
    required this.registerCount,
    required this.totalBalance,
    required this.totalSpend,
    required this.type,
    required this.username,
  });

  //coverFileName: json['cover_file_name'].toString().toAppString()!,
  // fromJson
  factory ProfileResponse.fromJson(Map<String, dynamic> json) => _$ProfileResponseFromJson(json);

  // toJson
  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}
