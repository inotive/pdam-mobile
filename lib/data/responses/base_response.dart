// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: 'meta')
  MetaResponse? meta;
}

@JsonSerializable()
class MetaResponse {
  @JsonKey(name: 'code')
  int? code;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "message")
  String? message;

  MetaResponse(this.code, this.status, this.message);

  factory MetaResponse.fromJson(Map<String, dynamic> json) => _$MetaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MetaResponseToJson(this);
}

@JsonSerializable()
class MessageResponse extends BaseResponse {
  MessageResponse();

  factory MessageResponse.fromJson(Map<String, dynamic> json) => _$MessageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MessageResponseToJson(this);
}

@JsonSerializable()
class BaseStatusResponse {
  @JsonKey(name: "status")
  StatusDataResponse? status;
}

@JsonSerializable()
class StatusDataResponse {
  @JsonKey(name: 'code')
  int? code;
  @JsonKey(name: "message")
  String? message;

  StatusDataResponse(this.code, this.message);

  factory StatusDataResponse.fromJson(Map<String, dynamic> json) => _$StatusDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StatusDataResponseToJson(this);
}
