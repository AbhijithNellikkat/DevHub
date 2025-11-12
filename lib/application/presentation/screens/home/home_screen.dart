import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:devhub/application/controller/developers_controller.dart';
import 'package:devhub/application/controller/theme_controller.dart';
import 'package:devhub/application/presentation/routes/routes.dart';
import 'package:devhub/application/presentation/utils/colors.dart';
import 'package:devhub/application/presentation/utils/constants.dart';
import 'package:devhub/application/presentation/utils/image/network_image_with_loader.dart';
import 'package:devhub/application/presentation/utils/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DevelopersController>();
    final themeController = Get.find<ThemeController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DevHub',
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: kprimary),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DevHub Menu',
                    style: TextStyle(color: kwhite, fontSize: 20),
                  ),
                  adjustHieght(10.h),
                  Image.asset(appLogo, height: 60.h),
                ],
              ),
            ),
            Obx(
              () => ListTile(
                leading: const Icon(Icons.dark_mode),
                title: const Text('Dark Mode'),
                trailing: Switch(
                  value: themeController.isDarkMode.value,
                  onChanged: (_) => themeController.toggleTheme(),
                ),
              ),
            ),
            const Divider(),
          ],
        ),
      ),
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

              AnimatedTextKit(
                isRepeatingAnimation: true,
                animatedTexts: [
                  TyperAnimatedText(
                    'Explore top developers from GitHub below 👇',
                    textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14.sp,
                      color: kgrey,
                    ),

                    speed: const Duration(milliseconds: 100),
                  ),
                ],
              ),
              adjustHieght(30.h),

              //  Search bar
              SearchBar(
                elevation: const WidgetStatePropertyAll(1),
                hintText: 'Search developers...',
                hintStyle: WidgetStatePropertyAll(
                  TextStyle(fontSize: 14.sp, color: kgrey),
                ),
                onChanged: (query) => controller.searchDevelopers(query),
              ),

              adjustHieght(25.h),

              //  Developers list
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CustomLoadingIndicator());
                  }

                  final developers = controller.filteredDevelopers;

                  if (developers.isEmpty) {
                    return const Center(child: Text('No developers found.'));
                  }

                  return RefreshIndicator(
                    onRefresh: () async => controller.fetchDevelopers(),
                    child: ListView.separated(
                      itemCount: developers.length,
                      separatorBuilder: (_, __) => adjustHieght(13.h),
                      itemBuilder: (context, index) {
                        final dev = developers[index];
                        return FadeInUp(
                          animate: true,
                          from: 10,
                          child: Card(
                            elevation: 1,
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.grey.shade200,
                                child: NetworkImageWithLoader(
                                  dev.avatarUrl ?? '',
                                  radius: 35,
                                ),
                              ),
                              title: Text(
                                dev.name ?? 'No Name',
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                '${dev.login ?? 'No Username'}\n${dev.bio ?? 'No Bio'}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              isThreeLine: true,
                              onTap: () {
                                Get.toNamed(
                                  Routes.developerDetail,
                                  arguments: dev,
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
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
