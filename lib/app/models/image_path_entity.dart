import 'package:hive/hive.dart';

part 'image_path_entity.g.dart'; // Required for code generation

@HiveType(typeId: 0)
class ImagePathEntity {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String path;

  ImagePathEntity({required this.id, required this.path});

  ImagePathEntity copyWith({int? id, String? path}) {
    return ImagePathEntity(
      id: id ?? this.id,
      path: path ?? this.path,
    );
  }
}
