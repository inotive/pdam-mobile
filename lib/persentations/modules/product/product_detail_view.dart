import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/di.dart';
import 'package:pdam_inventory/app/helpers/helpers.dart';
import 'package:pdam_inventory/domain/model/product_model.dart';
import 'package:pdam_inventory/persentations/modules/product/tabs/product_history_stock_tab.dart';
import 'package:pdam_inventory/persentations/modules/product/tabs/product_warehouse_stock_tab.dart';
import 'package:pdam_inventory/persentations/modules/product/viewmodel/product_detail_viewmodel.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/custom_cached_network_image.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key, required this.id});

  final int id;

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> with TickerProviderStateMixin {
  final ProductDetailViewmodel _productDetailViewmodel = instance<ProductDetailViewmodel>();

  late TabController _tabController;

  _bind() {
    _productDetailViewmodel.productDetail(widget.id);
    _productDetailViewmodel.productWarehouse(widget.id);
    _productDetailViewmodel.productStockHistory(widget.id);
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.grey,
      appBar: AppBar(
        title: const Text(StringApp.detailProduct),
      ),
      body: StreamBuilder<FlowState>(
          stream: _productDetailViewmodel.outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(context, _getContentWidget(), () {
                  _bind();
                }) ??
                Container();
          }),
    );
  }

  Widget _getContentWidget() {
    return StreamBuilder<ProductDetailData>(
        stream: _productDetailViewmodel.outputProductDetail,
        builder: (context, snapshot) {
          return Column(
            children: [
              _products(snapshot.data),
              _count(snapshot.data),
              const SpacerHeight(12),
              _tabbar(),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ProductHistoryStockTab(_productDetailViewmodel),
                    ProductWarehouseStockTab(_productDetailViewmodel),
                  ],
                ),
              ),
            ],
          );
        });
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
          text: 'RIWAYAT STOCK',
        ),
        Tab(
          text: 'STOCK GUDANG',
        ),
      ],
    );
  }

  Container _count(ProductDetailData? detail) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      decoration: const BoxDecoration(
        color: ColorApp.white,
      ),
      child: Row(
        children: [
          Flexible(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                color: ColorApp.grey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.arrow_downward,
                    size: 16,
                    color: ColorApp.green,
                  ),
                  const SpacerWidth(8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${StringApp.totalStockInThisMonth}:",
                          style: StyleApp.textNormal.copyWith(
                            color: ColorApp.greyText,
                          ),
                        ),
                        const SpacerHeight(6),
                        Text(
                          detail?.stockIn.toString() ?? '-',
                          style: StyleApp.textLg.copyWith(
                            color: ColorApp.blackText,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SpacerWidth(8),
          Flexible(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                color: ColorApp.grey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.arrow_upward,
                    size: 16,
                    color: ColorApp.red,
                  ),
                  const SpacerWidth(8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${StringApp.totalStockOutThisMonth}:",
                          style: StyleApp.textNormal.copyWith(
                            color: ColorApp.greyText,
                          ),
                        ),
                        const SpacerHeight(6),
                        Text(
                          detail?.stockOut.toString() ?? '-',
                          style: StyleApp.textLg.copyWith(
                            color: ColorApp.blackText,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _products(ProductDetailData? detail) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
      decoration: const BoxDecoration(
        color: ColorApp.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomNetworkImage(
            height: 56,
            width: 56,
            url: HelperApp.getUrlImage(detail?.image ?? "EMPTY"),
          ),
          const SpacerWidth(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  detail?.name ?? '-',
                  style: StyleApp.textXl.copyWith(
                    color: ColorApp.blackText,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SpacerHeight(6),
                Text(
                  detail?.code ?? '-',
                  style: StyleApp.textNormal.copyWith(
                    color: ColorApp.greyText,
                  ),
                ),
                const SpacerHeight(6),
                Row(
                  children: [
                    Text(
                      "${StringApp.totalInventory}:",
                      style: StyleApp.textNormal.copyWith(
                        color: ColorApp.greyText,
                      ),
                    ),
                    const SpacerWidth(6),
                    Text(
                      detail?.currentStock.toString() ?? '-',
                      style: StyleApp.textNormal.copyWith(
                        color: ColorApp.blackText,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _productDetailViewmodel.dispose();
    super.dispose();
  }
}
