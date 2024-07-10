import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:pdam_inventory/persentations/modules/accepted_item/widgets/detail_accepted_item_card.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class DetailAcceptedItemView extends StatelessWidget {
  const DetailAcceptedItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringApp.detailAcceptedItem),
      ),
      body: ListView(
        children: [
          _header(),
          const SpacerHeight(6),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                DetailAcceptedItemCard(),
                DetailAcceptedItemCard(),
                DetailAcceptedItemCard(),
              ],
            ),
          ),
        ],
      ),
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
            'TB-10234135-925',
            style: StyleApp.textXl.copyWith(
              fontWeight: FontWeight.w700,
              color: ColorApp.blackText,
            ),
          ),
          const SpacerHeight(6),
          Text(
            'BUY-2602142525-1',
            style: StyleApp.textNormal.copyWith(
              color: ColorApp.greyText,
            ),
          ),
          const SpacerHeight(6),
          Text(
            '16 Juli 2024',
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
                  'I',
                  style: StyleApp.textNormal.copyWith(
                    fontWeight: FontWeight.w600,
                    color: ColorApp.white,
                  ),
                ),
              ),
              const SpacerWidth(8),
              Text(
                'Inotive Technology',
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
