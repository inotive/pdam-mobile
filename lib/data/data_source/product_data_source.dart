import 'package:pdam_inventory/data/networks/app_api.dart';
import 'package:pdam_inventory/data/responses/product_response.dart';

abstract class ProductDataSource {
  Future<ProductResponse> products(Map<String, dynamic> queries);
  Future<ProductSummaryResponse> productSummary();
  Future<ProductDetailResponse> productDetail(String id);
  Future<ProductWarehouseResponse> productWarehouse(String id);
  Future<ProductStockHistoryResponse> productStockHistory(String id);
  Future<ProductByWarehouseResponse> productByWarehouse(int warehouseId);
}

class ProductDataSourceImpl extends ProductDataSource {
  final AppServiceClient _appServiceClient;
  ProductDataSourceImpl(this._appServiceClient);

  @override
  Future<ProductResponse> products(Map<String, dynamic> queries) async {
    return await _appServiceClient.products(queries);
  }

  @override
  Future<ProductDetailResponse> productDetail(String id) async {
    return await _appServiceClient.productDetail(id);
  }

  @override
  Future<ProductSummaryResponse> productSummary() async {
    return await _appServiceClient.productSummary();
  }

  @override
  Future<ProductWarehouseResponse> productWarehouse(String id) async {
    return await _appServiceClient.productWarehouse(id);
  }

  @override
  Future<ProductStockHistoryResponse> productStockHistory(String id) async {
    return await _appServiceClient.productStockHistory(id);
  }

  @override
  Future<ProductByWarehouseResponse> productByWarehouse(int warehouseId) async {
    return await _appServiceClient.productByWarehouse(warehouseId);
  }
}
