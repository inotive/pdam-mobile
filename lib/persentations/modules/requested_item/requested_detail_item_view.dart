import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:pdam_inventory/persentations/modules/requested_item/widgets/detail_requested_item_card.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/custom_badge.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class RequestedDetailItemView extends StatelessWidget {
  const RequestedDetailItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          StringApp.detailRequestedItem,
        ),
      ),
      body: ListView(
        children: [
          _product(),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 16,
            ),
            child: Column(
              children: [
                DetailRequestedItemCard(),
                DetailRequestedItemCard(),
                DetailRequestedItemCard(),
                DetailRequestedItemCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _product() {
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PR0000010',
                    style: StyleApp.textXl.copyWith(
                      color: ColorApp.blackText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SpacerHeight(6),
                  Text(
                    '06 Juli 2024',
                    style: StyleApp.textNormal.copyWith(
                      color: ColorApp.greyText,
                    ),
                  ),
                ],
              ),
              const CustomBadge(
                backgroundColor: ColorApp.brownBg,
                textColor: ColorApp.brown,
                text: "Sedang Purchase Order",
              ),
            ],
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
