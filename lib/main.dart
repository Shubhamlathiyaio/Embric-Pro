import 'package:embric/app/constants/app_theme.dart';
import 'package:embric/app/controlles/theme_controller.dart';
import 'package:embric/app/models/design_entity.dart';
import 'package:embric/app/models/design_part_entity.dart';
import 'package:embric/app/models/image_path_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initlaizer();

  runApp(MainApp());
}

Future<void> initlaizer() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ImagePathEntityAdapter());
  Hive.registerAdapter(DesignPartEntityAdapter());
  Hive.registerAdapter(DesignEntityAdapter());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final ThemeController _themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Embric',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
      initialRoute: '/',
    );
  }
}
