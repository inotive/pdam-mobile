// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/domain/model/receive_order_model.dart';
import 'package:pdam_inventory/domain/repository/receive_order_repository.dart';
import 'package:pdam_inventory/domain/usecase/base_usecase.dart';

class ReceiveOrderDetailUsecase implements BaseUsecase<int, ReceiveOrderDetail> {
  final ReceiveOrderRepository _receiveOrderRepository;
  ReceiveOrderDetailUsecase(this._receiveOrderRepository);

  @override
  Future<Either<Failure, ReceiveOrderDetail>> execute(int id) {
    return _receiveOrderRepository.receiveOrderDetail(id);
  }
}
