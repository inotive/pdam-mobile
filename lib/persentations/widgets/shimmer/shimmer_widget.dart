import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  const ShimmerWidget({
    super.key,
    this.width = 40,
    this.height = 40,
    this.radius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorApp.shimmerBase,
      highlightColor: ColorApp.shimmerHighlight,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: ColorApp.grey,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
