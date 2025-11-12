import 'package:devhub/application/controller/developers_controller.dart';
import 'package:devhub/application/presentation/routes/routes.dart';
import 'package:devhub/application/presentation/utils/colors.dart';
import 'package:devhub/application/presentation/utils/constants.dart';
import 'package:devhub/application/presentation/utils/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DevelopersController>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              adjustHieght(20.h),
              Text(
                '👋 Welcome to DevHub!',
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall?.copyWith(fontSize: 20.sp),
              ),
              adjustHieght(8.h),
              Text(
                'Explore top developers from GitHub below 👇',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontSize: 14.sp, color: kgrey),
              ),
              adjustHieght(30.h),
              SearchBar(
                elevation: WidgetStatePropertyAll(1),
                hintText: 'Search developers...',
                hintStyle: WidgetStatePropertyAll(
                  TextStyle(fontSize: 14.sp, color: kgrey),
                ),
              ),
              adjustHieght(25.h),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CustomLoadingIndicator());
                  }
                  return ListView.separated(
                    itemCount: controller.developersList.length,
                    separatorBuilder: (_, __) => adjustHieght(13.h),
                    itemBuilder: (context, index) {
                      final dev = controller.developersList[index];
                      return Card(
                        elevation: 1,

                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(dev.avatarUrl ?? ""),
                            radius: 25.r,
                          ),
                          title: Text(
                            dev.name ?? 'No Name',
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            '${dev.login ?? 'No Username'}\n${dev.bio ?? 'No Bio'}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          isThreeLine: true,
                          onTap: () {
                            Get.toNamed(Routes.developerDetail, arguments: dev);
                          },
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
