// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_hivebox.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserProfileHiveboxAdapter extends TypeAdapter<UserProfileHivebox> {
  @override
  final int typeId = 0;

  @override
  UserProfileHivebox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserProfileHivebox(
      id: fields[0] as int,
      email: fields[1] as String?,
      phoneNumber: fields[3] as String?,
      profile: fields[4] as String?,
      type: fields[5] as String,
      username: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserProfileHivebox obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phoneNumber)
      ..writeByte(4)
      ..write(obj.profile)
      ..writeByte(5)
      ..write(obj.type)
      ..writeByte(6)
      ..write(obj.username);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserProfileHiveboxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonGenerator
// **************************************************************************

// From Json Method
UserProfileHivebox _$UserProfileHiveboxFromJson(Map<String, dynamic> json) =>
    UserProfileHivebox(
      id: json['id'].toString().toAppInt(),
      email:
          json['email'] == null ? null : json['email'].toString().toAppString(),
      phoneNumber: json['phone_number'] == null
          ? null
          : json['phone_number'].toString().toAppString(),
      profile: json['profile'] == null
          ? null
          : json['profile'].toString().toAppString(),
      type: json['type'].toString().toAppString()!,
      username: json['username'].toString().toAppString()!,
    );

// To Json Method
Map<String, dynamic> _$UserProfileHiveboxToJson(UserProfileHivebox instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'profile': instance.profile,
      'type': instance.type,
      'username': instance.username,
    };

// Extension for a UserProfileHivebox class to provide 'copyWith' method
extension $UserProfileHiveboxExtension on UserProfileHivebox {
  UserProfileHivebox copyWith({
    int? id,
    String? email,
    String? phoneNumber,
    String? profile,
    String? type,
    String? username,
  }) {
    return UserProfileHivebox(
      id: id ?? this.id,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profile: profile ?? this.profile,
      type: type ?? this.type,
      username: username ?? this.username,
    );
  }
}
