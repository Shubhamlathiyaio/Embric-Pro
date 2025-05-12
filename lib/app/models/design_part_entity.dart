import 'package:hive/hive.dart';

part 'design_part_entity.g.dart';

@HiveType(typeId: 1)
enum DesignPartType {
  @HiveField(0)
  cPallu,

  @HiveField(1)
  pallu,

  @HiveField(2)
  stk,

  @HiveField(3)
  blz,
}

@HiveType(typeId: 2)
class DesignPartEntity extends HiveObject {
  @HiveField(0)
  final DesignPartType type;

  @HiveField(1)
  final double stitches;

  @HiveField(2)
  final double head;

  DesignPartEntity({
    required this.type,
    required this.stitches,
    required this.head,
  });

  double total(double stitchRate) => stitches * head * stitchRate / 1000;

  DesignPartEntity copyWith({
    DesignPartType? type,
    double? stitches,
    double? head,
  }) {
    return DesignPartEntity(
      type: type ?? this.type,
      stitches: stitches ?? this.stitches,
      head: head ?? this.head,
    );
  }
}
