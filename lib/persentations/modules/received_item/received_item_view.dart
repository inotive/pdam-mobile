import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/modules/received_item/tabs/received_item_by_reference_tab.dart';
import 'package:pdam_inventory/persentations/modules/received_item/tabs/received_item_manual_input_tab.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';

class ReceivedItemView extends StatefulWidget {
  const ReceivedItemView({super.key});

  @override
  State<ReceivedItemView> createState() => _ReceivedItemViewState();
}

class _ReceivedItemViewState extends State<ReceivedItemView> with SingleTickerProviderStateMixin {
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
        title: const Text(StringApp.receiveItem),
      ),
      body: Column(
        children: [
          _tabbar(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                ReceivedItemManualInputTab(),
                ReceivedItemByReferenceTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding _tabbar() {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: TabBar(
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
            text: StringApp.manualInput,
          ),
          Tab(
            text: StringApp.byReference,
          ),
        ],
      ),
    );
  }
}
