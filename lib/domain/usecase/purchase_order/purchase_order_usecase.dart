// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/domain/model/purchase_order_model.dart';
import 'package:pdam_inventory/domain/repository/purchase_order_repository.dart';
import 'package:pdam_inventory/domain/usecase/base_usecase.dart';

class PurchaseOrderUsecase implements BaseUsecase<void, PurchaseOrder> {
  final PurchaseOrderRepository _purchaseOrderRepository;
  PurchaseOrderUsecase(this._purchaseOrderRepository);

  @override
  Future<Either<Failure, PurchaseOrder>> execute(void output) {
    return _purchaseOrderRepository.purchaseOrder();
  }
}
