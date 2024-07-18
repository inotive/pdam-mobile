// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
import 'package:pdam_inventory/data/responses/pagination_base_response.dart';
part 'receive_order_response.g.dart';

@JsonSerializable()
class ReceiverOrderResponse {
  ReceiverOrderResponse(
    this.id,
    this.noBukti,
    this.noRef,
    this.count,
    this.receivedBy,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  );

  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "no_bukti")
  String? noBukti;
  @JsonKey(name: "no_ref")
  String? noRef;
  @JsonKey(name: "count")
  int? count;
  @JsonKey(name: "received_by")
  String? receivedBy;
  @JsonKey(name: "created_by")
  String? createdBy;
  @JsonKey(name: "updated_by")
  String? updatedBy;
  @JsonKey(name: "deleted_by")
  String? deletedBy;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;
  @JsonKey(name: "deleted_at")
  String? deletedAt;

  factory ReceiverOrderResponse.fromJson(Map<String, dynamic> json) => _$ReceiverOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiverOrderResponseToJson(this);
}

@JsonSerializable()
class ReceiveOrderDateResponse {
  ReceiveOrderDateResponse(
    this.id,
    this.date,
    this.receiveOrder,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  );

  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'date')
  String? date;
  @JsonKey(name: 'receive_order')
  List<ReceiverOrderResponse>? receiveOrder;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'deleted_at')
  String? deletedAt;

  factory ReceiveOrderDateResponse.fromJson(Map<String, dynamic> json) => _$ReceiveOrderDateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiveOrderDateResponseToJson(this);
}

@JsonSerializable()
class ReceiveOrderPaginationResponse extends PaginationBaseResponse {
  ReceiveOrderPaginationResponse(this.data);

  @JsonKey(name: 'data')
  List<ReceiveOrderDateResponse>? data;

  factory ReceiveOrderPaginationResponse.fromJson(Map<String, dynamic> json) =>
      _$ReceiveOrderPaginationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiveOrderPaginationResponseToJson(this);
}
