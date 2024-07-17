import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class InputDropdown extends StatelessWidget {
  final List<String> items;
  final String text;
  final Function(String?) onChanged;
  final String hint;
  final String? value;
  const InputDropdown({
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
        DropdownButtonFormField<String>(
          isExpanded: true,
          value: value,
          items: items
              .map(
                (item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                ),
              )
              .toList(),
          onChanged: onChanged,
          icon: const Icon(
            Icons.keyboard_arrow_down,
          ),
          dropdownColor: ColorApp.white,
          hint: Text(
            hint,
            style: StyleApp.textNormal.copyWith(
              color: ColorApp.greyText,
            ),
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
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
      ],
    );
  }
}
