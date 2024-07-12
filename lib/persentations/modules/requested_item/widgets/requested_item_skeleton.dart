import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/widgets/shimmer/shimmer_widget.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class RequestedItemSkeleton extends StatelessWidget {
  const RequestedItemSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ShimmerWidget(
          height: 20,
          width: 180,
          radius: 8,
        ),
        const SpacerHeight(8),
        _cards(),
        const SpacerHeight(8),
        _cards(),
        const SpacerHeight(8),
        _cards(),
      ],
    );
  }

  Container _cards() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorApp.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              border: DashedBorder(
                dashLength: 4,
                bottom: BorderSide(
                  width: 1,
                  color: ColorApp.border,
                ),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerWidget(
                      height: 16,
                      width: 120,
                    ),
                    ShimmerWidget(
                      height: 14,
                      width: 14,
                    ),
                  ],
                ),
                SpacerHeight(6),
                ShimmerWidget(
                  height: 16,
                  width: double.infinity,
                ),
                SpacerHeight(4),
                ShimmerWidget(
                  height: 16,
                  width: double.infinity,
                ),
                SpacerHeight(4),
                ShimmerWidget(
                  height: 16,
                  width: 300,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ShimmerWidget(
                      height: 24,
                      width: 24,
                      radius: 24,
                    ),
                    SpacerWidth(8),
                    ShimmerWidget(
                      width: 80,
                      height: 14,
                      radius: 8,
                    ),
                  ],
                ),
                ShimmerWidget(
                  height: 20,
                  width: 50,
                  radius: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
