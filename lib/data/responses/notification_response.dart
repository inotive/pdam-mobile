// ignore_for_file: depend_on_referenced_packages

import 'package:pdam_inventory/data/responses/base_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'notification_response.g.dart';

@JsonSerializable()
class NotificationCountResponse extends BaseResponse {
  NotificationCountResponse(this.data);

  @JsonKey(name: 'data')
  int? data;

  factory NotificationCountResponse.fromJson(Map<String, dynamic> json) => _$NotificationCountResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationCountResponseToJson(this);
}

@JsonSerializable()
class NotificationDataDetailResponse {
  NotificationDataDetailResponse(this.requestNumber, this.status);

  @JsonKey(name: 'request_number')
  String? requestNumber;
  @JsonKey(name: 'status')
  String? status;

  factory NotificationDataDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationDataDetailResponseToJson(this);
}

@JsonSerializable()
class NotificationDataResponse {
  NotificationDataResponse(
    this.id,
    this.name,
    this.type,
    this.notifiableId,
    this.data,
    this.readAt,
    this.createdAt,
    this.updatedAt,
  );

  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'notifiable_id')
  String? notifiableId;
  @JsonKey(name: 'data')
  NotificationDataDetailResponse? data;
  @JsonKey(name: 'read_at')
  String? readAt;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  factory NotificationDataResponse.fromJson(Map<String, dynamic> json) => _$NotificationDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationDataResponseToJson(this);
}

@JsonSerializable()
class NotificationResponse extends BaseStatusResponse {
  NotificationResponse(this.data);

  @JsonKey(name: 'data')
  List<NotificationDataResponse>? data;

  factory NotificationResponse.fromJson(Map<String, dynamic> json) => _$NotificationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationResponseToJson(this);
}
