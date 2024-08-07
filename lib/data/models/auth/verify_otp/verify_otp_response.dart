/// verify_otp_response
import 'package:agora/export.dart';

class VerifyOtpResponse {
  final String accessToken;
  final String refreshToken;

  VerifyOtpResponse({
    required this.accessToken,
    required this.refreshToken,
  });

//coverFileName: json['cover_file_name'].toString().toAppString()!,
// fromJson
  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) {
    return VerifyOtpResponse(
      accessToken: json['access_token'].toString().toAppString()!,
      refreshToken: json['refresh_token'].toString().toAppString()!,
    );
  }
// toJson
}
