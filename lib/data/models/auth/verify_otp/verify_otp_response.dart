/// verify_otp_response
import 'package:agora/export.dart';
import 'package:json_annotation/json_annotation.dart';
part 'verify_otp_response.g.dart';

@JsonSerializable()
class VerifyOtpResponse {
  VerifyOtpResponse({
    required this.accessToken,
    required this.refreshToken,
  });

  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'refresh_token')
  final String refreshToken;


//coverFileName: json['cover_file_name'].toString().toAppString()!,
// fromJson
  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) => _$VerifyOtpResponseFromJson(json);

// toJson
  Map<String, dynamic> toJson() => _$VerifyOtpResponseToJson(this);
}
