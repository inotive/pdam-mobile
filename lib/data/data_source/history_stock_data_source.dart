import 'package:pdam_inventory/data/networks/app_api.dart';
import 'package:pdam_inventory/data/responses/history_stock_response.dart';

abstract class HistoryStockDataSource {
  Future<HistoryStockResponse> historyStock();
}

class HistoryStockDataSourceImpl implements HistoryStockDataSource {
  final AppServiceClient _appServiceClient;

  HistoryStockDataSourceImpl(this._appServiceClient);

  @override
  Future<HistoryStockResponse> historyStock() async {
    return await _appServiceClient.historyStock();
  }
}
