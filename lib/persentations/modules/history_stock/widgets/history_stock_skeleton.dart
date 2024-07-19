import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/widgets/shimmer/shimmer_widget.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class HistoryStockSkeleton extends StatelessWidget {
  const HistoryStockSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: ColorApp.border,
          ),
        ),
      ),
      child: const Row(
        children: [
          ShimmerWidget(
            height: 40,
            width: 40,
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
                Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: Row(
                    children: [
                      ShimmerWidget(
                        height: 18,
                        width: 60,
                      ),
                      SpacerWidth(8),
                      ShimmerWidget(
                        height: 12,
                        width: 100,
                      ),
                      SpacerWidth(4),
                      ShimmerWidget(
                        height: 12,
                        width: 80,
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: ShimmerWidget(
                      height: 12,
                      width: 120,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
