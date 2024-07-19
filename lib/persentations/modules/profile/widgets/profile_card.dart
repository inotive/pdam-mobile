import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pdam_inventory/app/di.dart';
import 'package:pdam_inventory/app/extensions.dart';
import 'package:pdam_inventory/data/local_source/app_preference.dart';
import 'package:pdam_inventory/persentations/resources/asset_app.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/resources/value_app.dart';
import 'package:pdam_inventory/persentations/widgets/custom_cached_network_image.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  final AppPreference _appPreference = instance<AppPreference>();

  String name = EMPTY;
  String role = EMPTY;

  setup() async {
    name = await _appPreference.getString(PREFS_KEY_NAME);
    role = await _appPreference.getString(PREFS_KEY_ROLE_NAME);
    setState(() {});
  }

  @override
  void initState() {
    setup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 26),
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Container(
            width: double.infinity,
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: const LinearGradient(
                colors: [ColorApp.primaryBgLinear1, ColorApp.primaryBgLinear2],
              ),
            ),
          ),
          Image.asset(ImageApp.vector3),
          Positioned(
            bottom: 16,
            left: 16,
            top: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomNetworkImage(
                  height: 40,
                  width: 40,
                  borderRadius: 8,
                  url:
                      'https://s3-alpha-sig.figma.com/img/11db/cb98/2f9ba115c7d5cc790cc48a457815fb67?Expires=1721001600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=aBnhZykPSiWW5U6PSReWlw6GS4HpXIswqqhvOZf-TB0EDcHHDR~j3PlUZAUdznBOuu3i2VUdoDJgyHqa8P9RWEN3uK7uUG2ybDXG47tyaE3~3SJpvxQLzkboL-VlfmSRC28rNyjVFY-aPZZiEsfjra-vwkRoSAV6Xc80cJqGrwu6R6YedH~SjFDRMVQA816jKbEfNrnhAWiRrkoiX5iSJQJtpO-L5~L06IfPMMRu14bcw8OuJ7AZdWHHS~VoGtQ0g4U38Owul96mg6FiKbj-CNHk80kNFGfADWMoOA1jmVrO7uxiQVtEzcKEDyV8JgaA0uTyX310o~d4UAomFPzJlw__',
                ),
                const SpacerHeight(16),
                Text(
                  name,
                  style: StyleApp.textNormal.copyWith(
                    color: ColorApp.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SpacerHeight(16),
                Row(
                  children: [
                    Image.asset(
                      ImageApp.user,
                      width: 10,
                    ),
                    const SpacerWidth(4),
                    Text(
                      role.toTitleCase(),
                      style: StyleApp.textXs.copyWith(
                        fontSize: FontSizeApp.xss,
                        color: ColorApp.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: 16,
            top: 20,
            child: Container(
              height: 32,
              width: 32,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: ColorApp.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SvgPicture.asset(IconApp.settings),
            ),
          ),
        ],
      ),
    );
  }
}
