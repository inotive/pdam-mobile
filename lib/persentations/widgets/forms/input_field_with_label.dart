import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';

class InputFieldWithLabel extends StatelessWidget {
  const InputFieldWithLabel({
    super.key,
    required this.label,
    this.hint,
    this.suffixIcon,
    this.controller,
    this.keyboardType,
    this.validator,
    this.obscureText = false,
  });

  final String label;
  final String? hint;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: TextFormField(
        cursorColor: ColorApp.primary,
        style: StyleApp.textNormal.copyWith(),
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
          label: Text(
            label,
            style: StyleApp.textSm.copyWith(
              color: ColorApp.blue,
              fontWeight: FontWeight.w600,
            ),
          ),
          hintText: hint,
          fillColor: ColorApp.greyFA,
          filled: true,
          hintStyle: StyleApp.textLg.copyWith(color: ColorApp.greyText),
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              width: 1,
              color: ColorApp.red,
            ),
          ),
        ),
      ),
    );
  }
}
