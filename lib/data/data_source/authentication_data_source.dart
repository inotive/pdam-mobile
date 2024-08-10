import 'package:pdam_inventory/data/local_source/app_preference.dart';
import 'package:pdam_inventory/data/networks/app_api.dart';
import 'package:pdam_inventory/data/networks/app_api_other.dart';
import 'package:pdam_inventory/data/requests/login_request.dart';
import 'package:pdam_inventory/data/requests/update_user_request.dart';
import 'package:pdam_inventory/data/responses/authentication_response.dart';
import 'package:pdam_inventory/data/responses/base_response.dart';

abstract class AuthenticationDataSource {
  Future<LoginResponse> login(LoginRequest request);
  Future<MessageResponse> logout();
  Future<UpdateUserResponse> update(UpdateUserRequest request);
}

class AuthenticationDataSourceImpl implements AuthenticationDataSource {
  final AppServiceClient _appServiceClient;
  final AppServiceClientOther _appServiceClientOther;
  final AppPreference _appPreference;
  AuthenticationDataSourceImpl(this._appServiceClient, this._appPreference, this._appServiceClientOther);

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    return await _appServiceClient.login(request.username, request.password);
  }

  @override
  Future<MessageResponse> logout() async {
    return await _appServiceClient.logout();
  }

  @override
  Future<UpdateUserResponse> update(UpdateUserRequest request) async {
    String token = await _appPreference.getUserToken();
    return await _appServiceClientOther.update(
      token,
      request.name,
      request.password.toString(),
      request.noTelp,
      request.file,
    );
  }
}
