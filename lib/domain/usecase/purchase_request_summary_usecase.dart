// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/domain/model/purchase_request_model.dart';
import 'package:pdam_inventory/domain/repository/purchase_request_repository.dart';
import 'package:pdam_inventory/domain/usecase/base_usecase.dart';

class PurchaseRequestSummaryUsecase implements BaseUsecase<void, PurchaseRequestSummary> {
  final PurchaseRequestRepository _purchaseRequestRepository;

  PurchaseRequestSummaryUsecase(this._purchaseRequestRepository);

  @override
  Future<Either<Failure, PurchaseRequestSummary>> execute(void queries) async {
    return await _purchaseRequestRepository.purchaseRequestSummary();
  }
}
