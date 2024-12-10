// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/di.dart';
import 'package:pdam_inventory/data/local_source/app_preference.dart';
import 'package:pdam_inventory/persentations/resources/asset_app.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/route_app.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final AppPreference _appPreference = instance<AppPreference>();

  _onStart() {
    Timer(const Duration(seconds: 1), _goNext);
  }

  _goNext() {
    _appPreference.isUserLoggedIn().then((isUserLoggedIn) => {
          if (isUserLoggedIn)
            Navigator.pushReplacementNamed(context, Routes.mainMenu)
          else
            Navigator.pushReplacementNamed(context, Routes.login)
        });
  }

  @override
  void initState() {
    // _onStart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [ColorApp.primaryBgLinear1, ColorApp.primaryBgLinear2],
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Image.asset(ImageApp.vector1),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Image.asset(ImageApp.vector2),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ColorApp.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(
              ImageApp.logo,
              width: 180,
            ),
          ),
        ],
      ),
    );
  }
}
