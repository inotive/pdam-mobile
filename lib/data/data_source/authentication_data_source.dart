import 'package:pdam_inventory/data/networks/app_api.dart';
import 'package:pdam_inventory/data/requests/login_request.dart';
import 'package:pdam_inventory/data/responses/authentication_response.dart';

abstract class AuthenticationDataSource {
  Future<LoginResponse> login(LoginRequest request);
}

class AuthenticationDataSourceImpl implements AuthenticationDataSource {
  final AppServiceClient _appServiceClient;
  AuthenticationDataSourceImpl(this._appServiceClient);

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    return await _appServiceClient.login(request.username, request.password);
  }
}
