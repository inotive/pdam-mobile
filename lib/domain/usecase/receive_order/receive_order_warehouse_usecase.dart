// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/domain/model/receive_order_model.dart';
import 'package:pdam_inventory/domain/repository/receive_order_repository.dart';
import 'package:pdam_inventory/domain/usecase/base_usecase.dart';

class ReceiveOrderWarehouseUsecase implements BaseUsecase<Map<String, dynamic>, ReceiveOrderWarehouse> {
  final ReceiveOrderRepository _receiveOrderRepository;
  ReceiveOrderWarehouseUsecase(this._receiveOrderRepository);

  @override
  Future<Either<Failure, ReceiveOrderWarehouse>> execute(Map<String, dynamic> queries) {
    return _receiveOrderRepository.receiveOrderWarehouse(queries);
  }
}
