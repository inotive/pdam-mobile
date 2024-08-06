// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorResponse _$VendorResponseFromJson(Map<String, dynamic> json) =>
    VendorResponse(
      (json['data'] as List<dynamic>)
          .map((e) => VendorDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..status = json['status'] == null
        ? null
        : StatusDataResponse.fromJson(json['status'] as Map<String, dynamic>);

Map<String, dynamic> _$VendorResponseToJson(VendorResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

VendorDataResponse _$VendorDataResponseFromJson(Map<String, dynamic> json) =>
    VendorDataResponse(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['phone_number'] as String?,
      json['email'] as String?,
      json['wa_number'] as String?,
      json['website'] as String?,
      json['handphone'] as String?,
      json['bank'] as String?,
      json['account_number'] as String?,
      json['address'] as String?,
      json['created_at'] as String?,
      json['updated_at'] as String?,
    );

Map<String, dynamic> _$VendorDataResponseToJson(VendorDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'wa_number': instance.waNumber,
      'website': instance.website,
      'handphone': instance.handphone,
      'bank': instance.bank,
      'account_number': instance.accountNumber,
      'address': instance.address,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
