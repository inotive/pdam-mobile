// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
import 'package:pdam_inventory/data/responses/base_response.dart';
import 'package:pdam_inventory/data/responses/user_response.dart';
part 'authentication_response.g.dart';

@JsonSerializable()
class LoginResponse extends BaseResponse {
  LoginResponse(this.data, this.token);

  @JsonKey(name: 'data')
  UserDataResponse? data;
  @JsonKey(name: 'token')
  TokenResponse? token;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class TokenResponse {
  TokenResponse(this.accessToken, this.expiresIn, this.tokenType);

  @JsonKey(name: "expires_in")
  int? expiresIn;
  @JsonKey(name: "access_token")
  String? accessToken;
  @JsonKey(name: "token_type")
  String? tokenType;

  factory TokenResponse.fromJson(Map<String, dynamic> json) => _$TokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TokenResponseToJson(this);
}
