import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/di.dart';
import 'package:pdam_inventory/data/local_source/app_preference.dart';
import 'package:pdam_inventory/dummy/dummy_data.dart';
import 'package:pdam_inventory/persentations/modules/home/sections/home_history_stock_section.dart';
import 'package:pdam_inventory/persentations/modules/home/widgets/feature_card.dart';
import 'package:pdam_inventory/persentations/modules/home/widgets/header_home_card.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final AppPreference _appPreference = instance<AppPreference>();

  String _name = EMPTY;

  _bind() {
    _appPreference.getString(PREFS_KEY_NAME).then((name) {
      setState(() {
        _name = name;
      });
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          HeaderHomeCard(
            name: _name,
          ),
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
                child: FeatureCard(features[3]),
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
              // Flexible(
              //   child: FeatureCard(features[3]),
              // ),
              // const SpacerWidth(12),
              // Flexible(
              //   child: FeatureCard(features[4]),
              // ),
              Flexible(
                child: FeatureCard(features[5]),
              ),
              const SpacerWidth(12),
              const Flexible(
                child: SizedBox(
                  width: double.infinity,
                ),
              ),
              const SpacerWidth(12),
              const Flexible(
                child: SizedBox(
                  width: double.infinity,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
