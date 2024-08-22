import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:pdam_inventory/app/helpers/currency_formatter.dart';
import 'package:pdam_inventory/app/helpers/date_formatter.dart';
import 'package:pdam_inventory/domain/model/purchase_order_model.dart';
import 'package:pdam_inventory/persentations/modules/purchase_item/purchase/widgets/purchase_detail_text_item.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/custom_cached_network_image.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class PurchaseDetailPoTab extends StatelessWidget {
  const PurchaseDetailPoTab({super.key, required this.data});

  final PurchaseOrderDetailData? data;

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
              'Rp. 0',
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
            value: 'Rp. 0',
          ),
          SpacerHeight(12.0),
          PurchaseDetailTextItem(
            name: StringApp.discount,
            value: '(10%) - Rp. 0',
          ),
          SpacerHeight(12.0),
          PurchaseDetailTextItem(
            name: StringApp.delivery,
            value: '+ Rp. 0',
          ),
          SpacerHeight(12.0),
          PurchaseDetailTextItem(
            name: StringApp.tax,
            value: '+ Rp. 0',
          ),
        ],
      ),
    );
  }

  Padding _products() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: data?.products
                ?.map((product) => _productItem(
                      product.image,
                      product.name,
                      product.qty,
                      product.unitName,
                      int.parse(product.price),
                    ))
                .toList() ??
            [],
      ),
    );
  }

  Row _productItem(String imageUrl, String name, String stock, String unitName, int price) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomNetworkImage(
          height: 40,
          width: 40,
          url: imageUrl,
        ),
        const SpacerWidth(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: StyleApp.textNormal.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '$stock $unitName',
                style: StyleApp.textSm.copyWith(
                  color: ColorApp.greyText,
                ),
              ),
            ],
          ),
        ),
        const SpacerWidth(6),
        Text(
          CurrencyFormatterApp.rupiahFormat(price),
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          PurchaseDetailTextItem(
            name: StringApp.referenceNomor,
            value: data?.detail?.requestNumber ?? EMPTY,
          ),
          const SpacerHeight(12.0),
          PurchaseDetailTextItem(
            name: StringApp.transactionDate,
            value: data?.detail?.createdAt == EMPTY ? "-" : DateFormatterApp.formatIndoDate(data?.detail?.createdAt),
          ),
          const SpacerHeight(12.0),
          PurchaseDetailTextItem(
            name: StringApp.supplier,
            value: data?.detail?.departmentName ?? EMPTY,
          ),
          const SpacerHeight(12.0),
          PurchaseDetailTextItem(
            name: StringApp.status,
            value: data?.detail?.status ?? EMPTY,
          ),
          const SpacerHeight(12.0),
          PurchaseDetailTextItem(
            name: StringApp.createdBy,
            value: data?.detail?.requestName ?? EMPTY,
          ),
        ],
      ),
    );
  }
}
