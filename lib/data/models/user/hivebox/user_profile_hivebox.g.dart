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
// JsonSerializableGenerator
// **************************************************************************

UserProfileHivebox _$UserProfileHiveboxFromJson(Map<String, dynamic> json) =>
    UserProfileHivebox(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      profile: json['profile'] as String?,
      type: json['type'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$UserProfileHiveboxToJson(UserProfileHivebox instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'profile': instance.profile,
      'type': instance.type,
      'username': instance.username,
    };
