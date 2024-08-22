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

class PurchaseOrderDetailDataDetail {
  PurchaseOrderDetailDataDetail(
    this.id,
    this.requestNumber,
    this.requestDate,
    this.departmentName,
    this.requestName,
    this.requestDescription,
    this.requestDevice,
    this.status,
    this.approveDate,
    this.reasonCancel,
    this.vendorId,
    this.warehouseId,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.dateId,
    this.purchaseRequestId,
  );

  int id;
  String requestNumber;
  String requestDate;
  String departmentName;
  String requestName;
  String requestDescription;
  String requestDevice;
  String status;
  String approveDate;
  String reasonCancel;
  String vendorId;
  String warehouseId;
  String createdBy;
  String updatedBy;
  String deletedBy;
  String createdAt;
  String updatedAt;
  String deletedAt;
  String dateId;
  String purchaseRequestId;
}

class PurchaseOrderDetailDataProduct {
  PurchaseOrderDetailDataProduct(
    this.code,
    this.id,
    this.name,
    this.imgUrl,
    this.qty,
    this.price,
    this.unitName,
    this.createdAt,
    this.updatedAt,
    this.notes,
    this.image,
  );

  String code;
  int id;
  String name;
  String imgUrl;
  String qty;
  String price;
  String unitName;
  String createdAt;
  String updatedAt;
  String notes;
  String image;
}

class PurchaseOrderDetailData {
  PurchaseOrderDetailData(
    this.detail,
    this.products,
  );

  PurchaseOrderDetailDataDetail? detail;
  List<PurchaseOrderDetailDataProduct>? products;
}

class PurchaseOrderDetail {
  PurchaseOrderDetail(this.data);

  PurchaseOrderDetailData? data;
}
