import 'package:animate_do/animate_do.dart';
import 'package:devhub/application/presentation/routes/routes.dart';
import 'package:devhub/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _navigate(context);
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInUpBig(
              animate: true,
              child: SizedBox(
                width: 100.w,
                child: Hero(tag: appLogo, child: Image.asset(appLogo)),
              ),
            ),
            FadeInUpBig(
              animate: true,
              child: Text(
                'DevHub',
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigate(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 2000), () {
      Get.toNamed(Routes.home);
    });
  }
}
