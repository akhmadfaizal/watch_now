import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:watch_now/app/constants/app_constant.dart';

class ShimmerBox extends StatelessWidget {
  const ShimmerBox({
    Key? key,
    this.width,
    this.height,
    this.borderRadius,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    final double boxHeight = height != null ? height! : 8;
    final double boxWidth = width != null ? width! : 8;
    return Shimmer.fromColors(
      baseColor: AppConstant.borderColor,
      highlightColor: AppConstant.hightlightColor,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        height: boxHeight,
        width: boxWidth,
      ),
    );
  }
}
