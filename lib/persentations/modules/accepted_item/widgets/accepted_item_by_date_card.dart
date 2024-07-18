import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/helpers/date_formatter.dart';
import 'package:pdam_inventory/domain/model/receive_order_model.dart';
import 'package:pdam_inventory/persentations/modules/accepted_item/widgets/accepted_item_card.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';

class AcceptedItemByDateCard extends StatelessWidget {
  const AcceptedItemByDateCard(this.data, {super.key});

  final ReceiveOrderDate data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormatterApp.formatIndoDate(data.date),
            style: StyleApp.textNormal.copyWith(
              color: ColorApp.borderB3,
              fontStyle: FontStyle.italic,
            ),
          ),
          ...List.generate(data.receiveOrder.length, (idx) {
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: AcceptedItemCard(data.receiveOrder[idx]),
            );
          }),
        ],
      ),
    );
  }
}
