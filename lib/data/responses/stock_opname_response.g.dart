// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_opname_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockOpnameResponse _$StockOpnameResponseFromJson(Map<String, dynamic> json) =>
    StockOpnameResponse(
      (json['data'] as List<dynamic>)
          .map((e) =>
              StockOpnameDataResponse.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$StockOpnameResponseToJson(
        StockOpnameResponse instance) =>
    <String, dynamic>{
      'links': instance.links,
      'status': instance.status,
      'meta': instance.meta,
      'data': instance.data,
    };

StockOpnameDataResponse _$StockOpnameDataResponseFromJson(
        Map<String, dynamic> json) =>
    StockOpnameDataResponse(
      (json['id'] as num?)?.toInt(),
      json['warehouse_id'] as String?,
      json['opname_number'] as String?,
      json['date'] as String?,
      json['description'] as String?,
      json['status'] as String?,
      (json['product_count'] as num?)?.toInt(),
      json['created_by'] as String?,
      json['updated_by'] as String?,
      json['deleted_by'] as String?,
      json['created_at'] as String?,
      json['updated_at'] as String?,
      json['deleted_at'] as String?,
      json['finished_date'] as String?,
    );

Map<String, dynamic> _$StockOpnameDataResponseToJson(
        StockOpnameDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'warehouse_id': instance.warehouseId,
      'opname_number': instance.opnameNumber,
      'date': instance.date,
      'description': instance.description,
      'status': instance.status,
      'product_count': instance.productCount,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'deleted_by': instance.deletedBy,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
      'finished_date': instance.finishedDate,
    };

StockOpnameDetailResponse _$StockOpnameDetailResponseFromJson(
        Map<String, dynamic> json) =>
    StockOpnameDetailResponse(
      json['data'] == null
          ? null
          : StockOpnameDetailDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )..meta = json['meta'] == null
        ? null
        : MetaResponse.fromJson(json['meta'] as Map<String, dynamic>);

Map<String, dynamic> _$StockOpnameDetailResponseToJson(
        StockOpnameDetailResponse instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };

StockOpnameDetailDataResponse _$StockOpnameDetailDataResponseFromJson(
        Map<String, dynamic> json) =>
    StockOpnameDetailDataResponse(
      json['detail'] == null
          ? null
          : StockOpnameDetailDataDetailResponse.fromJson(
              json['detail'] as Map<String, dynamic>),
      (json['list_product'] as List<dynamic>)
          .map((e) => StockOpnameProductDataResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StockOpnameDetailDataResponseToJson(
        StockOpnameDetailDataResponse instance) =>
    <String, dynamic>{
      'detail': instance.detail,
      'list_product': instance.products,
    };

StockOpnameDetailDataDetailResponse
    _$StockOpnameDetailDataDetailResponseFromJson(Map<String, dynamic> json) =>
        StockOpnameDetailDataDetailResponse(
          (json['id'] as num?)?.toInt(),
          (json['warehouse_id'] as num?)?.toInt(),
          json['opname_number'] as String?,
          json['date'] as String?,
          json['description'] as String?,
          json['status'] as String?,
          json['created_at'] as String?,
          json['updated_at'] as String?,
          json['warehouse_name'] == null
              ? null
              : StockOpnameWarehouseDataResponse.fromJson(
                  json['warehouse_name'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$StockOpnameDetailDataDetailResponseToJson(
        StockOpnameDetailDataDetailResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'warehouse_id': instance.warehouseId,
      'opname_number': instance.opnameNumber,
      'date': instance.date,
      'description': instance.description,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'warehouse_name': instance.warehouseName,
    };

StockOpnameWarehouseDataResponse _$StockOpnameWarehouseDataResponseFromJson(
        Map<String, dynamic> json) =>
    StockOpnameWarehouseDataResponse(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['description'] as String?,
      (json['pic'] as num?)?.toInt(),
      json['address'] as String?,
      json['created_at'] as String?,
      json['updated_at'] as String?,
    );

Map<String, dynamic> _$StockOpnameWarehouseDataResponseToJson(
        StockOpnameWarehouseDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'pic': instance.pic,
      'address': instance.address,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

StockOpnameProductDataResponse _$StockOpnameProductDataResponseFromJson(
        Map<String, dynamic> json) =>
    StockOpnameProductDataResponse(
      json['code'] as String?,
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['unit_name'] as String?,
      (json['last_stock'] as num?)?.toInt(),
      (json['actual_stock'] as num?)?.toInt(),
      (json['difference'] as num?)?.toInt(),
      json['created_at'] as String?,
      json['updated_at'] as String?,
    );

Map<String, dynamic> _$StockOpnameProductDataResponseToJson(
        StockOpnameProductDataResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'id': instance.id,
      'name': instance.name,
      'unit_name': instance.unitName,
      'last_stock': instance.lastStock,
      'actual_stock': instance.actualStock,
      'difference': instance.difference,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
