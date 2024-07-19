// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
import 'package:pdam_inventory/data/responses/base_response.dart';
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
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "current_stock")
  int? currentStock;
  @JsonKey(name: "stock_in")
  int? stockIn;
  @JsonKey(name: "stock_out")
  int? stockOut;
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
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "current_stock")
  int? currentStock;
  @JsonKey(name: "stock_in")
  int? stockIn;
  @JsonKey(name: "stock_out")
  int? stockOut;
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
