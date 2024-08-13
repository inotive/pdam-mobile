// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/data/requests/create_request_item_request.dart';
import 'package:pdam_inventory/domain/repository/purchase_request_repository.dart';
import 'package:pdam_inventory/domain/usecase/base_usecase.dart';
import 'package:pdam_inventory/domain/usecase/inputs/request_item_input.dart';

class CreatePurchaseRequestUsecase implements BaseUsecase<RequestItemInput, bool> {
  final PurchaseRequestRepository _purchaseRequestRepository;
  CreatePurchaseRequestUsecase(this._purchaseRequestRepository);

  @override
  Future<Either<Failure, bool>> execute(RequestItemInput input) async {
    return await _purchaseRequestRepository.createPurchaseRequest(
      CreateRequestItemRequest(
        input.requestNumber,
        input.departmentName,
        input.requestDate,
        input.requestName,
        input.requestDescription,
        input.productList,
      ),
    );
  }
}
