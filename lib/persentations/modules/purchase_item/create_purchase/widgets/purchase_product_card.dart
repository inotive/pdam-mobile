import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/resources/value_app.dart';
import 'package:pdam_inventory/persentations/widgets/custom_badge.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class PurchaseProductCard extends StatelessWidget {
  const PurchaseProductCard(
      {super.key, required this.name, required this.amount, required this.unit, required this.onDelete});

  final String name;
  final String amount;
  final String unit;
  final Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: ColorApp.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 8,
            color: ColorApp.black.withOpacity(0.08),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: StyleApp.textSm.copyWith(
              fontWeight: FontWeight.bold,
              fontFamily: FontFamilyApp.inter,
            ),
          ),
          const SpacerHeight(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                StringApp.amount,
                style: StyleApp.textXss.copyWith(
                  color: ColorApp.greyText8D,
                  fontWeight: FontWeight.w500,
                  fontFamily: FontFamilyApp.inter,
                ),
              ),
              Text(
                amount,
                style: StyleApp.textXss.copyWith(
                  fontWeight: FontWeight.w500,
                  fontFamily: FontFamilyApp.inter,
                ),
              ),
            ],
          ),
          const SpacerHeight(4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                StringApp.unit,
                style: StyleApp.textXss.copyWith(
                  color: ColorApp.greyText8D,
                  fontWeight: FontWeight.w500,
                  fontFamily: FontFamilyApp.inter,
                ),
              ),
              Text(
                unit,
                style: StyleApp.textXss.copyWith(
                  fontWeight: FontWeight.w500,
                  fontFamily: FontFamilyApp.inter,
                ),
              ),
            ],
          ),
          const SpacerHeight(18),
          Row(
            children: [
              InkWell(
                onTap: onDelete,
                child: CustomBadge(
                  text: StringApp.delete,
                  backgroundColor: ColorApp.redBorder.withOpacity(0.1),
                  textColor: ColorApp.redBorder,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
