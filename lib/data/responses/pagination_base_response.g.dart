// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinksResponse _$LinksResponseFromJson(Map<String, dynamic> json) =>
    LinksResponse(
      json['first'] as String?,
      json['last'] as String?,
      json['next'] as String?,
      json['prev'] as String?,
    );

Map<String, dynamic> _$LinksResponseToJson(LinksResponse instance) =>
    <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
      'prev': instance.prev,
      'next': instance.next,
    };

StatusPaginationResponse _$StatusPaginationResponseFromJson(
        Map<String, dynamic> json) =>
    StatusPaginationResponse(
      (json['code'] as num?)?.toInt(),
      json['message'] as String?,
    );

Map<String, dynamic> _$StatusPaginationResponseToJson(
        StatusPaginationResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };

LinkItemResponse _$LinkItemResponseFromJson(Map<String, dynamic> json) =>
    LinkItemResponse(
      json['url'] as String?,
      json['label'] as String?,
      json['active'] as bool?,
    );

Map<String, dynamic> _$LinkItemResponseToJson(LinkItemResponse instance) =>
    <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'active': instance.active,
    };

MetaPaginationResponse _$MetaPaginationResponseFromJson(
        Map<String, dynamic> json) =>
    MetaPaginationResponse(
      (json['current_page'] as num?)?.toInt(),
      (json['from'] as num?)?.toInt(),
      (json['last_page'] as num?)?.toInt(),
      (json['links'] as List<dynamic>?)
          ?.map((e) => LinkItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['path'] as String?,
      (json['per_page'] as num?)?.toInt(),
      (json['to'] as num?)?.toInt(),
      (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MetaPaginationResponseToJson(
        MetaPaginationResponse instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'from': instance.from,
      'last_page': instance.lastPage,
      'links': instance.links,
      'path': instance.path,
      'per_page': instance.perPage,
      'to': instance.to,
      'total': instance.total,
    };
