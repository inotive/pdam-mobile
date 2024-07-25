import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/resources/value_app.dart';
import 'package:pdam_inventory/persentations/widgets/custom_cached_network_image.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class ReceiptItemCard extends StatelessWidget {
  const ReceiptItemCard(
      {super.key,
      required this.onAdd,
      required this.onRemove,
      required this.qty,
      required this.name,
      required this.image,
      required this.code});

  final String name;
  final String image;
  final String code;
  final Function() onAdd;
  final Function() onRemove;
  final String qty;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: ColorApp.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 6,
            color: ColorApp.black.withOpacity(0.08),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomNetworkImage(
                  height: 44,
                  width: 44,
                  borderRadius: 4,
                  url: image,
                ),
                const SpacerHeight(8),
                Text(
                  name,
                  style: StyleApp.textSm.copyWith(
                    fontWeight: FontWeight.w600,
                    fontFamily: FontFamilyApp.inter,
                  ),
                ),
                const SpacerHeight(2),
                Text(
                  code,
                  style: StyleApp.textXs.copyWith(
                    color: ColorApp.greyText,
                    fontSize: FontSizeApp.xss,
                    fontFamily: FontFamilyApp.inter,
                  ),
                )
              ],
            ),
          ),
          const SpacerWidth(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                StringApp.qty,
                style: StyleApp.textXs.copyWith(
                  color: ColorApp.greyText,
                  fontSize: FontSizeApp.xss,
                  fontFamily: FontFamilyApp.inter,
                ),
              ),
              const SpacerHeight(8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorApp.backgroundF1,
                ),
                child: Text(
                  qty,
                  style: StyleApp.textNormal.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SpacerHeight(8),
              Row(
                children: [
                  QtyButton(
                    icon: Icons.add,
                    onTap: onAdd,
                  ),
                  const SpacerWidth(8),
                  QtyButton(
                    icon: Icons.remove,
                    onTap: onRemove,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class QtyButton extends StatelessWidget {
  const QtyButton({super.key, required this.icon, required this.onTap});

  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 32,
        width: 32,
        child: Container(
          decoration: BoxDecoration(
            color: ColorApp.primary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: ColorApp.white,
          ),
        ),
      ),
    );
  }
}
