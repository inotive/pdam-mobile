import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 100,
          width: 200,
          decoration: const BoxDecoration(
            color: ColorApp.primary,
            shape: BoxShape.rectangle,
          ),
        ),
      ),
    );
  }
}
