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

PurchaseOrderDetailDataDetailResponse
    _$PurchaseOrderDetailDataDetailResponseFromJson(
            Map<String, dynamic> json) =>
        PurchaseOrderDetailDataDetailResponse(
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
          json['vendor_id'] as String?,
          json['warehouse_id'] as String?,
          json['created_by'] as String?,
          json['updated_by'] as String?,
          json['deleted_by'] as String?,
          json['created_at'] as String?,
          json['updated_at'] as String?,
          json['deleted_at'] as String?,
          json['date_id'] as String?,
          json['purchase_request_id'] as String?,
        );

Map<String, dynamic> _$PurchaseOrderDetailDataDetailResponseToJson(
        PurchaseOrderDetailDataDetailResponse instance) =>
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
      'vendor_id': instance.vendorId,
      'warehouse_id': instance.warehouseId,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'deleted_by': instance.deletedBy,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
      'date_id': instance.dateId,
      'purchase_request_id': instance.purchaseRequestId,
    };

PurchaseOrderDetailDataProductResponse
    _$PurchaseOrderDetailDataProductResponseFromJson(
            Map<String, dynamic> json) =>
        PurchaseOrderDetailDataProductResponse(
          json['code'] as String?,
          (json['id'] as num?)?.toInt(),
          json['name'] as String?,
          json['img_url'] as String?,
          json['qty'] as String?,
          json['price'] as String?,
          json['unit_name'] as String?,
          json['created_at'] as String?,
          json['updated_at'] as String?,
          json['notes'] as String?,
          json['image'] as String?,
        );

Map<String, dynamic> _$PurchaseOrderDetailDataProductResponseToJson(
        PurchaseOrderDetailDataProductResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'id': instance.id,
      'name': instance.name,
      'img_url': instance.imgUrl,
      'qty': instance.qty,
      'price': instance.price,
      'unit_name': instance.unitName,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'notes': instance.notes,
      'image': instance.image,
    };

PurchaseOrderDetailDataResponse _$PurchaseOrderDetailDataResponseFromJson(
        Map<String, dynamic> json) =>
    PurchaseOrderDetailDataResponse(
      json['detail'] == null
          ? null
          : PurchaseOrderDetailDataDetailResponse.fromJson(
              json['detail'] as Map<String, dynamic>),
      (json['list_product'] as List<dynamic>?)
          ?.map((e) => PurchaseOrderDetailDataProductResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PurchaseOrderDetailDataResponseToJson(
        PurchaseOrderDetailDataResponse instance) =>
    <String, dynamic>{
      'detail': instance.detail,
      'list_product': instance.products,
    };

PurchaseOrderDetailResponse _$PurchaseOrderDetailResponseFromJson(
        Map<String, dynamic> json) =>
    PurchaseOrderDetailResponse(
      json['data'] == null
          ? null
          : PurchaseOrderDetailDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )..meta = json['meta'] == null
        ? null
        : MetaResponse.fromJson(json['meta'] as Map<String, dynamic>);

Map<String, dynamic> _$PurchaseOrderDetailResponseToJson(
        PurchaseOrderDetailResponse instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };
