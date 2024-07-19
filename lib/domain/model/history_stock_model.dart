class HistoryStockData {
  HistoryStockData(
    this.id,
    this.purchaseRequestId,
    this.purchaseOrderId,
    this.type,
    this.source,
    this.productId,
    this.createdAt,
    this.updatedAt,
    this.receiveOrderId,
    this.stockOpnameId,
    this.referenceNumber,
    this.lastStock,
    this.qty,
    this.currentStock,
  );

  int? id;
  String? purchaseRequestId;
  String? purchaseOrderId;
  String? type;
  String? source;
  String? productId;
  String? createdAt;
  String? updatedAt;
  String? receiveOrderId;
  String? stockOpnameId;
  String? referenceNumber;
  String? lastStock;
  String? qty;
  String? currentStock;
}

class HistoryStock {
  HistoryStock(this.data);

  List<HistoryStockData> data;
}
