// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/domain/model/purchase_request_model.dart';
import 'package:pdam_inventory/domain/repository/purchase_request_repository.dart';
import 'package:pdam_inventory/domain/usecase/base_usecase.dart';

class PurchaseRequestUsecase implements BaseUsecase<Map<String, dynamic>, PurchaseRequestPagination> {
  final PurchaseRequestRepository _purchaseRequestRepository;

  PurchaseRequestUsecase(this._purchaseRequestRepository);

  @override
  Future<Either<Failure, PurchaseRequestPagination>> execute(Map<String, dynamic> queries) async {
    return await _purchaseRequestRepository.purchaseRequest(queries);
  }
}
