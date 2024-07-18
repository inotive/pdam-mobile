// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/domain/model/receive_order_model.dart';

abstract class ReceiveOrderRepository {
  Future<Either<Failure, ReceiveOrderPagination>> receiveOrders();
  Future<Either<Failure, ReceiveOrderDetail>> receiveOrderDetail(int id);
}
