// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
import 'package:pdam_inventory/data/responses/base_response.dart';
part 'vendor_response.g.dart';

@JsonSerializable()
class VendorResponse extends BaseStatusResponse {
  VendorResponse(this.data);

  @JsonKey(name: 'data')
  List<VendorDataResponse> data;

  factory VendorResponse.fromJson(Map<String, dynamic> json) => _$VendorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VendorResponseToJson(this);
}

@JsonSerializable()
class VendorDataResponse {
  VendorDataResponse(
    this.id,
    this.name,
    this.phoneNumber,
    this.email,
    this.waNumber,
    this.website,
    this.handphone,
    this.bank,
    this.accountNumber,
    this.address,
    this.createdAt,
    this.updatedAt,
  );

  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'wa_number')
  String? waNumber;
  @JsonKey(name: 'website')
  String? website;
  @JsonKey(name: 'handphone')
  String? handphone;
  @JsonKey(name: 'bank')
  String? bank;
  @JsonKey(name: 'account_number')
  String? accountNumber;
  @JsonKey(name: 'address')
  String? address;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  factory VendorDataResponse.fromJson(Map<String, dynamic> json) => _$VendorDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VendorDataResponseToJson(this);
}
