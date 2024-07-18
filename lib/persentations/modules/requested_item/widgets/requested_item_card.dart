import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:pdam_inventory/app/extensions.dart';
import 'package:pdam_inventory/domain/model/purchase_request_model.dart';
import 'package:pdam_inventory/persentations/modules/requested_item/requested_detail_item_view.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/custom_badge.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class RequestedItemCard extends StatelessWidget {
  const RequestedItemCard(this.data, {super.key});

  final PurchaseRequest data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RequestedDetailItemView(id: data.id),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 24,
                        width: 24,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.fromLTRB(8, 1.5, 8, 2.5),
                        decoration: const BoxDecoration(color: ColorApp.primary, shape: BoxShape.circle),
                        child: Text(
                          data.createdBy.getInitials(),
                          style: StyleApp.textNormal.copyWith(
                            fontWeight: FontWeight.w600,
                            color: ColorApp.white,
                          ),
                        ),
                      ),
                      const SpacerWidth(8),
                      Text(
                        data.createdBy,
                        style: StyleApp.textNormal.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  _status(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _status() {
    switch (data.status) {
      case 'Batal':
        return CustomBadge(
          backgroundColor: ColorApp.redBg,
          textColor: ColorApp.red,
          text: data.status.toTitleCase(),
        );
      case 'Menunggu Disetujui':
        return CustomBadge(
          backgroundColor: ColorApp.yellow.withOpacity(0.1),
          textColor: ColorApp.yellow,
          text: data.status.toTitleCase(),
        );
      case 'Sedang Purchase Order':
        return CustomBadge(
          backgroundColor: ColorApp.brownBg,
          textColor: ColorApp.brown,
          text: data.status.toTitleCase(),
        );
      case 'Disetujui':
        return CustomBadge(
          text: data.status.toTitleCase(),
        );
      default:
        return CustomBadge(
          text: data.status.toTitleCase(),
        );
    }
  }
}
