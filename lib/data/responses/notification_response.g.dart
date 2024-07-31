// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationCountResponse _$NotificationCountResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationCountResponse(
      (json['data'] as num?)?.toInt(),
    )..meta = json['meta'] == null
        ? null
        : MetaResponse.fromJson(json['meta'] as Map<String, dynamic>);

Map<String, dynamic> _$NotificationCountResponseToJson(
        NotificationCountResponse instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };

NotificationDataDetailResponse _$NotificationDataDetailResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationDataDetailResponse(
      json['request_number'] as String?,
      json['status'] as String?,
    );

Map<String, dynamic> _$NotificationDataDetailResponseToJson(
        NotificationDataDetailResponse instance) =>
    <String, dynamic>{
      'request_number': instance.requestNumber,
      'status': instance.status,
    };

NotificationDataResponse _$NotificationDataResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationDataResponse(
      json['id'] as String?,
      json['name'] as String?,
      json['type'] as String?,
      json['notifiable_id'] as String?,
      json['data'] == null
          ? null
          : NotificationDataDetailResponse.fromJson(
              json['data'] as Map<String, dynamic>),
      json['read_at'] as String?,
      json['created_at'] as String?,
      json['updated_at'] as String?,
    );

Map<String, dynamic> _$NotificationDataResponseToJson(
        NotificationDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'notifiable_id': instance.notifiableId,
      'data': instance.data,
      'read_at': instance.readAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

NotificationResponse _$NotificationResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) =>
              NotificationDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..status = json['status'] == null
        ? null
        : StatusDataResponse.fromJson(json['status'] as Map<String, dynamic>);

Map<String, dynamic> _$NotificationResponseToJson(
        NotificationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
