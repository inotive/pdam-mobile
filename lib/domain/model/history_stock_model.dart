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
    this.productName,
  );

  int id;
  int purchaseRequestId;
  int purchaseOrderId;
  String type;
  String source;
  int productId;
  String createdAt;
  String updatedAt;
  int receiveOrderId;
  int stockOpnameId;
  String referenceNumber;
  int lastStock;
  int qty;
  int currentStock;
  String productName;
}

class HistoryStock {
  HistoryStock(this.data);

  List<HistoryStockData> data;
}
