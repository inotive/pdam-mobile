import 'package:flutter/material.dart';
import 'package:pdam_inventory/domain/model/product_model.dart';
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
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: ColorApp.border),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomNetworkImage(
            height: 56,
            width: 56,
            borderRadius: 4,
            url:
                'https://s3-alpha-sig.figma.com/img/5fd9/329c/e57c8cd2f9f43cfbe953c40b4918e1dd?Expires=1721001600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=py~Lx2eiRv-lxA0QIudhUAYglg8of2PNz4sxgj8w09YGCLT2VfoWvcJWP6I3XdIdkCr76v4stUBDa~ZUSxN90DHZazjPPgm137YSgZUzMepNaDgfcbgq~Oj5N4HUPwdd17TFHsOaIR-PQprYQOsf2RrDhq7~eFXzCEMsHDGv9UdLQabeluMR27eomvBXKCUNy-63q2yL3F074H04lShdzQqrBMPBqhDlQ9tc5q8c87v8bO3-x8CU3dpvkI2pkYpZ~kcYEdwshCQTsP-4M0k21gA6hxUXXQ9D12Gmq2-kL0FpFlbq4ZaPBXrOkUDZllyruEDCMnzavLYXY7p9fnJdIw__',
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
                      text: data.max,
                      icon: const Icon(
                        Icons.arrow_downward,
                        size: 14,
                        color: ColorApp.green,
                      ),
                    ),
                    const SpacerWidth(8),
                    CustomBadge(
                      text: data.min,
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
                "${data.stock}",
                style: StyleApp.textLg.copyWith(
                  color: ColorApp.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
