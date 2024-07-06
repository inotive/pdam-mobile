import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';

class IconCircleButton extends StatelessWidget {
  final double width;
  final double height;
  final IconData icon;
  final Function() onTap;
  const IconCircleButton({
    super.key,
    this.width = 36,
    this.height = 36,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: height,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: ColorApp.primaryBg,
        ),
        child: Icon(
          icon,
          color: ColorApp.primary,
        ),
      ),
    );
  }
}
