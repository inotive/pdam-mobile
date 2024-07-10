import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:pdam_inventory/persentations/modules/accepted_item/detail_accepted_item_view.dart';
import 'package:pdam_inventory/persentations/resources/asset_app.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class AcceptedItemCard extends StatelessWidget {
  const AcceptedItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DetailAcceptedItemView(),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              color: ColorApp.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
              border: DashedBorder(
                dashLength: 4,
                bottom: BorderSide(
                  width: 1,
                  color: ColorApp.border,
                ),
              ),
            ),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'TB-10234135-925',
                            style: StyleApp.textNormal.copyWith(
                              fontWeight: FontWeight.w700,
                              color: ColorApp.blackText,
                            ),
                          ),
                        ),
                        const SpacerWidth(6),
                        const Icon(
                          Icons.chevron_right,
                          size: 14,
                        ),
                      ],
                    ),
                    const SpacerHeight(6),
                    Text(
                      'BUY-2602142525-1',
                      style: StyleApp.textNormal.copyWith(
                        color: ColorApp.greyText,
                      ),
                    ),
                  ],
                ),
                const SpacerHeight(16),
                Row(
                  children: [
                    SvgPicture.asset(IconApp.box),
                    const SpacerWidth(4),
                    Text(
                      '30 barang',
                      style: StyleApp.textNormal.copyWith(
                        color: ColorApp.greyText,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            decoration: const BoxDecoration(
              color: ColorApp.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(8.0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${StringApp.receivedBy}:",
                  style: StyleApp.textNormal.copyWith(
                    color: ColorApp.greyText,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Inotive Technology',
                      style: StyleApp.textNormal.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SpacerWidth(8),
                    Container(
                      height: 24,
                      width: 24,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(8, 1.5, 8, 2.5),
                      decoration: const BoxDecoration(color: ColorApp.primary, shape: BoxShape.circle),
                      child: Text(
                        'I',
                        style: StyleApp.textNormal.copyWith(
                          fontWeight: FontWeight.w600,
                          color: ColorApp.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
