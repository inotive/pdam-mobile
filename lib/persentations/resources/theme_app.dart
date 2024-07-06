import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: ColorApp.primary,
    useMaterial3: true,
    fontFamily: 'Mulish',
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorApp.primary,
      iconTheme: IconThemeData(
        color: ColorApp.white,
      ),
    ),
  );
}

SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
  systemNavigationBarColor: Colors.white,
  statusBarColor: ColorApp.primary,
  statusBarIconBrightness: Brightness.light,
  systemNavigationBarIconBrightness: Brightness.light,
);
