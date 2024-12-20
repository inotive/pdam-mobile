import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:pdam_inventory/app/helpers/date_formatter.dart';
import 'package:pdam_inventory/domain/model/purchase_request_model.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/custom_cached_network_image.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class DetailRequestedItemCard extends StatelessWidget {
  const DetailRequestedItemCard(this.data, {super.key});

  final PurchaseRequestProduct data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: ColorApp.white,
        border: Border.all(
          width: 1,
          color: ColorApp.border,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              border: DashedBorder(
                dashLength: 4,
                bottom: BorderSide(
                  color: ColorApp.border,
                  width: 1,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomNetworkImage(
                      height: 40,
                      width: 40,
                      borderRadius: 4,
                      url: data.image,
                    ),
                    const SpacerWidth(12),
                    Expanded(
                      child: Text(
                        data.name,
                        style: StyleApp.textLg.copyWith(
                          color: ColorApp.blackText,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SpacerWidth(8),
                    Text(
                      '${data.qty} Buah',
                      style: StyleApp.textLg.copyWith(
                        color: ColorApp.primary,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
                const SpacerHeight(6),
                Text(
                  data.notes,
                  style: StyleApp.textNormal.copyWith(
                    color: ColorApp.greyText,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringApp.createdAt,
                      style: StyleApp.textSm.copyWith(
                        color: ColorApp.greyText,
                      ),
                    ),
                    Text(
                      DateFormatterApp.formatIndoDate(data.createdAt),
                      style: StyleApp.textSm.copyWith(
                        color: ColorApp.greyText,
                      ),
                    ),
                  ],
                ),
                const SpacerHeight(6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringApp.updatedAt,
                      style: StyleApp.textSm.copyWith(
                        color: ColorApp.greyText,
                      ),
                    ),
                    Text(
                      DateFormatterApp.formatIndoDate(data.updatedAt),
                      style: StyleApp.textSm.copyWith(
                        color: ColorApp.greyText,
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
