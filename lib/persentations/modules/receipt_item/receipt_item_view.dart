import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/di.dart';
import 'package:pdam_inventory/app/extensions.dart';
import 'package:pdam_inventory/app/helpers/helpers.dart';
import 'package:pdam_inventory/data/local_source/app_preference.dart';
import 'package:pdam_inventory/data/params/receipt_produt_param.dart';
import 'package:pdam_inventory/domain/model/purchase_request_model.dart';
import 'package:pdam_inventory/domain/model/receive_order_model.dart';
import 'package:pdam_inventory/domain/model/vendor_model.dart';
import 'package:pdam_inventory/persentations/modules/receipt_item/viewmodel/receipt_viewmodel.dart';
import 'package:pdam_inventory/persentations/widgets/forms/input_dropdown_product.dart';
import 'package:pdam_inventory/persentations/modules/receipt_item/widgets/input_dropdown_reference.dart';
import 'package:pdam_inventory/persentations/modules/receipt_item/widgets/input_dropdown_vendor.dart';
import 'package:pdam_inventory/persentations/modules/receipt_item/widgets/receipt_item_card.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/resources/value_app.dart';
import 'package:pdam_inventory/persentations/widgets/button/custom_button.dart';
import 'package:pdam_inventory/persentations/widgets/card/empty_card.dart';
import 'package:pdam_inventory/persentations/widgets/forms/dropdown_warehouse/dropdown_warehouse.dart';
import 'package:pdam_inventory/persentations/widgets/forms/file_input.dart';
import 'package:pdam_inventory/persentations/widgets/forms/input_field.dart';
import 'package:pdam_inventory/persentations/widgets/snackbar_app.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class ReceiptItemView extends StatefulWidget {
  const ReceiptItemView({super.key});

  @override
  State<ReceiptItemView> createState() => _ReceiptItemViewState();
}

class _ReceiptItemViewState extends State<ReceiptItemView> with SingleTickerProviderStateMixin {
  final ReceiptViewmodel _receiptViewmodel = instance<ReceiptViewmodel>();
  final AppPreference _appPreference = instance<AppPreference>();

  List<PurchaseRequestProduct> productItem = [];
  List<ReceiptProductParam> productParam = [];

  late TabController _tabController;

  bool isEnable = false;
  File? file;

  ReceiveOrderWarehouseData? warehouse;
  // ReceiveOrderSupplierData? supplier;
  VendorDataModel? supplier;

  TextEditingController referenceController = TextEditingController();
  TextEditingController createdByController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  bool onEnable() {
    if (supplier != null && warehouse != null && productParam.isNotEmpty && noteController.text != '') {
      isEnable = true;
    }
    setState(() {});
    return isEnable;
  }

  _bind() {
    _receiptViewmodel.start();
    _receiptViewmodel.setRefferenceNumber(HelperApp.generateRandomString(12));
    _appPreference.getString(PREFS_KEY_NAME).then((value) {
      createdByController.text = value;
    });
    noteController.addListener(() => _receiptViewmodel.setNote(noteController.text));
  }

