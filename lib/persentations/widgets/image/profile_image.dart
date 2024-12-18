import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pdam_inventory/persentations/resources/asset_app.dart';
import 'package:pdam_inventory/persentations/widgets/custom_cached_network_image.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, required this.url, this.borderRadius = 40.0});

  final String url;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return CustomNetworkImage(
      height: 40,
      width: 40,
      borderRadius: borderRadius,
      url: url,
      errorWidget: Container(
        height: 40,
        width: 40,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: SvgPicture.asset(
          IconApp.profile,
        ),
      ),
    );
  }
}
