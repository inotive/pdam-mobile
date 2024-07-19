// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
import 'package:pdam_inventory/data/responses/base_response.dart';
part 'history_stock_response.g.dart';

@JsonSerializable()
class HistoryStockDataResponse {
  HistoryStockDataResponse(
    this.id,
    this.purchaseRequestId,
    this.purchaseOrderId,
    this.type,
    this.source,
    this.productId,
    this.createdAt,
    this.updatedAt,
    this.receiveOrderId,
    this.stockOpnameId,
    this.referenceNumber,
    this.lastStock,
    this.qty,
    this.currentStock,
  );

  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'purchase_request_id')
  String? purchaseRequestId;
  @JsonKey(name: 'purchase_order_id')
  String? purchaseOrderId;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'source')
  String? source;
  @JsonKey(name: 'product_id')
  String? productId;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'receive_order_id')
  String? receiveOrderId;
  @JsonKey(name: 'stock_opname_id')
  String? stockOpnameId;
  @JsonKey(name: 'reference_number')
  String? referenceNumber;
  @JsonKey(name: 'last_stock')
  String? lastStock;
  @JsonKey(name: 'qty')
  String? qty;
  @JsonKey(name: 'current_stock')
  String? currentStock;

  factory HistoryStockDataResponse.fromJson(Map<String, dynamic> json) => _$HistoryStockDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryStockDataResponseToJson(this);
}

@JsonSerializable()
class HistoryStockResponse extends BaseStatusResponse {
  HistoryStockResponse(this.data);

  @JsonKey(name: 'data')
  List<HistoryStockDataResponse>? data;

  factory HistoryStockResponse.fromJson(Map<String, dynamic> json) => _$HistoryStockResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryStockResponseToJson(this);
}