  @override
  void initState() {
    _bind();
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      file = File(result.files.single.path!);
      _receiptViewmodel.setFile(file!);
    } else {
      // User canceled the picker
      // ignore: use_build_context_synchronously
      SnackbarApp.topSnackbarError('No Image Selected', context);
    }
  }

  onAddProduct(PurchaseRequestProduct data) {
    log("Product ===> ${data.qty}");
    productItem.add(data);
    productParam.add(ReceiptProductParam(data.id, 1));
    _receiptViewmodel.setProductList(productParam);
    log("On Add Product ===> $productParam");
    setState(() {});
  }

  onAddReference(PurchaseRequest data) {
    _receiptViewmodel.referenceDetail(data.id);

    Timer(const Duration(seconds: 2), () {
      productItem = _receiptViewmodel.refProducts;
      productParam = _receiptViewmodel.refProductsParams;
      _receiptViewmodel.setProductList(productParam);

      setState(() {});
    });
  }

  onUpdateQuantity(ReceiptProductParam param) {
    if (productParam.isNotEmpty) {
      int index = productParam.indexWhere((item) => item.id.toString().contains(param.id.toString()));
      productParam.update(index, param);
      _receiptViewmodel.setProductList(productParam);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringApp.receiveItem),
      ),
      body: StreamBuilder<FlowState>(
        stream: _receiptViewmodel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidgets(), () => _bind()) ?? _getContentWidgets();
        },
      ),
    );
  }

  Column _getContentWidgets() {
    return Column(
      children: [
        _tabbar(),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _detail(),
              _withoutReference(),
              _byReference(),
            ],
          ),
        ),
      ],
    );
  }

  Container _byReference() {
    return Container(
      decoration: const BoxDecoration(
        color: ColorApp.background,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: ColorApp.white,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 1),
                  blurRadius: 6,
                  color: ColorApp.black.withOpacity(0.08),
                ),
              ],
            ),
            child: Column(
              children: [
                StreamBuilder<List<PurchaseRequest>>(
                    stream: _receiptViewmodel.outputReference,
                    builder: (context, snapshot) {
                      List<PurchaseRequest> data = snapshot.data ?? List.empty();
                      return InputDropdownReference(
                        items: data,
                        text: StringApp.reference,
                        onChanged: (PurchaseRequest? value) {
                          onAddReference(value!);
                          // reference = value.requestNumber;
                          onEnable();
                          _receiptViewmodel.setRefferenceNumber(value.requestNumber.toString());
                        },
                        hint: StringApp.referenceHint,
                      );
                    }),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringApp.listItem,
                      style: StyleApp.textNormal.copyWith(
                        fontWeight: FontWeight.w600,
                        fontFamily: FontFamilyApp.inter,
                      ),
                    ),
                    const SpacerHeight(16),
                    if (productItem.isNotEmpty)
                      ...List.generate(productItem.length, (index) {
                        // int parseQty = int.parse(productItem[index].qty);
                        ValueNotifier<int> qty = ValueNotifier<int>(1);
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
                      })
                    else
                      const EmptyCard(
                        message: StringApp.productNotYet,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _withoutReference() {
    return Container(
      decoration: const BoxDecoration(
        color: ColorApp.background,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: ColorApp.white,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 1),
                  blurRadius: 6,
                  color: ColorApp.black.withOpacity(0.08),
                ),
              ],
            ),
            child: Column(
              children: [
                StreamBuilder<List<PurchaseRequestProduct>>(
                    stream: _receiptViewmodel.outputProduct,
                    builder: (context, snapshot) {
                      List<PurchaseRequestProduct> data = snapshot.data ?? List.empty();
                      return InputDropdownProduct(
                        items: data,
                        text: StringApp.itemName,
                        onChanged: (PurchaseRequestProduct? value) {
                          onAddProduct(value!);
                          onEnable();
                        },
                        hint: StringApp.searchItem,
                      );
                    }),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringApp.listItem,
                      style: StyleApp.textNormal.copyWith(
                        fontWeight: FontWeight.w600,
                        fontFamily: FontFamilyApp.inter,
                      ),
                    ),
                    const SpacerHeight(16),
                    if (productItem.isNotEmpty)
                      ...List.generate(productItem.length, (index) {
                        ValueNotifier<int> qty = ValueNotifier<int>(1);
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
                      })
                    else
                      const EmptyCard(
                        message: StringApp.productNotYet,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _detail() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            InputField(
              text: StringApp.reference,
              hint: 'Otomatis',
              controller: referenceController,
              enabled: false,
              onChanged: (String? value) {},
            ),
            const SpacerHeight(12),
            InputField(
              text: StringApp.createdBy,
              hint: StringApp.createdBy,
              controller: createdByController,
              enabled: false,
              onChanged: (String? value) {
                onEnable();
              },
            ),
            const SpacerHeight(12),
            // StreamBuilder<List<ReceiveOrderSupplierData>>(
            //     stream: _receiptViewmodel.outputSupplier,
            //     builder: (context, snapshot) {
            //       List<ReceiveOrderSupplierData> data = snapshot.data ?? List.empty();
            //       return InputDropdownSupplier(
            //         items: data,
            //         text: StringApp.supplier,
            //         value: supplier,
            //         onChanged: (ReceiveOrderSupplierData? value) {
            //           supplier = value;
            //           onEnable();
            //           _receiptViewmodel.setSupplierId(value?.id.toString() ?? '0');
            //         },
            //         hint: StringApp.searchSupplier,
            //       );
            //     }),
            StreamBuilder<List<VendorDataModel>>(
                stream: _receiptViewmodel.outputVendor,
                builder: (context, snapshot) {
                  List<VendorDataModel> data = snapshot.data ?? List.empty();
                  return InputDropdownVendor(
                    items: data,
                    text: StringApp.supplier,
                    value: supplier,
                    onChanged: (VendorDataModel? value) {
                      supplier = value;
                      onEnable();
                      _receiptViewmodel.setSupplierId(value?.id.toString() ?? '0');
                    },
                    hint: StringApp.searchSupplier,
                  );
                }),
            const SpacerHeight(12),
            DropdownWarehouse(
              selectedValue: warehouse,
              onChanged: (ReceiveOrderWarehouseData? value) {
                warehouse = value;
                onEnable();
                _receiptViewmodel.setWarehouseId(value?.id.toString() ?? '0');
                _receiptViewmodel.products(value?.id ?? 0);
              },
            ),
            const SpacerHeight(12),
            FileInput(
              file: file,
              onTap: () {
                pickFile();
              },
            ),
            const SpacerHeight(12),
            InputField(
              text: StringApp.note,
              hint: StringApp.note,
              maxLines: 4,
              controller: noteController,
              onChanged: (String? value) {
                onEnable();
              },
            ),
            const SpacerHeight(24),
            CustomButton(
              text: StringApp.saveData,
              backgroundColor: isEnable ? ColorApp.blue : ColorApp.greyD9,
              onPressed: () {
                if (isEnable) {
                  _receiptViewmodel.create(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  TabBar _tabbar() {
    return TabBar(
      controller: _tabController,
      dividerColor: ColorApp.borderEB,
      indicatorColor: ColorApp.primary,
      indicatorWeight: 1,
      indicatorSize: TabBarIndicatorSize.tab,
      isScrollable: true,
      padding: EdgeInsets.zero,
      tabAlignment: TabAlignment.start,
      labelStyle: StyleApp.prompt.copyWith(
        fontWeight: FontWeight.w500,
        fontFamily: FontFamilyApp.inter,
      ),
      unselectedLabelStyle: StyleApp.prompt.copyWith(
        fontFamily: FontFamilyApp.inter,
        fontWeight: FontWeight.w500,
        color: ColorApp.blackText.withOpacity(0.5),
      ),
      tabs: const [
        Tab(
          text: StringApp.detail,
        ),
        Tab(
          text: StringApp.withoutReference,
        ),
        Tab(
          text: StringApp.byReference,
        ),
      ],
    );
  }
}
