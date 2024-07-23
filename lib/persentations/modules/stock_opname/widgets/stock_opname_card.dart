import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:pdam_inventory/app/extensions.dart';
import 'package:pdam_inventory/domain/model/stock_opname_model.dart';
import 'package:pdam_inventory/persentations/modules/stock_opname/stock_opname_detail_view.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/custom_badge.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class StockOpnameCard extends StatelessWidget {
  const StockOpnameCard(this.data, {super.key});

  final StockOpnameData data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StockOpnameDetailView(data),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 1,
            color: ColorApp.border,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                border: DashedBorder(
                  dashLength: 8,
                  bottom: BorderSide(
                    width: 1,
                    color: ColorApp.border,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    data.opnameNumber,
                    style: StyleApp.textLg.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SpacerWidth(6),
                  const Icon(
                    Icons.chevron_right,
                    size: 16,
                  ),
                  const Spacer(),
                  CustomBadge(
                    text: data.status.toCapitalized(),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              child: Column(
                children: [
                  _item(StringApp.timeBy, data.createdAt),
                  const SpacerHeight(6),
                  _item(StringApp.pic, data.createdBy),
                  const SpacerHeight(6),
                  _item(StringApp.productHasOpname, '${data.productCount} Produk'),
                  const SpacerHeight(6),
                  _item(StringApp.timeDone, data.finishedDate),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _item(String name, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: StyleApp.textSm.copyWith(
            color: ColorApp.greyText,
          ),
        ),
        Text(
          value,
          style: StyleApp.textSm.copyWith(
            color: ColorApp.greyText,
          ),
        ),
      ],
    );
  }
}
