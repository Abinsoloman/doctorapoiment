// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datamodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class detailsAdapter extends TypeAdapter<details> {
  @override
  final int typeId = 1;

  @override
  details read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return details(
      Name: fields[0] as String,
      Email: fields[1] as String,
      Mobilenumber: fields[2] as String,
      gender: fields[3] as String,
      Date: fields[4] as String,
      Time: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, details obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.Name)
      ..writeByte(1)
      ..write(obj.Email)
      ..writeByte(2)
      ..write(obj.Mobilenumber)
      ..writeByte(3)
      ..write(obj.gender)
      ..writeByte(4)
      ..write(obj.Date)
      ..writeByte(5)
      ..write(obj.Time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is detailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
