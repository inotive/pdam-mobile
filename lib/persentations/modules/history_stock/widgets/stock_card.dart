import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/helpers/date_formatter.dart';
import 'package:pdam_inventory/domain/model/history_stock_model.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/custom_badge.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class StockCard extends StatelessWidget {
  const StockCard(this.data, {super.key});

  final HistoryStockData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: ColorApp.border,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: data.type == 'Masuk' ? ColorApp.greenBg : ColorApp.redBg,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              data.type == 'Masuk' ? Icons.arrow_downward : Icons.arrow_upward,
              color: data.type == 'Masuk' ? ColorApp.green : ColorApp.red,
            ),
          ),
          const SpacerWidth(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.productName,
                  style: StyleApp.textLg.copyWith(
                    color: ColorApp.blackText,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Row(
                    children: [
                      CustomBadge(
                        textColor: ColorApp.greyText,
                        backgroundColor: ColorApp.grey,
                        text: data.type == 'Masuk'
                            ? " + ${data.qty.toString()} Stock"
                            : " - ${data.qty.toString()} Stock",
                      ),
                      const SpacerWidth(8),
                      Expanded(
                        child: RichText(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: data.source,
                                style: StyleApp.textSm.copyWith(
                                  color: ColorApp.blackText,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: ' | ',
                                style: StyleApp.textSm.copyWith(
                                  color: ColorApp.borderB3,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: DateFormatterApp.formatIndoDate(data.createdAt),
                                style: StyleApp.textSm.copyWith(
                                  color: ColorApp.blackText,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    '${StringApp.totalInventory} ${data.currentStock}',
                    style: StyleApp.textSm.copyWith(
                      color: ColorApp.greyText,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
