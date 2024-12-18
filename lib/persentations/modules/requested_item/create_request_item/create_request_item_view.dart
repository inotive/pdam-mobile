import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/di.dart';
import 'package:pdam_inventory/app/extensions.dart';
import 'package:pdam_inventory/app/helpers/code_formatter.dart';
import 'package:pdam_inventory/app/helpers/date_formatter.dart';
import 'package:pdam_inventory/app/helpers/helpers.dart';
import 'package:pdam_inventory/data/local_source/app_preference.dart';
import 'package:pdam_inventory/data/params/request_product_param.dart';
import 'package:pdam_inventory/domain/model/purchase_request_model.dart';
import 'package:pdam_inventory/domain/model/receive_order_model.dart';
import 'package:pdam_inventory/persentations/modules/receipt_item/widgets/receipt_item_card.dart';
import 'package:pdam_inventory/persentations/modules/requested_item/create_request_item/viewmodel/create_request_item_viewmodel.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/route_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/resources/value_app.dart';
import 'package:pdam_inventory/persentations/widgets/button/custom_button.dart';
import 'package:pdam_inventory/persentations/widgets/card/empty_card.dart';
import 'package:pdam_inventory/persentations/widgets/forms/dropdown_warehouse/dropdown_warehouse.dart';
import 'package:pdam_inventory/persentations/widgets/forms/input_dropdown_product.dart';
import 'package:pdam_inventory/persentations/widgets/forms/input_field.dart';
import 'package:pdam_inventory/persentations/widgets/picker/date_picker.dart';
import 'package:pdam_inventory/persentations/widgets/snackbar_app.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CreateRequestItemView extends StatefulWidget {
  const CreateRequestItemView({super.key});

  @override
  State<CreateRequestItemView> createState() => _CreateRequestItemViewState();
}

class _CreateRequestItemViewState extends State<CreateRequestItemView> with TickerProviderStateMixin {
  final AppPreference _appPreference = instance<AppPreference>();
  final CreateRequestItemViewmodel _createRequestItemViewmodel = instance<CreateRequestItemViewmodel>();

  late TabController _tabController;

  final TextEditingController _requestedByController = TextEditingController();
  final TextEditingController _requestedDateController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  int productId = ZERO;
  PurchaseRequestProduct? selectedProduct;
  DateTime selectedDate = DateTime.now();

  ReceiveOrderWarehouseData? warehouse;

  int initialIndex = 0;

  List<RequestProductParam> products = [];

  onAddProduct(RequestProductParam data) {
    final checkedProduct = products.where((el) => el.id == data.id).isNotEmpty;
    log(checkedProduct.toString());
    if (!checkedProduct) {
      products.add(data);
    } else {
      int index = products.indexWhere((item) => item.id.toString().contains(data.id.toString()));
      products.update(
        index,
        products[index].copyWith(
          qty: products[index].qty + 1,
        ),
      );
    }
    log(products.toString());
    setState(() {});
  }

  onUpdateQuantity(RequestProductParam param) {
    if (products.isNotEmpty) {
      int index = products.indexWhere((item) => item.id.toString().contains(param.id.toString()));
      products.update(index, param);
      log("On Update Quantity ===> $products");
    }
  }

  onRemove(RequestProductParam data) {
    products.removeWhere((item) => item.id.toString().contains(data.id.toString()));
    log("On Remove ===> $products");
    if (mounted) {
      setState(() {});
    }
  }

  setup() {
    _appPreference.getString(PREFS_KEY_NAME).then((value) {
      setState(() {
        _requestedByController.text = value;
        _createRequestItemViewmodel.setRequestName(value);
      });
    });
  }

  _bind() {
    _createRequestItemViewmodel.setRequestNumber(CodeFormatterApp.requestItem());
    _noteController.addListener(() => _createRequestItemViewmodel.setRequestDescription(_noteController.text));
    _createRequestItemViewmodel.isCreateSuccesfully.stream.listen((isSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, Routes.requestedItem);
      });
    });
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: initialIndex);
    setup();
    _bind();
    super.initState();
  }

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

  onSubmit() {
    if (products.isEmpty) {
      SnackbarApp.topSnackbarError(StringApp.youNotAddedProduct, context);
    } else {
      _createRequestItemViewmodel.setProductList(products);
      _createRequestItemViewmodel.create();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringApp.newRequest),
      ),
      body: StreamBuilder<FlowState>(
        stream: _createRequestItemViewmodel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidgets(), () => _bind()) ?? _getContentWidgets();
        },
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
    );
  }

  Column _getContentWidgets() {
    return Column(
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
                    stream: _createRequestItemViewmodel.outputProduct,
                    builder: (context, snapshot) {
                      List<PurchaseRequestProduct> data = snapshot.data ?? List.empty();
                      return InputDropdownProduct(
                        items: data,
                        text: StringApp.itemName,
                        onChanged: (PurchaseRequestProduct? value) {
                          setState(() {
                            selectedProduct = value;
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
                    if (selectedProduct == null) {
                      SnackbarApp.topSnackbarError(StringApp.chooseItemValidation, context);
                    } else {
                      onAddProduct(
                        RequestProductParam(
                          selectedProduct!.id,
                          selectedProduct!.name,
                          1,
                          'pcs',
                          selectedProduct!.code,
                          selectedProduct!.image,
                        ),
                      );
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
                        ValueNotifier<int> qty = ValueNotifier<int>(products[index].qty);
                        return ValueListenableBuilder<int>(
                            valueListenable: qty,
                            builder: (context, value, child) {
                              return ReceiptItemCard(
                                name: products[index].name,
                                code: products[index].code,
                                image: products[index].image == '' ? '' : HelperApp.getUrlImage(products[index].image),
                                onAdd: () {
                                  // ignore: unused_local_variable
                                  qty.value++;
                                  onUpdateQuantity(RequestProductParam(
                                    products[index].id,
                                    products[index].name,
                                    qty.value,
                                    products[index].unit,
                                    products[index].code,
                                    products[index].image,
                                  ));
                                },
                                onRemove: () {
                                  if (qty.value > 1) {
                                    qty.value--;
                                    onUpdateQuantity(RequestProductParam(
                                      products[index].id,
                                      products[index].name,
                                      qty.value,
                                      products[index].unit,
                                      products[index].code,
                                      products[index].image,
                                    ));
                                  } else {
                                    onRemove(products[index]);
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
                onYes: () {
                  _requestedDateController.text = DateFormatterApp.defaultDate(selectedDate.toString());
                  _createRequestItemViewmodel
                      .setRequestDate(DateFormatterApp.defaultDate(_requestedDateController.text));
                },
                onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                  if (args.value is DateTime) {
                    setState(() {
                      selectedDate = args.value;
                      _requestedDateController.text = DateFormatterApp.defaultDate(args.value.toString());
                      _createRequestItemViewmodel.setRequestDate(DateFormatterApp.defaultDate(args.value.toString()));
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
                  _createRequestItemViewmodel.setDepartmentName(value?.name ?? EMPTY);
                  _createRequestItemViewmodel.products(value?.id ?? ZERO);
                });
              },
            ),
          ),
          InputField(
            padding: const EdgeInsets.only(top: 12),
            controller: _requestedByController,
            text: StringApp.requestBy,
            hint: StringApp.requestBy,
            enabled: false,
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
}
