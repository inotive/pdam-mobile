import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/modules/history_stock/history_stock_view.dart';
import 'package:pdam_inventory/persentations/modules/notification/notification_view.dart';
import 'package:pdam_inventory/persentations/modules/splash/splash_view.dart';
import 'package:pdam_inventory/persentations/modules/undefined/undefined_view.dart';

class Routes {
  static const String splash = '/';
  static const String notification = '/notification';
  static const String historyStock = '/history-stock';
}

class RouterGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.notification:
        return MaterialPageRoute(builder: (_) => const NotificationView());
      case Routes.historyStock:
        return MaterialPageRoute(builder: (_) => const HistoryStockView());
      default:
        return MaterialPageRoute(builder: (_) => const UndefinedView());
    }
  }
}
