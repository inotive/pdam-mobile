import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/di.dart';
import 'package:pdam_inventory/persentations/modules/accepted_item/viewmodel/receive_order_viewmodel.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/widgets/forms/search_input_field.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

import '../../../domain/model/receive_order_model.dart';
import '../../widgets/card/empty_card.dart';
import 'widgets/accepted_item_by_date_card.dart';

class SearchAcceptedItemView extends StatefulWidget {
  const SearchAcceptedItemView({super.key});

  @override
  State<SearchAcceptedItemView> createState() => _SearchAcceptedItemViewState();
}

class _SearchAcceptedItemViewState extends State<SearchAcceptedItemView> {
  final ReceiveOrderViewmodel _receiveOrderViewmodel = instance<ReceiveOrderViewmodel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            Flexible(
              child: SearchInputField(
                hint: StringApp.search,
                onChanged: (String value) {
                  _receiveOrderViewmodel.search(value);
                },
              ),
            ),
            const SpacerWidth(16),
          ],
        ),
      ),
      body: StreamBuilder<List<ReceiveOrderDate>>(
          stream: _receiveOrderViewmodel.outputSearch,
          builder: (context, snapshot) {
            List<ReceiveOrderDate> orders = snapshot.data ?? List.empty();

            if (orders.isEmpty) {
              return const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                child: EmptyCard(message: StringApp.acceptedItemNotYet),
              );
            }

            return ListView(
              padding: const EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 16,
              ),
              children: orders.map((item) {
                return AcceptedItemByDateCard(item);
              }).toList(),
            );
          }),
    );
  }
}
