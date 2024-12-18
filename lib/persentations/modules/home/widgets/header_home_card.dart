import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/extensions.dart';
import 'package:pdam_inventory/persentations/resources/asset_app.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/route_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/button/icon_circle_button.dart';
import 'package:pdam_inventory/persentations/widgets/image/profile_image.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class HeaderHomeCard extends StatelessWidget {
  const HeaderHomeCard({
    super.key,
    required this.name,
    required this.image,
    required this.role,
    required this.count,
  });

  final String name;
  final String image;
  final String role;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
      decoration: const BoxDecoration(
        color: ColorApp.primary,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
      ),
      child: Row(
        children: [
          ProfileImage(url: image),
          const SpacerWidth(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Halo,',
                  style: StyleApp.textNormal.copyWith(
                    color: ColorApp.white,
                  ),
                ),
                Text(
                  name,
                  style: StyleApp.textXl.copyWith(
                    color: ColorApp.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  role.toCapitalized(),
                  style: StyleApp.textNormal.copyWith(
                    color: ColorApp.white.withOpacity(0.8),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          const SpacerWidth(8),
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconCircleButton(
                onTap: () {
                  Navigator.pushNamed(context, Routes.notification);
                },
                isSvg: true,
                svg: IconApp.notification,
              ),
              Positioned(
                right: -2,
                child: Container(
                  height: 14,
                  width: 14,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: ColorApp.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    count,
                    style: StyleApp.textXs.copyWith(
                      color: ColorApp.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
