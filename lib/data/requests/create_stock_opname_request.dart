import 'package:pdam_inventory/data/params/stock_opname_product_param.dart';

class CreateStockOpnameRequest {
  CreateStockOpnameRequest(
    this.warehouseId,
    this.opnameNumber,
    this.date,
    this.description,
    this.products,
  );
  String warehouseId;
  String opnameNumber;
  String date;
  String description;
  List<StockOpnameProductParam> products;
}
