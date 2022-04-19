// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'regis.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RegisAdapter extends TypeAdapter<Regis> {
  @override
  final int typeId = 0;

  @override
  Regis read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Regis(
      username: fields[1] as String?,
      password: fields[2] as String?,
    )..id = fields[0] as String?;
  }

  @override
  void write(BinaryWriter writer, Regis obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegisAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
