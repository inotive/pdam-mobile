// ignore: depend_on_referenced_packages
import "package:dartz/dartz.dart";
import "package:pdam_inventory/data/networks/failure.dart";
import "package:pdam_inventory/data/requests/create_request_item_request.dart";
import "package:pdam_inventory/domain/model/purchase_request_model.dart";

abstract class PurchaseRequestRepository {
  Future<Either<Failure, PurchaseRequestPagination>> purchaseRequest(Map<String, dynamic> queries);
  Future<Either<Failure, PurchaseRequestSummary>> purchaseRequestSummary();
  Future<Either<Failure, PurchaseRequestDetail>> purchaseRequestDetail(int id);
  Future<Either<Failure, bool>> createPurchaseRequest(CreateRequestItemRequest request);
}
