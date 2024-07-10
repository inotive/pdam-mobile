import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/modules/product/widgets/history_stock_card.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';

class ProductHistoryStockTab extends StatelessWidget {
  const ProductHistoryStockTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '6 Jul 2024',
                    style: StyleApp.textNormal.copyWith(
                      fontStyle: FontStyle.italic,
                      color: ColorApp.borderB3,
                    ),
                  ),
                  const HistoryStockCard(),
                  const HistoryStockCard(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '5 Jul 2024',
                    style: StyleApp.textNormal.copyWith(
                      fontStyle: FontStyle.italic,
                      color: ColorApp.borderB3,
                    ),
                  ),
                  const HistoryStockCard(),
                  const HistoryStockCard(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '4 Jul 2024',
                    style: StyleApp.textNormal.copyWith(
                      fontStyle: FontStyle.italic,
                      color: ColorApp.borderB3,
                    ),
                  ),
                  const HistoryStockCard(),
                  const HistoryStockCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
