import 'dart:convert';

import 'package:agora/export.dart';
import 'package:annotations/annotations.dart';

part 'token_hivebox.g.dart';

@JsonAnnotation()
@HiveType(typeId: 1)
class TokenHivebox {
  TokenHivebox({
    required this.accessToken,
    required this.refreshToken,
  });

  @HiveField(0)
  final String accessToken;

  @HiveField(1)
  final String refreshToken;

  factory TokenHivebox.fromJson(Map<String, dynamic> json) => _$TokenHiveboxFromJson(json);

  Map<String, dynamic> toJson() => _$TokenHiveboxToJson(this);

}
