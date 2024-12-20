import 'package:pdam_inventory/persentations/resources/string_app.dart';

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
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
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
  String createdBy;
  String updatedBy;
  String deletedBy;
  String createdAt;
  String updatedAt;
  String deletedAt;
}

class PurchaseRequestDetail {
  PurchaseRequestDetail(this.data);

  PurchaseRequestDetailData? data;
}

class PurchaseRequestDetailData {
  PurchaseRequestDetailData(this.detail, this.products);

  PurchaseRequest? detail;
  List<PurchaseRequestProduct> products;
}

class PurchaseRequestProduct {
  PurchaseRequestProduct(
    this.code,
    this.id,
    this.name,
    this.qty,
    this.unitName,
    this.createdAt,
    this.updatedAt,
    this.notes,
    this.image,
    this.min,
    this.max,
    this.stock,
  );

  String code;
  int id;
  String name;
  int qty;
  String unitName;
  String createdAt;
  String updatedAt;
  String notes;
  String image;
  int min;
  int max;
  int stock;

  factory PurchaseRequestProduct.empty() => PurchaseRequestProduct(
        EMPTY,
        ZERO,
        EMPTY,
        ZERO,
        EMPTY,
        EMPTY,
        EMPTY,
        EMPTY,
        EMPTY,
        ZERO,
        ZERO,
        ZERO,
      );

  PurchaseRequestProduct copyWith({
    String? code,
    int? id,
    String? name,
    int? qty,
    String? unitName,
    String? createdAt,
    String? updatedAt,
    String? notes,
    String? image,
    int? min,
    int? max,
    int? stock,
  }) =>
      PurchaseRequestProduct(
        code ?? this.code,
        id ?? this.id,
        name ?? this.name,
        qty ?? this.qty,
        unitName ?? this.unitName,
        createdAt ?? this.createdAt,
        updatedAt ?? this.updatedAt,
        notes ?? this.notes,
        image ?? this.image,
        min ?? this.min,
        max ?? this.max,
        stock ?? this.stock,
      );
}
