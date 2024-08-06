import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/modules/purchase_item/purchase/widgets/purchase_detail_text_item.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class PurchaseDetailStatusTab extends StatelessWidget {
  const PurchaseDetailStatusTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _name(),
            _detail(),
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: ColorApp.greyF6,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    StringApp.note,
                    style: StyleApp.textLg.copyWith(
                      fontWeight: FontWeight.w500,
                      color: ColorApp.black33,
                    ),
                  ),
                  const SpacerHeight(8),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer fringilla libero a turpis viverra vehicula. Sed ac pellentesque ligula, ac pharetra justo. Donec ut erat vitae tortor accumsan convallis.',
                    style: StyleApp.textLg.copyWith(
                      color: ColorApp.black33,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _detail() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          PurchaseDetailTextItem(
            name: StringApp.position,
            value: 'Supervisor',
          ),
          SpacerHeight(12),
          PurchaseDetailTextItem(
            name: StringApp.agreedTime,
            value: '16 Juli 2024',
          ),
        ],
      ),
    );
  }

  Row _name() {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Johnathan Doe',
            style: StyleApp.textNormal.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SpacerWidth(16.0),
        const Icon(
          Icons.check_circle,
          size: 20,
          color: ColorApp.green,
        ),
      ],
    );
  }
}
