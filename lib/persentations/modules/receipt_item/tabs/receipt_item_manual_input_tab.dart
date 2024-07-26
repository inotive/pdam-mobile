import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/extensions.dart';
import 'package:pdam_inventory/data/params/receipt_produt_param.dart';
import 'package:pdam_inventory/domain/model/product_model.dart';
import 'package:pdam_inventory/domain/model/receive_order_model.dart';
import 'package:pdam_inventory/persentations/modules/receipt_item/viewmodel/receipt_viewmodel.dart';
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
  List<ReceiptProductParam> productParam = [];
  String? warehouse;
  bool isEnable = false;

  TextEditingController referenceController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  onAddProduct(ProductData data) {
    productItem.add(data);
    productParam.add(ReceiptProductParam(data.id, 1));
    widget._receiptViewmodel.setProductList(productParam);
    log("On Add Product ===> $productParam");
    setState(() {});
  }

  onRemove(ProductData data) {
    productItem.remove(data);
    productParam.removeWhere((item) => item.id.toString().contains(data.id.toString()));
    log("On Remove ===> $productParam");
    setState(() {});
  }

  onUpdateQuantity(ReceiptProductParam param) {
    if (productParam.isNotEmpty) {
      int index = productParam.indexWhere((item) => item.id.toString().contains(param.id.toString()));
      productParam.update(index, param);
      widget._receiptViewmodel.setProductList(productParam);
      log("On Update Quantity ===> $productParam");
    }
  }

  _bind() {
    referenceController.addListener(() => widget._receiptViewmodel.setRefferenceNumber(referenceController.text));
    noteController.addListener(() => widget._receiptViewmodel.setNote(noteController.text));
  }

  bool onEnable() {
    if (referenceController.text != '' && warehouse != null && productParam.isNotEmpty && noteController.text != '') {
      isEnable = true;
    }
    setState(() {});
    return isEnable;
  }

  @override
  void initState() {
    _bind();
    super.initState();
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
                        name: productItem[index].name,
                        image: productItem[index].image,
                        code: productItem[index].code,
                        onAdd: () {
                          productItem[index].qty.value++;
                          onUpdateQuantity(ReceiptProductParam(productItem[index].id, productItem[index].qty.value));
                        },
                        onRemove: () {
                          if (productItem[index].qty.value > 1) {
                            productItem[index].qty.value--;
                            onUpdateQuantity(ReceiptProductParam(productItem[index].id, productItem[index].qty.value));
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
            backgroundColor: isEnable ? ColorApp.white : ColorApp.border,
            textColor: isEnable ? ColorApp.primary : ColorApp.greyText,
            borderColor: isEnable ? ColorApp.primary : ColorApp.borderB3,
            onPressed: () {
              if (isEnable) {
                widget._receiptViewmodel.create(context);
              }
            },
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
            controller: referenceController,
            onChanged: (String? value) {
              onEnable();
            },
          ),
          const SpacerHeight(12),
          StreamBuilder<List<ReceiveOrderWarehouseData>>(
              stream: widget._receiptViewmodel.outputReceiveOrderWarehouse,
              builder: (context, snapshot) {
                List<ReceiveOrderWarehouseData> data = snapshot.data ?? List.empty();
                return InputDropdownWarehouse(
                  items: data,
                  text: StringApp.warehouse,
                  onChanged: (ReceiveOrderWarehouseData? value) {
                    warehouse = value?.id.toString() ?? '0';
                    onEnable();
                    widget._receiptViewmodel.setWarehouseId(value?.id.toString() ?? '0');
                  },
                  hint: StringApp.searchWarehouse,
                );
              }),
          const SpacerHeight(12),
          // StreamBuilder<List<ProductData>>(
          //     stream: widget._receiptViewmodel.outputProduct,
          //     builder: (context, snapshot) {
          //       List<ProductData> data = snapshot.data ?? List.empty();
          //       return InputDropdownProduct(
          //         items: data,
          //         text: StringApp.itemName,
          //         onChanged: (ProductData? value) {
          //           onAddProduct(value!);
          //           onEnable();
          //         },
          //         hint: StringApp.searchItem,
          //       );
          //     }),
          const SpacerHeight(12),
          InputField(
            text: StringApp.note,
            hint: StringApp.note,
            textStyle: StyleApp.textNormal.copyWith(),
            controller: noteController,
            onChanged: (String? value) {
              onEnable();
            },
          ),
        ],
      ),
    );
  }
}
