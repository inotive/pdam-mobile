// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
import 'package:pdam_inventory/data/responses/base_response.dart';
import 'package:pdam_inventory/data/responses/pagination_base_response.dart';
import 'package:pdam_inventory/data/responses/purchase_request_response.dart';
part 'receive_order_response.g.dart';

@JsonSerializable()
class ReceiverOrderResponse {
  ReceiverOrderResponse(
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

  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "no_bukti")
  String? noBukti;
  @JsonKey(name: "no_ref")
  String? noRef;
  @JsonKey(name: "count")
  int? count;
  @JsonKey(name: "received_by")
  String? receivedBy;
  @JsonKey(name: "created_by")
  String? createdBy;
  @JsonKey(name: "updated_by")
  String? updatedBy;
  @JsonKey(name: "deleted_by")
  String? deletedBy;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;
  @JsonKey(name: "deleted_at")
  String? deletedAt;

  factory ReceiverOrderResponse.fromJson(Map<String, dynamic> json) => _$ReceiverOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiverOrderResponseToJson(this);
}

@JsonSerializable()
class ReceiveOrderDateResponse {
  ReceiveOrderDateResponse(
    this.id,
    this.date,
    this.receiveOrder,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  );

  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'date')
  String? date;
  @JsonKey(name: 'receive_order')
  List<ReceiverOrderResponse>? receiveOrder;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'deleted_at')
  String? deletedAt;

  factory ReceiveOrderDateResponse.fromJson(Map<String, dynamic> json) => _$ReceiveOrderDateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiveOrderDateResponseToJson(this);
}

@JsonSerializable()
class ReceiveOrderPaginationResponse extends PaginationBaseResponse {
  ReceiveOrderPaginationResponse(this.data);

  @JsonKey(name: 'data')
  List<ReceiveOrderDateResponse>? data;

  factory ReceiveOrderPaginationResponse.fromJson(Map<String, dynamic> json) =>
      _$ReceiveOrderPaginationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiveOrderPaginationResponseToJson(this);
}

@JsonSerializable()
class ReceiveOrderDetailDataDetailResponse {
  ReceiveOrderDetailDataDetailResponse(
    this.noBukti,
    this.noRef,
    this.date,
    this.receivedBy,
  );

  @JsonKey(name: "no_bukti")
  String? noBukti;
  @JsonKey(name: "no_ref")
  String? noRef;
  @JsonKey(name: "date")
  String? date;
  @JsonKey(name: "received_by")
  String? receivedBy;

  factory ReceiveOrderDetailDataDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ReceiveOrderDetailDataDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiveOrderDetailDataDetailResponseToJson(this);
}

@JsonSerializable()
class ReceiveOrderDetailProductResponse {
  ReceiveOrderDetailProductResponse(
    this.code,
    this.id,
    this.name,
    this.unitName,
    this.qty,
    this.price,
    this.pesan,
    this.totalBarangDiterimaSebelumnya,
    this.diterimaDiRak,
    this.diterimaDiGudang,
    this.sisa,
    this.notes,
    this.image,
  );

  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "unit_name")
  String? unitName;
  @JsonKey(name: "qty")
  String? qty;
  @JsonKey(name: "price")
  String? price;
  @JsonKey(name: "pesan")
  String? pesan;
  @JsonKey(name: "total_barang_diterima_sebelumnya")
  String? totalBarangDiterimaSebelumnya;
  @JsonKey(name: "diterima_di_rak")
  String? diterimaDiRak;
  @JsonKey(name: "diterima_di_gudang")
  String? diterimaDiGudang;
  @JsonKey(name: "sisa")
  String? sisa;
  @JsonKey(name: "notes")
  String? notes;
  @JsonKey(name: "image")
  String? image;

  factory ReceiveOrderDetailProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ReceiveOrderDetailProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiveOrderDetailProductResponseToJson(this);
}

@JsonSerializable()
class ReceiveOrderDetailDataResponse {
  ReceiveOrderDetailDataResponse(this.detail, this.products);

  @JsonKey(name: "detail")
  ReceiveOrderDetailDataDetailResponse? detail;
  @JsonKey(name: 'list_product')
  List<ReceiveOrderDetailProductResponse>? products;

  factory ReceiveOrderDetailDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ReceiveOrderDetailDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiveOrderDetailDataResponseToJson(this);
}

@JsonSerializable()
class ReceiveOrderDetailResponse extends BaseResponse {
  ReceiveOrderDetailResponse(this.data);

  @JsonKey(name: 'data')
  ReceiveOrderDetailDataResponse? data;

  factory ReceiveOrderDetailResponse.fromJson(Map<String, dynamic> json) => _$ReceiveOrderDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiveOrderDetailResponseToJson(this);
}

@JsonSerializable()
class ReceiveOrderWarehouseDataResponse {
  ReceiveOrderWarehouseDataResponse(
    this.id,
    this.name,
    this.pic,
    this.description,
    this.address,
    this.createdAt,
    this.updatedAt,
  );

  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "pic")
  String? pic;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "address")
  String? address;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;

  factory ReceiveOrderWarehouseDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ReceiveOrderWarehouseDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiveOrderWarehouseDataResponseToJson(this);
}

@JsonSerializable()
class ReceiveOrderWarehouseResponse extends PaginationBaseResponse {
  ReceiveOrderWarehouseResponse(this.data);

  @JsonKey(name: 'data')
  List<ReceiveOrderWarehouseDataResponse> data;

  factory ReceiveOrderWarehouseResponse.fromJson(Map<String, dynamic> json) =>
      _$ReceiveOrderWarehouseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiveOrderWarehouseResponseToJson(this);
}

@JsonSerializable()
class ReceiveOrderReferenceResponse extends PaginationBaseResponse {
  ReceiveOrderReferenceResponse(this.data);

  @JsonKey(name: 'data')
  List<PurchaseRequestResponse> data;

  factory ReceiveOrderReferenceResponse.fromJson(Map<String, dynamic> json) =>
      _$ReceiveOrderReferenceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiveOrderReferenceResponseToJson(this);
}

@JsonSerializable()
class ReceiveOrderReferenceDetailResponse extends BaseResponse {
  ReceiveOrderReferenceDetailResponse(this.data);

  @JsonKey(name: 'data')
  PurchaseRequestDetailDataResponse? data;

  factory ReceiveOrderReferenceDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ReceiveOrderReferenceDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiveOrderReferenceDetailResponseToJson(this);
}

@JsonSerializable()
class ReceiveOrderSupplierDataResponse {
  ReceiveOrderSupplierDataResponse(
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.deletedAt,
  );

  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'update_at')
  String? updatedAt;
  @JsonKey(name: 'created_by')
  String? createdBy;
  @JsonKey(name: 'updated_by')
  String? updatedBy;
  @JsonKey(name: 'deleted_by')
  String? deletedBy;
  @JsonKey(name: 'deleted_at')
  String? deletedAt;

  factory ReceiveOrderSupplierDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ReceiveOrderSupplierDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiveOrderSupplierDataResponseToJson(this);
}

@JsonSerializable()
class ReceiveOrderSupplierResponse extends PaginationBaseResponse {
  ReceiveOrderSupplierResponse(this.data);

  @JsonKey(name: 'data')
  List<ReceiveOrderSupplierDataResponse> data;

  factory ReceiveOrderSupplierResponse.fromJson(Map<String, dynamic> json) =>
      _$ReceiveOrderSupplierResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiveOrderSupplierResponseToJson(this);
}
