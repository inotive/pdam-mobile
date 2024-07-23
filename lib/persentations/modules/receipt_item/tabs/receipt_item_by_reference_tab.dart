import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/extensions.dart';
import 'package:pdam_inventory/data/params/receipt_produt_param.dart';
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
  List<PurchaseRequestProduct> productItem = [];
  List<ReceiptProductParam> productParam = [];
  bool isEnable = false;
  String? warehouse;
  String? reference;

  late Timer _timer;

  TextEditingController noteController = TextEditingController();

  onAddReference(PurchaseRequest data) {
    widget.receiptViewmodel.referenceDetail(data.id);

    _timer = Timer(const Duration(seconds: 2), () {
      productItem = widget.receiptViewmodel.refProducts;
      productParam = widget.receiptViewmodel.refProductsParams;
      widget.receiptViewmodel.setProductList(productParam);
      // /setState(() {
      // });
      setState(() {});
    });
  }

  onUpdateQuantity(ReceiptProductParam param) {
    if (productParam.isNotEmpty) {
      int index = productParam.indexWhere((item) => item.id.toString().contains(param.id.toString()));
      productParam.update(index, param);
      widget.receiptViewmodel.setProductList(productParam);
      log("On Update Quantity ===> $productParam");
    }
  }

  onRemove(PurchaseRequestProduct data) {
    productItem.remove(data);
    productParam.removeWhere((item) => item.id.toString().contains(data.id.toString()));
    log("On Remove ===> $productParam");
    if (mounted) {
      setState(() {});
    }
  }

  bool onEnable() {
    if (reference != null && warehouse != null && productParam.isNotEmpty && noteController.text != '') {
      isEnable = true;
    }
    if (mounted) {
      setState(() {});
    }
    return isEnable;
  }

  _bind() {
    noteController.addListener(() => widget.receiptViewmodel.setNote(noteController.text));
    // widget.receiptViewmodel.isCreateSuccesfully.stream.listen((isSuccess) {
    //   if (isSuccess) {
    //     WidgetsBinding.instance.addPostFrameCallback((isNext) {
    //       SnackbarApp.topSnackbarSucces('Terima Barang berhasil disimpan', context);
    //       Navigator.pushNamed(context, Routes.acceptedItem);
    //     });
    //   }
    // });
  }

  @override
  void initState() {
    _bind();
    if (mounted) {
      super.initState();
    }
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
                  int parseQty = int.parse(productItem[index].qty);
                  ValueNotifier<int> qty = ValueNotifier<int>(parseQty);
                  return ValueListenableBuilder<int>(
                      valueListenable: qty,
                      builder: (context, value, child) {
                        return ReceiptItemCard(
                          name: productItem[index].name,
                          code: productItem[index].code,
                          image: "https://pdam.inotivedev.com/images/package.png",
                          onAdd: () {
                            // ignore: unused_local_variable
                            qty.value++;
                            onUpdateQuantity(ReceiptProductParam(productItem[index].id, qty.value));
                          },
                          onRemove: () {
                            if (qty.value > 1) {
                              qty.value--;
                              onUpdateQuantity(ReceiptProductParam(productItem[index].id, qty.value));
                            } else {
                              onRemove(productItem[index]);
                            }
                          },
                          qty: qty.value.toString(),
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
            backgroundColor: isEnable ? ColorApp.white : ColorApp.border,
            textColor: isEnable ? ColorApp.primary : ColorApp.greyText,
            borderColor: isEnable ? ColorApp.primary : ColorApp.borderB3,
            onPressed: () {
              if (isEnable) {
                _timer.cancel();
                widget.receiptViewmodel.create();
              }
            },
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
          StreamBuilder<List<PurchaseRequest>>(
              stream: widget.receiptViewmodel.outputReference,
              builder: (context, snapshot) {
                List<PurchaseRequest> data = snapshot.data ?? List.empty();
                return InputDropdownReference(
                  items: data,
                  text: StringApp.reference,
                  onChanged: (PurchaseRequest? value) {
                    onAddReference(value!);
                    reference = value.requestNumber;
                    onEnable();
                    widget.receiptViewmodel.setRefferenceNumber(value.requestNumber.toString());
                  },
                  hint: StringApp.referenceHint,
                );
              }),
          const SpacerHeight(12),
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

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
