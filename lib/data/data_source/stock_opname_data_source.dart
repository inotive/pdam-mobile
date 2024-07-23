import 'package:pdam_inventory/data/networks/app_api.dart';
import 'package:pdam_inventory/data/responses/stock_opname_response.dart';

abstract class StockOpnameDataSource {
  Future<StockOpnameResponse> stockOpname(Map<String, dynamic> queries);
}

class StockOpnameDataSourceImpl implements StockOpnameDataSource {
  final AppServiceClient _appServiceClient;
  StockOpnameDataSourceImpl(this._appServiceClient);

  @override
  Future<StockOpnameResponse> stockOpname(Map<String, dynamic> queries) async {
    return await _appServiceClient.stockOpname(queries);
  }
}
