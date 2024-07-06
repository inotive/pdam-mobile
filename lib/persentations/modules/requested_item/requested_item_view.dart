import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/modules/requested_item/widgets/requested_item_card.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class RequestedItemView extends StatelessWidget {
  const RequestedItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.grey,
      appBar: AppBar(
        title: const Text(
          StringApp.requestedItem,
        ),
      ),
      body: ListView(
        children: [
          _total(),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringApp.historyRequestedItem,
                  style: StyleApp.textLg.copyWith(
                    color: ColorApp.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SpacerHeight(16),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 24,
                  ),
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
                      const RequestedItemCard(),
                      const SpacerHeight(8),
                      const RequestedItemCard(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '5 Jul 2024',
                        style: StyleApp.textNormal.copyWith(
                          color: ColorApp.borderB3,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SpacerHeight(8),
                      const RequestedItemCard(),
                      const SpacerHeight(8),
                      const RequestedItemCard(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _total() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 16,
      ),
      decoration: const BoxDecoration(
        color: ColorApp.white,
      ),
      child: Row(
        children: [
          _count(
            12,
            StringApp.totalRequested,
          ),
          const SpacerWidth(8),
          _count(
            12,
            StringApp.totalAgreed,
          ),
          const SpacerWidth(8),
          _count(
            12,
            StringApp.totalPending,
          ),
        ],
      ),
    );
  }

  Flexible _count(int value, String text) {
    return Flexible(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(12, 16, 12, 32),
        decoration: BoxDecoration(
          color: ColorApp.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value.toString(),
              style: StyleApp.text2xl.copyWith(
                fontWeight: FontWeight.w700,
                color: ColorApp.blackText,
              ),
            ),
            const SpacerHeight(6),
            Text(
              text,
              style: StyleApp.textNormal.copyWith(
                fontWeight: FontWeight.w400,
                color: ColorApp.blackText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
