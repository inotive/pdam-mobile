import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:pdam_inventory/persentations/modules/purchase_item/widgets/purchase_detail_text_item.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/custom_cached_network_image.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class PurchaseDetailPoTab extends StatelessWidget {
  const PurchaseDetailPoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _detail(),
          _divider(),
          _products(),
          _divider(),
          _transaction(),
          _dividerDashed(),
          _totals(),
        ],
      ),
    );
  }

  Padding _totals() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              StringApp.total,
              style: StyleApp.textNormal.copyWith(
                color: ColorApp.greyText,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Text(
            ':',
            style: StyleApp.textNormal.copyWith(
              color: ColorApp.greyText,
              fontWeight: FontWeight.w700,
            ),
          ),
          Expanded(
            child: Text(
              'Rp. 919.000',
              style: StyleApp.textNormal.copyWith(
                color: ColorApp.greyText,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Container _dividerDashed() {
    return Container(
      width: double.infinity,
      height: 1,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        border: DashedBorder(
          dashLength: 4,
          top: BorderSide(
            width: 1,
            color: ColorApp.border,
          ),
        ),
      ),
    );
  }

  Padding _transaction() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          PurchaseDetailTextItem(
            name: StringApp.subtotal,
            value: 'Rp. 900.000',
          ),
          SpacerHeight(12.0),
          PurchaseDetailTextItem(
            name: StringApp.discount,
            value: '(10%) - Rp. 900.000',
          ),
          SpacerHeight(12.0),
          PurchaseDetailTextItem(
            name: StringApp.delivery,
            value: '+ Rp. 100.000',
          ),
          SpacerHeight(12.0),
          PurchaseDetailTextItem(
            name: StringApp.tax,
            value: '+ Rp. 9.900',
          ),
        ],
      ),
    );
  }

  Padding _products() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _productItem(),
          const SpacerHeight(12),
          _productItem(),
          const SpacerHeight(12),
          _productItem(),
        ],
      ),
    );
  }

  Row _productItem() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomNetworkImage(
          height: 40,
          width: 40,
          url:
              'https://s3-alpha-sig.figma.com/img/492e/aef3/023115226ab55879588194128edabbc1?Expires=1721001600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=OnXPf31kgmeL~gM8cTP9dL8PnLe4oQCbdX0jMbpDosf1oqFDqv58bdrROmGmjQ8UbQQJtg2Vxx7qRU8jrZmpe7UyqzxNsXWzra44GZgC3yHUN3C1U~2fspWALUJGpSsFURhwUZAxrmAcw2knUZbxes21PEm2GoCT0WGlZUsjYaIN4nZvGsWRTJyv2mH9kF6XkoGCQR7jimrN9fVq9UBVccvjhtqM4lB0a57PceczQKpa9r6YlBjPhZXN6Rsza9ZlCrlcWgwhoO9WfFdbhbQzqcK-qYjBLcm5lOnygRyoWaimV7sKrR~abaMVz2qFQY9GIZ0RYtK9XamKOOfqOgrzaw__',
        ),
        const SpacerWidth(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Equal Tee Coupler hdpe 75mm",
                style: StyleApp.textNormal.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '3 Buah',
                style: StyleApp.textSm.copyWith(
                  color: ColorApp.greyText,
                ),
              ),
            ],
          ),
        ),
        const SpacerWidth(6),
        Text(
          'Rp 300.000',
          style: StyleApp.textNormal.copyWith(
            color: ColorApp.greyText,
          ),
        ),
      ],
    );
  }

  Padding _divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Divider(
        color: ColorApp.border,
      ),
    );
  }

  Padding _detail() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          PurchaseDetailTextItem(
            name: StringApp.referenceNomor,
            value: '2145672FDSFW',
          ),
          SpacerHeight(12.0),
          PurchaseDetailTextItem(
            name: StringApp.transactionDate,
            value: '06 Juli 2024',
          ),
          SpacerHeight(12.0),
          PurchaseDetailTextItem(
            name: StringApp.supplier,
            value: '200658',
          ),
          SpacerHeight(12.0),
          PurchaseDetailTextItem(
            name: StringApp.status,
            value: 'Menunggu Persetujuan',
          ),
          SpacerHeight(12.0),
          PurchaseDetailTextItem(
            name: StringApp.createdBy,
            value: 'Samantha Cole',
          ),
        ],
      ),
    );
  }
}
