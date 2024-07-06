import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/modules/history_stock/history_stock_view.dart';
import 'package:pdam_inventory/persentations/modules/notification/notification_view.dart';
import 'package:pdam_inventory/persentations/modules/product/product_view.dart';
import 'package:pdam_inventory/persentations/modules/purchase_item/purchase_item_view.dart';
import 'package:pdam_inventory/persentations/modules/splash/splash_view.dart';
import 'package:pdam_inventory/persentations/modules/undefined/undefined_view.dart';

class Routes {
  static const String splash = '/';
  static const String notification = '/notification';
  static const String historyStock = '/history-stock';
  static const String purchaseItem = '/purchase-item';
  static const String product = '/product';
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
      case Routes.purchaseItem:
        return MaterialPageRoute(builder: (_) => const PurchaseItemView());
      case Routes.product:
        return MaterialPageRoute(builder: (_) => const ProductView());
      default:
        return MaterialPageRoute(builder: (_) => const UndefinedView());
    }
  }
}
