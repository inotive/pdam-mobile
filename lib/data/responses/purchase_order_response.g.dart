// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseOrderResponse _$PurchaseOrderResponseFromJson(
        Map<String, dynamic> json) =>
    PurchaseOrderResponse(
      (json['data'] as List<dynamic>)
          .map((e) =>
              PurchaseOrderDateResponse.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$PurchaseOrderResponseToJson(
        PurchaseOrderResponse instance) =>
    <String, dynamic>{
      'links': instance.links,
      'status': instance.status,
      'meta': instance.meta,
      'data': instance.data,
    };

PurchaseOrderDateResponse _$PurchaseOrderDateResponseFromJson(
        Map<String, dynamic> json) =>
    PurchaseOrderDateResponse(
      (json['id'] as num?)?.toInt(),
      json['date'] as String?,
      (json['purchase_order'] as List<dynamic>?)
          ?.map((e) =>
              PurchaseOrderDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['created_at'] as String?,
      json['updated_at'] as String?,
      json['deleted_at'] as String?,
    );

Map<String, dynamic> _$PurchaseOrderDateResponseToJson(
        PurchaseOrderDateResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'purchase_order': instance.purchaseOrder,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
    };

PurchaseOrderDataResponse _$PurchaseOrderDataResponseFromJson(
        Map<String, dynamic> json) =>
    PurchaseOrderDataResponse(
      (json['id'] as num?)?.toInt(),
      json['request_number'] as String?,
      json['request_number_purchase_request'] as String?,
      json['request_date'] as String?,
      json['department_name'] as String?,
      json['request_name'] as String?,
      json['request_description'] as String?,
      json['request_device'] as String?,
      json['status'] as String?,
      json['approve_date'] as String?,
      json['reason_cancel'] as String?,
      (json['qty'] as num?)?.toInt(),
      (json['total'] as num?)?.toInt(),
      json['created_by'] as String?,
      json['updated_by'] as String?,
      json['deleted_by'] as String?,
      json['created_at'] as String?,
      json['updated_at'] as String?,
      json['deleted_at'] as String?,
    );

Map<String, dynamic> _$PurchaseOrderDataResponseToJson(
        PurchaseOrderDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'request_number': instance.requestNumber,
      'request_number_purchase_request': instance.requestNumberPurchaseRequest,
      'request_date': instance.requestDate,
      'department_name': instance.departmentName,
      'request_name': instance.requestName,
      'request_description': instance.requestDescription,
      'request_device': instance.requestDevice,
      'status': instance.status,
      'approve_date': instance.approveDate,
      'reason_cancel': instance.reasonCancel,
      'qty': instance.qty,
      'total': instance.total,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'deleted_by': instance.deletedBy,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
    };
