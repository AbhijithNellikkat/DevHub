import 'package:devhub/application/controller/developers_controller.dart';
import 'package:devhub/application/controller/theme_controller.dart';
import 'package:devhub/domain/core/internet/internet_connection.dart';
import 'package:get/get.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(InternetConnectionController(), permanent: true);
    Get.put(DevelopersController(), permanent: true);
    Get.put(ThemeController(), permanent: true);
  }
}
