import 'package:flutter/material.dart';
import 'package:pdam_inventory/dummy/dummy_data.dart';
import 'package:pdam_inventory/dummy/dummy_model.dart';
import 'package:pdam_inventory/persentations/modules/history_stock/widgets/status_card.dart';
import 'package:pdam_inventory/persentations/modules/history_stock/widgets/stock_card.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/route_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/button/custom_outline_button.dart';

class HomeHistoryStockSection extends StatefulWidget {
  const HomeHistoryStockSection({super.key});

  @override
  State<HomeHistoryStockSection> createState() => _HomeHistoryStockSectionState();
}

class _HomeHistoryStockSectionState extends State<HomeHistoryStockSection> {
  int statusIndex = 1;

  List<ProductModel> productsItems = [];

  onStatusTapped(int id) {
    setState(() {
      statusIndex = id;
      if (statusIndex == 3) {
        productsItems = products.where((element) => element.status == 'Barang Keluar').toList();
      } else if (statusIndex == 2) {
        productsItems = products.where((element) => element.status == 'Barang Masuk').toList();
      } else {
        productsItems = products;
      }
    });
  }

  @override
  void initState() {
    onStatusTapped(statusIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringApp.historyStock,
                style: StyleApp.textLg.copyWith(
                  fontWeight: FontWeight.bold,
                  color: ColorApp.blackText,
                ),
              ),
              _status(),
            ],
          ),
        ),
        Column(
          children: productsItems
              .map(
                (item) => StockCard(item),
              )
              .toList(),
        ),
        CustomOutlineButton(
          margin: const EdgeInsets.all(16.0),
          text: StringApp.seeMore,
          onPressed: () => Navigator.pushNamed(context, Routes.historyStock),
        ),
      ],
    );
  }

  Container _status() {
    return Container(
      margin: const EdgeInsets.only(top: 16.0),
      decoration: const BoxDecoration(
        color: ColorApp.white,
      ),
      child: Row(
        children: statuses
            .map(
              (item) => GestureDetector(
                onTap: () {
                  onStatusTapped(item.id);
                },
                child: StatusCard(
                  data: item,
                  index: statusIndex,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
