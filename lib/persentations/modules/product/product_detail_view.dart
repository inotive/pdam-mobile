import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/modules/product/tabs/product_history_stock_tab.dart';
import 'package:pdam_inventory/persentations/modules/product/tabs/product_warehouse_stock_tab.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/custom_cached_network_image.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.grey,
      appBar: AppBar(
        title: const Text(StringApp.detailProduct),
      ),
      body: Column(
        children: [
          _products(),
          _count(),
          const SpacerHeight(12),
          _tabbar(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                ProductHistoryStockTab(),
                ProductWarehouseStockTab(),
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
          text: 'RIWAYAT STOCK',
        ),
        Tab(
          text: 'STOCK GUDANG',
        ),
      ],
    );
  }

  Container _count() {
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
                          '3100',
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
                          '1400',
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

  Container _products() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
      decoration: const BoxDecoration(
        color: ColorApp.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomNetworkImage(
            height: 56,
            width: 56,
            url:
                'https://s3-alpha-sig.figma.com/img/5fd9/329c/e57c8cd2f9f43cfbe953c40b4918e1dd?Expires=1721001600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=py~Lx2eiRv-lxA0QIudhUAYglg8of2PNz4sxgj8w09YGCLT2VfoWvcJWP6I3XdIdkCr76v4stUBDa~ZUSxN90DHZazjPPgm137YSgZUzMepNaDgfcbgq~Oj5N4HUPwdd17TFHsOaIR-PQprYQOsf2RrDhq7~eFXzCEMsHDGv9UdLQabeluMR27eomvBXKCUNy-63q2yL3F074H04lShdzQqrBMPBqhDlQ9tc5q8c87v8bO3-x8CU3dpvkI2pkYpZ~kcYEdwshCQTsP-4M0k21gA6hxUXXQ9D12Gmq2-kL0FpFlbq4ZaPBXrOkUDZllyruEDCMnzavLYXY7p9fnJdIw__',
          ),
          const SpacerWidth(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Equal Tee Coupler hdpe 75mm',
                  style: StyleApp.textXl.copyWith(
                    color: ColorApp.blackText,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SpacerHeight(6),
                Text(
                  'ETCHDP7',
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
                      '2415',
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
}
