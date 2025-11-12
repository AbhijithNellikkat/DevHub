import 'package:devhub/application/controller/theme_controller.dart';
import 'package:devhub/application/presentation/routes/routes_generators.dart';
import 'package:devhub/application/presentation/theme/app_theme.dart';
import 'package:devhub/domain/core/bindings/all_controller_bindings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Initialize the theme controller & load saved preference before running the app
  final themeController = Get.put(ThemeController());

  runApp(MyApp(themeController: themeController));
}

class MyApp extends StatelessWidget {
  final ThemeController themeController;
  const MyApp({super.key, required this.themeController});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Obx(
          () => GetMaterialApp(
            title: 'DevHub',
            debugShowCheckedModeBanner: false,

            // ✅ Use your custom themes
            theme: AppThemes.lightTheme(),
            darkTheme: AppThemes.darkTheme(),
            themeMode: themeController.isDarkMode.value
                ? ThemeMode.dark
                : ThemeMode.light,

            getPages: RouteGenerator.routes,
            initialBinding: AllControllerBinding(),
          ),
        );
      },
    );
  }
}
