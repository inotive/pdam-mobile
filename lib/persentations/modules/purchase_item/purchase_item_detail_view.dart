import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:pdam_inventory/persentations/modules/purchase_item/widgets/purchase_item_detail_product_card.dart';
import 'package:pdam_inventory/persentations/modules/purchase_item/widgets/purchase_tab_detail.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class PurchaseItemDetailView extends StatelessWidget {
  const PurchaseItemDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringApp.detailPurchaseItem),
      ),
      body: ListView(
        children: [
          _header(),
          const SpacerHeight(6),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _tabs(),
                const SpacerHeight(12),
                const PurchaseItemDetailProductCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _tabs() {
    return const Row(
      children: [
        Flexible(
          child: PurchaseTabDetail(
            text: 'Detail PO',
            isActive: true,
          ),
        ),
        Flexible(
          child: PurchaseTabDetail(
            text: 'Status',
            isActive: false,
          ),
        ),
      ],
    );
  }

  Container _header() {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 16,
      ),
      decoration: const BoxDecoration(
        border: DashedBorder(
          dashLength: 4,
          bottom: BorderSide(
            width: 1,
            color: ColorApp.border,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'PO-000001',
            style: StyleApp.textXl.copyWith(
              color: ColorApp.blackText,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SpacerHeight(6),
          const SpacerHeight(6),
          Text(
            '06 Juli 2024',
            style: StyleApp.textNormal.copyWith(
              color: ColorApp.greyText,
            ),
          ),
          const SpacerHeight(6),
          Row(
            children: [
              Container(
                height: 24,
                width: 24,
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(8, 1.5, 8, 2.5),
                decoration: const BoxDecoration(color: ColorApp.primary, shape: BoxShape.circle),
                child: Text(
                  'J',
                  style: StyleApp.textNormal.copyWith(
                    fontWeight: FontWeight.w600,
                    color: ColorApp.white,
                  ),
                ),
              ),
              const SpacerWidth(8),
              Text(
                'John Doe',
                style: StyleApp.textNormal.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
