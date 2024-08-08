import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/di.dart';
import 'package:pdam_inventory/app/helpers/code_formatter.dart';
import 'package:pdam_inventory/app/helpers/date_formatter.dart';
import 'package:pdam_inventory/data/local_source/app_preference.dart';
import 'package:pdam_inventory/data/params/request_product_param.dart';
import 'package:pdam_inventory/domain/model/product_model.dart';
import 'package:pdam_inventory/persentations/modules/requested_item/create_request_item/viewmodel/create_request_item_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/requested_item/create_request_item/widgets/request_product_card.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/widgets/button/custom_button.dart';
import 'package:pdam_inventory/persentations/widgets/button/custom_outline_button.dart';
import 'package:pdam_inventory/persentations/widgets/card/empty_card.dart';
import 'package:pdam_inventory/persentations/widgets/forms/dropdown_product.dart';
import 'package:pdam_inventory/persentations/widgets/forms/input_dropdown.dart';
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

class _CreateRequestItemViewState extends State<CreateRequestItemView> {
  final AppPreference _appPreference = instance<AppPreference>();
  final CreateRequestItemViewmodel _createRequestItemViewmodel = instance<CreateRequestItemViewmodel>();

  final TextEditingController _requestedByController = TextEditingController();
  final TextEditingController _requestedDateController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  final TextEditingController _qtyController = TextEditingController();
  final TextEditingController _unitController = TextEditingController();

  final productFormKey = GlobalKey<FormState>();

  String productId = EMPTY;
  String productName = EMPTY;
  String? division;
  ProductData? selectedProduct;
  DateTime selectedDate = DateTime.now();

  late PageController _pageController;

  int initialIndex = 0;

  List<RequestProductParam> products = [];
  List<String> divisions = [
    'Divisi A',
    'Divisi B',
    'Divisi C',
    'Divisi d',
  ];

  setup() {
    _appPreference.getString(PREFS_KEY_NAME).then((value) {
      setState(() {
        _requestedByController.text = value;
        _createRequestItemViewmodel.setRequestName(value);
      });
    });
    setState(() {
      _unitController.text = 'pcs';
    });
  }

  _bind() {
    _createRequestItemViewmodel.setRequestNumber(CodeFormatterApp.requestItem());
    _noteController.addListener(() => _createRequestItemViewmodel.setRequestDescription(_noteController.text));
  }

  bool onEnable() {
    bool value = false;
    log(value.toString());
    if (_requestedDateController.text != EMPTY &&
        division != null &&
        _noteController.text != EMPTY &&
        products.isNotEmpty) {
      log(value.toString());
      value = true;

      return value;
    }
    return value;
  }

  @override
  void initState() {
    setup();
    _bind();
    _pageController = PageController(initialPage: initialIndex);

    super.initState();
  }

  onContinue() {
    if (initialIndex == 1) {
      _pageController.jumpToPage(0);
    } else {
      _pageController.jumpToPage(1);
    }
  }

  onReset() {
    setState(() {
      productId = EMPTY;
      productName = EMPTY;
      _qtyController.text = "";
      selectedProduct = null;
    });
  }

  onAddProduct(RequestProductParam param) {
    if (products.isEmpty) {
      products.add(param);
      _pageController.jumpToPage(1);
      onReset();
    } else {
      if ((products.firstWhereOrNull((item) => item.id == param.id)) != null) {
        SnackbarApp.topSnackbarError('Produk sudah ditambahkan. Ganti dengan produk yang lain', context);
      } else {
        products.add(param);
        _pageController.jumpToPage(1);
        onReset();
      }
    }
    onEnable();
  }

