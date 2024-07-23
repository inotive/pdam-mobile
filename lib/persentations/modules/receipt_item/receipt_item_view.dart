import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/di.dart';
import 'package:pdam_inventory/persentations/modules/receipt_item/tabs/receipt_item_by_reference_tab.dart';
import 'package:pdam_inventory/persentations/modules/receipt_item/tabs/receipt_item_manual_input_tab.dart';
import 'package:pdam_inventory/persentations/modules/receipt_item/viewmodel/receipt_viewmodel.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';

class ReceiptItemView extends StatefulWidget {
  const ReceiptItemView({super.key});

  @override
  State<ReceiptItemView> createState() => _ReceiptItemViewState();
}

class _ReceiptItemViewState extends State<ReceiptItemView> with SingleTickerProviderStateMixin {
  final ReceiptViewmodel _receiptViewmodel = instance<ReceiptViewmodel>();
  late TabController _tabController;

  _bind() {
    _receiptViewmodel.start();
  }

  @override
  void initState() {
    _bind();
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringApp.receiveItem),
      ),
      body: StreamBuilder<FlowState>(
          stream: _receiptViewmodel.outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(context, _getContentWidgets(), () => _bind()) ?? _getContentWidgets();
          }),
    );
  }

  Column _getContentWidgets() {
    return Column(
      children: [
        _tabbar(),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              ReceiptItemManualInputTab(_receiptViewmodel),
              ReceiptItemByReferenceTab(),
            ],
          ),
        ),
      ],
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
