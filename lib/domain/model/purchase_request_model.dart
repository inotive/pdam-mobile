class PurchaseRequestPagination {
  PurchaseRequestPagination(this.data);

  List<PurchaseRequestDate> data;
}

class PurchaseRequestSummary {
  PurchaseRequestSummary(this.data);

  PurchaseRequestSummaryData? data;
}

class PurchaseRequestSummaryData {
  PurchaseRequestSummaryData(this.totalRequested, this.totalAgreed, this.totalPending);

  int totalRequested;
  int totalAgreed;
  int totalPending;
}

class PurchaseRequestDate {
  PurchaseRequestDate(
    this.id,
    this.date,
    this.purchaseRequest,
  );

  int id;
  String date;
  List<PurchaseRequest> purchaseRequest;
}

class PurchaseRequest {
  PurchaseRequest(
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
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
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
  String createdAt;
  String updatedAt;
  String deletedAt;
}
