import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/resources/asset_app.dart';
import 'package:pdam_inventory/persentations/resources/route_app.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  _onStart() {
    Timer(const Duration(seconds: 1), _goNext);
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, Routes.mainMenu);
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
        child: Image.asset(
          ImageApp.logoWithText,
        ),
      ),
    );
  }
}
