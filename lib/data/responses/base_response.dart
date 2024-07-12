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
  @JsonKey(name: "messsage")
  String? messsage;

  MetaResponse(this.code, this.status, this.messsage);

  factory MetaResponse.fromJson(Map<String, dynamic> json) => _$MetaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MetaResponseToJson(this);
}
