import 'package:devhub/application/presentation/routes/routes.dart';
import 'package:devhub/application/presentation/utils/colors.dart';
import 'package:devhub/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final developers = [
      {
        'name': 'Abhijith Nellikkat',
        'username': 'abhijith-dev',
        'avatar':
            'https://avatars.githubusercontent.com/u/9919?s=280&v=4', // sample image
        'bio': 'Flutter Developer passionate about clean architecture.',
      },
      {
        'name': 'John Doe',
        'username': 'john-doe',
        'avatar': 'https://avatars.githubusercontent.com/u/1?v=4',
        'bio': 'Mobile & backend engineer.',
      },
      {
        'name': 'Jane Smith',
        'username': 'jane-smith',
        'avatar': 'https://avatars.githubusercontent.com/u/2?v=4',
        'bio': 'Open source contributor.',
      },
    ];
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
              Expanded(
                child: ListView.separated(
                  itemCount: developers.length,
                  separatorBuilder: (_, __) => adjustHieght(13.h),
                  itemBuilder: (context, index) {
                    final dev = developers[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(dev['avatar']!),
                        radius: 25.r,
                      ),
                      title: Text(
                        dev['name']!,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        '@${dev['username']}\n${dev['bio']}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      isThreeLine: true,
                      onTap: () {
                        Get.toNamed(
                          Routes.developerDetail,
                          arguments: {
                            'name': dev['name']!,
                            'username': dev['username']!,
                            'avatarUrl': dev['avatar']!,
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
