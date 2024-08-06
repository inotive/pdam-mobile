import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/modules/purchase_item/purchase/widgets/purchase_detail_po_tab.dart';
import 'package:pdam_inventory/persentations/modules/purchase_item/purchase/widgets/purchase_detail_status_tab.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';

class PurchaseItemDetailView extends StatefulWidget {
  const PurchaseItemDetailView({super.key});

  @override
  State<PurchaseItemDetailView> createState() => _PurchaseItemDetailViewState();
}

class _PurchaseItemDetailViewState extends State<PurchaseItemDetailView> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringApp.detailPurchaseItem),
      ),
      body: Column(
        children: [
          _header(),
          _tabbar(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                PurchaseDetailPoTab(),
                PurchaseDetailStatusTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TabBar _tabbar() {
    return TabBar(
      controller: _tabController,
      dividerColor: Colors.transparent,
      indicatorColor: ColorApp.primary,
      indicatorWeight: 1,
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: StyleApp.prompt.copyWith(
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: StyleApp.prompt.copyWith(
        fontWeight: FontWeight.w500,
        color: ColorApp.blackText.withOpacity(0.5),
      ),
      tabs: const [
        Tab(
          text: 'DETAIL PO',
        ),
        Tab(
          text: 'APPROVAL STATUS',
        ),
      ],
    );
  }

  Container _header() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.symmetric(
        vertical: 12.0,
      ),
      decoration: const BoxDecoration(
        color: ColorApp.grey,
      ),
      alignment: Alignment.center,
      child: Text(
        'PO-000001',
        style: StyleApp.textXl.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
