import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';

class PurchaseTabDetail extends StatelessWidget {
  const PurchaseTabDetail({super.key, required this.text, this.isActive = false});

  final String text;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: isActive ? ColorApp.border30 : ColorApp.borderB2,
          ),
        ),
      ),
      child: Text(
        text,
        style: StyleApp.textLg.copyWith(
          color: isActive ? ColorApp.border30 : ColorApp.greyText76,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
