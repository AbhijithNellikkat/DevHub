import 'package:devhub/application/presentation/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoaderTile extends StatelessWidget {
  const ShimmerLoaderTile({
    super.key,
    this.height,
    this.width,
    this.baseColor,
    this.padding = const EdgeInsets.all(0),
    this.boxDecoration = const BoxDecoration(
      color: klightgrey,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    this.highlightColor,
  });

  final double? width;
  final double? height;
  final Color? baseColor;
  final Color? highlightColor;
  final BoxDecoration? boxDecoration;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Shimmer.fromColors(
        baseColor:
            baseColor ??
            Theme.of(context).colorScheme.secondary.withOpacity(0.3),
        highlightColor: baseColor ?? Theme.of(context).scaffoldBackgroundColor,
        child: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            color: klightgrey,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
