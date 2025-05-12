// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'design_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DesignEntityAdapter extends TypeAdapter<DesignEntity> {
  @override
  final int typeId = 3;

  @override
  DesignEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DesignEntity(
      id: fields[0] as int,
      number: fields[1] as String,
      name: fields[2] as String,
      stitchRate: fields[3] as double,
      addOnPrice: fields[4] as double,
      cPallu: fields[5] as DesignPartEntity,
      pallu: fields[6] as DesignPartEntity,
      stk: fields[7] as DesignPartEntity,
      blz: fields[8] as DesignPartEntity,
      imagePaths: (fields[9] as List).cast<ImagePathEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, DesignEntity obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.number)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.stitchRate)
      ..writeByte(4)
      ..write(obj.addOnPrice)
      ..writeByte(5)
      ..write(obj.cPallu)
      ..writeByte(6)
      ..write(obj.pallu)
      ..writeByte(7)
      ..write(obj.stk)
      ..writeByte(8)
      ..write(obj.blz)
      ..writeByte(9)
      ..write(obj.imagePaths);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DesignEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
