// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/domain/model/receive_order_model.dart';
import 'package:pdam_inventory/domain/repository/receive_order_repository.dart';
import 'package:pdam_inventory/domain/usecase/base_usecase.dart';

class ReceiveOrderReferenceDetailUsecase implements BaseUsecase<int, ReceiveOrderReferenceDetail> {
  final ReceiveOrderRepository _receiveOrderRepository;
  ReceiveOrderReferenceDetailUsecase(this._receiveOrderRepository);

  @override
  Future<Either<Failure, ReceiveOrderReferenceDetail>> execute(int id) async {
    return _receiveOrderRepository.receiveOrderReferenceDetail(id);
  }
}
