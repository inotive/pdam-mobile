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
