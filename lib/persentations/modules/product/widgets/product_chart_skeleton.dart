import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/widgets/shimmer/shimmer_widget.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class ProductChartSkeleton extends StatelessWidget {
  const ProductChartSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(24.0),
      child: Column(
        children: [
          Row(
            children: [
              ShimmerWidget(
                height: 120,
                width: 120,
                radius: 100,
              ),
              SpacerWidth(20),
              Column(
                children: [
                  ShimmerWidget(
                    height: 18,
                    width: 150,
                  ),
                  SpacerHeight(8),
                  ShimmerWidget(
                    height: 18,
                    width: 150,
                  ),
                  SpacerHeight(8),
                  ShimmerWidget(
                    height: 18,
                    width: 150,
                  ),
                ],
              )
            ],
          ),
          SpacerHeight(16),
          ShimmerWidget(
            width: double.infinity,
            height: 80,
          ),
        ],
      ),
    );
  }
}
