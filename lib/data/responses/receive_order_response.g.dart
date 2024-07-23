// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receive_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceiverOrderResponse _$ReceiverOrderResponseFromJson(
        Map<String, dynamic> json) =>
    ReceiverOrderResponse(
      (json['id'] as num?)?.toInt(),
      json['no_bukti'] as String?,
      json['no_ref'] as String?,
      (json['count'] as num?)?.toInt(),
      json['received_by'] as String?,
      json['created_by'] as String?,
      json['updated_by'] as String?,
      json['deleted_by'] as String?,
      json['created_at'] as String?,
      json['updated_at'] as String?,
      json['deleted_at'] as String?,
    );

Map<String, dynamic> _$ReceiverOrderResponseToJson(
        ReceiverOrderResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'no_bukti': instance.noBukti,
      'no_ref': instance.noRef,
      'count': instance.count,
      'received_by': instance.receivedBy,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'deleted_by': instance.deletedBy,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
    };

ReceiveOrderDateResponse _$ReceiveOrderDateResponseFromJson(
        Map<String, dynamic> json) =>
    ReceiveOrderDateResponse(
      (json['id'] as num?)?.toInt(),
      json['date'] as String?,
      (json['receive_order'] as List<dynamic>?)
          ?.map(
              (e) => ReceiverOrderResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['created_at'] as String?,
      json['updated_at'] as String?,
      json['deleted_at'] as String?,
    );

Map<String, dynamic> _$ReceiveOrderDateResponseToJson(
        ReceiveOrderDateResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'receive_order': instance.receiveOrder,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
    };

ReceiveOrderPaginationResponse _$ReceiveOrderPaginationResponseFromJson(
        Map<String, dynamic> json) =>
    ReceiveOrderPaginationResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) =>
              ReceiveOrderDateResponse.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$ReceiveOrderPaginationResponseToJson(
        ReceiveOrderPaginationResponse instance) =>
    <String, dynamic>{
      'links': instance.links,
      'status': instance.status,
      'meta': instance.meta,
      'data': instance.data,
    };

ReceiveOrderDetailDataDetailResponse
    _$ReceiveOrderDetailDataDetailResponseFromJson(Map<String, dynamic> json) =>
        ReceiveOrderDetailDataDetailResponse(
          json['no_bukti'] as String?,
          json['no_ref'] as String?,
          json['date'] as String?,
          json['received_by'] as String?,
        );

Map<String, dynamic> _$ReceiveOrderDetailDataDetailResponseToJson(
        ReceiveOrderDetailDataDetailResponse instance) =>
    <String, dynamic>{
      'no_bukti': instance.noBukti,
      'no_ref': instance.noRef,
      'date': instance.date,
      'received_by': instance.receivedBy,
    };

ReceiveOrderDetailProductResponse _$ReceiveOrderDetailProductResponseFromJson(
        Map<String, dynamic> json) =>
    ReceiveOrderDetailProductResponse(
      json['code'] as String?,
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['unit_name'] as String?,
      json['qty'] as String?,
      json['price'] as String?,
      json['pesan'] as String?,
      json['total_barang_diterima_sebelumnya'] as String?,
      json['diterima_di_rak'] as String?,
      json['diterima_di_gudang'] as String?,
      json['sisa'] as String?,
      json['notes'] as String?,
    );

Map<String, dynamic> _$ReceiveOrderDetailProductResponseToJson(
        ReceiveOrderDetailProductResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'id': instance.id,
      'name': instance.name,
      'unit_name': instance.unitName,
      'qty': instance.qty,
      'price': instance.price,
      'pesan': instance.pesan,
      'total_barang_diterima_sebelumnya':
          instance.totalBarangDiterimaSebelumnya,
      'diterima_di_rak': instance.diterimaDiRak,
      'diterima_di_gudang': instance.diterimaDiGudang,
      'sisa': instance.sisa,
      'notes': instance.notes,
    };

ReceiveOrderDetailDataResponse _$ReceiveOrderDetailDataResponseFromJson(
        Map<String, dynamic> json) =>
    ReceiveOrderDetailDataResponse(
      json['detail'] == null
          ? null
          : ReceiveOrderDetailDataDetailResponse.fromJson(
              json['detail'] as Map<String, dynamic>),
      (json['list_product'] as List<dynamic>?)
          ?.map((e) => ReceiveOrderDetailProductResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReceiveOrderDetailDataResponseToJson(
        ReceiveOrderDetailDataResponse instance) =>
    <String, dynamic>{
      'detail': instance.detail,
      'list_product': instance.products,
    };

ReceiveOrderDetailResponse _$ReceiveOrderDetailResponseFromJson(
        Map<String, dynamic> json) =>
    ReceiveOrderDetailResponse(
      json['data'] == null
          ? null
          : ReceiveOrderDetailDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )..meta = json['meta'] == null
        ? null
        : MetaResponse.fromJson(json['meta'] as Map<String, dynamic>);

Map<String, dynamic> _$ReceiveOrderDetailResponseToJson(
        ReceiveOrderDetailResponse instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };

ReceiveOrderWarehouseDataResponse _$ReceiveOrderWarehouseDataResponseFromJson(
        Map<String, dynamic> json) =>
    ReceiveOrderWarehouseDataResponse(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['pic'] as String?,
      json['description'] as String?,
      json['address'] as String?,
      json['created_at'] as String?,
      json['updated_at'] as String?,
    );

Map<String, dynamic> _$ReceiveOrderWarehouseDataResponseToJson(
        ReceiveOrderWarehouseDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'pic': instance.pic,
      'description': instance.description,
      'address': instance.address,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

ReceiveOrderWarehouseResponse _$ReceiveOrderWarehouseResponseFromJson(
        Map<String, dynamic> json) =>
    ReceiveOrderWarehouseResponse(
      (json['data'] as List<dynamic>)
          .map((e) => ReceiveOrderWarehouseDataResponse.fromJson(
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

Map<String, dynamic> _$ReceiveOrderWarehouseResponseToJson(
        ReceiveOrderWarehouseResponse instance) =>
    <String, dynamic>{
      'links': instance.links,
      'status': instance.status,
      'meta': instance.meta,
      'data': instance.data,
    };

ReceiveOrderReferenceResponse _$ReceiveOrderReferenceResponseFromJson(
        Map<String, dynamic> json) =>
    ReceiveOrderReferenceResponse(
      (json['data'] as List<dynamic>)
          .map((e) =>
              PurchaseRequestResponse.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$ReceiveOrderReferenceResponseToJson(
        ReceiveOrderReferenceResponse instance) =>
    <String, dynamic>{
      'links': instance.links,
      'status': instance.status,
      'meta': instance.meta,
      'data': instance.data,
    };
