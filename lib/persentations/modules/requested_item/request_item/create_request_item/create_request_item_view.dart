import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/di.dart';
import 'package:pdam_inventory/data/local_source/app_preference.dart';
import 'package:pdam_inventory/data/params/request_product_param.dart';
import 'package:pdam_inventory/domain/model/product_model.dart';
import 'package:pdam_inventory/persentations/modules/requested_item/request_item/create_request_item/widgets/request_product_card.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/widgets/button/custom_button.dart';
import 'package:pdam_inventory/persentations/widgets/button/custom_outline_button.dart';
import 'package:pdam_inventory/persentations/widgets/card/empty_card.dart';
import 'package:pdam_inventory/persentations/widgets/forms/dropdown_product.dart';
import 'package:pdam_inventory/persentations/widgets/forms/input_field.dart';
import 'package:pdam_inventory/persentations/widgets/snackbar_app.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class CreateRequestItemView extends StatefulWidget {
  const CreateRequestItemView({super.key});

  @override
  State<CreateRequestItemView> createState() => _CreateRequestItemViewState();
}

class _CreateRequestItemViewState extends State<CreateRequestItemView> {
  final AppPreference _appPreference = instance<AppPreference>();

  final TextEditingController _requestedByController = TextEditingController();
  final TextEditingController _requestedDateController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  final TextEditingController _qtyController = TextEditingController();
  final TextEditingController _unitController = TextEditingController();

  final productFormKey = GlobalKey<FormState>();

  String productId = EMPTY;
  String productName = EMPTY;
  ProductData? selectedProduct;

  late PageController _pageController;

  int initialIndex = 0;

  bool enableButton = false;

  List<RequestProductParam> products = [];

  setup() {
    _appPreference.getString(PREFS_KEY_NAME).then((value) {
      setState(() {
        _requestedByController.text = value;
      });
    });
    setState(() {
      _unitController.text = 'pcs';
    });
  }

  @override
  void initState() {
    setup();
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
  }

  onRemove(String id) {
    products.removeWhere((item) => item.id.toString().contains(id.toString()));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
          suffixIcon: const Icon(
            Icons.calendar_month_outlined,
            color: ColorApp.greyText98,
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
        backgroundColor: enableButton ? ColorApp.blue : ColorApp.greyBD,
        onPressed: () {},
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
      title: Text(initialIndex == 2 ? StringApp.newItem : StringApp.addData),
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
