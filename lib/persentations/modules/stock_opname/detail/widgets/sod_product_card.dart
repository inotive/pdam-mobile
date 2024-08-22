import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/helpers/date_formatter.dart';
import 'package:pdam_inventory/domain/model/stock_opname_model.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/custom_badge.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class SODProductCard extends StatelessWidget {
  const SODProductCard(this.product, {super.key});

  final StockOpnameProductData product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: ColorApp.greyD9,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: ColorApp.greyD9,
                ),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        product.name,
                        style: StyleApp.textNormal.copyWith(
                          fontWeight: FontWeight.w700,
                          color: ColorApp.blackText,
                        ),
                      ),
                    ),
                    const SpacerHeight(6),
                    Text(
                      product.code,
                      style: StyleApp.textSm.copyWith(
                        color: ColorApp.greyText,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                  color: ColorApp.greyD9,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          StringApp.stockSystem,
                          style: StyleApp.textSm.copyWith(
                            color: ColorApp.greyText,
                          ),
                        ),
                        Text(
                          '${product.lastStock} ${product.unitName}',
                          style: StyleApp.textNormal.copyWith(
                            fontWeight: FontWeight.w600,
                            color: ColorApp.blackText,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          StringApp.stockActual,
                          style: StyleApp.textSm.copyWith(
                            color: ColorApp.greyText,
                          ),
                        ),
                        Text(
                          '${product.actualStock} ${product.unitName}',
                          style: StyleApp.textNormal.copyWith(
                            fontWeight: FontWeight.w600,
                            color: ColorApp.blackText,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          StringApp.different,
                          style: StyleApp.textSm.copyWith(
                            color: ColorApp.greyText,
                          ),
                        ),
                        difference(),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            child: Row(
              children: [
                Text(
                  StringApp.manageAt,
                  style: StyleApp.textSm.copyWith(
                    color: ColorApp.greyText,
                  ),
                ),
                Expanded(
                  child: Text(
                    DateFormatterApp.formatIndoDate(product.createdAt),
                    style: StyleApp.textSm.copyWith(
                      color: ColorApp.greyText,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget difference() {
    if (product.difference == 0) {
      return CustomBadge(
        text: '${product.difference} ${product.unitName}',
        textColor: ColorApp.info,
        backgroundColor: ColorApp.infoBg,
      );
    } else if (product.difference > 1) {
      return CustomBadge(
        text: '${product.difference} ${product.unitName}',
        textColor: ColorApp.green,
        backgroundColor: ColorApp.greenBg,
      );
    } else if (product.difference < 1) {
      return CustomBadge(
        text: '${product.difference} ${product.unitName}',
        textColor: ColorApp.red,
        backgroundColor: ColorApp.redBg,
      );
    }
    {
      return CustomBadge(text: '${product.difference} ${product.unitName}');
    }
  }
}
