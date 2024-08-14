import 'package:flutter/material.dart';
import 'package:pdam_inventory/domain/model/stock_opname_model.dart';
import 'package:pdam_inventory/persentations/modules/stock_opname/detail/widgets/sod_product_card.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/widgets/card/empty_card.dart';

class SODInfomation extends StatelessWidget {
  const SODInfomation(
    this.products, {
    super.key,
  });

  final List<StockOpnameProductData> products;

  @override
  Widget build(BuildContext context) {
    return products.isNotEmpty
        ? SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: products.map((item) => SODProductCard(item)).toList()),
            ),
          )
        : const EmptyCard(message: StringApp.noDataProducts);
  }
}
