import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.label,
    required this.hint,
    this.suffixIcon,
    this.controller,
    this.keyboardType,
    this.validator,
    this.obscureText = false,
  });

  final String label;
  final String hint;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: StyleApp.textLg.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SpacerHeight(8),
        TextFormField(
          cursorColor: ColorApp.primary,
          style: StyleApp.textLg.copyWith(),
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: StyleApp.textLg.copyWith(color: ColorApp.greyText),
            suffixIcon: suffixIcon,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                width: 1,
                color: ColorApp.border,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                width: 1,
                color: ColorApp.primary,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                width: 1,
                color: ColorApp.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
