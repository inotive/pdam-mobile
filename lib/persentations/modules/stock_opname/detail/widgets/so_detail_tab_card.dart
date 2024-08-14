import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';

class SODetailTabCard extends StatelessWidget {
  const SODetailTabCard({
    super.key,
    required this.text,
    required this.onTap,
    required this.keyId,
    required this.index,
  });

  final int keyId;
  final int index;
  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 10,
        ),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: keyId == index ? ColorApp.primary.withOpacity(0.1) : ColorApp.white,
          border: Border.all(
            width: 1,
            color: keyId == index ? ColorApp.primary : ColorApp.borderE5,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(text,
            style: StyleApp.textNormal.copyWith(
              fontWeight: FontWeight.w600,
            )),
      ),
    );
  }
}
