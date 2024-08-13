// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/data/requests/receive_order_request.dart';
import 'package:pdam_inventory/domain/repository/receive_order_repository.dart';
import 'package:pdam_inventory/domain/usecase/base_usecase.dart';
import 'package:pdam_inventory/domain/usecase/inputs/receive_order_input.dart';

class ReceiveOrderCreateUsecase implements BaseUsecase<ReceiveOrderInput, bool> {
  final ReceiveOrderRepository _receiveOrderRepository;
  ReceiveOrderCreateUsecase(this._receiveOrderRepository);

  @override
  Future<Either<Failure, bool>> execute(ReceiveOrderInput input) {
    return _receiveOrderRepository.createReceiveOrder(
      ReceiveOrderRequest(
        input.refferenceNumber,
        input.supplierId,
        input.warehouseId,
        input.note,
        input.file,
        input.productList,
      ),
    );
  }
}
