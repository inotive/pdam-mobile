import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pdam_inventory/dummy/dummy_data.dart';
import 'package:pdam_inventory/dummy/dummy_model.dart';
import 'package:pdam_inventory/persentations/modules/history_stock/widgets/status_card.dart';
import 'package:pdam_inventory/persentations/modules/history_stock/widgets/stock_card.dart';
import 'package:pdam_inventory/persentations/resources/asset_app.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/widgets/forms/input_field.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class HistoryStockView extends StatefulWidget {
  const HistoryStockView({super.key});

  @override
  State<HistoryStockView> createState() => _HistoryStockViewState();
}

class _HistoryStockViewState extends State<HistoryStockView> {
  int statusIndex = 1;

  List<ProductModel> incomingItems = [];
  List<ProductModel> exitItems = [];
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

  filterSearch(String query) {
    setState(() {
      productsItems = products.where((element) => element.name.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  @override
  void initState() {
    onStatusTapped(statusIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          _status(),
          Expanded(
            child: SingleChildScrollView(
                child: Column(
                    children: productsItems
                        .map(
                          (item) => StockCard(item),
                        )
                        .toList())),
          )
        ],
      ),
    );
  }

  Container _status() {
    return Container(
      padding: const EdgeInsets.all(16),
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

  AppBar _appBar() {
    return AppBar(
      title: const Text(StringApp.historyStock),
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
          child: InputField(
            hint: StringApp.searchItem,
            onChanged: (String val) {
              filterSearch(val);
            },
            suffixIcon: const Icon(
              Icons.search,
              color: ColorApp.black,
            ),
          ),
        ),
      ),
    );
  }
}
