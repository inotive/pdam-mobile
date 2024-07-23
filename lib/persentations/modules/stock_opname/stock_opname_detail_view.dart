import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/extensions.dart';
import 'package:pdam_inventory/domain/model/stock_opname_model.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/custom_badge.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class StockOpnameDetailView extends StatelessWidget {
  const StockOpnameDetailView(this.data, {super.key});

  final StockOpnameData data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          StringApp.detailStockOpname,
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: ColorApp.border,
                ),
                top: BorderSide(
                  width: 1,
                  color: ColorApp.border,
                ),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        data.opnameNumber,
                        style: StyleApp.textXl.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SpacerWidth(6),
                    CustomBadge(text: data.status.toCapitalized()),
                  ],
                ),
                const SpacerHeight(16),
                _item(StringApp.timeBy, data.createdAt),
                const SpacerHeight(8),
                _item(StringApp.pic, data.createdBy),
                const SpacerHeight(8),
                _item(StringApp.productHasOpname, '${data.productCount} produk'),
                const SpacerHeight(8),
                _item(StringApp.timeDone, data.finishedDate),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _item(String name, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: StyleApp.textNormal.copyWith(
            color: ColorApp.greyText,
          ),
        ),
        Text(
          value,
          style: StyleApp.textNormal.copyWith(
            color: ColorApp.greyText,
          ),
        ),
      ],
    );
  }
}
