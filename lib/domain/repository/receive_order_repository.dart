// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/data/requests/receive_order_request.dart';
import 'package:pdam_inventory/domain/model/receive_order_model.dart';

abstract class ReceiveOrderRepository {
  Future<Either<Failure, ReceiveOrderPagination>> receiveOrders(
    Map<String, dynamic> queries,
  );
  Future<Either<Failure, ReceiveOrderDetail>> receiveOrderDetail(int id);
  Future<Either<Failure, ReceiveOrderWarehouse>> receiveOrderWarehouse(Map<String, dynamic> queries);
  Future<Either<Failure, ReceiveOrderReference>> receiveOrderReference(Map<String, dynamic> queries);
  Future<Either<Failure, ReceiveOrderSupplier>> receiveOrderSupplier(Map<String, dynamic> queries);
  Future<Either<Failure, ReceiveOrderReferenceDetail>> receiveOrderReferenceDetail(int id);
  Future<Either<Failure, bool>> createReceiveOrder(ReceiveOrderRequest request);
}
