import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/modules/stock_opname/create_stock_opname/create_stock_opname_view.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/button/custom_button.dart';
import 'package:pdam_inventory/persentations/widgets/button/custom_outline_button.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

void confirmCreateBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    builder: (context) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(16, 32, 24, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              StringApp.confirmCreateOpname,
              style: StyleApp.textSm.copyWith(
                color: ColorApp.greyTextA5,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Text(
                "${StringApp.areYouSure}?",
                style: StyleApp.text2xl.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            CustomButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateStockOpnameView()));
              },
              text: StringApp.yesCreateOpname,
            ),
            const SpacerHeight(10),
            CustomOutlineButton(
              text: StringApp.cancelled,
              onPressed: () {
                Navigator.pop(context);
              },
              textColor: ColorApp.red,
              borderColor: ColorApp.red,
            ),
          ],
        ),
      );
    },
  );
}
