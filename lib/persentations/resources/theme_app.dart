import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: ColorApp.primary,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorApp.primary,
      iconTheme: IconThemeData(
        color: ColorApp.white,
      ),
    ),
  );
}
