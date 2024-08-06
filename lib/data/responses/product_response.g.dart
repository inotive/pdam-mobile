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
      json['id'] as String?,
      json['name'] as String?,
      json['code'] as String?,
      json['current_stock'],
      json['stock_in'],
      json['stock_out'],
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
      json['id'] as String?,
      json['name'] as String?,
      json['code'] as String?,
      json['current_stock'],
      json['stock_in'],
      json['stock_out'],
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

ProductWarehouseDataResponse _$ProductWarehouseDataResponseFromJson(
        Map<String, dynamic> json) =>
    ProductWarehouseDataResponse(
      json['name'] as String?,
      json['current_stock'] as String?,
    );

Map<String, dynamic> _$ProductWarehouseDataResponseToJson(
        ProductWarehouseDataResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'current_stock': instance.currentStock,
    };

ProductWarehouseResponse _$ProductWarehouseResponseFromJson(
        Map<String, dynamic> json) =>
    ProductWarehouseResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) =>
              ProductWarehouseDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..meta = json['meta'] == null
        ? null
        : MetaResponse.fromJson(json['meta'] as Map<String, dynamic>);

Map<String, dynamic> _$ProductWarehouseResponseToJson(
        ProductWarehouseResponse instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };

ProductStockHistoryDataResponse _$ProductStockHistoryDataResponseFromJson(
        Map<String, dynamic> json) =>
    ProductStockHistoryDataResponse(
      json['last_stock'] as String?,
      json['qty'] as String?,
      json['current_stock'] as String?,
      json['created_at'] as String?,
      json['type'] as String?,
      json['date'] as String?,
    );

Map<String, dynamic> _$ProductStockHistoryDataResponseToJson(
        ProductStockHistoryDataResponse instance) =>
    <String, dynamic>{
      'last_stock': instance.lastStock,
      'qty': instance.qty,
      'current_stock': instance.currentStock,
      'created_at': instance.createdAt,
      'type': instance.type,
      'date': instance.date,
    };

ProductStockHistoryResponse _$ProductStockHistoryResponseFromJson(
        Map<String, dynamic> json) =>
    ProductStockHistoryResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => ProductStockHistoryDataResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    )..meta = json['meta'] == null
        ? null
        : MetaResponse.fromJson(json['meta'] as Map<String, dynamic>);

Map<String, dynamic> _$ProductStockHistoryResponseToJson(
        ProductStockHistoryResponse instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };

ProductByWarehouseResponse _$ProductByWarehouseResponseFromJson(
        Map<String, dynamic> json) =>
    ProductByWarehouseResponse(
      (json['data'] as List<dynamic>)
          .map((e) => PurchaseRequestProductResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    )
      ..links = json['links'] == null
          ? null
          : LinksResponse.fromJson(json['links'] as Map<String, dynamic>)
      ..status = json['status'] == null
          ? null
          : StatusPaginationResponse.fromJson(
              json['status'] as Map<String, dynamic>)
      ..meta = json['meta'] == null
          ? null
          : MetaPaginationResponse.fromJson(
              json['meta'] as Map<String, dynamic>);

Map<String, dynamic> _$ProductByWarehouseResponseToJson(
        ProductByWarehouseResponse instance) =>
    <String, dynamic>{
      'links': instance.links,
      'status': instance.status,
      'meta': instance.meta,
      'data': instance.data,
    };
