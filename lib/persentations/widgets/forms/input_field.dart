import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/resources/value_app.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.text,
    required this.hint,
    this.padding = EdgeInsets.zero,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.textStyle,
    this.borderColor,
    this.onChanged,
    this.maxLines = 1,
    this.suffixIcon,
    this.enabled = true,
    this.validator,
  });

  final String text;
  final String hint;
  final EdgeInsets padding;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool readOnly;
  final TextStyle? textStyle;
  final Color? borderColor;
  final Function(String)? onChanged;
  final int maxLines;
  final Widget? suffixIcon;
  final bool enabled;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: textStyle ??
                StyleApp.textSm.copyWith(
                  fontWeight: FontWeight.w600,
                  color: ColorApp.greyTextA5,
                  fontFamily: FontFamilyApp.inter,
                ),
          ),
          const SpacerHeight(6),
          TextFormField(
            style: StyleApp.textNormal.copyWith(
              fontFamily: FontFamilyApp.inter,
            ),
            maxLines: maxLines,
            cursorColor: ColorApp.primary,
            keyboardType: keyboardType,
            controller: controller,
            readOnly: readOnly,
            onChanged: onChanged,
            enabled: enabled,
            validator: validator,
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: enabled ? ColorApp.white : ColorApp.greyF4,
              suffixIcon: suffixIcon,
              hintStyle: StyleApp.textNormal.copyWith(
                color: ColorApp.greyText98,
                fontFamily: FontFamilyApp.inter,
              ),
              contentPadding: const EdgeInsets.all(12),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: borderColor ?? ColorApp.greyTextA5,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: ColorApp.primary,
                  width: 1,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: ColorApp.red,
                  width: 1,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: borderColor ?? ColorApp.greyTextA5,
                  width: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
