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
          : MetaPaginationResponse.fromJson(
              json['meta'] as Map<String, dynamic>);

Map<String, dynamic> _$PurchaseRequestPaginationResponseToJson(
        PurchaseRequestPaginationResponse instance) =>
    <String, dynamic>{
      'links': instance.links,
      'status': instance.status,
      'meta': instance.meta,
      'data': instance.data,
    };

PurchaseRequestSummaryResponse _$PurchaseRequestSummaryResponseFromJson(
        Map<String, dynamic> json) =>
    PurchaseRequestSummaryResponse(
      json['data'] == null
          ? null
          : PurchaseRequestSummaryDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )..meta = json['meta'] == null
        ? null
        : MetaResponse.fromJson(json['meta'] as Map<String, dynamic>);

Map<String, dynamic> _$PurchaseRequestSummaryResponseToJson(
        PurchaseRequestSummaryResponse instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };

PurchaseRequestSummaryDataResponse _$PurchaseRequestSummaryDataResponseFromJson(
        Map<String, dynamic> json) =>
    PurchaseRequestSummaryDataResponse(
      (json['total_permintaan'] as num?)?.toInt(),
      (json['total_disetujui'] as num?)?.toInt(),
      (json['total_pending'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PurchaseRequestSummaryDataResponseToJson(
        PurchaseRequestSummaryDataResponse instance) =>
    <String, dynamic>{
      'total_permintaan': instance.totalRequested,
      'total_disetujui': instance.totalAgreed,
      'total_pending': instance.totalPending,
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
      json['created_by'] as String?,
      json['updated_by'] as String?,
      json['deleted_by'] as String?,
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
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'deleted_by': instance.deletedBy,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
    };

PurchaseRequestDetailResponse _$PurchaseRequestDetailResponseFromJson(
        Map<String, dynamic> json) =>
    PurchaseRequestDetailResponse(
      json['data'] == null
          ? null
          : PurchaseRequestDetailDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )..meta = json['meta'] == null
        ? null
        : MetaResponse.fromJson(json['meta'] as Map<String, dynamic>);

Map<String, dynamic> _$PurchaseRequestDetailResponseToJson(
        PurchaseRequestDetailResponse instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };

PurchaseRequestDetailDataResponse _$PurchaseRequestDetailDataResponseFromJson(
        Map<String, dynamic> json) =>
    PurchaseRequestDetailDataResponse(
      json['detail'] == null
          ? null
          : PurchaseRequestResponse.fromJson(
              json['detail'] as Map<String, dynamic>),
      (json['list_product'] as List<dynamic>?)
          ?.map((e) => PurchaseRequestProductResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PurchaseRequestDetailDataResponseToJson(
        PurchaseRequestDetailDataResponse instance) =>
    <String, dynamic>{
      'detail': instance.detail,
      'list_product': instance.products,
    };

PurchaseRequestProductResponse _$PurchaseRequestProductResponseFromJson(
        Map<String, dynamic> json) =>
    PurchaseRequestProductResponse(
      json['code'] as String?,
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['qty'] as String?,
      json['unit_name'] as String?,
      json['created_at'] as String?,
      json['updated_at'] as String?,
      json['notes'] as String?,
    );

Map<String, dynamic> _$PurchaseRequestProductResponseToJson(
        PurchaseRequestProductResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'id': instance.id,
      'name': instance.name,
      'qty': instance.qty,
      'unit_name': instance.unitName,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'notes': instance.notes,
    };
