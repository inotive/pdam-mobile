import 'package:pdam_inventory/data/networks/app_api.dart';
import 'package:pdam_inventory/data/requests/create_stock_opname_request.dart';
import 'package:pdam_inventory/data/responses/base_response.dart';
import 'package:pdam_inventory/data/responses/stock_opname_response.dart';

abstract class StockOpnameDataSource {
  Future<StockOpnameResponse> stockOpname(Map<String, dynamic> queries);
  Future<StockOpnameDetailResponse> stockOpnameDetail(String id);
  Future<MessageResponse> createStockOpname(CreateStockOpnameRequest request);
}

class StockOpnameDataSourceImpl implements StockOpnameDataSource {
  final AppServiceClient _appServiceClient;
  StockOpnameDataSourceImpl(this._appServiceClient);

  @override
  Future<StockOpnameResponse> stockOpname(Map<String, dynamic> queries) async {
    return await _appServiceClient.stockOpname(queries);
  }

  @override
  Future<StockOpnameDetailResponse> stockOpnameDetail(String id) async {
    return await _appServiceClient.stockOpnameDetail(id);
  }

  @override
  Future<MessageResponse> createStockOpname(CreateStockOpnameRequest request) async {
    return await _appServiceClient.createStockOpname(
      request.warehouseId,
      request.opnameNumber,
      request.date,
      request.description,
      request.products,
    );
  }
}
