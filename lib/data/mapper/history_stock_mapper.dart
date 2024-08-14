import 'package:pdam_inventory/app/extensions.dart';
import 'package:pdam_inventory/data/responses/history_stock_response.dart';
import 'package:pdam_inventory/domain/model/history_stock_model.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';

extension HistoryStockDataResponseMapper on HistoryStockDataResponse? {
  HistoryStockData toDomain() {
    return HistoryStockData(
      this?.id.orZero() ?? ZERO,
      this?.purchaseRequestId.orZero() ?? ZERO,
      this?.purchaseOrderId.orZero() ?? ZERO,
      this?.type.orEmpty() ?? EMPTY,
      this?.source.orEmpty() ?? EMPTY,
      this?.productId.orZero() ?? ZERO,
      this?.createdAt.orEmpty() ?? EMPTY,
      this?.updatedAt.orEmpty() ?? EMPTY,
      this?.receiveOrderId.orZero() ?? ZERO,
      this?.stockOpnameId.orZero() ?? ZERO,
      this?.referenceNumber.orEmpty() ?? EMPTY,
      this?.lastStock.orZero() ?? ZERO,
      this?.qty.orZero() ?? ZERO,
      this?.currentStock.orZero() ?? ZERO,
      this?.productName.orEmpty() ?? EMPTY,
    );
  }
}

extension HistoryStockResponseMapper on HistoryStockResponse? {
  HistoryStock toDomain() {
    List<HistoryStockData> stocks =
        (this?.data?.map((item) => item.toDomain()) ?? const Iterable.empty()).cast<HistoryStockData>().toList();

    return HistoryStock(stocks);
  }
}
