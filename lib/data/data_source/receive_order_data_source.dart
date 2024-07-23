import 'package:pdam_inventory/data/networks/app_api.dart';
import 'package:pdam_inventory/data/requests/receive_order_request.dart';
import 'package:pdam_inventory/data/responses/base_response.dart';
import 'package:pdam_inventory/data/responses/receive_order_response.dart';

abstract class ReceiveOrderDataSource {
  Future<ReceiveOrderPaginationResponse> receiveOrders();
  Future<ReceiveOrderDetailResponse> receiveOrderDetail(int id);
  Future<ReceiveOrderWarehouseResponse> receiveOrderWarehouse(Map<String, dynamic> queries);
  Future<ReceiveOrderReferenceResponse> receiveOrderReference(Map<String, dynamic> queries);
  Future<MessageResponse> createReceiveOrderMap(ReceiveOrderRequest request);
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

  @override
  Future<ReceiveOrderWarehouseResponse> receiveOrderWarehouse(Map<String, dynamic> queries) async {
    return await _appServiceClient.receiveOrderWarehouse(queries);
  }

  @override
  Future<MessageResponse> createReceiveOrderMap(ReceiveOrderRequest request) async {
    return await _appServiceClient.createReceiveOrder(
      request.refferenceNumber,
      request.warehouseId,
      request.note,
      request.productList,
    );
  }

  @override
  Future<ReceiveOrderReferenceResponse> receiveOrderReference(Map<String, dynamic> queries) async {
    return await _appServiceClient.receiveOrderReference(queries);
  }
}
