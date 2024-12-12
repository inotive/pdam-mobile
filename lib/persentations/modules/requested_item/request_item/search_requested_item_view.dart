import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/di.dart';
import 'package:pdam_inventory/domain/model/purchase_request_model.dart';
import 'package:pdam_inventory/persentations/modules/requested_item/request_item/viewmodel/requested_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/requested_item/request_item/widgets/requested_item_date_card.dart';
import 'package:pdam_inventory/persentations/widgets/card/empty_card.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

import '../../../resources/string_app.dart';
import '../../../widgets/forms/search_input_field.dart';

class SearchRequestedItemView extends StatefulWidget {
  const SearchRequestedItemView({super.key});

  @override
  State<SearchRequestedItemView> createState() => _SearchRequestedItemViewState();
}

class _SearchRequestedItemViewState extends State<SearchRequestedItemView> {
  final RequestedViewModel _requestedViewModel = instance<RequestedViewModel>();

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
                  _requestedViewModel.search(value);
                },
              ),
            ),
            const SpacerWidth(16),
          ],
        ),
      ),
      body: StreamBuilder<List<PurchaseRequestDate>>(
          stream: _requestedViewModel.outputPurchaseRequest,
          builder: (context, snapshot) {
            final data = snapshot.data ?? List.empty();

            if (data.isEmpty) {
              return const EmptyCard(
                message: "${StringApp.requestedItemNotYet}!",
              );
            }

            return ListView(
              padding: const EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 16,
              ),
              children: data.map((item) {
                return RequestedItemDateCard(item);
              }).toList(),
            );
          }),
    );
  }
}
