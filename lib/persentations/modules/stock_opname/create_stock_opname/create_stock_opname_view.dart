import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/di.dart';
import 'package:pdam_inventory/app/extensions.dart';
import 'package:pdam_inventory/app/helpers/code_formatter.dart';
import 'package:pdam_inventory/data/params/stock_opname_product_param.dart';
import 'package:pdam_inventory/domain/model/purchase_request_model.dart';
import 'package:pdam_inventory/domain/model/receive_order_model.dart';
import 'package:pdam_inventory/domain/model/stock_opname_model.dart';
import 'package:pdam_inventory/persentations/modules/receipt_item/widgets/receipt_item_card.dart';
import 'package:pdam_inventory/persentations/modules/stock_opname/create_stock_opname/viewmodel/create_stock_opname_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/stock_opname/detail/widgets/sod_product_card.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/value_app.dart';
import 'package:pdam_inventory/persentations/widgets/button/custom_button.dart';
import 'package:pdam_inventory/persentations/widgets/button/custom_outline_button.dart';
import 'package:pdam_inventory/persentations/widgets/card/empty_card.dart';
import 'package:pdam_inventory/persentations/widgets/dialog/confirm_dialog.dart';
import 'package:pdam_inventory/persentations/widgets/forms/dropdown_warehouse/dropdown_warehouse.dart';
import 'package:pdam_inventory/persentations/widgets/forms/input_dropdown_product.dart';
import 'package:pdam_inventory/persentations/widgets/forms/input_field.dart';
import 'package:pdam_inventory/persentations/widgets/picker/date_picker.dart';
import 'package:pdam_inventory/persentations/widgets/snackbar_app.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../app/helpers/date_formatter.dart';
import '../../../resources/route_app.dart';
import '../../../resources/style_app.dart';

class CreateStockOpnameView extends StatefulWidget {
  const CreateStockOpnameView({super.key});

  @override
  State<CreateStockOpnameView> createState() => _CreateStockOpnameViewState();
}

class _CreateStockOpnameViewState extends State<CreateStockOpnameView> with TickerProviderStateMixin {
  final CreateStockOpnameViewmodel _stockOpnameViewmodel = instance<CreateStockOpnameViewmodel>();

  late TabController _tabController;

  final TextEditingController _requestedDateController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  int initialIndex = 0;
  DateTime selectedDate = DateTime.now();

  ReceiveOrderWarehouseData? warehouse;
  PurchaseRequestProduct? selectedProduct;
  StockOpnameProductData? selectedProductOpname;

  List<StockOpnameProductData> products = [];

  onContinue() {
    if (formKey.currentState!.validate()) {
      if (warehouse == null) {
        SnackbarApp.topSnackbarError(StringApp.warehouseValidation, context);
      } else {
        setState(() {
          _tabController.animateTo(1);
          initialIndex = 1;
        });
      }
    }
  }

