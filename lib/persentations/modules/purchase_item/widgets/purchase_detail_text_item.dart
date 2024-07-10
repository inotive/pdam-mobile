import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';

class PurchaseDetailTextItem extends StatelessWidget {
  const PurchaseDetailTextItem({super.key, required this.name, required this.value});

  final String name;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            name,
            style: StyleApp.textNormal.copyWith(
              color: ColorApp.greyText,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        Text(
          ':',
          style: StyleApp.textNormal.copyWith(
            color: ColorApp.greyText,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: StyleApp.textNormal.copyWith(
              color: ColorApp.greyText,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
