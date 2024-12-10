// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
import 'package:pdam_inventory/data/responses/base_response.dart';
import 'package:pdam_inventory/data/responses/pagination_base_response.dart';
import 'package:pdam_inventory/data/responses/purchase_request_response.dart';
part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse extends BaseStatusResponse {
  ProductResponse(this.data);

  @JsonKey(name: 'data')
  List<ProductDataResponse>? data;

  factory ProductResponse.fromJson(Map<String, dynamic> json) => _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}

@JsonSerializable()
class ProductDataResponse {
  ProductDataResponse(
    this.id,
    this.name,
    this.code,
    this.currentStock,
    this.stockIn,
    this.stockOut,
    this.image,
    this.createdAt,
    this.updatedAt,
  );

  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "current_stock")
  dynamic currentStock;
  @JsonKey(name: "stock_in")
  dynamic stockIn;
  @JsonKey(name: "stock_out")
  dynamic stockOut;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;

  factory ProductDataResponse.fromJson(Map<String, dynamic> json) => _$ProductDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDataResponseToJson(this);
}

@JsonSerializable()
class ProductDetailResponse extends BaseStatusResponse {
  ProductDetailResponse(this.data);

  @JsonKey(name: 'data')
  ProductDetailDataResponse? data;

  factory ProductDetailResponse.fromJson(Map<String, dynamic> json) => _$ProductDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailResponseToJson(this);
}

@JsonSerializable()
class ProductDetailDataResponse {
  ProductDetailDataResponse(
    this.id,
    this.name,
    this.code,
    this.currentStock,
    this.stockIn,
    this.stockOut,
    this.image,
    this.createdAt,
    this.updatedAt,
  );

  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "current_stock")
  dynamic currentStock;
  @JsonKey(name: "stock_in")
  dynamic stockIn;
  @JsonKey(name: "stock_out")
  dynamic stockOut;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;

  factory ProductDetailDataResponse.fromJson(Map<String, dynamic> json) => _$ProductDetailDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailDataResponseToJson(this);
}

@JsonSerializable()
class ProductSummaryChartResponse {
  ProductSummaryChartResponse(this.inHand, this.outStock, this.inStock);

  @JsonKey(name: 'in_hand')
  int? inHand;
  @JsonKey(name: 'out')
  int? outStock;
  @JsonKey(name: 'in')
  int? inStock;

  factory ProductSummaryChartResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductSummaryChartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductSummaryChartResponseToJson(this);
}

@JsonSerializable()
class ProductSummaryDataResponse {
  ProductSummaryDataResponse(
    this.chart,
    this.totalProduct,
    this.lowStock,
  );

  @JsonKey(name: 'chart')
  ProductSummaryChartResponse? chart;
  @JsonKey(name: 'total_product')
  int? totalProduct;
  @JsonKey(name: 'low_stock')
  int? lowStock;

  factory ProductSummaryDataResponse.fromJson(Map<String, dynamic> json) => _$ProductSummaryDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductSummaryDataResponseToJson(this);
}

@JsonSerializable()
class ProductSummaryResponse extends BaseResponse {
  ProductSummaryResponse(this.data);

  @JsonKey(name: 'data')
  ProductSummaryDataResponse? data;

  factory ProductSummaryResponse.fromJson(Map<String, dynamic> json) => _$ProductSummaryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductSummaryResponseToJson(this);
}

@JsonSerializable()
class ProductWarehouseDataResponse {
  ProductWarehouseDataResponse(this.name, this.currentStock);

  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "current_stock")
  String? currentStock;

  factory ProductWarehouseDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductWarehouseDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductWarehouseDataResponseToJson(this);
}

@JsonSerializable()
class ProductWarehouseResponse extends BaseResponse {
  ProductWarehouseResponse(this.data);

  @JsonKey(name: 'data')
  List<ProductWarehouseDataResponse>? data;

  factory ProductWarehouseResponse.fromJson(Map<String, dynamic> json) => _$ProductWarehouseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductWarehouseResponseToJson(this);
}

@JsonSerializable()
class ProductStockHistoryDataResponse {
  ProductStockHistoryDataResponse(
    this.lastStock,
    this.qty,
    this.currentStock,
    this.createdAt,
    this.type,
    this.date,
  );

  @JsonKey(name: 'last_stock')
  int? lastStock;
  @JsonKey(name: 'qty')
  int? qty;
  @JsonKey(name: 'current_stock')
  int? currentStock;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'date')
  String? date;

  factory ProductStockHistoryDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductStockHistoryDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductStockHistoryDataResponseToJson(this);
}

@JsonSerializable()
class ProductStockHistoryResponse extends BaseResponse {
  ProductStockHistoryResponse(this.data);

  @JsonKey(name: 'data')
  List<ProductStockHistoryDataResponse>? data;

  factory ProductStockHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductStockHistoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductStockHistoryResponseToJson(this);
}

@JsonSerializable()
class ProductByWarehouseResponse extends PaginationBaseResponse {
  ProductByWarehouseResponse(this.data);

  @JsonKey(name: 'data')
  List<PurchaseRequestProductResponse> data;

  factory ProductByWarehouseResponse.fromJson(Map<String, dynamic> json) => _$ProductByWarehouseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductByWarehouseResponseToJson(this);
}
