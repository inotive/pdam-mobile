import 'package:pdam_inventory/data/networks/app_api.dart';
import 'package:pdam_inventory/data/responses/product_response.dart';

abstract class ProductDataSource {
  Future<ProductResponse> products();
}

class ProductDataSourceImpl extends ProductDataSource {
  final AppServiceClient _appServiceClient;
  ProductDataSourceImpl(this._appServiceClient);

  @override
  Future<ProductResponse> products() async {
    return await _appServiceClient.products();
  }
}
