import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/modules/purchase_item/widgets/purchase_item_by_date_card.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';

class PurchaseItemView extends StatelessWidget {
  const PurchaseItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.grey,
      appBar: AppBar(
        title: const Text(StringApp.purchaseItem),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        children: const [
          PurchaseItemByDateCard(),
          PurchaseItemByDateCard(),
          PurchaseItemByDateCard(),
        ],
      ),
    );
  }
}
