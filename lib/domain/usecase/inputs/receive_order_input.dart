import 'dart:io';

import 'package:pdam_inventory/data/params/receipt_produt_param.dart';

class ReceiveOrderInput {
  ReceiveOrderInput(
    this.refferenceNumber,
    this.supplierId,
    this.warehouseId,
    this.note,
    this.file,
    this.productList,
  );

  String refferenceNumber;
  String supplierId;
  String warehouseId;
  String note;
  File file;
  List<ReceiptProductParam> productList;
}
