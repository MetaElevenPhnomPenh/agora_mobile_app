import 'dart:convert';

import 'package:agora/export.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_profile_hivebox.g.dart';

@JsonSerializable()
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
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @HiveField(4)
  final String? profile;
  @HiveField(5)
  final String type;
  @HiveField(6)
  final String username;

  UserProfileHivebox copyWith({
    String? email,
    int? id,
    //bool? isVerify,
    String? phoneNumber,
    String? profile,
    String? type,
    String? username,
  }) {
    return UserProfileHivebox(
      email: email ?? this.email,
      id: id ?? this.id,
      //isVerify: isVerify ?? this.isVerify,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profile: profile ?? this.profile,
      type: type ?? this.type,
      username: username ?? this.username,
    );
  }

  factory UserProfileHivebox.fromJson(Map<String, dynamic> json) => _$UserProfileHiveboxFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileHiveboxToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
