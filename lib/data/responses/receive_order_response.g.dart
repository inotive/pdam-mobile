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
