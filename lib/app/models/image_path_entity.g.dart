// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_path_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImagePathEntityAdapter extends TypeAdapter<ImagePathEntity> {
  @override
  final int typeId = 0;

  @override
  ImagePathEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImagePathEntity(
      id: fields[0] as int,
      path: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ImagePathEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.path);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImagePathEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
