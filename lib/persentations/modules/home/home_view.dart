import 'package:flutter/material.dart';
import 'package:pdam_inventory/dummy/dummy_data.dart';
import 'package:pdam_inventory/persentations/modules/home/sections/home_history_stock_section.dart';
import 'package:pdam_inventory/persentations/modules/home/widgets/feature_card.dart';
import 'package:pdam_inventory/persentations/modules/home/widgets/header_home_card.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const HeaderHomeCard(),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 16,
            ),
            child: _feature(),
          ),
          const HomeHistoryStockSection(),
        ],
      ),
    );
  }

  Column _feature() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: FeatureCard(features[0]),
              ),
              const SpacerWidth(12),
              Flexible(
                child: FeatureCard(features[1]),
              ),
              const SpacerWidth(12),
              Flexible(
                child: FeatureCard(features[2]),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: FeatureCard(features[3]),
              ),
              const SpacerWidth(12),
              Flexible(
                child: FeatureCard(features[4]),
              ),
              const SpacerWidth(12),
              Flexible(
                child: FeatureCard(features[5]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
