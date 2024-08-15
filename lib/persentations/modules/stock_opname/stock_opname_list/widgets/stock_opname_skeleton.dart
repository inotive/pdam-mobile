import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/widgets/shimmer/shimmer_widget.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class StockOpnameSkeleton extends StatelessWidget {
  const StockOpnameSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1,
          color: ColorApp.border,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              border: DashedBorder(
                dashLength: 8,
                bottom: BorderSide(
                  width: 1,
                  color: ColorApp.border,
                ),
              ),
            ),
            child: const Row(
              children: [
                ShimmerWidget(
                  height: 16,
                  width: 160,
                  radius: 4,
                ),
                SpacerWidth(6),
                ShimmerWidget(
                  height: 16,
                  width: 16,
                  radius: 4,
                ),
                Spacer(),
                ShimmerWidget(
                  height: 20,
                  width: 60,
                  radius: 4,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
            child: Column(
              children: [
                _item(),
                const SpacerHeight(6),
                _item(),
                const SpacerHeight(6),
                _item(),
                const SpacerHeight(6),
                _item(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _item() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ShimmerWidget(
          height: 12,
          width: 120,
          radius: 4,
        ),
        ShimmerWidget(
          height: 12,
          width: 160,
          radius: 4,
        ),
      ],
    );
  }
}
