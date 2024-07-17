import 'package:flutter/material.dart';
import 'package:pdam_inventory/dummy/dummy_data.dart';
import 'package:pdam_inventory/persentations/modules/stock_opname/widgets/stock_opname_card.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/widgets/forms/input_dropdown.dart';

class StockOpnameView extends StatelessWidget {
  const StockOpnameView({super.key});

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
                child: Column(
                  children: [
                    StockOpnameCard(),
                    StockOpnameCard(),
                    StockOpnameCard(),
                  ],
                ),
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
}
