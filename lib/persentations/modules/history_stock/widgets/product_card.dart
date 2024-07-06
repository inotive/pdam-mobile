import 'package:flutter/material.dart';
import 'package:pdam_inventory/dummy/dummy_model.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/custom_badge.dart';
import 'package:pdam_inventory/persentations/widgets/custom_cached_network_image.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(this.data, {super.key});

  final ProductModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: ColorApp.border,
          ),
        ),
      ),
      child: Row(
        children: [
          CustomNetworkImage(
            width: 56,
            height: 56,
            borderRadius: 8,
            url: data.image,
          ),
          const SpacerWidth(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name,
                  style: StyleApp.textLg.copyWith(
                    color: ColorApp.blackText,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Row(
                    children: [
                      CustomBadge(
                        textColor: data.status == 'Barang Masuk' ? ColorApp.green : ColorApp.red,
                        backgroundColor: data.status == 'Barang Masuk' ? ColorApp.greenBg : ColorApp.redBg,
                        text: data.status == 'Barang Masuk'
                            ? " + ${data.addedStock.toString()} Stock"
                            : " - ${data.addedStock.toString()} Stock",
                      ),
                      const SpacerWidth(8),
                      Text(
                        data.type,
                        style: StyleApp.textSm.copyWith(
                          color: ColorApp.blackText,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        width: 1,
                        height: 15,
                        color: ColorApp.borderB3,
                      ),
                      Text(
                        data.date,
                        style: StyleApp.textSm.copyWith(
                          color: ColorApp.blackText,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    '${StringApp.totalInventory} ${data.stock}',
                    style: StyleApp.textSm.copyWith(
                      color: ColorApp.greyText,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
