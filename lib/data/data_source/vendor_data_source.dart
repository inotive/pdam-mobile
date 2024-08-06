import 'package:pdam_inventory/data/local_source/app_preference.dart';
import 'package:pdam_inventory/data/networks/app_api.dart';
import 'package:pdam_inventory/data/responses/vendor_response.dart';

abstract class VendorDataSource {
  Future<VendorResponse> vendors(Map<String, dynamic> queries);
}

class VendorDataSourceImpl implements VendorDataSource {
  VendorDataSourceImpl(this._appPreference, this._appServiceClient);
  final AppServiceClient _appServiceClient;
  final AppPreference _appPreference;

  @override
  Future<VendorResponse> vendors(Map<String, dynamic> queries) async {
    String token = await _appPreference.getUserToken();
    return await _appServiceClient.vendors(token, queries);
  }
}
