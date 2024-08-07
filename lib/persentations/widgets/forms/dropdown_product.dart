import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/di.dart';
import 'package:pdam_inventory/domain/model/product_model.dart';
import 'package:pdam_inventory/persentations/modules/product/viewmodel/product_viewmodel.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/resources/value_app.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class DropdownProduct extends StatefulWidget {
  const DropdownProduct({super.key, required this.onChanged, this.validator, this.selectedValue});

  final Function(ProductData?) onChanged;
  final String? Function(ProductData?)? validator;
  final ProductData? selectedValue;

  @override
  State<DropdownProduct> createState() => _DropdownProductState();
}

class _DropdownProductState extends State<DropdownProduct> {
  final ProductViewmodel _productViewmodel = instance<ProductViewmodel>();

  @override
  void initState() {
    _productViewmodel.products(100);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringApp.barang,
          style: StyleApp.textSm.copyWith(
            fontWeight: FontWeight.w600,
            color: ColorApp.greyTextA5,
            fontFamily: FontFamilyApp.inter,
          ),
        ),
        const SpacerHeight(8),
        StreamBuilder<List<ProductData>>(
            stream: _productViewmodel.outputProducts,
            builder: (context, snapshot) {
              List<ProductData> items = snapshot.data ?? List.empty();
              return DropdownSearch<ProductData>(
                itemAsString: (ProductData data) => data.name,
                popupProps: const PopupProps.menu(
                  showSelectedItems: false,
                  showSearchBox: true,
                  menuProps: MenuProps(
                    backgroundColor: ColorApp.white,
                  ),
                ),
                items: items,
                validator: widget.validator,
                selectedItem: widget.selectedValue,
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    hintText: StringApp.searchItem,
                    hintStyle: StyleApp.textNormal.copyWith(
                      color: ColorApp.greyText98,
                      fontFamily: FontFamilyApp.inter,
                    ),
                    fillColor: ColorApp.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 1,
                        color: ColorApp.border,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 1,
                        color: ColorApp.border,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 1,
                        color: ColorApp.red,
                      ),
                    ),
                  ),
                ),
                onChanged: widget.onChanged,
              );
            }),
      ],
    );
  }
}
