// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaResponse _$MetaResponseFromJson(Map<String, dynamic> json) => MetaResponse(
      (json['code'] as num?)?.toInt(),
      json['status'] as String?,
      json['message'] as String?,
    );

Map<String, dynamic> _$MetaResponseToJson(MetaResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'message': instance.message,
    };

MessageResponse _$MessageResponseFromJson(Map<String, dynamic> json) =>
    MessageResponse()
      ..meta = json['meta'] == null
          ? null
          : MetaResponse.fromJson(json['meta'] as Map<String, dynamic>);

Map<String, dynamic> _$MessageResponseToJson(MessageResponse instance) =>
    <String, dynamic>{
      'meta': instance.meta,
    };

StatusDataResponse _$StatusDataResponseFromJson(Map<String, dynamic> json) =>
    StatusDataResponse(
      (json['code'] as num?)?.toInt(),
      json['message'] as String?,
    );

Map<String, dynamic> _$StatusDataResponseToJson(StatusDataResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
