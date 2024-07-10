import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';

class StockOpnameView extends StatelessWidget {
  const StockOpnameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringApp.stockOpname),
      ),
    );
  }
}
