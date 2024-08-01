// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
import 'package:pdam_inventory/data/responses/pagination_base_response.dart';
part 'purchase_order_response.g.dart';

@JsonSerializable()
class PurchaseOrderResponse extends PaginationBaseResponse {
  PurchaseOrderResponse(this.data);

  @JsonKey(name: 'data')
  List<PurchaseOrderDateResponse> data;

  factory PurchaseOrderResponse.fromJson(Map<String, dynamic> json) => _$PurchaseOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseOrderResponseToJson(this);
}

@JsonSerializable()
class PurchaseOrderDateResponse {
  PurchaseOrderDateResponse(
    this.id,
    this.date,
    this.purchaseOrder,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  );
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'date')
  String? date;
  @JsonKey(name: 'purchase_order')
  List<PurchaseOrderDataResponse>? purchaseOrder;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'deleted_at')
  String? deletedAt;

  factory PurchaseOrderDateResponse.fromJson(Map<String, dynamic> json) => _$PurchaseOrderDateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseOrderDateResponseToJson(this);
}

@JsonSerializable()
class PurchaseOrderDataResponse {
  PurchaseOrderDataResponse(
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

  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'request_number')
  String? requestNumber;
  @JsonKey(name: 'request_number_purchase_request')
  String? requestNumberPurchaseRequest;
  @JsonKey(name: 'request_date')
  String? requestDate;
  @JsonKey(name: 'department_name')
  String? departmentName;
  @JsonKey(name: 'request_name')
  String? requestName;
  @JsonKey(name: 'request_description')
  String? requestDescription;
  @JsonKey(name: 'request_device')
  String? requestDevice;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'approve_date')
  String? approveDate;
  @JsonKey(name: 'reason_cancel')
  String? reasonCancel;
  @JsonKey(name: 'qty')
  int? qty;
  @JsonKey(name: 'total')
  int? total;
  @JsonKey(name: 'created_by')
  String? createdBy;
  @JsonKey(name: 'updated_by')
  String? updatedBy;
  @JsonKey(name: 'deleted_by')
  String? deletedBy;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'deleted_at')
  String? deletedAt;

  factory PurchaseOrderDataResponse.fromJson(Map<String, dynamic> json) => _$PurchaseOrderDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseOrderDataResponseToJson(this);
}
