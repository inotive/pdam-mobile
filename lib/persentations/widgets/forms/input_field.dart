import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
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
  });

  final String text;
  final String hint;
  final EdgeInsets padding;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool readOnly;
  final TextStyle? textStyle;
  final Color? borderColor;

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
                ),
          ),
          const SpacerHeight(6),
          TextFormField(
            style: StyleApp.textNormal,
            cursorColor: ColorApp.primary,
            keyboardType: keyboardType,
            controller: controller,
            readOnly: readOnly,
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: readOnly ? ColorApp.greyF4 : ColorApp.white,
              hintStyle: StyleApp.textNormal.copyWith(
                color: ColorApp.greyText98,
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
