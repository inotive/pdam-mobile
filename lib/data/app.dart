import 'package:flutter/material.dart';
import 'package:pdam_inventory/data/config_app.dart';
import 'package:pdam_inventory/persentations/modules/splash/splash_view.dart';
import 'package:pdam_inventory/persentations/resources/theme_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getApplicationTheme(),
      title: ConfigApp.appName,
      home: const SplashView(),
    );
  }
}
