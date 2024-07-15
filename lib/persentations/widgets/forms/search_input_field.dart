import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';

class SearchInputField extends StatelessWidget {
  final String hint;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final bool readOnly;
  final Function()? onTap;
  const SearchInputField({
    super.key,
    required this.hint,
    this.suffixIcon,
    this.controller,
    this.onChanged,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      cursorColor: ColorApp.primary,
      onTap: onTap,
      readOnly: readOnly,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorApp.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(70),
          borderSide: const BorderSide(
            color: ColorApp.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(70),
          borderSide: const BorderSide(
            color: ColorApp.grey,
          ),
        ),
        hintText: hint,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
