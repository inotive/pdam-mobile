import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:pdam_inventory/persentations/resources/asset_app.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/custom_cached_network_image.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class DetailAcceptedItemCard extends StatelessWidget {
  const DetailAcceptedItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          width: 1,
          color: ColorApp.border,
        ),
      ),
      child: Column(
        children: [
          _product(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 16,
            ),
            child: Column(
              children: [
                _item(
                  StringApp.message,
                  '200',
                ),
                const SpacerHeight(6),
                _item(
                  StringApp.totalItemPreviouslyReceived,
                  '0',
                ),
                const SpacerHeight(6),
                _item(
                  StringApp.receivedOnShelf,
                  '200',
                ),
                const SpacerHeight(6),
                _item(
                  StringApp.receivedOnWarehouse,
                  '100',
                ),
                const SpacerHeight(6),
                _item(
                  StringApp.remainder,
                  '0',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Row _item(String name, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: StyleApp.textSm.copyWith(
            color: ColorApp.greyText,
          ),
        ),
        Text(
          value,
          style: StyleApp.textSm.copyWith(
            color: ColorApp.greyText,
          ),
        ),
      ],
    );
  }

  Container _product() {
    return Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
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
            Row(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Equal Tee Coupler hdpe 75mm',
                        style: StyleApp.textLg.copyWith(
                          fontWeight: FontWeight.w700,
                          color: ColorApp.blackText,
                        ),
                      ),
                      const SpacerHeight(2),
                      Text(
                        '1241853571761',
                        style: StyleApp.textNormal.copyWith(
                          color: ColorApp.greyText,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SpacerHeight(6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                ),
                const Text(
                  'Rp. 25.000.000',
                  style: StyleApp.textNormal,
                ),
              ],
            ),
          ],
        ));
  }
}
