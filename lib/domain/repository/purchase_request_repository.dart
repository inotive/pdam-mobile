// ignore: depend_on_referenced_packages
import "package:dartz/dartz.dart";
import "package:pdam_inventory/data/networks/failure.dart";
import "package:pdam_inventory/domain/model/purchase_request_model.dart";

abstract class PurchaseRequestRepository {
  Future<Either<Failure, PurchaseRequestPagination>> purchaseRequest(Map<String, dynamic> queries);
}
