import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/widgets/shimmer/shimmer_widget.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class ProductSkeleton extends StatelessWidget {
  const ProductSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: ColorApp.border),
        ),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerWidget(
            width: 56,
            height: 56,
            radius: 4,
          ),
          SpacerWidth(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerWidget(
                  height: 16,
                  width: 180,
                ),
                SpacerHeight(6),
                ShimmerWidget(
                  width: 80,
                  height: 12,
                ),
                SpacerHeight(6),
                Row(
                  children: [
                    ShimmerWidget(
                      height: 14,
                      width: 40,
                    ),
                    SpacerWidth(8),
                    ShimmerWidget(
                      height: 14,
                      width: 40,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SpacerWidth(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ShimmerWidget(
                width: 40,
                height: 12,
              ),
              ShimmerWidget(
                width: 60,
                height: 16,
              ),
            ],
          )
        ],
      ),
    );
  }
}
