import 'package:hive/hive.dart';
import 'design_part_entity.dart';
import 'image_path_entity.dart';

part 'design_entity.g.dart';

@HiveType(typeId: 3)
class DesignEntity extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String number;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final double stitchRate;

  @HiveField(4)
  final double addOnPrice;

  @HiveField(5)
  final DesignPartEntity cPallu;

  @HiveField(6)
  final DesignPartEntity pallu;

  @HiveField(7)
  final DesignPartEntity stk;

  @HiveField(8)
  final DesignPartEntity blz;

  @HiveField(9)
  final List<ImagePathEntity> imagePaths;

  DesignEntity({
    required this.id,
    required this.number,
    required this.name,
    required this.stitchRate,
    required this.addOnPrice,
    required this.cPallu,
    required this.pallu,
    required this.stk,
    required this.blz,
    required this.imagePaths,
  });

  double get total {
    final partTotal = cPallu.total(stitchRate) +
        pallu.total(stitchRate) +
        stk.total(stitchRate) +
        blz.total(stitchRate);
    return partTotal + addOnPrice;
  }

  DesignEntity copyWith({
    int? id,
    String? number,
    String? name,
    double? stitchRate,
    double? addOnPrice,
    DesignPartEntity? cPallu,
    DesignPartEntity? pallu,
    DesignPartEntity? stk,
    DesignPartEntity? blz,
    List<ImagePathEntity>? imagePaths,
  }) {
    return DesignEntity(
      id: id ?? this.id,
      number: number ?? this.number,
      name: name ?? this.name,
      stitchRate: stitchRate ?? this.stitchRate,
      addOnPrice: addOnPrice ?? this.addOnPrice,
      cPallu: cPallu ?? this.cPallu,
      pallu: pallu ?? this.pallu,
      stk: stk ?? this.stk,
      blz: blz ?? this.blz,
      imagePaths: imagePaths ?? this.imagePaths,
    );
  }
}
