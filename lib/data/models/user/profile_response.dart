/// profile_response
import 'package:agora/export.dart';
import 'package:annotations/annotations.dart';

part 'profile_response.g.dart';

@JsonAnnotation()
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
  final bool isVerify;
  final String phoneNumber;
  final String profile;
  final String registerCount;
  final String totalBalance;
  final String totalSpend;
  final String type;
  final String username;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) => _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);

}

