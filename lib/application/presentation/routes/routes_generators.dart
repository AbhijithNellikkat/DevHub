import 'package:devhub/application/presentation/screens/developer_detail/developer_detail_screen.dart';
import 'package:devhub/application/presentation/screens/home/home_screen.dart';
import 'package:devhub/application/presentation/screens/splash/splash_screen.dart';

import 'package:get/get.dart';

import 'routes.dart';

class RouteGenerator {
  static const Duration animationDuration = Duration(milliseconds: 500);

  static final routes = [
    GetPage(name: Routes.initial, page: () => ScreenSplash()),
    GetPage(
      name: Routes.home,
      page: () => const ScreenHome(),
      transition: Transition.fadeIn,
      transitionDuration: animationDuration,
    ),
    GetPage(
      name: Routes.developerDetail,
      page: () {
        final args = Get.arguments;

        return ScreenDeveloperDetail(userDetails: args);
      },
      transition: Transition.cupertino,
      transitionDuration: animationDuration,
    ),
  ];
}
