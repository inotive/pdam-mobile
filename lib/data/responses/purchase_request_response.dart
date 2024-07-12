// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
import 'package:pdam_inventory/data/responses/pagination_base_response.dart';
part 'purchase_request_response.g.dart';

@JsonSerializable()
class PurchaseRequestPaginationResponse extends PaginationBaseResponse {
  PurchaseRequestPaginationResponse(this.data);

  @JsonKey(name: 'data')
  List<PurchaseRequestDateResponse>? data;

  factory PurchaseRequestPaginationResponse.fromJson(Map<String, dynamic> json) =>
      _$PurchaseRequestPaginationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseRequestPaginationResponseToJson(this);
}

@JsonSerializable()
class PurchaseRequestDateResponse {
  PurchaseRequestDateResponse(this.id, this.date, this.purchaseRequest);

  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: 'date')
  String? date;
  @JsonKey(name: "purchase_request")
  List<PurchaseRequestResponse>? purchaseRequest;

  factory PurchaseRequestDateResponse.fromJson(Map<String, dynamic> json) =>
      _$PurchaseRequestDateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseRequestDateResponseToJson(this);
}

@JsonSerializable()
class PurchaseRequestResponse {
  PurchaseRequestResponse(
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

  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'request_number')
  String? requestNumber;
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
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'deleted_at')
  String? deletedAt;

  factory PurchaseRequestResponse.fromJson(Map<String, dynamic> json) => _$PurchaseRequestResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseRequestResponseToJson(this);
}
