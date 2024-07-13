// ignore_for_file: depend_on_referenced_packages

import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/domain/model/purchase_request_model.dart';
import 'package:pdam_inventory/domain/repository/purchase_request_repository.dart';
import 'package:pdam_inventory/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class PurchaseRequestDetailUsecase implements BaseUsecase<int, PurchaseRequestDetail> {
  final PurchaseRequestRepository _purchaseRequestRepository;

  PurchaseRequestDetailUsecase(this._purchaseRequestRepository);

  @override
  Future<Either<Failure, PurchaseRequestDetail>> execute(int id) async {
    return await _purchaseRequestRepository.purchaseRequestDetail(id);
  }
}
