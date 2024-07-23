import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/extensions.dart';
import 'package:pdam_inventory/app/helpers/date_formatter.dart';
import 'package:pdam_inventory/domain/model/product_model.dart';
import 'package:pdam_inventory/persentations/modules/product/viewmodel/product_detail_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/product/widgets/history_stock_card.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/card/empty_card.dart';

class ProductHistoryStockTab extends StatelessWidget {
  final ProductDetailViewmodel productDetailViewmodel;
  const ProductHistoryStockTab(this.productDetailViewmodel, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        child: StreamBuilder<List<ProductStockHistoryData>>(
            stream: productDetailViewmodel.outputProductStockHistory,
            builder: (context, snapshot) {
              List<ProductStockHistoryData> data = snapshot.data ?? List.empty();
              var groupedMapper = data.groupBy((obj) => obj.date);

              if (data.isEmpty) {
                return const EmptyCard(
                  message: StringApp.historyStockNotYet,
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...List.generate(groupedMapper.length, (idx) {
                    String date = groupedMapper.keys.elementAt(idx);
                    List<ProductStockHistoryData> items = groupedMapper[date] ?? List.empty();
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            DateFormatterApp.formatIndoDate(date),
                            style: StyleApp.textNormal.copyWith(
                              fontStyle: FontStyle.italic,
                              color: ColorApp.borderB3,
                            ),
                          ),
                          Column(
                            children: items.map((item) => HistoryStockCard(item)).toList(),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              );
            }),
      ),
    );
  }
}
