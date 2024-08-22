import 'package:pdam_inventory/data/local_source/app_preference.dart';
import 'package:pdam_inventory/data/networks/app_api.dart';
import 'package:pdam_inventory/data/responses/purchase_order_response.dart';

abstract class PurchaseOrderDataSource {
  Future<PurchaseOrderResponse> purchaseOrder();
  Future<PurchaseOrderDetailResponse> purchaseOrderDetail(String id);
}

class PurchaseOrderDataSourceImpl implements PurchaseOrderDataSource {
  final AppServiceClient _appServiceClient;
  final AppPreference _appPreference;

  PurchaseOrderDataSourceImpl(this._appServiceClient, this._appPreference);

  @override
  Future<PurchaseOrderResponse> purchaseOrder() async {
    String token = await _appPreference.getUserToken();

    return await _appServiceClient.purchaseOrder(token);
  }

  @override
  Future<PurchaseOrderDetailResponse> purchaseOrderDetail(String id) async {
    String token = await _appPreference.getUserToken();

    return await _appServiceClient.purchaseOrderDetail(token, id);
  }
}
