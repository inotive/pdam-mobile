import 'package:pdam_inventory/data/networks/app_api.dart';
import 'package:pdam_inventory/data/responses/purchase_request_response.dart';

abstract class PurchaseRequestDataSource {
  Future<PurchaseRequestPaginationResponse> purchaseRequest(Map<String, dynamic> queries);
}

class PurchaseRequestDataSourceImpl implements PurchaseRequestDataSource {
  PurchaseRequestDataSourceImpl(this._appServiceClient);

  final AppServiceClient _appServiceClient;

  @override
  Future<PurchaseRequestPaginationResponse> purchaseRequest(Map<String, dynamic> queries) async {
    return await _appServiceClient.purchaseRequest(queries);
  }
}
