// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_request_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseRequestPaginationResponse _$PurchaseRequestPaginationResponseFromJson(
        Map<String, dynamic> json) =>
    PurchaseRequestPaginationResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) =>
              PurchaseRequestDateResponse.fromJson(e as Map<String, dynamic>))
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
          : MetaResponse.fromJson(json['meta'] as Map<String, dynamic>);

Map<String, dynamic> _$PurchaseRequestPaginationResponseToJson(
        PurchaseRequestPaginationResponse instance) =>
    <String, dynamic>{
      'links': instance.links,
      'status': instance.status,
      'meta': instance.meta,
      'data': instance.data,
    };

PurchaseRequestDateResponse _$PurchaseRequestDateResponseFromJson(
        Map<String, dynamic> json) =>
    PurchaseRequestDateResponse(
      (json['id'] as num?)?.toInt(),
      json['date'] as String?,
      (json['purchase_request'] as List<dynamic>?)
          ?.map((e) =>
              PurchaseRequestResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PurchaseRequestDateResponseToJson(
        PurchaseRequestDateResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'purchase_request': instance.purchaseRequest,
    };

PurchaseRequestResponse _$PurchaseRequestResponseFromJson(
        Map<String, dynamic> json) =>
    PurchaseRequestResponse(
      (json['id'] as num?)?.toInt(),
      json['request_number'] as String?,
      json['request_date'] as String?,
      json['department_name'] as String?,
      json['request_name'] as String?,
      json['request_description'] as String?,
      json['request_device'] as String?,
      json['status'] as String?,
      json['approve_date'] as String?,
      json['reason_cancel'] as String?,
      json['created_at'] as String?,
      json['updated_at'] as String?,
      json['deleted_at'] as String?,
    );

Map<String, dynamic> _$PurchaseRequestResponseToJson(
        PurchaseRequestResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'request_number': instance.requestNumber,
      'request_date': instance.requestDate,
      'department_name': instance.departmentName,
      'request_name': instance.requestName,
      'request_description': instance.requestDescription,
      'request_device': instance.requestDevice,
      'status': instance.status,
      'approve_date': instance.approveDate,
      'reason_cancel': instance.reasonCancel,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
    };
