import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/modules/purchase_item/widgets/purchase_item_card.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class PurchaseItemByDateCard extends StatelessWidget {
  const PurchaseItemByDateCard({super.key});

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
          const PurchaseItemCard(),
          const SpacerHeight(8),
          const PurchaseItemCard(),
        ],
      ),
    );
  }
}
