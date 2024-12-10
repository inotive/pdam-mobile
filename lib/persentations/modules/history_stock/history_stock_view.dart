import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/di.dart';
import 'package:pdam_inventory/domain/model/history_stock_model.dart';
import 'package:pdam_inventory/dummy/dummy_data.dart';
import 'package:pdam_inventory/dummy/dummy_model.dart';
import 'package:pdam_inventory/persentations/modules/history_stock/viewmodel/history_stock_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/history_stock/widgets/history_stock_skeleton.dart';
import 'package:pdam_inventory/persentations/modules/history_stock/widgets/status_card.dart';
import 'package:pdam_inventory/persentations/modules/history_stock/widgets/stock_card.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/route_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/widgets/card/empty_card.dart';
import 'package:pdam_inventory/persentations/widgets/forms/search_input_field.dart';

class HistoryStockView extends StatefulWidget {
  const HistoryStockView({super.key});

  @override
  State<HistoryStockView> createState() => _HistoryStockViewState();
}

class _HistoryStockViewState extends State<HistoryStockView> {
  final HistoryStockViewmodel _historyStockViewmodel = instance<HistoryStockViewmodel>();

  int statusIndex = 1;

  List<ProductModel> productsItems = [];

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
    return Scaffold(
      appBar: _appBar(),
      body: StreamBuilder<FlowState>(
          stream: _historyStockViewmodel.outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(context, _getContentWidgets(), () => _bind()) ?? _getContentWidgets();
          }),
    );
  }

  Column _getContentWidgets() {
    return Column(
      children: [
        _status(),
        Expanded(
          child: SingleChildScrollView(
            child: _content(),
          ),
        )
      ],
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

  AppBar _appBar() {
    return AppBar(
      title: const Text(StringApp.historyStock),
      // actions: [
      // GestureDetector(
      //   onTap: () {},
      //   child: SvgPicture.asset(
      //     IconApp.filter,
      //   ),
      // ),
      // const SpacerWidth(16),
      // ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: SearchInputField(
            hint: StringApp.searchItem,
            readOnly: true,
            onTap: () => Navigator.pushNamed(context, Routes.searchHistoryStock),
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
