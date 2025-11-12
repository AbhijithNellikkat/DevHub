import 'package:devhub/domain/core/internet/internet_connection.dart';
import 'package:get/get.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(InternetConnectionController(), permanent: true);
  }
}
