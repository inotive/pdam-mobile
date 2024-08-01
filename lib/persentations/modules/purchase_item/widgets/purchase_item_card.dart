import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:pdam_inventory/app/extensions.dart';
import 'package:pdam_inventory/domain/model/purchase_order_model.dart';
import 'package:pdam_inventory/persentations/modules/purchase_item/purchase_item_detail_view.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class PurchaseItemCard extends StatelessWidget {
  const PurchaseItemCard(this.data, {super.key});

  final PurchaseOrderData data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PurchaseItemDetailView(),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorApp.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data.requestNumber,
                        style: StyleApp.textNormal.copyWith(
                          color: ColorApp.blackText,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right,
                        size: 14,
                        color: ColorApp.black,
                      ),
                    ],
                  ),
                  const SpacerHeight(6),
                  Text(
                    data.requestDescription,
                    style: StyleApp.textNormal.copyWith(
                      color: ColorApp.greyText,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: Row(
                children: [
                  Container(
                    height: 24,
                    width: 24,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(8, 1.5, 8, 2.5),
                    decoration: const BoxDecoration(color: ColorApp.primary, shape: BoxShape.circle),
                    child: Text(
                      data.requestName.getInitials(),
                      style: StyleApp.textNormal.copyWith(
                        fontWeight: FontWeight.w600,
                        color: ColorApp.white,
                      ),
                    ),
                  ),
                  const SpacerWidth(8),
                  Text(
                    data.requestName,
                    style: StyleApp.textNormal.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
