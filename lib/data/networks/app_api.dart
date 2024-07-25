// ignore_for_file: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:pdam_inventory/app/config_app.dart';
import 'package:pdam_inventory/data/params/receipt_produt_param.dart';
import 'package:pdam_inventory/data/responses/authentication_response.dart';
import 'package:pdam_inventory/data/responses/base_response.dart';
import 'package:pdam_inventory/data/responses/history_stock_response.dart';
import 'package:pdam_inventory/data/responses/product_response.dart';
import 'package:pdam_inventory/data/responses/purchase_request_response.dart';
import 'package:pdam_inventory/data/responses/receive_order_response.dart';
import 'package:pdam_inventory/data/responses/stock_opname_response.dart';
import 'package:retrofit/retrofit.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: ConfigApp.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  /* Purchase Request */
  @GET('/mobile/purchase-request')
  Future<PurchaseRequestPaginationResponse> purchaseRequest(
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/mobile/purchase-request/summary')
  Future<PurchaseRequestSummaryResponse> purchaseRequestSummary();

  @GET('/mobile/purchase-request/{id}/show')
  Future<PurchaseRequestDetailResponse> purchaseRequestDetail(@Path() int id);
  /* End Purchase Request */

  /* Authentication */
  @POST('/auth/login')
  Future<LoginResponse> login(
    @Field() String username,
    @Field() String password,
  );

  @POST('/auth/logout')
  Future<MessageResponse> logout();
  /* End Authentication */

  /* Products */
  @GET('/mobile/product')
  Future<ProductResponse> products();

  @GET('/mobile/product/summary')
  Future<ProductSummaryResponse> productSummary();

  @GET('/mobile/product/{id}/show')
  Future<ProductDetailResponse> productDetail(@Path() int id);

  @GET('/mobile/product/{id}/stock-warehouse')
  Future<ProductWarehouseResponse> productWarehouse(@Path() int id);

  @GET('/mobile/product/{id}/stock-history')
  Future<ProductStockHistoryResponse> productStockHistory(@Path() int id);
  /* End Products */

  /* Receive Order */
  @GET('/mobile/receive-order')
  Future<ReceiveOrderPaginationResponse> receiveOrders();

  @GET('/mobile/receive-order/{id}/show')
  Future<ReceiveOrderDetailResponse> receiveOrderDetail(@Path() int id);

  @GET('/mobile/receive-order/list-warehouse')
  Future<ReceiveOrderWarehouseResponse> receiveOrderWarehouse(@Queries() Map<String, dynamic> queries);

  @GET('/mobile/receive-order/list-reference')
  Future<ReceiveOrderReferenceResponse> receiveOrderReference(@Queries() Map<String, dynamic> queries);

  @GET('/mobile/receive-order/list-reference/{id}/show')
  Future<ReceiveOrderReferenceDetailResponse> receiveOrderReferenceDetail(@Path() int id);

  @GET('/mobile/receive-order/list-supplier')
  Future<ReceiveOrderSupplierResponse> receiveOrderSupplier(@Queries() Map<String, dynamic> queries);

  @POST('/mobile/receive-order')
  Future<MessageResponse> createReceiveOrder(
    @Field('refference_number') String refferenceNumber,
    @Field('warehouse_id') String warehouseId,
    @Field('note') String? note,
    @Field('product_list') List<ReceiptProductParam> productList,
  );

  /* End Receive Order */

  /* History Stock */

  @GET('/mobile/product-stock')
  Future<HistoryStockResponse> historyStock();

  /* End History Stock */

  /* Stock Opname */
  @GET('/mobile/stock-opname')
  Future<StockOpnameResponse> stockOpname(
    @Queries() Map<String, dynamic> queries,
  );
  /* End Stock Opname */
}
