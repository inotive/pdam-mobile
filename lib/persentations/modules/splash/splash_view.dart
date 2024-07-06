import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 100,
          width: 200,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: ColorApp.primary,
            shape: BoxShape.circle,
          ),
          child: Text(
            StringApp.pdam,
            style: StyleApp.textXl.copyWith(
              fontWeight: FontWeight.w700,
              color: ColorApp.white,
            ),
          ),
        ),
      ),
    );
  }
}
