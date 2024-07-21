import 'package:pdam_inventory/app/extensions.dart';
import 'package:pdam_inventory/data/responses/history_stock_response.dart';
import 'package:pdam_inventory/domain/model/history_stock_model.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';

extension HistoryStockDataResponseMapper on HistoryStockDataResponse? {
  HistoryStockData toDomain() {
    return HistoryStockData(
      this?.id.orEmpty() ?? EMPTY,
      this?.purchaseRequestId.orEmpty() ?? EMPTY,
      this?.purchaseOrderId.orEmpty() ?? EMPTY,
      this?.type.orEmpty() ?? EMPTY,
      this?.source.orEmpty() ?? EMPTY,
      this?.productId.orEmpty() ?? EMPTY,
      this?.createdAt.orEmpty() ?? EMPTY,
      this?.updatedAt.orEmpty() ?? EMPTY,
      this?.receiveOrderId.orEmpty() ?? EMPTY,
      this?.stockOpnameId.orEmpty() ?? EMPTY,
      this?.referenceNumber.orEmpty() ?? EMPTY,
      this?.lastStock.orEmpty() ?? EMPTY,
      this?.qty.orEmpty() ?? EMPTY,
      this?.currentStock.orEmpty() ?? EMPTY,
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
