// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'design_part_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DesignPartEntityAdapter extends TypeAdapter<DesignPartEntity> {
  @override
  final int typeId = 2;

  @override
  DesignPartEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DesignPartEntity(
      type: fields[0] as DesignPartType,
      stitches: fields[1] as double,
      head: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, DesignPartEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.stitches)
      ..writeByte(2)
      ..write(obj.head);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DesignPartEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DesignPartTypeAdapter extends TypeAdapter<DesignPartType> {
  @override
  final int typeId = 1;

  @override
  DesignPartType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return DesignPartType.cPallu;
      case 1:
        return DesignPartType.pallu;
      case 2:
        return DesignPartType.stk;
      case 3:
        return DesignPartType.blz;
      default:
        return DesignPartType.cPallu;
    }
  }

  @override
  void write(BinaryWriter writer, DesignPartType obj) {
    switch (obj) {
      case DesignPartType.cPallu:
        writer.writeByte(0);
        break;
      case DesignPartType.pallu:
        writer.writeByte(1);
        break;
      case DesignPartType.stk:
        writer.writeByte(2);
        break;
      case DesignPartType.blz:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DesignPartTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
