import 'package:pdam_inventory/data/params/receipt_produt_param.dart';

class ReceiveOrderRequest {
  ReceiveOrderRequest(
    this.refferenceNumber,
    this.warehouseId,
    this.note,
    this.productList,
  );

  String refferenceNumber;
  String warehouseId;
  String note;
  List<ReceiptProductParam> productList;
}
