import 'package:devhub/application/presentation/utils/colors.dart';
import 'package:devhub/domain/models/user_details/user_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScreenDeveloperDetail extends StatelessWidget {
  final UserDetails userDetails;

  const ScreenDeveloperDetail({super.key, required this.userDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
              CircleAvatar(
                radius: 50.r,
                backgroundImage: NetworkImage(userDetails.avatarUrl ?? ""),
              ),
              SizedBox(height: 16.h),
              Text(
                userDetails.name ?? '',
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

              // Followers / Following
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildStatItem('Followers', '250'),
                  Container(
                    width: 1,
                    height: 20.h,
                    color: Colors.grey[400],
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                  ),
                  _buildStatItem('Following', '180'),
                ],
              ),

              SizedBox(height: 24.h),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Public Repositories',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
              ),
              SizedBox(height: 12.h),

              // ListView.separated(
              //   itemCount: repositories.length,
              //   physics: const NeverScrollableScrollPhysics(),
              //   shrinkWrap: true,
              //   separatorBuilder: (_, __) => SizedBox(height: 12.h),
              //   itemBuilder: (context, index) {
              //     final repo = repositories[index];
              //     return Container(
              //       padding: EdgeInsets.all(12.w),
              //       decoration: BoxDecoration(
              //         color: Colors.grey[100],
              //         borderRadius: BorderRadius.circular(12.r),
              //       ),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             repo['name'] as String,
              //             style: Theme.of(context).textTheme.titleMedium
              //                 ?.copyWith(
              //                   fontWeight: FontWeight.w600,
              //                   fontSize: 16.sp,
              //                 ),
              //           ),
              //           SizedBox(height: 6.h),
              //           Text(
              //             repo['description'] as String,
              //             style: Theme.of(context).textTheme.bodyMedium
              //                 ?.copyWith(
              //                   color: Colors.grey[700],
              //                   fontSize: 13.sp,
              //                 ),
              //           ),
              //           SizedBox(height: 8.h),
              //           Row(
              //             children: [
              //               const Icon(
              //                 Icons.star,
              //                 size: 18,
              //                 color: Colors.amber,
              //               ),
              //               SizedBox(width: 4.w),
              //               Text('${repo['stars']}'),
              //             ],
              //           ),
              //         ],
              //       ),
              //     );
              //   },
              // ),
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
