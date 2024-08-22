import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pdam_inventory/data/data_source/authentication_data_source.dart';
import 'package:pdam_inventory/data/data_source/history_stock_data_source.dart';
import 'package:pdam_inventory/data/data_source/notification_data_source.dart';
import 'package:pdam_inventory/data/data_source/product_data_source.dart';
import 'package:pdam_inventory/data/data_source/purchase_order_data_source.dart';
import 'package:pdam_inventory/data/data_source/purchase_request_data_source.dart';
import 'package:pdam_inventory/data/data_source/receive_order_data_source.dart';
import 'package:pdam_inventory/data/data_source/stock_opname_data_source.dart';
import 'package:pdam_inventory/data/data_source/vendor_data_source.dart';
import 'package:pdam_inventory/data/local_source/app_preference.dart';
import 'package:pdam_inventory/data/networks/app_api.dart';
import 'package:pdam_inventory/data/networks/app_api_other.dart';
import 'package:pdam_inventory/data/networks/dio_factory.dart';
import 'package:pdam_inventory/data/networks/network_info.dart';
import 'package:pdam_inventory/data/repository/authentication_repository_impl.dart';
import 'package:pdam_inventory/data/repository/history_stock_repository_impl.dart';
import 'package:pdam_inventory/data/repository/notification_repository_impl.dart';
import 'package:pdam_inventory/data/repository/product_repository_impl.dart';
import 'package:pdam_inventory/data/repository/purchase_order_repository_impl.dart';
import 'package:pdam_inventory/data/repository/purchase_request_repository_impl.dart';
import 'package:pdam_inventory/data/repository/receive_order_repository_impl.dart';
import 'package:pdam_inventory/data/repository/stock_opname_repository_impl.dart';
import 'package:pdam_inventory/data/repository/vendor_repository_impl.dart';
import 'package:pdam_inventory/domain/repository/authentication_repository.dart';
import 'package:pdam_inventory/domain/repository/history_stock_repository.dart';
import 'package:pdam_inventory/domain/repository/notification_repository.dart';
import 'package:pdam_inventory/domain/repository/product_repository.dart';
import 'package:pdam_inventory/domain/repository/purchase_order_repository.dart';
import 'package:pdam_inventory/domain/repository/purchase_request_repository.dart';
import 'package:pdam_inventory/domain/repository/receive_order_repository.dart';
import 'package:pdam_inventory/domain/repository/stock_opname_repository.dart';
import 'package:pdam_inventory/domain/repository/vendor_repository.dart';
import 'package:pdam_inventory/domain/usecase/authentication/login_usecase.dart';
import 'package:pdam_inventory/domain/usecase/authentication/logout_usecase.dart';
import 'package:pdam_inventory/domain/usecase/authentication/update_user_usecase.dart';
import 'package:pdam_inventory/domain/usecase/history_stock/history_stock_usecase.dart';
import 'package:pdam_inventory/domain/usecase/notification/notification_count_usecase.dart';
import 'package:pdam_inventory/domain/usecase/notification/notification_usecase.dart';
import 'package:pdam_inventory/domain/usecase/notification/read_notification_usecase.dart';
import 'package:pdam_inventory/domain/usecase/products/product_by_warehouse_usecase.dart';
import 'package:pdam_inventory/domain/usecase/products/product_detail_usecase.dart';
import 'package:pdam_inventory/domain/usecase/products/product_stock_history_usecase.dart';
import 'package:pdam_inventory/domain/usecase/products/product_summary_usecase.dart';
import 'package:pdam_inventory/domain/usecase/products/product_usecase.dart';
import 'package:pdam_inventory/domain/usecase/products/product_warehouse_usecase.dart';
import 'package:pdam_inventory/domain/usecase/purchase_order/purchase_order_detail_usecase.dart';
import 'package:pdam_inventory/domain/usecase/purchase_order/purchase_order_usecase.dart';
import 'package:pdam_inventory/domain/usecase/purchase_request/create_purchase_request_usecase.dart';
import 'package:pdam_inventory/domain/usecase/purchase_request_detail_usecase.dart';
import 'package:pdam_inventory/domain/usecase/purchase_request_summary_usecase.dart';
import 'package:pdam_inventory/domain/usecase/purchase_request_usecase.dart';
import 'package:pdam_inventory/domain/usecase/receive_order/receive_order_create_usecase.dart';
import 'package:pdam_inventory/domain/usecase/receive_order/receive_order_detail_usecase.dart';
import 'package:pdam_inventory/domain/usecase/receive_order/receive_order_reference_detail_usecase.dart';
import 'package:pdam_inventory/domain/usecase/receive_order/receive_order_reference_usecase.dart';
import 'package:pdam_inventory/domain/usecase/receive_order/receive_order_supplier_usecase.dart';
import 'package:pdam_inventory/domain/usecase/receive_order/receive_order_usecase.dart';
import 'package:pdam_inventory/domain/usecase/receive_order/receive_order_warehouse_usecase.dart';
import 'package:pdam_inventory/domain/usecase/stock_opname/stock_opname_create_usecase.dart';
import 'package:pdam_inventory/domain/usecase/stock_opname/stock_opname_detail_usecase.dart';
import 'package:pdam_inventory/domain/usecase/stock_opname/stock_opname_usecase.dart';
import 'package:pdam_inventory/domain/usecase/vendor/vendor_usecase.dart';
import 'package:pdam_inventory/persentations/modules/accepted_item/viewmodel/receive_order_detail_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/accepted_item/viewmodel/receive_order_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/auth/login/viewmodel/login_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/history_stock/viewmodel/history_stock_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/home/viewmodel/home_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/notification/viewmodel/notification_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/product/viewmodel/product_detail_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/product/viewmodel/product_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/profile/viewmodel/profile_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/purchase_item/purchase/viewmodel/purchase_order_detail_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/purchase_item/purchase/viewmodel/purchase_order_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/receipt_item/viewmodel/receipt_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/requested_item/create_request_item/viewmodel/create_request_item_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/requested_item/request_item/viewmodel/requested_detail_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/requested_item/request_item/viewmodel/requested_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/stock_opname/create_stock_opname/viewmodel/create_stock_opname_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/stock_opname/detail/viewmodel/stock_opname_detail_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/stock_opname/stock_opname_list/viewmodel/stock_opname_viewmodel.dart';
import 'package:pdam_inventory/persentations/widgets/forms/dropdown_warehouse/viewmodel/warehouse_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  // Shared Prefs instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // App Prefss instance
  instance.registerLazySingleton<AppPreference>(() => AppPreference(instance()));

  // network info
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()));

  // Dio Factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));
  instance.registerLazySingleton<AppServiceClientOther>(() => AppServiceClientOther(dio));

  // data source
  instance
      .registerLazySingleton<PurchaseRequestDataSource>(() => PurchaseRequestDataSourceImpl(instance(), instance()));
  instance.registerLazySingleton<AuthenticationDataSource>(
      () => AuthenticationDataSourceImpl(instance(), instance(), instance()));
  instance.registerLazySingleton<ProductDataSource>(() => ProductDataSourceImpl(instance()));
  instance.registerLazySingleton<ReceiveOrderDataSource>(() => ReceiveOrderDataSourceImpl(instance()));
  instance.registerLazySingleton<HistoryStockDataSource>(() => HistoryStockDataSourceImpl(instance()));
  instance.registerLazySingleton<StockOpnameDataSource>(() => StockOpnameDataSourceImpl(instance()));
  instance.registerLazySingleton<NotificationDataSource>(() => NotificationDataSourceImpl(instance(), instance()));
  instance.registerLazySingleton<PurchaseOrderDataSource>(() => PurchaseOrderDataSourceImpl(instance(), instance()));
  instance.registerLazySingleton<VendorDataSource>(() => VendorDataSourceImpl(instance(), instance()));

  // repository
  instance
      .registerLazySingleton<PurchaseRequestRepository>(() => PurchaseRequestRepositoryImpl(instance(), instance()));
  instance.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(instance(), instance(), instance()));
  instance.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(instance(), instance()));
  instance.registerLazySingleton<ReceiveOrderRepository>(() => ReceiveOrderRepositoryImpl(instance(), instance()));
  instance.registerLazySingleton<HistoryStockRepository>(() => HistoryStockRepositoryImpl(instance(), instance()));
  instance.registerLazySingleton<StockOpnameRepository>(() => StockOpnameRepositoryImpl(instance(), instance()));
  instance.registerLazySingleton<NotificationRepository>(
      () => NotificationRepositoryImpl(instance(), instance(), instance()));
  instance.registerLazySingleton<PurchaseOrderRepository>(() => PurchaseOrderRepositoryImpl(instance(), instance()));
  instance.registerLazySingleton<VendorRepository>(() => VendorRepositoryImpl(instance(), instance()));

