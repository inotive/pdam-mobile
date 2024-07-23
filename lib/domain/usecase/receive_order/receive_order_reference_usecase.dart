import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/domain/model/receive_order_model.dart';
import 'package:pdam_inventory/domain/repository/receive_order_repository.dart';
import 'package:pdam_inventory/domain/usecase/base_usecase.dart';

class ReceiveOrderReferenceUsecase implements BaseUsecase<Map<String, dynamic>, ReceiveOrderReference> {
  final ReceiveOrderRepository _receiveOrderRepository;
  ReceiveOrderReferenceUsecase(this._receiveOrderRepository);

  @override
  Future<Either<Failure, ReceiveOrderReference>> execute(Map<String, dynamic> queries) async {
    return await _receiveOrderRepository.receiveOrderReference(queries);
  }
}
