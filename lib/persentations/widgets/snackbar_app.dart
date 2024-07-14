import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';

class SnackbarApp {
  static void topSnackbarError(String message, BuildContext context) {
    context.showFlash<bool>(
      barrierDismissible: true,
      duration: const Duration(seconds: 2),
      builder: (context, controller) => FlashBar(
        controller: controller,
        position: FlashPosition.top,
        backgroundColor: ColorApp.red,
        content: Text(message,
            style: StyleApp.textNormal.copyWith(
              fontWeight: FontWeight.w700,
              color: ColorApp.white,
            )),
        elevation: 0,
      ),
    );
  }

  static void topSnackbarSucces(String message, BuildContext context) {
    context.showFlash<bool>(
      barrierDismissible: true,
      duration: const Duration(seconds: 3),
      builder: (context, controller) => FlashBar(
        controller: controller,
        position: FlashPosition.top,
        backgroundColor: ColorApp.green,
        content: Text(message,
            style: StyleApp.textNormal.copyWith(
              fontWeight: FontWeight.w700,
              color: ColorApp.white,
            )),
        elevation: 0,
      ),
    );
  }
}
