import 'package:animate_do/animate_do.dart';
import 'package:devhub/application/presentation/utils/colors.dart';
import 'package:devhub/application/presentation/utils/image/network_image_with_loader.dart';
import 'package:devhub/domain/models/user_details/user_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScreenDeveloperDetail extends StatelessWidget {
  final UserDetails userDetails;

  const ScreenDeveloperDetail({super.key, required this.userDetails});

  @override
  Widget build(BuildContext context) {
    // Dummy repo list for now (since API doesn’t return repos)
    final List<Map<String, dynamic>> repositories = [
      {
        'name': '${userDetails.login}_core',
        'description':
            'Main core utilities maintained by ${userDetails.name ?? 'user'}',
        'stars': (userDetails.followers ?? 1000) ~/ 100,
      },
      {
        'name': '${userDetails.login}_ui',
        'description': 'UI library built by ${userDetails.name ?? 'user'}.',
        'stars': (userDetails.followers ?? 500) ~/ 200,
      },
      {
        'name': '${userDetails.login}_api',
        'description': 'Public API integrations example repo.',
        'stars': (userDetails.followers ?? 400) ~/ 150,
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //  Back button
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      width: 45.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: klightgrey),
                        color: Theme.of(context).colorScheme.surface,
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Icon(Icons.arrow_back_ios, size: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),

              //  Avatar
              CircleAvatar(
                radius: 75.r,
                child: NetworkImageWithLoader(
                  userDetails.avatarUrl ?? "",
                  radius: 50.r,
                ),
              ),
              SizedBox(height: 16.h),

              //  Name + Username
              Text(
                userDetails.name ?? 'Unknown',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.sp,
                ),
              ),
              Text(
                '@${userDetails.login ?? ''}',
                style: TextStyle(color: Colors.grey[600], fontSize: 14.sp),
              ),
              SizedBox(height: 12.h),

              //  Bio
              if (userDetails.bio != null && userDetails.bio!.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    userDetails.bio!,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey[700],
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

              SizedBox(height: 20.h),

              //  Followers / Following
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildStatItem('Followers', '${userDetails.followers ?? 0}'),
                  Container(
                    width: 1,
                    height: 20.h,
                    color: Colors.grey[400],
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                  ),
                  _buildStatItem('Following', '${userDetails.following ?? 0}'),
                ],
              ),

              SizedBox(height: 24.h),

              // Repo section
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Public Repositories (${userDetails.publicRepos ?? 0})',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
              ),
              SizedBox(height: 12.h),

              ListView.separated(
                itemCount: repositories.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (_, __) => SizedBox(height: 12.h),
                itemBuilder: (context, index) {
                  final repo = repositories[index];
                  return FadeInUp(
                    animate: true,
                    from: 10,
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              repo['name'],
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp,
                                  ),
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              repo['description'],
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: Colors.grey[700],
                                    fontSize: 13.sp,
                                  ),
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 18,
                                  color: Colors.amber,
                                ),
                                SizedBox(width: 4.w),
                                Text('${repo['stars']}'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String title, String count) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
        ),
        SizedBox(height: 2.h),
        Text(
          title,
          style: TextStyle(color: Colors.grey[600], fontSize: 13.sp),
        ),
      ],
    );
  }
}
