import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/modules/accepted_item/widgets/accepted_item_card.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class AcceptedItemByDateCard extends StatelessWidget {
  const AcceptedItemByDateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '6 Jul 2024',
            style: StyleApp.textNormal.copyWith(
              color: ColorApp.borderB3,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SpacerHeight(8),
          const AcceptedItemCard(),
          const SpacerHeight(8),
          const AcceptedItemCard(),
          const SpacerHeight(8),
          const AcceptedItemCard(),
        ],
      ),
    );
  }
}
