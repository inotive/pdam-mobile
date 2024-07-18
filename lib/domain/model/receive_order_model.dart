class ReceiveOrder {
  ReceiveOrder(
    this.id,
    this.noBukti,
    this.noRef,
    this.count,
    this.receivedBy,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  );

  int id;
  String noBukti;
  String noRef;
  int count;
  String receivedBy;
  String createdBy;
  String updatedBy;
  String deletedBy;
  String createdAt;
  String updatedAt;
  String deletedAt;
}

class ReceiveOrderDate {
  ReceiveOrderDate(
    this.id,
    this.date,
    this.receiveOrder,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  );

  int id;
  String date;
  List<ReceiveOrder> receiveOrder;
  String createdAt;
  String updatedAt;
  String deletedAt;
}

class ReceiveOrderPagination {
  ReceiveOrderPagination(this.data);

  List<ReceiveOrderDate> data;
}
