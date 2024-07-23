import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/custom_cached_network_image.dart';
import 'package:pdam_inventory/persentations/widgets/forms/search_input_field.dart';
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
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorApp.border,
            width: 1,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomNetworkImage(
            height: 44,
            width: 44,
            borderRadius: 4,
            url: image,
          ),
          const SpacerWidth(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: StyleApp.textLg.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SpacerHeight(6),
                Text(
                  code,
                  style: StyleApp.textSm.copyWith(
                    color: ColorApp.greyText,
                  ),
                )
              ],
            ),
          ),
          const SpacerWidth(12),
          Column(
            children: [
              Text(
                StringApp.qty,
                style: StyleApp.textSm.copyWith(
                  color: ColorApp.greyText,
                ),
              ),
              const SpacerHeight(4),
              SizedBox(
                width: 72,
                height: 40,
                child: SearchInputField(
                  controller: TextEditingController(text: qty),
                  readOnly: true,
                  hint: '1',
                  textAlign: TextAlign.center,
                ),
              ),
              const SpacerHeight(12),
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
