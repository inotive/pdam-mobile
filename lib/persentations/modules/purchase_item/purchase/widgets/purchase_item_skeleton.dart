import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/widgets/shimmer/shimmer_widget.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class PurchaseItemSkeleton extends StatelessWidget {
  const PurchaseItemSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ShimmerWidget(
            height: 14,
            width: 100,
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 8),
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
                            width: 160,
                            height: 14,
                          ),
                          ShimmerWidget(
                            width: 14,
                            height: 14,
                            radius: 4,
                          ),
                        ],
                      ),
                      SpacerHeight(6),
                      ShimmerWidget(
                        width: double.infinity,
                        height: 14,
                      ),
                      SpacerHeight(6),
                      ShimmerWidget(
                        width: double.infinity,
                        height: 14,
                      ),
                      SpacerHeight(6),
                      ShimmerWidget(
                        width: 200,
                        height: 14,
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
                    children: [
                      ShimmerWidget(
                        height: 24,
                        width: 24,
                      ),
                      SpacerWidth(8),
                      ShimmerWidget(
                        height: 14,
                        width: 80,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
