import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/config_app.dart';
import 'package:pdam_inventory/persentations/resources/route_app.dart';
import 'package:pdam_inventory/persentations/resources/theme_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    return MaterialApp(
      theme: getApplicationTheme(),
      title: ConfigApp.appName,
      onGenerateRoute: RouterGenerator.getRoute,
      initialRoute: Routes.splash,
    );
  }
}
