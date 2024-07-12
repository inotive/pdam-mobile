import 'package:pdam_inventory/app/extensions.dart';
import 'package:pdam_inventory/data/responses/purchase_request_response.dart';
import 'package:pdam_inventory/domain/model/purchase_request_model.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';

extension PurchaseRequestPaginationResponseMapper on PurchaseRequestPaginationResponse? {
  PurchaseRequestPagination toDomain() {
    List<PurchaseRequestDate> data =
        (this?.data?.map((pr) => pr.toDomain()) ?? const Iterable.empty()).cast<PurchaseRequestDate>().toList();

    return PurchaseRequestPagination(data);
  }
}

extension PurchaseRequestSummaryResponseMapper on PurchaseRequestSummaryResponse? {
  PurchaseRequestSummary toDomain() {
    return PurchaseRequestSummary(
      this?.data?.toDomain(),
    );
  }
}

extension PurchaseRequestSummaryDataResponseMapper on PurchaseRequestSummaryDataResponse? {
  PurchaseRequestSummaryData toDomain() {
    return PurchaseRequestSummaryData(
      this?.totalRequested?.orZero() ?? ZERO,
      this?.totalAgreed?.orZero() ?? ZERO,
      this?.totalPending?.orZero() ?? ZERO,
    );
  }
}

extension PurchaseRequestDateResponseMapper on PurchaseRequestDateResponse? {
  PurchaseRequestDate toDomain() {
    List<PurchaseRequest> data =
        (this?.purchaseRequest?.map((pr) => pr.toDomain()) ?? const Iterable.empty()).cast<PurchaseRequest>().toList();

    return PurchaseRequestDate(
      this?.id.orZero() ?? ZERO,
      this?.date.orEmpty() ?? EMPTY,
      data,
    );
  }
}

extension PurchaseRequestResponseMapper on PurchaseRequestResponse? {
  PurchaseRequest toDomain() {
    return PurchaseRequest(
      this?.id.orZero() ?? ZERO,
      this?.requestNumber.orEmpty() ?? EMPTY,
      this?.requestDate.orEmpty() ?? EMPTY,
      this?.departmentName.orEmpty() ?? EMPTY,
      this?.requestName.orEmpty() ?? EMPTY,
      this?.requestDescription.orEmpty() ?? EMPTY,
      this?.requestDevice.orEmpty() ?? EMPTY,
      this?.status.orEmpty() ?? EMPTY,
      this?.approveDate.orEmpty() ?? EMPTY,
      this?.reasonCancel.orEmpty() ?? EMPTY,
      this?.createdAt.orEmpty() ?? EMPTY,
      this?.updatedAt.orEmpty() ?? EMPTY,
      this?.deletedAt.orEmpty() ?? EMPTY,
    );
  }
}
