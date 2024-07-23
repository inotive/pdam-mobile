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
