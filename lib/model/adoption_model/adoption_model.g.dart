// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adoption_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AdoptionModelAdapter extends TypeAdapter<AdoptionModel> {
  @override
  final int typeId = 1;

  @override
  AdoptionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AdoptionModel(
      name: fields[0] as String?,
      age: fields[1] as int?,
      gender: fields[2] as String?,
      noOfPets: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AdoptionModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.gender)
      ..writeByte(3)
      ..write(obj.noOfPets);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdoptionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
