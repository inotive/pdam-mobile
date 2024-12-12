import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/di.dart';
import 'package:pdam_inventory/domain/model/receive_order_model.dart';
import 'package:pdam_inventory/persentations/modules/accepted_item/viewmodel/receive_order_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/accepted_item/widgets/accepted_item_by_date_card.dart';
import 'package:pdam_inventory/persentations/modules/accepted_item/widgets/accepted_item_skeleton.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/route_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/widgets/card/empty_card.dart';

import '../../widgets/forms/search_input_field.dart';

class AcceptedItemView extends StatefulWidget {
  const AcceptedItemView({super.key});

  @override
  State<AcceptedItemView> createState() => _AcceptedItemViewState();
}

class _AcceptedItemViewState extends State<AcceptedItemView> {
  final ReceiveOrderViewmodel _receiveOrderViewmodel = instance<ReceiveOrderViewmodel>();

  _bind() {
    _receiveOrderViewmodel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.grey,
      appBar: AppBar(
        title: const Text(StringApp.acceptedItem),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(64),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: SearchInputField(
              hint: StringApp.search,
              readOnly: true,
              onTap: () => Navigator.pushNamed(context, Routes.searchAcceptedItem),
              suffixIcon: const Icon(
                Icons.search,
                color: ColorApp.black,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: _fab(context),
      body: StreamBuilder<List<ReceiveOrderDate>>(
          stream: _receiveOrderViewmodel.outputReceiveOrder,
          builder: (context, snapshot) {
            List<ReceiveOrderDate> orders = snapshot.data ?? List.empty();

            if (ConnectionState.waiting == snapshot.connectionState) {
              return const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 16,
                ),
                child: Column(
                  children: [
                    AcceptedItemSkeleton(),
                    AcceptedItemSkeleton(),
                    AcceptedItemSkeleton(),
                  ],
                ),
              );
            }

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

  FloatingActionButton _fab(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context, Routes.receivedItem),
      backgroundColor: ColorApp.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: const Icon(
        Icons.add_box_outlined,
        color: ColorApp.white,
      ),
    );
  }

  @override
  void dispose() {
    _receiveOrderViewmodel.dispose();
    super.dispose();
  }
}
