import 'package:flutter/material.dart';
import 'package:pdam_inventory/dummy/dummy_model.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class FeatureCard extends StatelessWidget {
  const FeatureCard(this.data, {super.key});

  final FeatureDummyModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 72,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: ColorApp.grey,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.asset(
            data.icon,
          ),
        ),
        const SpacerHeight(8),
        Text(
          data.title,
          style: StyleApp.textNormal,
        ),
      ],
    );
  }
}
