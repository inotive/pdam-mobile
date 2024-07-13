// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
import 'package:pdam_inventory/data/responses/base_response.dart';
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
class PurchaseRequestSummaryResponse extends BaseResponse {
  PurchaseRequestSummaryResponse(this.data);

  @JsonKey(name: 'data')
  PurchaseRequestSummaryDataResponse? data;

  factory PurchaseRequestSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$PurchaseRequestSummaryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseRequestSummaryResponseToJson(this);
}

@JsonSerializable()
class PurchaseRequestSummaryDataResponse {
  PurchaseRequestSummaryDataResponse(
    this.totalRequested,
    this.totalAgreed,
    this.totalPending,
  );

  @JsonKey(name: "total_permintaan")
  int? totalRequested;
  @JsonKey(name: "total_disetujui")
  int? totalAgreed;
  @JsonKey(name: "total_pending")
  int? totalPending;

  factory PurchaseRequestSummaryDataResponse.fromJson(Map<String, dynamic> json) =>
      _$PurchaseRequestSummaryDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseRequestSummaryDataResponseToJson(this);
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

@JsonSerializable()
class PurchaseRequestDetailResponse extends BaseResponse {
  PurchaseRequestDetailResponse(this.data);

  @JsonKey(name: 'data')
  PurchaseRequestDetailDataResponse? data;

  factory PurchaseRequestDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$PurchaseRequestDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseRequestDetailResponseToJson(this);
}

@JsonSerializable()
class PurchaseRequestDetailDataResponse {
  PurchaseRequestDetailDataResponse(this.detail, this.products);

  @JsonKey(name: 'detail')
  PurchaseRequestResponse? detail;
  @JsonKey(name: 'list_product')
  List<PurchaseRequestProductResponse>? products;

  factory PurchaseRequestDetailDataResponse.fromJson(Map<String, dynamic> json) =>
      _$PurchaseRequestDetailDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseRequestDetailDataResponseToJson(this);
}

@JsonSerializable()
class PurchaseRequestProductResponse {
  PurchaseRequestProductResponse(this.id);

  @JsonKey(name: 'id')
  int? id;

  factory PurchaseRequestProductResponse.fromJson(Map<String, dynamic> json) =>
      _$PurchaseRequestProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseRequestProductResponseToJson(this);
}
