import 'dart:convert';

import 'package:agora/export.dart';
import 'package:annotations/annotations.dart';

part 'user_profile_hivebox.g.dart';

@JsonAnnotation()
@HiveType(typeId: 0)
class UserProfileHivebox extends HiveObject {
  UserProfileHivebox({
    required this.id,
    required this.email,
    //required this.isVerify,
    required this.phoneNumber,
    required this.profile,
    required this.type,
    required this.username,
  });

  @HiveField(0)
  final int id;
  @HiveField(1)
  final String? email;
  //@HiveField(2)
  //@JsonKey(name: 'is_verify')
  //final bool isVerify;
  @HiveField(3)
  final String? phoneNumber;
  @HiveField(4)
  final String? profile;
  @HiveField(5)
  final String type;
  @HiveField(6)
  final String username;

  factory UserProfileHivebox.fromJson(Map<String, dynamic> json) => _$UserProfileHiveboxFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileHiveboxToJson(this);
}
