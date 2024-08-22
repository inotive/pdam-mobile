// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pdam_inventory/data/params/receipt_produt_param.dart';
import 'package:pdam_inventory/data/params/request_product_param.dart';
import 'package:pdam_inventory/data/params/stock_opname_product_param.dart';
part 'freezed_data_classes.freezed.dart';

@freezed
class LoginObject with _$LoginObject {
  factory LoginObject(String username, String password) = _LoginObject;
}

@freezed
class ReceiveOrderObject with _$ReceiveOrderObject {
  factory ReceiveOrderObject(
    String refferenceNumber,
    String supplierId,
    String warehouseId,
    String note,
    File file,
    List<ReceiptProductParam> productList,
  ) = _ReceiveOrderObject;
}

@freezed
class UpdateUserObject with _$UpdateUserObject {
  factory UpdateUserObject(String name, String? password, String noTelp, File file) = _UpdateUserObject;
}

@freezed
class CreatePurchaseRequestObject with _$CreatePurchaseRequestObject {
  factory CreatePurchaseRequestObject(
    String requestNumber,
    String departmentName,
    String requestDate,
    String requestName,
    String requestDescription,
    List<RequestProductParam> productList,
  ) = _CreatePurchaseRequestObject;
}

@freezed
class CreateStockOpnameObject with _$CreateStockOpnameObject {
  factory CreateStockOpnameObject(
    String warehouseId,
    String opnameNumber,
    String date,
    String description,
    List<StockOpnameProductParam> products,
  ) = _CreateStockOpnameObject;
}
