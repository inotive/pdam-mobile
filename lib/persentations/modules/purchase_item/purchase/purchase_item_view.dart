import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/di.dart';
import 'package:pdam_inventory/domain/model/purchase_order_model.dart';
import 'package:pdam_inventory/persentations/modules/purchase_item/purchase/viewmodel/purchase_order_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/purchase_item/purchase/widgets/purchase_item_by_date_card.dart';
import 'package:pdam_inventory/persentations/modules/purchase_item/purchase/widgets/purchase_item_skeleton.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/route_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/widgets/card/empty_card.dart';

class PurchaseItemView extends StatefulWidget {
  const PurchaseItemView({super.key});

  @override
  State<PurchaseItemView> createState() => _PurchaseItemViewState();
}

class _PurchaseItemViewState extends State<PurchaseItemView> {
  final PurchaseOrderViewmodel _purchaseOrderViewmodel = instance<PurchaseOrderViewmodel>();

  _bind() {
    _purchaseOrderViewmodel.start();
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorApp.blue,
        onPressed: () => Navigator.pushNamed(context, Routes.createPurchase),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(
          Icons.add,
          color: ColorApp.white,
        ),
      ),
      appBar: AppBar(
        title: const Text(StringApp.purchaseItem),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        children: [
          StreamBuilder(
            stream: _purchaseOrderViewmodel.outputPurchaseOrder,
            builder: (context, snapshot) {
              List<PurchaseOrderDate> data = snapshot.data ?? List.empty();

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Column(
                  children: [
                    PurchaseItemSkeleton(),
                    PurchaseItemSkeleton(),
                    PurchaseItemSkeleton(),
                  ],
                );
              }

              if (snapshot.hasData) {
                return Column(
                  children: data.map((item) {
                    return PurchaseItemByDateCard(item);
                  }).toList(),
                );
              } else {
                return const EmptyCard(message: StringApp.purchaseItem);
              }
            },
          ),
        ],
      ),
    );
  }
}
