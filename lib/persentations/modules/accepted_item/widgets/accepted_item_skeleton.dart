import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/widgets/shimmer/shimmer_widget.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class AcceptedItemSkeleton extends StatelessWidget {
  const AcceptedItemSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SpacerHeight(16),
        const ShimmerWidget(
          width: 60,
          height: 14,
        ),
        const SpacerHeight(8),
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: ColorApp.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ShimmerWidget(
                            height: 14,
                            width: 120,
                          ),
                          SpacerWidth(6),
                          ShimmerWidget(
                            height: 14,
                            width: 14,
                          ),
                        ],
                      ),
                      SpacerHeight(6),
                      ShimmerWidget(
                        height: 14,
                        width: 120,
                      )
                    ],
                  ),
                  SpacerHeight(16),
                  ShimmerWidget(
                    height: 12,
                    width: 80,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              decoration: const BoxDecoration(
                color: ColorApp.white,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(8.0)),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShimmerWidget(
                    width: 60,
                    height: 14,
                  ),
                  Row(
                    children: [
                      ShimmerWidget(
                        width: 80,
                        height: 14,
                      ),
                      SpacerWidth(8),
                      ShimmerWidget(
                        width: 24,
                        height: 24,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
