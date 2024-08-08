/// profile_response
import 'package:agora/export.dart';
import 'package:json_annotation/json_annotation.dart';
class ProfileResponse {
  final String email;
  final String id;
  final bool isDeleted;
  final bool isVerify;
  final String phoneNumber;
  final String profile;
  final String registerCount;
  final String totalBalance;
  final String totalSpend;
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
  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      email: json["email"].toString().toAppString()!,
      id: json["id"].toString().toAppString()!,
      isDeleted: json["is_deleted"] == true,
      isVerify: json["is_verify"] == true,
      phoneNumber: json["phone_number"].toString().toAppString()!,
      profile: json["profile"].toString().toAppString()!,
      registerCount: json["register_count"].toString().toAppString()!,
      totalBalance: json["total_balance"].toString().toAppString()!,
      totalSpend: json["total_spend"].toString().toAppString()!,
      type: json["type"].toString().toAppString()!,
      username: json["username"].toString().toAppString()!,
    );
  }

// toJson
  Map<String, dynamic> toJson() => {
        "email": email,
        "id": id,
        "is_deleted": isDeleted,
        "is_verify": isVerify,
        "phone_number": phoneNumber,
        "profile": profile,
        "register_count": registerCount,
        "total_balance": totalBalance,
        "total_spend": totalSpend,
        "type": type,
        "username": username,
      };
}
