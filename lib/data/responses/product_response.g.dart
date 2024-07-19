// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => ProductDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..status = json['status'] == null
        ? null
        : StatusDataResponse.fromJson(json['status'] as Map<String, dynamic>);

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

ProductDataResponse _$ProductDataResponseFromJson(Map<String, dynamic> json) =>
    ProductDataResponse(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['code'] as String?,
      (json['current_stock'] as num?)?.toInt(),
      (json['stock_in'] as num?)?.toInt(),
      (json['stock_out'] as num?)?.toInt(),
      json['image'] as String?,
      json['created_at'] as String?,
      json['updated_at'] as String?,
    );

Map<String, dynamic> _$ProductDataResponseToJson(
        ProductDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'current_stock': instance.currentStock,
      'stock_in': instance.stockIn,
      'stock_out': instance.stockOut,
      'image': instance.image,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

ProductDetailResponse _$ProductDetailResponseFromJson(
        Map<String, dynamic> json) =>
    ProductDetailResponse(
      json['data'] == null
          ? null
          : ProductDetailDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )..status = json['status'] == null
        ? null
        : StatusDataResponse.fromJson(json['status'] as Map<String, dynamic>);

Map<String, dynamic> _$ProductDetailResponseToJson(
        ProductDetailResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

ProductDetailDataResponse _$ProductDetailDataResponseFromJson(
        Map<String, dynamic> json) =>
    ProductDetailDataResponse(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['code'] as String?,
      (json['current_stock'] as num?)?.toInt(),
      (json['stock_in'] as num?)?.toInt(),
      (json['stock_out'] as num?)?.toInt(),
      json['image'] as String?,
      json['created_at'] as String?,
      json['updated_at'] as String?,
    );

Map<String, dynamic> _$ProductDetailDataResponseToJson(
        ProductDetailDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'current_stock': instance.currentStock,
      'stock_in': instance.stockIn,
      'stock_out': instance.stockOut,
      'image': instance.image,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

ProductSummaryChartResponse _$ProductSummaryChartResponseFromJson(
        Map<String, dynamic> json) =>
    ProductSummaryChartResponse(
      (json['in_hand'] as num?)?.toInt(),
      (json['out'] as num?)?.toInt(),
      (json['in'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductSummaryChartResponseToJson(
        ProductSummaryChartResponse instance) =>
    <String, dynamic>{
      'in_hand': instance.inHand,
      'out': instance.outStock,
      'in': instance.inStock,
    };

ProductSummaryDataResponse _$ProductSummaryDataResponseFromJson(
        Map<String, dynamic> json) =>
    ProductSummaryDataResponse(
      json['chart'] == null
          ? null
          : ProductSummaryChartResponse.fromJson(
              json['chart'] as Map<String, dynamic>),
      (json['total_product'] as num?)?.toInt(),
      (json['low_stock'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductSummaryDataResponseToJson(
        ProductSummaryDataResponse instance) =>
    <String, dynamic>{
      'chart': instance.chart,
      'total_product': instance.totalProduct,
      'low_stock': instance.lowStock,
    };

ProductSummaryResponse _$ProductSummaryResponseFromJson(
        Map<String, dynamic> json) =>
    ProductSummaryResponse(
      json['data'] == null
          ? null
          : ProductSummaryDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )..meta = json['meta'] == null
        ? null
        : MetaResponse.fromJson(json['meta'] as Map<String, dynamic>);

Map<String, dynamic> _$ProductSummaryResponseToJson(
        ProductSummaryResponse instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };
