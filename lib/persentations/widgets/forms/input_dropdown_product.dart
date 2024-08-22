import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:pdam_inventory/domain/model/purchase_request_model.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/resources/value_app.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class InputDropdownProduct extends StatelessWidget {
  final List<PurchaseRequestProduct> items;
  final String text;
  final Function(PurchaseRequestProduct?) onChanged;
  final String hint;
  final PurchaseRequestProduct? value;
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
          style: StyleApp.textSm.copyWith(
            fontWeight: FontWeight.w600,
            color: ColorApp.greyTextA5,
            fontFamily: FontFamilyApp.inter,
          ),
        ),
        const SpacerHeight(8),
        DropdownSearch<PurchaseRequestProduct>(
          itemAsString: (PurchaseRequestProduct data) => data.name,
          popupProps: const PopupProps.menu(
            showSelectedItems: false,
            showSearchBox: true,
            menuProps: MenuProps(
              backgroundColor: ColorApp.white,
            ),
          ),
          items: items,
          selectedItem: value,
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              hintText: hint,
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
            ),
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
