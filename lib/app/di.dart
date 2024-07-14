import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pdam_inventory/data/data_source/authentication_data_source.dart';
import 'package:pdam_inventory/data/data_source/purchase_request_data_source.dart';
import 'package:pdam_inventory/data/local_source/app_preference.dart';
import 'package:pdam_inventory/data/networks/app_api.dart';
import 'package:pdam_inventory/data/networks/dio_factory.dart';
import 'package:pdam_inventory/data/networks/network_info.dart';
import 'package:pdam_inventory/data/repository/authentication_repository_impl.dart';
import 'package:pdam_inventory/data/repository/purchase_request_repository_impl.dart';
import 'package:pdam_inventory/domain/repository/authentication_repository.dart';
import 'package:pdam_inventory/domain/repository/purchase_request_repository.dart';
import 'package:pdam_inventory/domain/usecase/authentication/login_usecase.dart';
import 'package:pdam_inventory/domain/usecase/authentication/logout_usecase.dart';
import 'package:pdam_inventory/domain/usecase/purchase_request_detail_usecase.dart';
import 'package:pdam_inventory/domain/usecase/purchase_request_summary_usecase.dart';
import 'package:pdam_inventory/domain/usecase/purchase_request_usecase.dart';
import 'package:pdam_inventory/persentations/modules/auth/login/viewmodel/login_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/profile/viewmodel/profile_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/requested_item/viewmodel/requested_detail_viewmodel.dart';
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
  instance.registerLazySingleton<AuthenticationDataSource>(() => AuthenticationDataSourceImpl(instance()));

  // repository
  instance
      .registerLazySingleton<PurchaseRequestRepository>(() => PurchaseRequestRepositoryImpl(instance(), instance()));
  instance.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(instance(), instance(), instance()));

// initAppModule
  initLoginModule();
  initPurchaseRequestDetailModule();
  initProfiileModule();
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
    instance.registerFactory<ProfileViewModel>(() => ProfileViewModel(instance()));
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

resetModules() {
  instance.reset(dispose: false);
  initAppModule();
  initLoginModule();
  initPurchaseRequestModule();
  initPurchaseRequestDetailModule();
  initProfiileModule();
}
