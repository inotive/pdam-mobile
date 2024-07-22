import 'package:pdam_inventory/data/networks/app_api.dart';
import 'package:pdam_inventory/data/responses/product_response.dart';

abstract class ProductDataSource {
  Future<ProductResponse> products();
  Future<ProductSummaryResponse> productSummary();
  Future<ProductDetailResponse> productDetail(int id);
  Future<ProductWarehouseResponse> productWarehouse(int id);
}

class ProductDataSourceImpl extends ProductDataSource {
  final AppServiceClient _appServiceClient;
  ProductDataSourceImpl(this._appServiceClient);

  @override
  Future<ProductResponse> products() async {
    return await _appServiceClient.products();
  }

  @override
  Future<ProductDetailResponse> productDetail(int id) async {
    return await _appServiceClient.productDetail(id);
  }

  @override
  Future<ProductSummaryResponse> productSummary() async {
    return await _appServiceClient.productSummary();
  }

  @override
  Future<ProductWarehouseResponse> productWarehouse(int id) async {
    return await _appServiceClient.productWarehouse(id);
  }
}
