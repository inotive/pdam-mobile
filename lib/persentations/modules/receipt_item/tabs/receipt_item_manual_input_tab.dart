import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/extensions.dart';
import 'package:pdam_inventory/data/params/receipt_produt_param.dart';
import 'package:pdam_inventory/domain/model/product_model.dart';
import 'package:pdam_inventory/domain/model/receive_order_model.dart';
import 'package:pdam_inventory/persentations/modules/receipt_item/viewmodel/receipt_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/receipt_item/widgets/input_dropdown_product.dart';
import 'package:pdam_inventory/persentations/modules/receipt_item/widgets/input_dropdown_warehouse.dart';
import 'package:pdam_inventory/persentations/modules/receipt_item/widgets/receipt_item_card.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/button/custom_outline_button.dart';
import 'package:pdam_inventory/persentations/widgets/forms/input_field.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class ReceiptItemManualInputTab extends StatefulWidget {
  const ReceiptItemManualInputTab(this._receiptViewmodel, {super.key});

  final ReceiptViewmodel _receiptViewmodel;

  @override
  State<ReceiptItemManualInputTab> createState() => _ReceiptItemManualInputTabState();
}

class _ReceiptItemManualInputTabState extends State<ReceiptItemManualInputTab> {
  ValueNotifier<int> qty = ValueNotifier<int>(0);
  List<ProductData> productItem = [];
  List<ReceiptProdutParam> productParam = [];

  onAddProduct(ProductData data) {
    productItem.add(data);
    productParam.add(ReceiptProdutParam(data.id, 1));

    log("On Add Product ===> $productParam");
    setState(() {});
  }

  onRemove(ProductData data) {
    productItem.remove(data);
    productParam.removeWhere((item) => item.id.toString().contains(data.id.toString()));
    log("On Remove ===> $productParam");
    setState(() {});
  }

  onUpdateQuantity(ReceiptProdutParam param) {
    if (productParam.isNotEmpty) {
      int index = productParam.indexWhere((item) => item.id.toString().contains(param.id.toString()));
      productParam.update(index, param);
      log("On Update Quantity ===> $productParam");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _itemName(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(children: [
              ...List.generate(productItem.length, (index) {
                return ValueListenableBuilder<int>(
                    valueListenable: productItem[index].qty,
                    builder: (context, value, child) {
                      return ReceiptItemCard(
                        product: productItem[index],
                        onAdd: () {
                          productItem[index].qty.value++;
                          onUpdateQuantity(ReceiptProdutParam(productItem[index].id, productItem[index].qty.value));
                        },
                        onRemove: () {
                          if (productItem[index].qty.value > 1) {
                            productItem[index].qty.value--;
                            onUpdateQuantity(ReceiptProdutParam(productItem[index].id, productItem[index].qty.value));
                          } else {
                            onRemove(productItem[index]);
                          }
                        },
                        qty: productItem[index].qty.value.toString(),
                      );
                    });
              }),
            ]),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 1, color: ColorApp.border),
            ),
          ),
          child: CustomOutlineButton(
            text: StringApp.save,
            onPressed: () {},
          ),
        )
      ],
    );
  }

  Container _itemName() {
    return Container(
      margin: const EdgeInsets.only(
        top: 6,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 16,
      ),
      decoration: const BoxDecoration(
        color: ColorApp.white,
        border: Border(
          bottom: BorderSide(
            color: ColorApp.border,
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          InputField(
            text: StringApp.reference,
            hint: StringApp.reference,
            textStyle: StyleApp.textNormal.copyWith(),
          ),
          const SpacerHeight(12),
          StreamBuilder<List<ReceiveOrderWarehouseData>>(
              stream: widget._receiptViewmodel.outputReceiveOrderWarehouse,
              builder: (context, snapshot) {
                List<ReceiveOrderWarehouseData> data = snapshot.data ?? List.empty();
                return InputDropdownWarehouse(
                  items: data,
                  text: StringApp.warehouse,
                  onChanged: (ReceiveOrderWarehouseData? value) {},
                  hint: StringApp.searchWarehouse,
                );
              }),
          const SpacerHeight(12),
          StreamBuilder<List<ProductData>>(
              stream: widget._receiptViewmodel.outputProduct,
              builder: (context, snapshot) {
                List<ProductData> data = snapshot.data ?? List.empty();
                return InputDropdownProduct(
                  items: data,
                  text: StringApp.itemName,
                  onChanged: (ProductData? value) {
                    onAddProduct(value!);
                  },
                  hint: StringApp.searchItem,
                );
              }),
        ],
      ),
    );
  }
}
