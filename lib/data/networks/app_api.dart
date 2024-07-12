// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:pdam_inventory/app/config_app.dart';
import 'package:pdam_inventory/data/responses/purchase_request_response.dart';
import 'package:retrofit/retrofit.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: ConfigApp.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @GET('/mobile/purchase-request')
  Future<PurchaseRequestPaginationResponse> purchaseRequest(
    @Queries() Map<String, dynamic> queries,
  );
}
