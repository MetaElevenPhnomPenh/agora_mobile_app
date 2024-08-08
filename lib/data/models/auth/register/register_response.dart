/// register_response
import 'package:agora/export.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  RegisterResponse({
    required this.key,
  });

  final String key;


//coverFileName: json['cover_file_name'].toString().toAppString()!,
// fromJson
  factory RegisterResponse.fromJson(Map<String, dynamic> json) => _$RegisterResponseFromJson(json);

// toJson
  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}
