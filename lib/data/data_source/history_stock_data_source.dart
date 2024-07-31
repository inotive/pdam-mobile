import 'package:pdam_inventory/data/networks/app_api.dart';
import 'package:pdam_inventory/data/responses/history_stock_response.dart';

abstract class HistoryStockDataSource {
  Future<HistoryStockResponse> historyStock(Map<String, dynamic> queries);
}

class HistoryStockDataSourceImpl implements HistoryStockDataSource {
  final AppServiceClient _appServiceClient;

  HistoryStockDataSourceImpl(this._appServiceClient);

  @override
  Future<HistoryStockResponse> historyStock(Map<String, dynamic> queries) async {
    return await _appServiceClient.historyStock(queries);
  }
}
