// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataResponse _$UserDataResponseFromJson(Map<String, dynamic> json) =>
    UserDataResponse(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['email'] as String?,
      json['email_verified_at'] as String?,
      json['created_at'] as String?,
      json['updated_at'] as String?,
      json['role_id'] as String?,
      json['username'] as String?,
      json['no_telp'] as String?,
      json['role'] == null
          ? null
          : RoleDataResponse.fromJson(json['role'] as Map<String, dynamic>),
      json['image'] as String?,
    );

Map<String, dynamic> _$UserDataResponseToJson(UserDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'role_id': instance.roleId,
      'username': instance.username,
      'no_telp': instance.noTelp,
      'role': instance.role,
      'image': instance.image,
    };

RoleDataResponse _$RoleDataResponseFromJson(Map<String, dynamic> json) =>
    RoleDataResponse(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['guard_name'] as String?,
      json['created_at'] as String?,
      json['updated_at'] as String?,
    );

Map<String, dynamic> _$RoleDataResponseToJson(RoleDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'guard_name': instance.guardName,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
