import 'package:pdam_inventory/data/local_source/app_preference.dart';
import 'package:pdam_inventory/data/networks/app_api.dart';
import 'package:pdam_inventory/data/requests/create_request_item_request.dart';
import 'package:pdam_inventory/data/responses/base_response.dart';
import 'package:pdam_inventory/data/responses/purchase_request_response.dart';

abstract class PurchaseRequestDataSource {
  Future<PurchaseRequestPaginationResponse> purchaseRequest(Map<String, dynamic> queries);
  Future<PurchaseRequestSummaryResponse> purchaseRequestSummary();
  Future<PurchaseRequestDetailResponse> purchaseRequestDetail(int id);
  Future<MessageResponse> createPurchaseRequest(CreateRequestItemRequest request);
}

class PurchaseRequestDataSourceImpl implements PurchaseRequestDataSource {
  PurchaseRequestDataSourceImpl(
    this._appServiceClient,
    this._appPreference,
  );

  final AppServiceClient _appServiceClient;
  final AppPreference _appPreference;

  @override
  Future<PurchaseRequestPaginationResponse> purchaseRequest(Map<String, dynamic> queries) async {
    return await _appServiceClient.purchaseRequest(queries);
  }

  @override
  Future<PurchaseRequestSummaryResponse> purchaseRequestSummary() async {
    return await _appServiceClient.purchaseRequestSummary();
  }

  @override
  Future<PurchaseRequestDetailResponse> purchaseRequestDetail(int id) async {
    return await _appServiceClient.purchaseRequestDetail(id);
  }

  @override
  Future<MessageResponse> createPurchaseRequest(CreateRequestItemRequest request) async {
    String token = await _appPreference.getUserToken();

    return await _appServiceClient.createPurchaseRequest(
      token,
      request.requestNumber,
      request.departmentName,
      request.requestDate,
      request.requestName,
      request.requestDescription,
      request.productList,
    );
  }
}
