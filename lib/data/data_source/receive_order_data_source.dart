import 'package:pdam_inventory/data/networks/app_api.dart';
import 'package:pdam_inventory/data/responses/receive_order_response.dart';

abstract class ReceiveOrderDataSource {
  Future<ReceiveOrderPaginationResponse> receiveOrders();
  Future<ReceiveOrderDetailResponse> receiveOrderDetail(int id);
}

class ReceiveOrderDataSourceImpl implements ReceiveOrderDataSource {
  final AppServiceClient _appServiceClient;
  ReceiveOrderDataSourceImpl(this._appServiceClient);

  @override
  Future<ReceiveOrderPaginationResponse> receiveOrders() async {
    return await _appServiceClient.receiveOrders();
  }

  @override
  Future<ReceiveOrderDetailResponse> receiveOrderDetail(int id) async {
    return await _appServiceClient.receiveOrderDetail(id);
  }
}
