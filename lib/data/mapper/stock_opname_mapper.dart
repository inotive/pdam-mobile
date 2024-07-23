import 'package:pdam_inventory/app/extensions.dart';
import 'package:pdam_inventory/data/responses/stock_opname_response.dart';
import 'package:pdam_inventory/domain/model/stock_opname_model.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';

extension StockOpnameResponseMapper on StockOpnameResponse? {
  StockOpname toDomain() {
    List<StockOpnameData> stocks =
        (this?.data.map((item) => item.toDomain()) ?? const Iterable.empty()).cast<StockOpnameData>().toList();
    return StockOpname(stocks);
  }
}

extension StockOpnameDataResponseMapper on StockOpnameDataResponse? {
  StockOpnameData toDomain() {
    return StockOpnameData(
      this?.id.orZero() ?? ZERO,
      this?.warehouseId.orEmpty() ?? EMPTY,
      this?.opnameNumber.orEmpty() ?? EMPTY,
      this?.date.orEmpty() ?? EMPTY,
      this?.description.orEmpty() ?? EMPTY,
      this?.status.orEmpty() ?? EMPTY,
      this?.productCount.orZero() ?? ZERO,
      this?.createdBy.orEmpty() ?? EMPTY,
      this?.updatedBy.orEmpty() ?? EMPTY,
      this?.deletedBy.orEmpty() ?? EMPTY,
      this?.createdAt.orEmpty() ?? EMPTY,
      this?.updatedAt.orEmpty() ?? EMPTY,
      this?.deletedAt.orEmpty() ?? EMPTY,
      this?.finishedDate.orEmpty() ?? EMPTY,
    );
  }
}
