// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_stock_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryStockDataResponse _$HistoryStockDataResponseFromJson(
        Map<String, dynamic> json) =>
    HistoryStockDataResponse(
      json['id'] as String?,
      json['purchase_request_id'] as String?,
      json['purchase_order_id'] as String?,
      json['type'] as String?,
      json['source'] as String?,
      json['product_id'] as String?,
      json['created_at'] as String?,
      json['updated_at'] as String?,
      json['receive_order_id'] as String?,
      json['stock_opname_id'] as String?,
      json['reference_number'] as String?,
      json['last_stock'] as String?,
      json['qty'] as String?,
      json['current_stock'] as String?,
      json['product_name'] as String?,
    );

Map<String, dynamic> _$HistoryStockDataResponseToJson(
        HistoryStockDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'purchase_request_id': instance.purchaseRequestId,
      'purchase_order_id': instance.purchaseOrderId,
      'type': instance.type,
      'source': instance.source,
      'product_id': instance.productId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'receive_order_id': instance.receiveOrderId,
      'stock_opname_id': instance.stockOpnameId,
      'reference_number': instance.referenceNumber,
      'last_stock': instance.lastStock,
      'qty': instance.qty,
      'current_stock': instance.currentStock,
      'product_name': instance.productName,
    };

HistoryStockResponse _$HistoryStockResponseFromJson(
        Map<String, dynamic> json) =>
    HistoryStockResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) =>
              HistoryStockDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..status = json['status'] == null
        ? null
        : StatusDataResponse.fromJson(json['status'] as Map<String, dynamic>);

Map<String, dynamic> _$HistoryStockResponseToJson(
        HistoryStockResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
