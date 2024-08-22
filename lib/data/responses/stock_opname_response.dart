// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:pdam_inventory/data/responses/base_response.dart';
import 'package:pdam_inventory/data/responses/pagination_base_response.dart';
part 'stock_opname_response.g.dart';

@JsonSerializable()
class StockOpnameResponse extends PaginationBaseResponse {
  StockOpnameResponse(this.data);

  @JsonKey(name: 'data')
  List<StockOpnameDataResponse> data;

  factory StockOpnameResponse.fromJson(Map<String, dynamic> json) => _$StockOpnameResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StockOpnameResponseToJson(this);
}

@JsonSerializable()
class StockOpnameDataResponse {
  StockOpnameDataResponse(
    this.id,
    this.warehouseId,
    this.opnameNumber,
    this.date,
    this.description,
    this.status,
    this.productCount,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.finishedDate,
  );

  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'warehouse_id')
  String? warehouseId;
  @JsonKey(name: 'opname_number')
  String? opnameNumber;
  @JsonKey(name: 'date')
  String? date;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'product_count')
  int? productCount;
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
  @JsonKey(name: 'finished_date')
  String? finishedDate;

  factory StockOpnameDataResponse.fromJson(Map<String, dynamic> json) => _$StockOpnameDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StockOpnameDataResponseToJson(this);
}

@JsonSerializable()
class StockOpnameDetailResponse extends BaseResponse {
  StockOpnameDetailResponse(this.data);

  @JsonKey(name: 'data')
  StockOpnameDetailDataResponse? data;

  factory StockOpnameDetailResponse.fromJson(Map<String, dynamic> json) => _$StockOpnameDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StockOpnameDetailResponseToJson(this);
}

@JsonSerializable()
class StockOpnameDetailDataResponse {
  StockOpnameDetailDataResponse(this.detail, this.products);

  @JsonKey(name: 'detail')
  StockOpnameDetailDataDetailResponse? detail;
  @JsonKey(name: 'list_product')
  List<StockOpnameProductDataResponse> products;

  factory StockOpnameDetailDataResponse.fromJson(Map<String, dynamic> json) =>
      _$StockOpnameDetailDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StockOpnameDetailDataResponseToJson(this);
}

@JsonSerializable()
class StockOpnameDetailDataDetailResponse {
  StockOpnameDetailDataDetailResponse(
    this.id,
    this.warehouseId,
    this.opnameNumber,
    this.date,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.warehouseName,
  );
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'warehouse_id')
  int? warehouseId;
  @JsonKey(name: 'opname_number')
  String? opnameNumber;
  @JsonKey(name: 'date')
  String? date;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'warehouse_name')
  StockOpnameWarehouseDataResponse? warehouseName;

  factory StockOpnameDetailDataDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$StockOpnameDetailDataDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StockOpnameDetailDataDetailResponseToJson(this);
}

@JsonSerializable()
class StockOpnameWarehouseDataResponse {
  StockOpnameWarehouseDataResponse(
    this.id,
    this.name,
    this.description,
    this.pic,
    this.address,
    this.createdAt,
    this.updatedAt,
  );

  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'pic')
  int? pic;
  @JsonKey(name: 'address')
  String? address;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  factory StockOpnameWarehouseDataResponse.fromJson(Map<String, dynamic> json) =>
      _$StockOpnameWarehouseDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StockOpnameWarehouseDataResponseToJson(this);
}

@JsonSerializable()
class StockOpnameProductDataResponse {
  StockOpnameProductDataResponse(
    this.code,
    this.id,
    this.name,
    this.unitName,
    this.lastStock,
    this.actualStock,
    this.difference,
    this.createdAt,
    this.updatedAt,
  );

  @JsonKey(name: 'code')
  String? code;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'unit_name')
  String? unitName;
  @JsonKey(name: 'last_stock')
  int? lastStock;
  @JsonKey(name: 'actual_stock')
  int? actualStock;
  @JsonKey(name: 'difference')
  int? difference;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  factory StockOpnameProductDataResponse.fromJson(Map<String, dynamic> json) =>
      _$StockOpnameProductDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StockOpnameProductDataResponseToJson(this);
}
