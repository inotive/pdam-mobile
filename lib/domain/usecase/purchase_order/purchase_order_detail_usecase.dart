// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/domain/model/purchase_order_model.dart';
import 'package:pdam_inventory/domain/repository/purchase_order_repository.dart';
import 'package:pdam_inventory/domain/usecase/base_usecase.dart';

class PurchaseOrderDetailUsecase implements BaseUsecase<String, PurchaseOrderDetail> {
  final PurchaseOrderRepository _purchaseOrderRepository;
  PurchaseOrderDetailUsecase(this._purchaseOrderRepository);

  @override
  Future<Either<Failure, PurchaseOrderDetail>> execute(String output) {
    return _purchaseOrderRepository.purchaseOrderDetail(output);
  }
}