  onRemove(String id) {
    products.removeWhere((item) => item.id.toString().contains(id.toString()));
    onEnable();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
        stream: _createRequestItemViewmodel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidgets(), () {}) ?? _getContentWidgets();
        });
  }

  Scaffold _getContentWidgets() {
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: _appBar(),
      bottomNavigationBar: _bottomNavbar(),
      floatingActionButton: initialIndex == 1
          ? FloatingActionButton(
              backgroundColor: ColorApp.blue,
              onPressed: () {
                _pageController.jumpToPage(2);
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              child: const Icon(
                Icons.add,
                color: ColorApp.white,
              ),
            )
          : null,
      body: PageView(
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            initialIndex = index;
          });
        },
        children: [
          _form(),
          _productList(),
          _addProduct(),
        ],
      ),
    );
  }

  Form _addProduct() {
    return Form(
      key: productFormKey,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          DropdownProduct(
            selectedValue: selectedProduct,
            onChanged: (ProductData? value) {
              setState(() {
                selectedProduct = value;
                productId = value?.id ?? EMPTY;
                productName = value?.name ?? EMPTY;
              });
            },
            validator: (ProductData? value) {
              if (value == null) {
                return 'Produk harus dipilih';
              }
              return null;
            },
          ),
          InputField(
            padding: const EdgeInsets.only(top: 12),
            controller: _qtyController,
            text: StringApp.amount,
            hint: StringApp.amount,
            keyboardType: TextInputType.number,
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Jumlah harus diisi dan lebih dari 0';
              }
              return null;
            },
          ),
          InputField(
            padding: const EdgeInsets.only(top: 12),
            controller: _unitController,
            text: StringApp.unit,
            hint: StringApp.unit,
            enabled: false,
          ),
        ],
      ),
    );
  }

  Widget _productList() {
    return Container(
      color: ColorApp.primary.withOpacity(0.05),
      padding: const EdgeInsets.all(16),
      child: products.isEmpty
          ? const Center(
              child: EmptyCard(message: StringApp.youNotAddedProduct),
            )
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, idx) {
                return RequestProductCard(
                  name: products[idx].name,
                  unit: products[idx].unit,
                  amount: products[idx].qty.toString(),
                  onDelete: () {
                    onRemove(products[idx].id);
                  },
                );
              },
            ),
    );
  }

  ListView _form() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        InputField(
          text: StringApp.requestDate,
          hint: StringApp.chooseRequestDate,
          controller: _requestedDateController,
          readOnly: true,
          onTap: () {
            DatePickerApp().showDateRangePicker(
              context,
              initialSelectedDate: selectedDate,
              onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                if (args.value is DateTime) {
                  setState(() {
                    selectedDate = args.value;
                    _requestedDateController.text = DateFormatterApp.defaultDate(args.value.toString());
                    _createRequestItemViewmodel.setRequestDate(DateFormatterApp.defaultDate(args.value.toString()));
                    onEnable();
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
          padding: const EdgeInsets.only(top: 12),
          child: InputDropdown(
            items: divisions,
            text: StringApp.division,
            onChanged: (String? value) {
              setState(() {
                division = value;
                _createRequestItemViewmodel.setDepartmentName(division.toString());
                onEnable();
              });
            },
            hint: StringApp.division,
          ),
        ),
        InputField(
          padding: const EdgeInsets.only(top: 12),
          controller: _requestedByController,
          text: StringApp.requestBy,
          hint: StringApp.requestBy,
          enabled: false,
          onChanged: (String value) {
            onEnable();
          },
        ),
        InputField(
          padding: const EdgeInsets.only(top: 12),
          text: StringApp.note,
          hint: StringApp.note,
          controller: _noteController,
          maxLines: 5,
          onChanged: (String value) {
            onEnable();
          },
        ),
      ],
    );
  }

  Container _bottomNavbar() {
    Widget buttonContinue = Flexible(
      child: CustomOutlineButton(
        text: initialIndex == 0
            ? StringApp.continueText
            : initialIndex == 1
                ? StringApp.back
                : StringApp.cancelled,
        onPressed: () {
          onContinue();
        },
        textColor: initialIndex == 2 ? ColorApp.redBorder : ColorApp.blue,
        borderColor: initialIndex == 2 ? ColorApp.redBorder : ColorApp.blue,
      ),
    );

    Widget buttonSave = Flexible(
      child: CustomButton(
        text: StringApp.save,
        backgroundColor: onEnable() ? ColorApp.blue : ColorApp.greyBD,
        onPressed: () {
          if (onEnable()) {
            _createRequestItemViewmodel.setProductList(products);
            _createRequestItemViewmodel.create(context);
          }
        },
      ),
    );

    Widget buttonAdd = Flexible(
      child: CustomButton(
        text: StringApp.add,
        backgroundColor: ColorApp.blue,
        onPressed: () {
          if (productFormKey.currentState!.validate()) {
            onAddProduct(
              RequestProductParam(
                productId,
                productName,
                int.parse(_qtyController.text),
                _unitController.text,
              ),
            );
          }
        },
      ),
    );

    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          buttonContinue,
          const SpacerWidth(10),
          initialIndex == 2 ? buttonAdd : buttonSave,
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(initialIndex == 2 ? StringApp.newRequest : StringApp.itemSubmitted),
      leading: IconButton(
        onPressed: () {
          if (initialIndex == 2) {
            _pageController.jumpToPage(1);
          } else {
            Navigator.pop(context);
          }
        },
        icon: const Icon(Icons.arrow_back),
      ),
    );
  }
}
