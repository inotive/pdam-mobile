import 'package:flutter/material.dart';
import 'package:pdam_inventory/domain/model/product_model.dart';
import 'package:pdam_inventory/persentations/modules/product/product_detail_view.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/custom_badge.dart';
import 'package:pdam_inventory/persentations/widgets/custom_cached_network_image.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(this.data, {super.key});

  final ProductData data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProductDetailView(id: data.id)),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: ColorApp.border),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomNetworkImage(
              height: 56,
              width: 56,
              borderRadius: 4,
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
                      fontWeight: FontWeight.w700,
                      color: ColorApp.blackText,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SpacerHeight(6),
                  Text(
                    data.code,
                    style: StyleApp.textSm.copyWith(
                      color: ColorApp.greyText,
                    ),
                  ),
                  const SpacerHeight(6),
                  Row(
                    children: [
                      CustomBadge(
                        text: data.stockIn.toString(),
                        icon: const Icon(
                          Icons.arrow_downward,
                          size: 14,
                          color: ColorApp.green,
                        ),
                      ),
                      const SpacerWidth(8),
                      CustomBadge(
                        text: data.stockOut.toString(),
                        backgroundColor: ColorApp.redBg,
                        textColor: ColorApp.red,
                        icon: const Icon(
                          Icons.arrow_upward,
                          size: 14,
                          color: ColorApp.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SpacerWidth(12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${StringApp.stock}:",
                  style: StyleApp.textSm.copyWith(
                    color: ColorApp.greyText,
                  ),
                ),
                Text(
                  "${data.currentStock}",
                  style: StyleApp.textLg.copyWith(
                    color: ColorApp.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
