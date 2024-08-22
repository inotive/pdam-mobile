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

extension StockOpnameDetailResponseMapper on StockOpnameDetailResponse? {
  StockOpnameDetail toDomain() {
    return StockOpnameDetail(
      this?.data.toDomain(),
    );
  }
}

extension StockOpnameDetailDataResponseMapper on StockOpnameDetailDataResponse? {
  StockOpnameDetailData toDomain() {
    List<StockOpnameProductData> products = (this?.products.map((item) => item.toDomain()) ?? const Iterable.empty())
        .cast<StockOpnameProductData>()
        .toList();

    return StockOpnameDetailData(this?.detail.toDomain(), products);
  }
}

extension StockOpnameDetailDataDetailResponseMapper on StockOpnameDetailDataDetailResponse? {
  StockOpnameDetailDataDetail toDomain() {
    return StockOpnameDetailDataDetail(
      this?.id?.orZero() ?? ZERO,
      this?.warehouseId?.orZero() ?? ZERO,
      this?.opnameNumber?.orEmpty() ?? EMPTY,
      this?.date?.orEmpty() ?? EMPTY,
      this?.description?.orEmpty() ?? EMPTY,
      this?.status?.orEmpty() ?? EMPTY,
      this?.createdAt?.orEmpty() ?? EMPTY,
      this?.updatedAt?.orEmpty() ?? EMPTY,
      this?.warehouseName?.toDomain(),
    );
  }
}

extension StockOpnameWarehouseDataResponseMapper on StockOpnameWarehouseDataResponse? {
  StockOpnameWarehouseData toDomain() {
    return StockOpnameWarehouseData(
      this?.id?.orZero() ?? ZERO,
      this?.name?.orEmpty() ?? EMPTY,
      this?.description?.orEmpty() ?? EMPTY,
      this?.pic?.orZero() ?? ZERO,
      this?.address?.orEmpty() ?? EMPTY,
      this?.createdAt?.orEmpty() ?? EMPTY,
      this?.updatedAt?.orEmpty() ?? EMPTY,
    );
  }
}

extension StockOpnameProductDataResponseMapper on StockOpnameProductDataResponse? {
  StockOpnameProductData toDomain() {
    return StockOpnameProductData(
      code: this?.code?.orEmpty() ?? EMPTY,
      id: this?.id?.orZero() ?? ZERO,
      name: this?.name?.orEmpty() ?? EMPTY,
      unitName: this?.unitName?.orEmpty() ?? EMPTY,
      lastStock: this?.lastStock?.orZero() ?? ZERO,
      actualStock: this?.actualStock?.orZero() ?? ZERO,
      difference: this?.difference?.orZero() ?? ZERO,
      createdAt: this?.createdAt?.orEmpty() ?? EMPTY,
      updatedAt: this?.updatedAt?.orEmpty() ?? EMPTY,
    );
  }
}
