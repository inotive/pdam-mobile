import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:pdam_inventory/domain/model/product_model.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class InputDropdownProduct extends StatelessWidget {
  final List<ProductData> items;
  final String text;
  final Function(ProductData?) onChanged;
  final String hint;
  final String? value;
  const InputDropdownProduct({
    super.key,
    required this.items,
    required this.text,
    required this.onChanged,
    required this.hint,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: StyleApp.textNormal.copyWith(),
        ),
        const SpacerHeight(8),
        DropdownSearch<ProductData>(
          itemAsString: (ProductData data) => data.name,
          popupProps: const PopupProps.menu(
            showSelectedItems: false,
            showSearchBox: true,
            menuProps: MenuProps(
              backgroundColor: ColorApp.white,
            ),
          ),
          items: items,
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              hintText: hint,
              hintStyle: StyleApp.textNormal.copyWith(
                color: ColorApp.greyText,
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
            ),
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
