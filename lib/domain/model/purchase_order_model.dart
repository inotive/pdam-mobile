class PurchaseOrder {
  PurchaseOrder(this.data);

  List<PurchaseOrderDate> data;
}

class PurchaseOrderDate {
  PurchaseOrderDate(
    this.id,
    this.date,
    this.purchaseOrder,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  );
  int id;
  String date;
  List<PurchaseOrderData> purchaseOrder;
  String createdAt;
  String updatedAt;
  String deletedAt;
}

class PurchaseOrderData {
  PurchaseOrderData(
    this.id,
    this.requestNumber,
    this.requestNumberPurchaseRequest,
    this.requestDate,
    this.departmentName,
    this.requestName,
    this.requestDescription,
    this.requestDevice,
    this.status,
    this.approveDate,
    this.reasonCancel,
    this.qty,
    this.total,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  );

  int id;
  String requestNumber;
  String requestNumberPurchaseRequest;
  String requestDate;
  String departmentName;
  String requestName;
  String requestDescription;
  String requestDevice;
  String status;
  String approveDate;
  String reasonCancel;
  int qty;
  int total;
  String createdBy;
  String updatedBy;
  String deletedBy;
  String createdAt;
  String updatedAt;
  String deletedAt;
}