  _bind() {
    _stockOpnameViewmodel.setOpnameNumber(CodeFormatterApp.stockOpname());
    _noteController.addListener(() {
      _stockOpnameViewmodel.setDescription(_noteController.text);
    });
    _stockOpnameViewmodel.isCreateSuccesfully.stream.listen((isSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, Routes.stockOpname);
      });
    });
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: initialIndex);
    _bind();
    super.initState();
  }

  onSubmit() {
    if (products.isEmpty) {
      SnackbarApp.topSnackbarError(StringApp.youNotAddedProduct, context);
    } else {
      _stockOpnameViewmodel.setProducts(
          products.map((item) => StockOpnameProductParam(item.id, item.lastStock, item.actualStock)).toList());
      _stockOpnameViewmodel.create();
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
        stream: _stockOpnameViewmodel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidgets(), () {}) ?? _getContentWidgets();
        });
  }

  Scaffold _getContentWidgets() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock Opname'),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: ColorApp.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
              text: initialIndex == 0 ? StringApp.continueText : StringApp.save,
              onPressed: () {
                if (initialIndex == 0) {
                  onContinue();
                } else {
                  onSubmit();
                }
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          _tabbar(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _form(),
                _products(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _products() {
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
                    stream: _stockOpnameViewmodel.outputProduct,
                    builder: (context, snapshot) {
                      List<PurchaseRequestProduct> data = snapshot.data ?? List.empty();
                      return InputDropdownProduct(
                        items: data,
                        text: StringApp.itemName,
                        value: selectedProduct,
                        onChanged: (PurchaseRequestProduct? value) {
                          setState(() {
                            selectedProduct = value;
                            selectedProductOpname = StockOpnameProductData(
                              code: selectedProduct!.code,
                              id: selectedProduct!.id,
                              name: selectedProduct!.name,
                              unitName: selectedProduct!.unitName,
                              lastStock: selectedProduct!.stock,
                              actualStock: 0,
                              difference: selectedProduct!.stock,
                              createdAt: selectedProduct!.createdAt,
                              updatedAt: selectedProduct!.updatedAt,
                            );
                          });
                        },
                        hint: StringApp.searchItem,
                      );
                    }),
                const SpacerHeight(24),
                CustomButton(
                  text: StringApp.addItem,
                  backgroundColor: ColorApp.primary,
                  onPressed: () {
                    if (selectedProductOpname == null) {
                      SnackbarApp.topSnackbarError(StringApp.chooseItemValidation, context);
                    } else {
                      int id = products
                          .firstWhere(
                            (item) => item.id == selectedProductOpname?.id,
                            orElse: () => StockOpnameProductData.empty(),
                          )
                          .id;

                      if (id != selectedProductOpname?.id) {
                        showProductBottomSheet(selectedProductOpname ?? StockOpnameProductData.empty());
                      } else {
                        SnackbarApp.topSnackbarError('Produk Sudah Ada Di List', context);
                      }
                    }
                  },
                ),
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
                    if (products.isNotEmpty)
                      ...List.generate(products.length, (index) {
                        return Dismissible(
                          key: Key(products[index].code),
                          dragStartBehavior: DragStartBehavior.start,
                          confirmDismiss: (direction) async {
                            bool? res = await confirmDialog(
                              context,
                              onConfirm: () {
                                products.removeAt(index);
                                Navigator.pop(context);
                                setState(() {});
                              },
                            );

                            if (res == true) {}

                            return res;
                          },
                          direction: DismissDirection.endToStart,
                          background: Container(
                            decoration: BoxDecoration(
                              color: ColorApp.red,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.only(right: 16),
                            alignment: Alignment.centerRight,
                            child: const Icon(
                              Icons.delete_outline,
                              color: Colors.white,
                              size: 32,
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              showProductBottomSheet(
                                products[index],
                                isEdit: true,
                                index: index,
                              );
                            },
                            child: SODProductCard(products[index]),
                          ),
                        );
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

  Form _form() {
    return Form(
      key: formKey,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          InputField(
            text: StringApp.requestDate,
            hint: StringApp.chooseRequestDate,
            controller: _requestedDateController,
            readOnly: true,
            validator: (String? value) {
              if (value!.isEmpty) {
                return StringApp.requestDateValidation;
              }
              return null;
            },
            onTap: () {
              DatePickerApp().showDateRangePicker(
                context,
                initialSelectedDate: selectedDate,
                onYes: () {},
                onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                  if (args.value is DateTime) {
                    setState(() {
                      selectedDate = args.value;

                      _requestedDateController.text = DateFormatterApp.defaultDate(args.value.toString());
                      _stockOpnameViewmodel.setDate(DateFormatterApp.defaultDate(args.value.toString()));
                    });
                  }
                },
              );
            },
            suffixIcon: const Icon(
              Icons.calendar_month_outlined,
              color: ColorApp.greyText98,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: DropdownWarehouse(
              selectedValue: warehouse,
              onChanged: (ReceiveOrderWarehouseData? value) {
                setState(() {
                  warehouse = value;
                  _stockOpnameViewmodel.setWarehouseId(value?.id.toString() ?? EMPTY);
                  _stockOpnameViewmodel.products(value?.id ?? ZERO);
                });
              },
            ),
          ),
          InputField(
            padding: const EdgeInsets.only(top: 12),
            text: StringApp.note,
            hint: StringApp.note,
            controller: _noteController,
            maxLines: 5,
            validator: (String? value) {
              if (value!.isEmpty) {
                return StringApp.noteValidation;
              }
              return null;
            },
          ),
        ],
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
      onTap: (int index) {
        setState(() {
          initialIndex = index;
        });
      },
      padding: EdgeInsets.zero,
      labelStyle: StyleApp.prompt.copyWith(
        fontWeight: FontWeight.w500,
        fontFamily: FontFamilyApp.inter,
      ),
      unselectedLabelStyle: StyleApp.prompt.copyWith(
        fontFamily: FontFamilyApp.inter,
        fontWeight: FontWeight.w500,
        color: ColorApp.blackText.withOpacity(0.5),
      ),
      tabs: [
        const Tab(
          text: StringApp.detail,
        ),
        Tab(
          text: StringApp.listItem.toUpperCase(),
        ),
      ],
    );
  }

  void showProductBottomSheet(StockOpnameProductData product, {bool isEdit = false, int index = 0}) {
    ValueNotifier<int> qty = ValueNotifier<int>(product.actualStock);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, StateSetter stateSetter) {
            return Container(
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 24),
              child: ValueListenableBuilder<int>(
                valueListenable: qty,
                builder: (context, value, child) {
                  int diff = qty.value - product.lastStock;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Nama Barang',
                            style: StyleApp.textNormal,
                          ),
                          Expanded(
                            child: Text(
                              product.name,
                              style: StyleApp.textNormal.copyWith(fontWeight: FontWeight.w600),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                      const SpacerHeight(12),
                      Row(
                        children: [
                          const Text(
                            'Kode Barang',
                            style: StyleApp.textNormal,
                          ),
                          Expanded(
                            child: Text(
                              product.code,
                              style: StyleApp.textNormal.copyWith(fontWeight: FontWeight.w600),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                      const SpacerHeight(12),
                      Row(
                        children: [
                          const Text(
                            'Stock Sistem',
                            style: StyleApp.textNormal,
                          ),
                          Expanded(
                            child: Text(
                              product.lastStock.toString(),
                              style: StyleApp.textNormal.copyWith(fontWeight: FontWeight.w600),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                      const SpacerHeight(12),
                      Row(
                        children: [
                          const Text(
                            'Selisih',
                            style: StyleApp.textNormal,
                          ),
                          Expanded(
                            child: Text(
                              "$diff",
                              style: StyleApp.textNormal.copyWith(fontWeight: FontWeight.w600),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                      const SpacerHeight(12),
                      Row(
                        children: [
                          const Text(
                            'Aktual',
                            style: StyleApp.textNormal,
                          ),
                          Expanded(
                            child: Text(
                              qty.value.toString(),
                              style: StyleApp.textNormal.copyWith(fontWeight: FontWeight.w600),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                      const SpacerHeight(24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          QtyButton(
                            icon: Icons.add,
                            onTap: () {
                              qty.value++;
                            },
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: ColorApp.backgroundF1,
                            ),
                            child: Text(
                              qty.value.toString(),
                              style: StyleApp.textXl.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          QtyButton(
                            icon: Icons.remove,
                            onTap: () {
                              qty.value--;
                            },
                          ),
                        ],
                      ),
                      const SpacerHeight(24),
                      CustomButton(
                        text: StringApp.save,
                        onPressed: () {
                          stateSetter(() {
                            if (isEdit) {
                              products.update(
                                index,
                                product.copyWith(
                                  difference: diff,
                                  actualStock: qty.value,
                                ),
                              );
                            } else {
                              products.add(
                                product.copyWith(
                                  difference: diff,
                                  actualStock: qty.value,
                                ),
                              );
                              selectedProduct = null;
                              selectedProductOpname = null;
                            }
                          });
                          Navigator.pop(context);
                        },
                      ),
                      const SpacerHeight(12),
                      CustomOutlineButton(
                        text: StringApp.cancel,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        borderColor: ColorApp.red,
                        textColor: ColorApp.red,
                      ),
                    ],
                  );
                },
              ),
            );
          },
        );
      },
    ).then((value) => setState(() {}));
  }
}
