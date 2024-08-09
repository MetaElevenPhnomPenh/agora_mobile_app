import 'dart:convert';

import 'package:agora/export.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token_hivebox.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class TokenHivebox {
  TokenHivebox({
    required this.accessToken,
    required this.refreshToken,
  });

  @HiveField(0)
  @JsonKey(name: 'access_token')
  final String accessToken;

  @HiveField(1)
  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  TokenHivebox copyWith({
    String? accessToken,
    String? refreshToken,
  }) {
    return TokenHivebox(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

//coverFileName: json['cover_file_name'].toString().toAppString()!,
// fromJson
  factory TokenHivebox.fromJson(Map<String, dynamic> json) => _$TokenHiveboxFromJson(json);

// toJson
  Map<String, dynamic> toJson() => _$TokenHiveboxToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
