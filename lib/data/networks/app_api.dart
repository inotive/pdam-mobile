// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:pdam_inventory/app/config_app.dart';
import 'package:pdam_inventory/data/responses/authentication_response.dart';
import 'package:pdam_inventory/data/responses/base_response.dart';
import 'package:pdam_inventory/data/responses/product_response.dart';
import 'package:pdam_inventory/data/responses/purchase_request_response.dart';
import 'package:pdam_inventory/data/responses/receive_order_response.dart';
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
  @GET('/web/master/product')
  Future<ProductResponse> products();

  @GET('/web/master/product/{id}/show')
  Future<ProductDetailResponse> productDetail(@Path() int id);
  /* End Products */

  /* Receive Order */
  @GET('/mobile/receive-order')
  Future<ReceiveOrderPaginationResponse> receiveOrders();

  @GET('/mobile/receive-order/{id}/show')
  Future<ReceiveOrderDetailResponse> receiveOrderDetail(@Path() int id);
  /* End Receive Order */
}
