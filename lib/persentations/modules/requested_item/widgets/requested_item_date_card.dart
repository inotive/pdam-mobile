import 'package:flutter/material.dart';
import 'package:pdam_inventory/domain/model/purchase_request_model.dart';
import 'package:pdam_inventory/persentations/modules/requested_item/widgets/requested_item_card.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class RequestedItemDateCard extends StatelessWidget {
  final PurchaseRequestDate data;
  const RequestedItemDateCard(
    this.data, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.date,
            style: StyleApp.textNormal.copyWith(
              color: ColorApp.borderB3,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SpacerHeight(8),
          ...List.generate(
            data.purchaseRequest.length,
            (idx) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: RequestedItemCard(data.purchaseRequest[idx]),
              );
            },
          ),
        ],
      ),
    );
  }
}
