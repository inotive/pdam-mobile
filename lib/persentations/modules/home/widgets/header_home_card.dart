import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/resources/asset_app.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/route_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/button/icon_circle_button.dart';
import 'package:pdam_inventory/persentations/widgets/custom_cached_network_image.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class HeaderHomeCard extends StatelessWidget {
  const HeaderHomeCard({
    super.key,
    required this.name,
  });

  final String name;

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
          const CustomNetworkImage(
            height: 40,
            width: 40,
            borderRadius: 40,
            url:
                'https://s3-alpha-sig.figma.com/img/11db/cb98/2f9ba115c7d5cc790cc48a457815fb67?Expires=1721001600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=aBnhZykPSiWW5U6PSReWlw6GS4HpXIswqqhvOZf-TB0EDcHHDR~j3PlUZAUdznBOuu3i2VUdoDJgyHqa8P9RWEN3uK7uUG2ybDXG47tyaE3~3SJpvxQLzkboL-VlfmSRC28rNyjVFY-aPZZiEsfjra-vwkRoSAV6Xc80cJqGrwu6R6YedH~SjFDRMVQA816jKbEfNrnhAWiRrkoiX5iSJQJtpO-L5~L06IfPMMRu14bcw8OuJ7AZdWHHS~VoGtQ0g4U38Owul96mg6FiKbj-CNHk80kNFGfADWMoOA1jmVrO7uxiQVtEzcKEDyV8JgaA0uTyX310o~d4UAomFPzJlw__',
          ),
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
              ],
            ),
          ),
          const SpacerWidth(8),
          IconCircleButton(
            onTap: () {
              Navigator.pushNamed(context, Routes.notification);
            },
            isSvg: true,
            svg: IconApp.notification,
          ),
        ],
      ),
    );
  }
}
