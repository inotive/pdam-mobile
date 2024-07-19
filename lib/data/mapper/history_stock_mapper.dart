import 'package:pdam_inventory/app/extensions.dart';
import 'package:pdam_inventory/data/responses/history_stock_response.dart';
import 'package:pdam_inventory/domain/model/history_stock_model.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';

extension HistoryStockDataResponseMapper on HistoryStockDataResponse? {
  HistoryStockData toDomain() {
    return HistoryStockData(
      this?.id.orZero() ?? ZERO,
      this?.purchaseRequestId.orEmpty() ?? EMPTY,
      this?.purchaseOrderId.orEmpty() ?? EMPTY,
      this?.type.orEmpty(),
      this?.source.orEmpty(),
      this?.productId.orEmpty(),
      this?.createdAt.orEmpty(),
      this?.updatedAt.orEmpty(),
      this?.receiveOrderId.orEmpty(),
      this?.stockOpnameId.orEmpty(),
      this?.referenceNumber.orEmpty(),
      this?.lastStock.orEmpty(),
      this?.qty.orEmpty(),
      this?.currentStock.orEmpty(),
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
