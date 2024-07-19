import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    super.key,
    this.height = 36.0,
    this.width = double.infinity,
    this.margin = EdgeInsets.zero,
    required this.text,
    required this.onPressed,
    this.textColor,
    this.borderColor,
    this.backgroundColor,
  });

  final double height;
  final String text;
  final double width;
  final EdgeInsets margin;
  final Function() onPressed;
  final Color? textColor;
  final Color? borderColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor ?? ColorApp.white,
          side: BorderSide(
            width: 1,
            color: borderColor ?? ColorApp.primary,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: StyleApp.textLg.copyWith(
            color: textColor ?? ColorApp.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
