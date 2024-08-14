import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/di.dart';
import 'package:pdam_inventory/domain/model/stock_opname_model.dart';
import 'package:pdam_inventory/persentations/modules/stock_opname/detail/viewmodel/stock_opname_detail_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/stock_opname/detail/widgets/so_detail_tab_card.dart';
import 'package:pdam_inventory/persentations/modules/stock_opname/detail/widgets/sod_infomation.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';

class StockOpnameDetailView extends StatefulWidget {
  const StockOpnameDetailView(this.data, {super.key});

  final StockOpnameData data;

  @override
  State<StockOpnameDetailView> createState() => _StockOpnameDetailViewState();
}

class _StockOpnameDetailViewState extends State<StockOpnameDetailView> {
  final StockOpnameDetailViewmodel _viewmodel = instance<StockOpnameDetailViewmodel>();
  int initialIndex = 0;
  late PageController _pageController;

  _bind() {
    _viewmodel.start();
    _viewmodel.detail(widget.data.id.toString());
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: initialIndex);
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          StringApp.detailStockOpname,
        ),
      ),
      body: StreamBuilder<FlowState>(
          stream: _viewmodel.outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(context, _getContentWidgets(), () {
                  _bind();
                }) ??
                Container();
          }),
    );
  }

  Column _getContentWidgets() {
    return Column(
      children: [
        _tabs(),
        StreamBuilder<StockOpnameDetailData>(
            stream: _viewmodel.outputDetail,
            builder: (context, snapshot) {
              return Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (int index) {
                    setState(() {
                      initialIndex = index;
                    });
                  },
                  children: [
                    SODInfomation(snapshot.data?.products ?? List.empty()),
                    Container(),
                    Container(),
                  ],
                ),
              );
            }),
      ],
    );
  }

  Container _tabs() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorApp.greyD9,
          ),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SODetailTabCard(
              text: StringApp.information,
              onTap: () {
                _pageController.jumpToPage(0);
                setState(() {
                  initialIndex = 0;
                });
              },
              keyId: 0,
              index: initialIndex,
            ),
            SODetailTabCard(
              text: StringApp.opanameResult,
              onTap: () {
                _pageController.jumpToPage(1);
                setState(() {
                  initialIndex = 1;
                });
              },
              keyId: 1,
              index: initialIndex,
            ),
            SODetailTabCard(
              text: StringApp.searchOrScanProduct,
              onTap: () {
                _pageController.jumpToPage(2);
                setState(() {
                  initialIndex = 2;
                });
              },
              keyId: 2,
              index: initialIndex,
            ),
          ],
        ),
      ),
    );
  }
}
