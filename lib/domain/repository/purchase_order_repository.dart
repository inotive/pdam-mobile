// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/domain/model/purchase_order_model.dart';

abstract class PurchaseOrderRepository {
  Future<Either<Failure, PurchaseOrder>> purchaseOrder();
  Future<Either<Failure, PurchaseOrderDetail>> purchaseOrderDetail(String id);
}
