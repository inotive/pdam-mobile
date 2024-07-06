import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/modules/design_system/design_system.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late Timer _timer;

  _onStart() {
    _timer = Timer(const Duration(seconds: 1), _goNext);
  }

  _goNext() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DesignSystemView()));
  }

  @override
  void initState() {
    _onStart();
    super.initState();
  }

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
