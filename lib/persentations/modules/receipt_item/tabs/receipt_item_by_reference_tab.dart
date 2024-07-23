import 'package:flutter/material.dart';
import 'package:pdam_inventory/data/params/receipt_produt_param.dart';
import 'package:pdam_inventory/domain/model/product_model.dart';
import 'package:pdam_inventory/domain/model/purchase_request_model.dart';
import 'package:pdam_inventory/domain/model/receive_order_model.dart';
import 'package:pdam_inventory/persentations/modules/receipt_item/viewmodel/receipt_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/receipt_item/widgets/input_dropdown_reference.dart';
import 'package:pdam_inventory/persentations/modules/receipt_item/widgets/input_dropdown_warehouse.dart';
import 'package:pdam_inventory/persentations/modules/receipt_item/widgets/receipt_item_card.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/button/custom_outline_button.dart';
import 'package:pdam_inventory/persentations/widgets/forms/input_field.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class ReceiptItemByReferenceTab extends StatefulWidget {
  const ReceiptItemByReferenceTab(this.receiptViewmodel, {super.key});

  final ReceiptViewmodel receiptViewmodel;

  @override
  State<ReceiptItemByReferenceTab> createState() => _ReceiptItemByReferenceTabState();
}

class _ReceiptItemByReferenceTabState extends State<ReceiptItemByReferenceTab> {
  List<ProductData> productItem = [];
  List<ReceiptProductParam> productParam = [];
  bool isEnable = false;
  String? warehouse;
  String? reference;

  TextEditingController noteController = TextEditingController();

  bool onEnable() {
    if (reference != null && warehouse != null && productParam.isNotEmpty && noteController.text != '') {
      isEnable = true;
    }
    setState(() {});
    return isEnable;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _form(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...List.generate(productItem.length, (index) {
                  return ValueListenableBuilder<int>(
                      valueListenable: productItem[index].qty,
                      builder: (context, value, child) {
                        return ReceiptItemCard(
                          product: productItem[index],
                          onAdd: () {
                            productItem[index].qty.value++;
                            // onUpdateQuantity(ReceiptProductParam(productItem[index].id, productItem[index].qty.value));
                          },
                          onRemove: () {
                            if (productItem[index].qty.value > 1) {
                              productItem[index].qty.value--;
                              // onUpdateQuantity(ReceiptProductParam(productItem[index].id, productItem[index].qty.value));
                            } else {
                              // onRemove(productItem[index]);
                            }
                          },
                          qty: productItem[index].qty.value.toString(),
                        );
                      });
                }),
              ],
            ),
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

  Container _form() {
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
          StreamBuilder<List<ReceiveOrderWarehouseData>>(
              stream: widget.receiptViewmodel.outputReceiveOrderWarehouse,
              builder: (context, snapshot) {
                List<ReceiveOrderWarehouseData> data = snapshot.data ?? List.empty();
                return InputDropdownWarehouse(
                  items: data,
                  text: StringApp.warehouse,
                  onChanged: (ReceiveOrderWarehouseData? value) {
                    warehouse = value?.id.toString() ?? '0';
                    onEnable();
                    widget.receiptViewmodel.setWarehouseId(value?.id.toString() ?? '0');
                  },
                  hint: StringApp.searchWarehouse,
                );
              }),
          const SpacerHeight(12),
          StreamBuilder<List<PurchaseRequest>>(
              stream: widget.receiptViewmodel.outputReference,
              builder: (context, snapshot) {
                List<PurchaseRequest> data = snapshot.data ?? List.empty();
                return InputDropdownReference(
                  items: data,
                  text: StringApp.reference,
                  onChanged: (PurchaseRequest? value) {
                    reference = value?.requestNumber;
                    onEnable();
                    widget.receiptViewmodel.setRefferenceNumber(value?.requestNumber.toString() ?? '0');
                  },
                  hint: StringApp.referenceHint,
                );
              }),
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
