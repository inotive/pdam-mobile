import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:pdam_inventory/domain/model/receive_order_model.dart';
import 'package:pdam_inventory/persentations/resources/asset_app.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/custom_cached_network_image.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class DetailAcceptedItemCard extends StatelessWidget {
  const DetailAcceptedItemCard(this.data, {super.key});

  final ReceiveOrderDetailProduct data;

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
                // _item(
                //   StringApp.message,
                //   data.pesan,
                // ),
                // const SpacerHeight(6),
                // _item(
                //   StringApp.totalItemPreviouslyReceived,
                //   data.totalBarangDiterimaSebelumnya,
                // ),
                // const SpacerHeight(6),
                // _item(
                //   StringApp.receivedOnShelf,
                //   data.diterimaDiRak,
                // ),
                // const SpacerHeight(6),
                // _item(
                //   StringApp.receivedOnWarehouse,
                //   data.diterimaDiGudang,
                // ),
                const SpacerHeight(6),
                _item(
                  'Stock saat ini',
                  data.sisa,
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
                CustomNetworkImage(
                  height: 40,
                  width: 40,
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
                      ),
                      const SpacerHeight(2),
                      Text(
                        data.code,
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
                      '${data.qty} barang',
                      style: StyleApp.textNormal.copyWith(
                        color: ColorApp.greyText,
                      ),
                    ),
                  ],
                ),
                // Text(
                //   'Rp. ${data.price}',
                //   style: StyleApp.textNormal,
                // ),
              ],
            ),
          ],
        ));
  }
}
