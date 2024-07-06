import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/custom_cached_network_image.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class DetailRequestedItemCard extends StatelessWidget {
  const DetailRequestedItemCard({super.key});

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
                    const CustomNetworkImage(
                      height: 40,
                      width: 40,
                      borderRadius: 4,
                      url:
                          'https://s3-alpha-sig.figma.com/img/5fd9/329c/e57c8cd2f9f43cfbe953c40b4918e1dd?Expires=1721001600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=py~Lx2eiRv-lxA0QIudhUAYglg8of2PNz4sxgj8w09YGCLT2VfoWvcJWP6I3XdIdkCr76v4stUBDa~ZUSxN90DHZazjPPgm137YSgZUzMepNaDgfcbgq~Oj5N4HUPwdd17TFHsOaIR-PQprYQOsf2RrDhq7~eFXzCEMsHDGv9UdLQabeluMR27eomvBXKCUNy-63q2yL3F074H04lShdzQqrBMPBqhDlQ9tc5q8c87v8bO3-x8CU3dpvkI2pkYpZ~kcYEdwshCQTsP-4M0k21gA6hxUXXQ9D12Gmq2-kL0FpFlbq4ZaPBXrOkUDZllyruEDCMnzavLYXY7p9fnJdIw__',
                    ),
                    const SpacerWidth(12),
                    Expanded(
                      child: Text(
                        'Equal Tee Coupler hdpe 75mm',
                        style: StyleApp.textLg.copyWith(
                          color: ColorApp.blackText,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SpacerWidth(8),
                    Text(
                      '3 Buah',
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
                  'Notes',
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
                      '23 Juli 2024',
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
                      '23 Juli 2024',
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
