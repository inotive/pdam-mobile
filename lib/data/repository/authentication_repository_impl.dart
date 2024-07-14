// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/data_source/authentication_data_source.dart';
import 'package:pdam_inventory/data/local_source/app_preference.dart';
import 'package:pdam_inventory/data/networks/error_handler.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/data/networks/network_info.dart';
import 'package:pdam_inventory/data/requests/login_request.dart';
import 'package:pdam_inventory/domain/repository/authentication_repository.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationDataSource _authenticationDataSource;
  final NetworkInfo _networkInfo;
  final AppPreference _appPreference;

  AuthenticationRepositoryImpl(
    this._authenticationDataSource,
    this._networkInfo,
    this._appPreference,
  );

  @override
  Future<Either<Failure, bool>> login(LoginRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _authenticationDataSource.login(request);
        if (response.meta?.code == ResponseCode.SUCCESS) {
          _appPreference.setUserToken("${response.token?.tokenType} ${response.token?.accessToken}");
          _appPreference.setString(PREFS_KEY_NAME, response.data?.name ?? EMPTY);
          return const Right(true);
        } else {
          return Left(
            Failure(
              response.meta?.code ?? ResponseCode.DEFAULT,
              response.meta?.message ?? ResponseMessage.DEFAULT,
            ),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
