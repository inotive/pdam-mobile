import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdam_inventory/persentations/resources/asset_app.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';

class IconCircleButton extends StatelessWidget {
  final double width;
  final double height;
  final IconData? icon;
  final Function() onTap;
  final bool isSvg;
  final String svg;

  const IconCircleButton({
    super.key,
    this.width = 36,
    this.height = 36,
    this.icon,
    required this.onTap,
    this.isSvg = false,
    this.svg = IconApp.notification,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: height,
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: ColorApp.primaryBgOpacity,
        ),
        child: isSvg
            ? SvgPicture.asset(
                svg,
                // ignore: deprecated_member_use
                color: ColorApp.primary,
              )
            : Icon(
                icon,
              ),
      ),
    );
  }
}
