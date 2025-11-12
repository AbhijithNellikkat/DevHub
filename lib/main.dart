import 'package:devhub/application/presentation/routes/routes_generators.dart';
import 'package:devhub/application/presentation/theme/app_theme.dart';
import 'package:devhub/domain/core/bindings/all_controller_bindings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        title: 'DevHub',
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme(),
        getPages: RouteGenerator.routes,
        initialBinding: AllControllerBinding(),
      ),
    );
  }
}
