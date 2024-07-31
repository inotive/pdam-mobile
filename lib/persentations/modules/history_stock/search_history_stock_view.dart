import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/di.dart';
import 'package:pdam_inventory/persentations/modules/history_stock/viewmodel/history_stock_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/history_stock/widgets/stock_card.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/widgets/card/empty_card.dart';
import 'package:pdam_inventory/persentations/widgets/forms/search_input_field.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class SearchHistoryStockView extends StatefulWidget {
  const SearchHistoryStockView({super.key});

  @override
  State<SearchHistoryStockView> createState() => _SearchHistoryStockViewState();
}

class _SearchHistoryStockViewState extends State<SearchHistoryStockView> {
  final HistoryStockViewmodel _historyStockViewmodel = instance<HistoryStockViewmodel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            Flexible(
              child: SearchInputField(
                hint: StringApp.searchItem,
                onChanged: (String value) {
                  _historyStockViewmodel.search(value);
                },
              ),
            ),
            const SpacerWidth(16),
          ],
        ),
      ),
      body: ListView(
        children: [
          StreamBuilder(
            stream: _historyStockViewmodel.outputSearch,
            builder: (context, snapshot) {
              final data = snapshot.data ?? List.empty();

              if (data.isEmpty) {
                return const EmptyCard(
                  message: StringApp.historyStockNotYet,
                );
              }

              return Column(
                  children: data
                      .map(
                        (item) => StockCard(item),
                      )
                      .toList());
            },
          ),
        ],
      ),
    );
  }
}
