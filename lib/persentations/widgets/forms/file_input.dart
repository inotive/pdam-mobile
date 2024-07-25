import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:pdam_inventory/persentations/resources/asset_app.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/resources/value_app.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class FileInput extends StatelessWidget {
  const FileInput({super.key, this.text, this.textStyle, this.file, required this.onTap});

  final String? text;
  final TextStyle? textStyle;
  final File? file;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text ?? StringApp.uploadFile,
          style: textStyle ??
              StyleApp.textSm.copyWith(
                fontWeight: FontWeight.w600,
                color: ColorApp.greyTextA5,
                fontFamily: FontFamilyApp.inter,
              ),
        ),
        const SpacerHeight(6),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            height: 110,
            decoration: BoxDecoration(
              color: ColorApp.primary.withOpacity(0.10),
              borderRadius: BorderRadius.circular(8),
              border: DashedBorder.all(
                dashLength: 4,
                color: ColorApp.primary,
              ),
            ),
            child: file != null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(file!),
                        ),
                      ],
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        IconApp.upload,
                      ),
                      const SpacerHeight(12),
                      Text(
                        StringApp.uploadFileDesc,
                        style: StyleApp.textNormal.copyWith(
                          fontFamily: FontFamilyApp.inter,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}
