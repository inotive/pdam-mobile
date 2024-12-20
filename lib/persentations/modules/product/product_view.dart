import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pdam_inventory/app/di.dart';
import 'package:pdam_inventory/domain/model/product_model.dart';
import 'package:pdam_inventory/persentations/modules/product/viewmodel/product_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/product/widgets/product_card.dart';
import 'package:pdam_inventory/persentations/modules/product/widgets/product_chart_skeleton.dart';
import 'package:pdam_inventory/persentations/modules/product/widgets/product_skeleton.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/route_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/card/empty_card.dart';
import 'package:pdam_inventory/persentations/widgets/forms/search_input_field.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';
import 'package:pie_chart/pie_chart.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final ProductViewmodel _productViewmodel = instance<ProductViewmodel>();
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;

  _bind() {
    _productViewmodel.start();
    _productViewmodel.products(10);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        setState(() {
          isLoading = true;
        });
        Future.delayed(const Duration(seconds: 1), () {
          _productViewmodel.updateLimit();
          _productViewmodel.products(10);
        });
      }
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: StreamBuilder<FlowState>(
          stream: _productViewmodel.outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(
                  context,
                  _getContentWidget(),
                  () {
                    _bind();
                  },
                ) ??
                _getContentWidget();
          }),
    );
  }

  ListView _getContentWidget() {
    return ListView(
      controller: _scrollController,
      children: [
        _chart(),
        StreamBuilder(
          stream: _productViewmodel.outputProducts,
          builder: (context, snapshot) {
            final data = snapshot.data ?? List.empty();

            if (ConnectionState.waiting == snapshot.connectionState) {
              return const Column(
                children: [
                  ProductSkeleton(),
                  ProductSkeleton(),
                  ProductSkeleton(),
                  ProductSkeleton(),
                  ProductSkeleton(),
                ],
              );
            }

            if (data.isEmpty) {
              return const EmptyCard(
                message: StringApp.productNotYet,
              );
            }

            return Column(
                children: data
                    .map(
                      (item) => ProductCard(item),
                    )
                    .toList());
          },
        ),
        if (isLoading)
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: SpinKitCircle(
                color: ColorApp.primary,
              ),
            ),
          ),
      ],
    );
  }

  StreamBuilder _chart() {
    return StreamBuilder<ProductSummaryData>(
        stream: _productViewmodel.outputProductSummary,
        builder: (context, snapshot) {
          if (ConnectionState.waiting == snapshot.connectionState) {
            return const ProductChartSkeleton();
          }

          final dataMap = {
            "${snapshot.data?.chart?.inHand} - IN HAND": double.parse(snapshot.data?.chart?.inHand.toString() ?? '0.0'),
            "${snapshot.data?.chart?.outStock} - OUT": double.parse(snapshot.data?.chart?.outStock.toString() ?? '0.0'),
            "${snapshot.data?.chart?.inStock} - IN": double.parse(snapshot.data?.chart?.inStock.toString() ?? '0.0'),
          };

          final colors = [
            const Color(0xFF33BFA3),
            const Color(0xFFF2DD21),
            const Color(0xFF23B9FF),
          ];

          return Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1, color: ColorApp.border),
              ),
            ),
            child: Column(
              children: [
                PieChart(
                  dataMap: dataMap,
                  colorList: colors,
                  chartType: ChartType.ring,
                  chartRadius: 100,
                  ringStrokeWidth: 24,
                  chartValuesOptions: const ChartValuesOptions(
                    showChartValueBackground: false,
                    showChartValuesInPercentage: false,
                    showChartValues: false,
                  ),
                  legendOptions: LegendOptions(
                    legendShape: BoxShape.rectangle,
                    legendTextStyle: StyleApp.textSm.copyWith(
                      color: ColorApp.greyText,
                    ),
                  ),
                ),
                const SpacerHeight(16),
                Container(
                  height: 67,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorApp.grey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            snapshot.data?.totalProduct.toString() ?? '0',
                            style: StyleApp.textXl.copyWith(
                              color: ColorApp.black,
                            ),
                          ),
                          const SpacerHeight(4),
                          Text(
                            StringApp.totalProduct,
                            style: StyleApp.textNormal.copyWith(
                              color: ColorApp.greyText,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 43,
                        width: 1,
                        color: ColorApp.border,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            snapshot.data?.lowStock.toString() ?? '0',
                            style: StyleApp.textXl.copyWith(
                              color: ColorApp.black,
                            ),
                          ),
                          const SpacerHeight(4),
                          Text(
                            StringApp.lowStock,
                            style: StyleApp.textNormal.copyWith(
                              color: ColorApp.greyText,
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
        });
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text(StringApp.product),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: SearchInputField(
            hint: StringApp.searchItem,
            readOnly: true,
            onTap: () => Navigator.pushNamed(context, Routes.searchProduct),
            suffixIcon: const Icon(
              Icons.search,
              color: ColorApp.black,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _productViewmodel.dispose();
    super.dispose();
  }
}
