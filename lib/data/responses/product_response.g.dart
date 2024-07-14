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
      json['unit'] == null
          ? null
          : UnitDataResponse.fromJson(json['unit'] as Map<String, dynamic>),
      json['category'] == null
          ? null
          : CategoryDataResponse.fromJson(
              json['category'] as Map<String, dynamic>),
      json['name'] as String?,
      json['code'] as String?,
      json['min'] as String?,
      json['max'] as String?,
      (json['stock'] as num?)?.toInt(),
      json['created_at'] as String?,
      json['updated_at'] as String?,
    );

Map<String, dynamic> _$ProductDataResponseToJson(
        ProductDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'unit': instance.unit,
      'category': instance.category,
      'name': instance.name,
      'code': instance.code,
      'min': instance.min,
      'max': instance.max,
      'stock': instance.stock,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

CategoryDataResponse _$CategoryDataResponseFromJson(
        Map<String, dynamic> json) =>
    CategoryDataResponse(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['created_at'] as String?,
      json['updated_at'] as String?,
    );

Map<String, dynamic> _$CategoryDataResponseToJson(
        CategoryDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

UnitDataResponse _$UnitDataResponseFromJson(Map<String, dynamic> json) =>
    UnitDataResponse(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['created_at'] as String?,
      json['updated_at'] as String?,
    );

Map<String, dynamic> _$UnitDataResponseToJson(UnitDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
