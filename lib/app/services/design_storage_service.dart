import 'package:embric/app/models/design_entity.dart';
import 'package:hive/hive.dart';

class DesignStorageService {
  static const String _boxName = 'designs';

  Future<void> init() async {
    await Hive.openBox<DesignEntity>(_boxName);
  }

  Box<DesignEntity> get _box => Hive.box<DesignEntity>(_boxName);

  List<DesignEntity> getAllDesigns() => _box.values.toList();

  DesignEntity? getDesign(int key) => _box.get(key);

  Future<void> addDesign(DesignEntity design) async {
    await _box.put(design.id, design);
  }

  Future<void> updateDesign(DesignEntity design) async {
    await _box.put(design.id, design);
  }

  Future<void> deleteDesign(int key) async {
    await _box.delete(key);
  }

  Future<void> clearAll() async {
    await _box.clear();
  }
}
