import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/modules/accepted_item/accepted_item_view.dart';
import 'package:pdam_inventory/persentations/modules/accepted_item/received_item_view.dart';
import 'package:pdam_inventory/persentations/modules/history_stock/history_stock_view.dart';
import 'package:pdam_inventory/persentations/modules/main_menu/main_menu_view.dart';
import 'package:pdam_inventory/persentations/modules/notification/notification_view.dart';
import 'package:pdam_inventory/persentations/modules/product/product_view.dart';
import 'package:pdam_inventory/persentations/modules/purchase_item/purchase_item_view.dart';
import 'package:pdam_inventory/persentations/modules/requested_item/requested_item_view.dart';
import 'package:pdam_inventory/persentations/modules/splash/splash_view.dart';
import 'package:pdam_inventory/persentations/modules/stock_opname/stock_opname_view.dart';
import 'package:pdam_inventory/persentations/modules/undefined/undefined_view.dart';

class Routes {
  static const String splash = '/';
  static const String notification = '/notification';
  static const String historyStock = '/history-stock';
  static const String purchaseItem = '/purchase-item';
  static const String product = '/product';
  static const String requestedItem = '/requested-item';
  static const String stockOpname = '/stock-opname';
  static const String acceptedItem = '/accepted-item';
  static const String receivedItem = '/received-item';
  static const String mainMenu = '/main-menu';
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
      case Routes.requestedItem:
        return MaterialPageRoute(builder: (_) => const RequestedItemView());
      case Routes.stockOpname:
        return MaterialPageRoute(builder: (_) => const StockOpnameView());
      case Routes.acceptedItem:
        return MaterialPageRoute(builder: (_) => const AcceptedItemView());
      case Routes.receivedItem:
        return MaterialPageRoute(builder: (_) => const ReceivedItemView());
      case Routes.mainMenu:
        return MaterialPageRoute(builder: (_) => const MainMenuView());
      default:
        return MaterialPageRoute(builder: (_) => const UndefinedView());
    }
  }
}
