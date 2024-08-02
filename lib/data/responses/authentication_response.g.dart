// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      json['data'] == null
          ? null
          : UserDataResponse.fromJson(json['data'] as Map<String, dynamic>),
      json['token'] == null
          ? null
          : TokenResponse.fromJson(json['token'] as Map<String, dynamic>),
    )..meta = json['meta'] == null
        ? null
        : MetaResponse.fromJson(json['meta'] as Map<String, dynamic>);

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
      'token': instance.token,
    };

TokenResponse _$TokenResponseFromJson(Map<String, dynamic> json) =>
    TokenResponse(
      json['access_token'] as String?,
      (json['expires_in'] as num?)?.toInt(),
      json['token_type'] as String?,
    );

Map<String, dynamic> _$TokenResponseToJson(TokenResponse instance) =>
    <String, dynamic>{
      'expires_in': instance.expiresIn,
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
    };

UpdateUserResponse _$UpdateUserResponseFromJson(Map<String, dynamic> json) =>
    UpdateUserResponse(
      json['data'] == null
          ? null
          : UserDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    )..meta = json['meta'] == null
        ? null
        : MetaResponse.fromJson(json['meta'] as Map<String, dynamic>);

Map<String, dynamic> _$UpdateUserResponseToJson(UpdateUserResponse instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };
