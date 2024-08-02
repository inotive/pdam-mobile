// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
part 'user_response.g.dart';

@JsonSerializable()
class UserDataResponse {
  UserDataResponse(
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.roleId,
    this.username,
    this.noTelp,
    this.role,
    this.image,
  );

  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "email_verified_at")
  String? emailVerifiedAt;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;
  @JsonKey(name: "role_id")
  String? roleId;
  @JsonKey(name: "username")
  String? username;
  @JsonKey(name: "no_telp")
  String? noTelp;
  @JsonKey(name: "role")
  RoleDataResponse? role;
  @JsonKey(name: "image")
  String? image;

  factory UserDataResponse.fromJson(Map<String, dynamic> json) => _$UserDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataResponseToJson(this);
}

@JsonSerializable()
class RoleDataResponse {
  RoleDataResponse(
    this.id,
    this.name,
    this.guardName,
    this.createdAt,
    this.updatedAt,
  );

  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'guard_name')
  String? guardName;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  factory RoleDataResponse.fromJson(Map<String, dynamic> json) => _$RoleDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RoleDataResponseToJson(this);
}
