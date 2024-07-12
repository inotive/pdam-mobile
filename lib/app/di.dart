import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pdam_inventory/data/data_source/purchase_request_data_source.dart';
import 'package:pdam_inventory/data/local_source/app_preference.dart';
import 'package:pdam_inventory/data/networks/app_api.dart';
import 'package:pdam_inventory/data/networks/dio_factory.dart';
import 'package:pdam_inventory/data/networks/network_info.dart';
import 'package:pdam_inventory/data/repository/purchase_request_repository_impl.dart';
import 'package:pdam_inventory/domain/repository/purchase_request_repository.dart';
import 'package:pdam_inventory/domain/usecase/purchase_request_usecase.dart';
import 'package:pdam_inventory/persentations/modules/requested_item/viewmodel/requested_viewmodel.dart';
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

  // data source
  instance.registerLazySingleton<PurchaseRequestDataSource>(() => PurchaseRequestDataSourceImpl(instance()));

  // repository
  instance
      .registerLazySingleton<PurchaseRequestRepository>(() => PurchaseRequestRepositoryImpl(instance(), instance()));
}

initPurchaseRequestModule() {
  if (!GetIt.I.isRegistered<PurchaseRequestUsecase>()) {
    instance.registerFactory<PurchaseRequestUsecase>(() => PurchaseRequestUsecase(instance()));
    instance.registerFactory<RequestedViewModel>(() => RequestedViewModel(instance()));
  }
}

resetModules() {
  instance.reset(dispose: false);
}
