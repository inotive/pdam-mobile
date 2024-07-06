import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/modules/splash/splash_view.dart';
import 'package:pdam_inventory/persentations/modules/undefined/undefined_view.dart';

class Routes {
  static const String splash = '/';
}

class RouterGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      default:
        return MaterialPageRoute(builder: (_) => const UndefinedView());
    }
  }
}
