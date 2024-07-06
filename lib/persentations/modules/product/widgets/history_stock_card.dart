import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/custom_badge.dart';

class HistoryStockCard extends StatelessWidget {
  const HistoryStockCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: ColorApp.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              border: DashedBorder(
                dashLength: 4,
                bottom: BorderSide(
                  width: 1,
                  color: ColorApp.border,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringApp.purchase,
                  style: StyleApp.textNormal.copyWith(
                    color: ColorApp.blackText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const CustomBadge(
                  text: '+ 200 Stock',
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
            child: Text(
              '${StringApp.totalInventory}: 2415',
              style: StyleApp.textNormal.copyWith(
                color: ColorApp.greyText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
