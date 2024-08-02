import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pdam_inventory/app/di.dart';
import 'package:pdam_inventory/app/extensions.dart';
import 'package:pdam_inventory/data/local_source/app_preference.dart';
import 'package:pdam_inventory/persentations/modules/profile/viewmodel/profile_viewmodel.dart';
import 'package:pdam_inventory/persentations/resources/asset_app.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/resources/value_app.dart';
import 'package:pdam_inventory/persentations/widgets/custom_cached_network_image.dart';
import 'package:pdam_inventory/persentations/widgets/snackbar_app.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  final AppPreference _appPreference = instance<AppPreference>();
  final ProfileViewModel _profileViewModel = instance<ProfileViewModel>();

  String name = EMPTY;
  String role = EMPTY;
  String image = EMPTY;
  File? file;

  setup() async {
    name = await _appPreference.getString(PREFS_KEY_NAME);
    role = await _appPreference.getString(PREFS_KEY_ROLE_NAME);
    image = await _appPreference.getString(PREFS_KEY_IMAGE);
    setState(() {});
  }

  pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      file = File(result.files.single.path!);
      _profileViewModel.setFile(file!);
    } else {
      // User canceled the picker
      // ignore: use_build_context_synchronously
      SnackbarApp.topSnackbarError('No Image Selected', context);
    }
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
                InkWell(
                  onTap: () {
                    pickFile();
                  },
                  child: file == null
                      ? CustomNetworkImage(
                          height: 40,
                          width: 40,
                          borderRadius: 8,
                          url: image,
                        )
                      : Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.file(file!),
                        ),
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
