/// register_response
import 'package:agora/export.dart';

class RegisterResponse {
  final String key;

  RegisterResponse({
    required this.key,
  });

//coverFileName: json['cover_file_name'].toString().toAppString()!,
// fromJson
  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(key: json['key'].toString().toAppString()!);
  }

// toJson
}
