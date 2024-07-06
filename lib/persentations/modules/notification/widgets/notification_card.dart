import 'package:flutter/material.dart';
import 'package:pdam_inventory/dummy/dummy_model.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard(this.data, {super.key});

  final NotificationDummyModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 16, 16),
      decoration: BoxDecoration(
        color: data.isRead == 0 ? ColorApp.yellow.withOpacity(0.1) : ColorApp.white,
        border: Border(
          left: BorderSide(
            width: 5,
            color: data.isRead == 0 ? ColorApp.yellow : ColorApp.white,
          ),
          bottom: const BorderSide(
            width: 1,
            color: ColorApp.border,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.code,
            style: StyleApp.textLg.copyWith(
              color: ColorApp.blackText,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            data.desc,
            style: StyleApp.textLg.copyWith(
              color: ColorApp.blackText,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SpacerHeight(11),
          Text(
            data.date,
            style: StyleApp.textNormal.copyWith(
              color: ColorApp.greyText,
            ),
          ),
        ],
      ),
    );
  }
}
