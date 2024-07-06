import 'package:flutter/material.dart';
import 'package:pdam_inventory/dummy/dummy_model.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({
    super.key,
    required this.data,
    required this.index,
  });

  final StatusModel data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 10,
      ),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: data.id == index ? ColorApp.primary.withOpacity(0.1) : ColorApp.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: data.id == index ? ColorApp.primary : ColorApp.borderE5,
        ),
      ),
      child: Text(
        data.text,
        style: StyleApp.textNormal.copyWith(
          color: ColorApp.blackText,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
