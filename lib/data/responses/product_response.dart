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
    this.unit,
    this.category,
    this.name,
    this.code,
    this.min,
    this.max,
    this.stock,
    this.createdAt,
    this.updatedAt,
  );

  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "unit")
  UnitDataResponse? unit;
  @JsonKey(name: "category")
  CategoryDataResponse? category;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "min")
  String? min;
  @JsonKey(name: "max")
  String? max;
  @JsonKey(name: "stock")
  int? stock;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;

  factory ProductDataResponse.fromJson(Map<String, dynamic> json) => _$ProductDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDataResponseToJson(this);
}

@JsonSerializable()
class CategoryDataResponse {
  CategoryDataResponse(
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  );

  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;

  factory CategoryDataResponse.fromJson(Map<String, dynamic> json) => _$CategoryDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDataResponseToJson(this);
}

@JsonSerializable()
class UnitDataResponse {
  UnitDataResponse(
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  );

  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;

  factory UnitDataResponse.fromJson(Map<String, dynamic> json) => _$UnitDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UnitDataResponseToJson(this);
}

@JsonSerializable()
class ProductDetailResponse extends BaseResponse {
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
    this.code,
    this.productCategoryId,
    this.name,
    this.min,
    this.max,
    this.createdAt,
    this.updatedAt,
    this.category,
  );

  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "product_category_id")
  String? productCategoryId;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "min")
  String? min;
  @JsonKey(name: "max")
  String? max;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;
  @JsonKey(name: "product_category")
  CategoryDataResponse? category;

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
