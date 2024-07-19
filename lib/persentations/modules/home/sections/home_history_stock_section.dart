import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/di.dart';
import 'package:pdam_inventory/domain/model/history_stock_model.dart';
import 'package:pdam_inventory/dummy/dummy_data.dart';
import 'package:pdam_inventory/persentations/modules/history_stock/viewmodel/history_stock_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/history_stock/widgets/history_stock_skeleton.dart';
import 'package:pdam_inventory/persentations/modules/history_stock/widgets/status_card.dart';
import 'package:pdam_inventory/persentations/modules/history_stock/widgets/stock_card.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/route_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/button/custom_outline_button.dart';
import 'package:pdam_inventory/persentations/widgets/card/empty_card.dart';

class HomeHistoryStockSection extends StatefulWidget {
  const HomeHistoryStockSection({super.key});

  @override
  State<HomeHistoryStockSection> createState() => _HomeHistoryStockSectionState();
}

class _HomeHistoryStockSectionState extends State<HomeHistoryStockSection> {
  final HistoryStockViewmodel _historyStockViewmodel = instance<HistoryStockViewmodel>();

  int statusIndex = 1;

  onStatusTapped(int id) {
    setState(() {
      statusIndex = id;
    });
  }

  _bind() {
    _historyStockViewmodel.start();
  }

  @override
  void initState() {
    onStatusTapped(statusIndex);
    _bind();
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
        _content(),
        CustomOutlineButton(
          margin: const EdgeInsets.all(16.0),
          text: StringApp.seeMore,
          onPressed: () => Navigator.pushNamed(context, Routes.historyStock),
        ),
      ],
    );
  }

  Widget _content() {
    switch (statusIndex) {
      case 1:
        return StreamBuilder<List<HistoryStockData>>(
          stream: _historyStockViewmodel.outputAllHistoryStock,
          builder: (context, snapshot) {
            List<HistoryStockData> data = snapshot.data ?? List.empty();

            if (ConnectionState.waiting == snapshot.connectionState) {
              return const Column(
                children: [
                  HistoryStockSkeleton(),
                  HistoryStockSkeleton(),
                  HistoryStockSkeleton(),
                ],
              );
            }

            if (data.isEmpty) {
              return const EmptyCard(message: StringApp.historyStockNotYet);
            }

            return Column(
              children: data.map((item) => StockCard(item)).toList(),
            );
          },
        );
      case 2:
        return StreamBuilder<List<HistoryStockData>>(
          stream: _historyStockViewmodel.outputInHistoryStock,
          builder: (context, snapshot) {
            List<HistoryStockData> data = snapshot.data ?? List.empty();

            if (ConnectionState.waiting == snapshot.connectionState) {
              return const Column(
                children: [
                  HistoryStockSkeleton(),
                  HistoryStockSkeleton(),
                  HistoryStockSkeleton(),
                ],
              );
            }

            if (data.isEmpty) {
              return const EmptyCard(message: StringApp.historyStockNotYet);
            }

            return Column(
              children: data.map((item) => StockCard(item)).toList(),
            );
          },
        );
      case 3:
        return StreamBuilder<List<HistoryStockData>>(
          stream: _historyStockViewmodel.outputOutHistoryStock,
          builder: (context, snapshot) {
            List<HistoryStockData> data = snapshot.data ?? List.empty();

            if (ConnectionState.waiting == snapshot.connectionState) {
              return const Column(
                children: [
                  HistoryStockSkeleton(),
                  HistoryStockSkeleton(),
                  HistoryStockSkeleton(),
                ],
              );
            }

            if (data.isEmpty) {
              return const EmptyCard(message: StringApp.historyStockNotYet);
            }

            return Column(
              children: data.map((item) => StockCard(item)).toList(),
            );
          },
        );
      default:
        return Container();
    }
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
