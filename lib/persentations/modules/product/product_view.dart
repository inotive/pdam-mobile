import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pdam_inventory/persentations/modules/product/widgets/product_card.dart';
import 'package:pdam_inventory/persentations/resources/asset_app.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/forms/search_input_field.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';
import 'package:pie_chart/pie_chart.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final dataMap = {
    "467 - IN HAND": 467.0,
    "56 - OUT": 56.0,
    "523 - IN": 523.0,
  };

  final colors = [
    const Color(0xFF33BFA3),
    const Color(0xFFF2DD21),
    const Color(0xFF23B9FF),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: ListView(
        children: [
          _chart(),
          const ProductCard(),
          const ProductCard(),
          const ProductCard(),
          const ProductCard(),
          const ProductCard(),
          const ProductCard(),
          const ProductCard(),
          const ProductCard(),
        ],
      ),
    );
  }

  Container _chart() {
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
                      '12',
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
                      '2',
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
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text(StringApp.product),
      actions: [
        GestureDetector(
          onTap: () {},
          child: SvgPicture.asset(
            IconApp.filter,
          ),
        ),
        const SpacerWidth(16),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: const SearchInputField(
            hint: StringApp.searchItem,
            // onChanged: (String val) {
            //   filterSearch(val);
            // },
            suffixIcon: Icon(
              Icons.search,
              color: ColorApp.black,
            ),
          ),
        ),
      ),
    );
  }
}
