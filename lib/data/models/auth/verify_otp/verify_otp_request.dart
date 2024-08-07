/// verify_otp_request
import 'package:agora/export.dart';

class VerifyOtpRequest {
  final String code;
  final String key;

  VerifyOtpRequest({
    required this.code,
    required this.key,
  });

  Map<String, dynamic> toJson() => {
        "code": code,
        "key": key,
      };
}