// initAppModule
  initLoginModule();
  initPurchaseRequestDetailModule();
  initProfiileModule();
  initReceiveOrderModule();
  initReceiveOrderDetailModule();
  initProductDetailModule();
  initWarehouseModule();
  initStockOpnameDetailModule();
  initCreateStockOpnameModule();
  initPurchaseOrderDetailModule();
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUsecase>()) {
    instance.registerFactory<LoginUsecase>(() => LoginUsecase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

initProfiileModule() {
  if (!GetIt.I.isRegistered<LogoutUsecase>()) {
    instance.registerFactory<LogoutUsecase>(() => LogoutUsecase(instance()));
    instance.registerFactory<UpdateUserUsecase>(() => UpdateUserUsecase(instance()));
    instance.registerFactory<ProfileViewModel>(() => ProfileViewModel(instance(), instance()));
  }
}

initPurchaseRequestModule() {
  if (!GetIt.I.isRegistered<PurchaseRequestUsecase>()) {
    instance.registerFactory<PurchaseRequestUsecase>(() => PurchaseRequestUsecase(instance()));
    instance.registerFactory<PurchaseRequestSummaryUsecase>(() => PurchaseRequestSummaryUsecase(instance()));
    instance.registerFactory<RequestedViewModel>(() => RequestedViewModel(instance(), instance()));
  }
}

initPurchaseRequestDetailModule() {
  if (!GetIt.I.isRegistered<PurchaseRequestDetailUsecase>()) {
    instance.registerFactory<PurchaseRequestDetailUsecase>(() => PurchaseRequestDetailUsecase(instance()));
    instance.registerFactory<RequestedDetailViewModel>(() => RequestedDetailViewModel(instance()));
  }
}

initProductModule() {
  if (!GetIt.I.isRegistered<ProductUsecase>()) {
    instance.registerFactory<ProductUsecase>(() => ProductUsecase(instance()));
    instance.registerFactory<ProductSummaryUsecase>(() => ProductSummaryUsecase(instance()));
    instance.registerFactory<ProductViewmodel>(() => ProductViewmodel(instance(), instance()));
  }
}

initReceiveOrderModule() {
  if (!GetIt.I.isRegistered<ReceiveOrderUsecase>()) {
    instance.registerFactory<ReceiveOrderUsecase>(() => ReceiveOrderUsecase(instance()));
    instance.registerFactory<ReceiveOrderViewmodel>(() => ReceiveOrderViewmodel(instance()));
  }
}

initReceiveOrderDetailModule() {
  if (!GetIt.I.isRegistered<ReceiveOrderDetailUsecase>()) {
    instance.registerFactory<ReceiveOrderDetailUsecase>(() => ReceiveOrderDetailUsecase(instance()));
    instance.registerFactory<ReceiveOrderDetailViewmodel>(() => ReceiveOrderDetailViewmodel(instance()));
  }
}

initHistoryStockModule() {
  if (!GetIt.I.isRegistered<HistoryStockUsecase>()) {
    instance.registerFactory<HistoryStockUsecase>(() => HistoryStockUsecase(instance()));
    instance.registerFactory<HistoryStockViewmodel>(() => HistoryStockViewmodel(instance()));
  }
}

initProductDetailModule() {
  if (!GetIt.I.isRegistered<ProductDetailUsecase>()) {
    instance.registerFactory<ProductDetailUsecase>(() => ProductDetailUsecase(instance()));
    instance.registerFactory<ProductWarehouseUsecase>(() => ProductWarehouseUsecase(instance()));
    instance.registerFactory<ProductStockHistoryUsecase>(() => ProductStockHistoryUsecase(instance()));
    instance.registerFactory<ProductDetailViewmodel>(() => ProductDetailViewmodel(instance(), instance(), instance()));
  }
}

initStockOpnameModule() {
  if (!GetIt.I.isRegistered<StockOpnameUsecase>()) {
    instance.registerFactory<StockOpnameUsecase>(() => StockOpnameUsecase(instance()));
    instance.registerFactory<StockOpnameViewmodel>(() => StockOpnameViewmodel(instance()));
  }
}

initReceiptItemModule() {
  if (!GetIt.I.isRegistered<ReceiveOrderCreateUsecase>()) {
    instance.registerFactory<ReceiveOrderCreateUsecase>(() => ReceiveOrderCreateUsecase(instance()));
    instance.registerFactory<ReceiveOrderReferenceUsecase>(() => ReceiveOrderReferenceUsecase(instance()));
    instance.registerFactory<ReceiveOrderReferenceDetailUsecase>(() => ReceiveOrderReferenceDetailUsecase(instance()));
    instance.registerFactory<ReceiveOrderSupplierUsecase>(() => ReceiveOrderSupplierUsecase(instance()));
    instance.registerFactory<VendorUsecase>(() => VendorUsecase(instance()));
    instance.registerFactory<ReceiptViewmodel>(() => ReceiptViewmodel(
          instance(),
          instance(),
          instance(),
          instance(),
          instance(),
          instance(),
        ));
    if (!GetIt.I.isRegistered<ProductByWarehouseUsecase>()) {
      instance.registerFactory<ProductByWarehouseUsecase>(() => ProductByWarehouseUsecase(instance()));
    }
  }
}

initHomeModule() {
  if (!GetIt.I.isRegistered<NotificationCountUsecase>()) {
    instance.registerFactory<NotificationCountUsecase>(() => NotificationCountUsecase(instance()));
    instance.registerFactory<HomeViewmodel>(() => HomeViewmodel(instance()));
  }
}

initNotificationModule() {
  if (!GetIt.I.isRegistered<NotificationUsecase>()) {
    instance.registerFactory<NotificationUsecase>(() => NotificationUsecase(instance()));
    instance.registerFactory<ReadNotificationUsecase>(() => ReadNotificationUsecase(instance()));
    instance.registerFactory<NotificationViewmodel>(() => NotificationViewmodel(instance(), instance()));
  }
}

initPurchaseOrderModule() {
  if (!GetIt.I.isRegistered<PurchaseOrderUsecase>()) {
    instance.registerFactory<PurchaseOrderUsecase>(() => PurchaseOrderUsecase(instance()));
    instance.registerFactory<PurchaseOrderViewmodel>(() => PurchaseOrderViewmodel(instance()));
  }
}

initCreatePurchaseRequestModule() {
  if (!GetIt.I.isRegistered<CreatePurchaseRequestUsecase>()) {
    instance.registerFactory<CreatePurchaseRequestUsecase>(() => CreatePurchaseRequestUsecase(instance()));
    instance.registerFactory<CreateRequestItemViewmodel>(() => CreateRequestItemViewmodel(instance(), instance()));
    if (!GetIt.I.isRegistered<ProductByWarehouseUsecase>()) {
      instance.registerFactory<ProductByWarehouseUsecase>(() => ProductByWarehouseUsecase(instance()));
    }
  }
}

initWarehouseModule() {
  if (!GetIt.I.isRegistered<ReceiveOrderWarehouseUsecase>()) {
    instance.registerFactory<ReceiveOrderWarehouseUsecase>(() => ReceiveOrderWarehouseUsecase(instance()));
    instance.registerFactory<WarehouseViewmodel>(() => WarehouseViewmodel(instance()));
  }
}

initStockOpnameDetailModule() {
  if (!GetIt.I.isRegistered<StockOpnameDetailUsecase>()) {
    instance.registerFactory<StockOpnameDetailUsecase>(() => StockOpnameDetailUsecase(instance()));
    instance.registerFactory<StockOpnameDetailViewmodel>(() => StockOpnameDetailViewmodel(instance()));
  }
}

initCreateStockOpnameModule() {
  if (!GetIt.I.isRegistered<StockOpnameCreateUsecase>()) {
    instance.registerFactory<StockOpnameCreateUsecase>(() => StockOpnameCreateUsecase(instance()));
    instance.registerFactory<CreateStockOpnameViewmodel>(() => CreateStockOpnameViewmodel(instance(), instance()));
    if (!GetIt.I.isRegistered<ProductByWarehouseUsecase>()) {
      instance.registerFactory<ProductByWarehouseUsecase>(() => ProductByWarehouseUsecase(instance()));
    }
  }
}

initPurchaseOrderDetailModule() {
  if (!GetIt.I.isRegistered<PurchaseOrderDetailUsecase>()) {
    instance.registerFactory<PurchaseOrderDetailUsecase>(() => PurchaseOrderDetailUsecase(instance()));
    instance.registerFactory<PurchaseOrderDetailViewmodel>(() => PurchaseOrderDetailViewmodel(instance()));
  }
}

resetModules() {
  instance.reset(dispose: false);
  initAppModule();
  initLoginModule();
  initPurchaseRequestModule();
  initPurchaseRequestDetailModule();
  initProfiileModule();
  initProductModule();
  initReceiveOrderModule();
  initHistoryStockModule();
  initProductDetailModule();
  initStockOpnameModule();
  initReceiptItemModule();
  initHomeModule();
  initNotificationModule();
  initPurchaseOrderModule();
  initCreatePurchaseRequestModule();
  initWarehouseModule();
  initStockOpnameDetailModule();
  initCreateStockOpnameModule();
  initPurchaseOrderDetailModule();
}
