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
      id: fields[0] as String,
      email: fields[1] as String,
      isVerify: fields[2] as bool,
      phoneNumber: fields[3] as String,
      profile: fields[4] as String,
      type: fields[5] as String,
      username: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserProfileHivebox obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.isVerify)
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
