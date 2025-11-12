import 'package:devhub/application/presentation/utils/colors.dart';
import 'package:devhub/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ErrorRefreshIndicator extends StatelessWidget {
  const ErrorRefreshIndicator({
    super.key,
    this.shrinkWrap = false,

    this.scroll = false,
    required this.onRefresh,
    this.errorMessage =
        "Oops! Something went wrong. Please tap 'Try Again' to retry.",
    this.image,
  });

  final VoidCallback onRefresh;

  final String errorMessage;
  final bool shrinkWrap;

  final String? image;
  final bool scroll;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        onRefresh();
        await Future.delayed(const Duration(milliseconds: 1500));
      },
      child: ListView(
        physics: scroll
            ? const AlwaysScrollableScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        shrinkWrap: shrinkWrap,
        children: [
          // adjustHieght(0),
          image != null
              ? Image.asset(image!)
              : const Icon(Icons.refresh, color: kgrey),
          Center(
            child: Text(
              errorMessage,
              style: Theme.of(
                context,
              ).textTheme.displaySmall?.copyWith(fontSize: 12.sp),
              textAlign: TextAlign.center,
            ),
          ),
          adjustHieght(15.h),
        ],
      ),
    );
  }
}

class InternetConnectionLostWidget extends StatelessWidget {
  const InternetConnectionLostWidget({
    required this.onTap,
    this.showImage = true,
    this.shrinkWrap = false,
    super.key,
  });
  final VoidCallback onTap;
  final bool? showImage;
  final bool? shrinkWrap;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: shrinkWrap ?? false,
      children: [
        adjustHieght(20),
        if (showImage == true) Image.asset(noInternetConnection),
        Center(
          child: Text(
            textAlign: TextAlign.center,
            'Maybe you are not connected to the internet ?',
            style: Theme.of(
              context,
            ).textTheme.displaySmall?.copyWith(fontSize: 13),
          ),
        ),
        adjustHieght(5.h),
        Center(
          child: Text(
            'Please check your connection and try again.',
            style: Theme.of(
              context,
            ).textTheme.displaySmall?.copyWith(fontSize: 10, color: kgrey),
            textAlign: TextAlign.center,
          ),
        ),

        const SizedBox(width: double.infinity),
      ],
    );
  }
}
