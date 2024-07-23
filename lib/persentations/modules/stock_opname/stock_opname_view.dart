import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/di.dart';
import 'package:pdam_inventory/domain/model/stock_opname_model.dart';
import 'package:pdam_inventory/dummy/dummy_data.dart';
import 'package:pdam_inventory/persentations/modules/stock_opname/viewmodel/stock_opname_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/stock_opname/widgets/stock_opname_card.dart';
import 'package:pdam_inventory/persentations/modules/stock_opname/widgets/stock_opname_skeleton.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/widgets/card/empty_card.dart';
import 'package:pdam_inventory/persentations/widgets/forms/input_dropdown.dart';

class StockOpnameView extends StatefulWidget {
  const StockOpnameView({super.key});

  @override
  State<StockOpnameView> createState() => _StockOpnameViewState();
}

class _StockOpnameViewState extends State<StockOpnameView> {
  final StockOpnameViewmodel _stockOpnameViewmodel = instance<StockOpnameViewmodel>();

  _bind() {
    _stockOpnameViewmodel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringApp.stockOpname),
      ),
      body: Column(
        children: [
          _dropdowns(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: StreamBuilder<List<StockOpnameData>>(
                    stream: _stockOpnameViewmodel.outputStockOpname,
                    builder: (context, snapshot) {
                      List<StockOpnameData> data = snapshot.data ?? List.empty();

                      if (ConnectionState.waiting == snapshot.connectionState) {
                        return const Column(
                          children: [
                            StockOpnameSkeleton(),
                            StockOpnameSkeleton(),
                            StockOpnameSkeleton(),
                          ],
                        );
                      }

                      if (data.isEmpty) {
                        return const EmptyCard(message: StringApp.stockOpnameNotYet);
                      }

                      return Column(
                        children: data.map((item) => StockOpnameCard(item)).toList(),
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _dropdowns() {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 6,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 16,
      ),
      decoration: const BoxDecoration(
        color: ColorApp.white,
        border: Border(
          bottom: BorderSide(
            color: ColorApp.border,
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          InputDropdown(
            items: opnameDropdowns,
            text: StringApp.stockOpname,
            onChanged: (String? value) {},
            hint: StringApp.allDataOpname,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _stockOpnameViewmodel.dispose();
    super.dispose();
  }
}
