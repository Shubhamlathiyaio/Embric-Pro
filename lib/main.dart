import 'package:embric/app/constants/app_theme.dart';
import 'package:embric/app/controlles/theme_controller.dart';
import 'package:embric/app/models/design_entity.dart';
import 'package:embric/app/models/design_part_entity.dart';
import 'package:embric/app/models/image_path_entity.dart';
import 'package:embric/app/routes/app_pages.dart';
import 'package:embric/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initlaizer();

  runApp(MainApp());
}

Future<void> initlaizer() async {
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDirectory.path);
  await Hive.openBox<DesignEntity>('designs');
  Hive.registerAdapter(ImagePathEntityAdapter());
  Hive.registerAdapter(DesignPartEntityAdapter());
  Hive.registerAdapter(DesignEntityAdapter());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final ThemeController _themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 910),
      minTextAdapt: true,
      child: GetMaterialApp(
        title: 'Embric',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode:
            _themeController.isDarkMode.value
                ? ThemeMode.dark
                : ThemeMode.light,
        initialRoute: AppRoutes.home,
        getPages: AppPages.pages,
      ),
    );
  }
}
