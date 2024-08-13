import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/extensions.dart';
import 'package:pdam_inventory/domain/model/stock_opname_model.dart';
import 'package:pdam_inventory/persentations/modules/stock_opname/stock_opname_detail_view.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/resources/value_app.dart';
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
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ColorApp.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 8,
              color: ColorApp.black.withOpacity(0.08),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  data.opnameNumber,
                  style: StyleApp.textLg.copyWith(
                    fontWeight: FontWeight.w700,
                    fontFamily: FontFamilyApp.inter,
                  ),
                ),
                const Spacer(),
                CustomBadge(
                  text: data.status.toCapitalized(),
                ),
              ],
            ),
            const SpacerHeight(16),
            Column(
              children: [
                _item(StringApp.timeBy, data.createdAt),
                const SpacerHeight(8),
                _item(StringApp.pic, data.createdBy),
                const SpacerHeight(8),
                _item(StringApp.productHasOpname, '${data.productCount} Produk'),
                const SpacerHeight(8),
                _item(StringApp.timeDone, data.finishedDate),
              ],
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
            color: ColorApp.greyText8D,
            fontFamily: FontFamilyApp.inter,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: StyleApp.textSm.copyWith(
            color: ColorApp.black,
            fontFamily: FontFamilyApp.inter,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
