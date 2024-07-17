import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: ColorApp.primary,
    fontFamily: 'Mulish',
    scaffoldBackgroundColor: ColorApp.white,
    splashColor: ColorApp.primary,
    highlightColor: ColorApp.primary,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorApp.primary,
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: ColorApp.white,
      ),
      titleTextStyle: StyleApp.textLg.copyWith(
        fontWeight: FontWeight.w900,
        color: ColorApp.white,
      ),
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: WidgetStateProperty.all(ColorApp.primary),
      trackColor: WidgetStateProperty.all(ColorApp.track),
      minThumbLength: 300.0,
    ),
  );
}

SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
  systemNavigationBarColor: Colors.white,
  statusBarColor: ColorApp.primary,
  statusBarIconBrightness: Brightness.light,
  systemNavigationBarIconBrightness: Brightness.light,
);
