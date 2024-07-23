// ignore_for_file: depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pdam_inventory/data/params/receipt_produt_param.dart';
part 'freezed_data_classes.freezed.dart';

@freezed
class LoginObject with _$LoginObject {
  factory LoginObject(String username, String password) = _LoginObject;
}

@freezed
class ReceiveOrderObject with _$ReceiveOrderObject {
  factory ReceiveOrderObject(
          String refferenceNumber, String warehouseId, String note, List<ReceiptProductParam> productList) =
      _ReceiveOrderObject;
}
