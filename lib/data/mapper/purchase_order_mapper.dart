import 'package:pdam_inventory/app/extensions.dart';
import 'package:pdam_inventory/data/responses/purchase_order_response.dart';
import 'package:pdam_inventory/domain/model/purchase_order_model.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';

extension PurchaseOrderDataResponseMapper on PurchaseOrderDataResponse? {
  PurchaseOrderData toDomain() {
    return PurchaseOrderData(
      this?.id.orZero() ?? ZERO,
      this?.requestNumber.orEmpty() ?? EMPTY,
      this?.requestNumberPurchaseRequest.orEmpty() ?? EMPTY,
      this?.requestDate.orEmpty() ?? EMPTY,
      this?.departmentName.orEmpty() ?? EMPTY,
      this?.requestName.orEmpty() ?? EMPTY,
      this?.requestDescription.orEmpty() ?? EMPTY,
      this?.requestDevice.orEmpty() ?? EMPTY,
      this?.status.orEmpty() ?? EMPTY,
      this?.approveDate.orEmpty() ?? EMPTY,
      this?.reasonCancel.orEmpty() ?? EMPTY,
      this?.qty.orZero() ?? ZERO,
      this?.total.orZero() ?? ZERO,
      this?.createdBy.orEmpty() ?? EMPTY,
      this?.updatedBy.orEmpty() ?? EMPTY,
      this?.deletedBy.orEmpty() ?? EMPTY,
      this?.createdAt.orEmpty() ?? EMPTY,
      this?.updatedAt.orEmpty() ?? EMPTY,
      this?.deletedAt.orEmpty() ?? EMPTY,
    );
  }
}

extension PurchaseOrderDateResponseMapper on PurchaseOrderDateResponse? {
  PurchaseOrderDate toDomain() {
    List<PurchaseOrderData> datas = (this?.purchaseOrder?.map((item) => item.toDomain()) ?? const Iterable.empty())
        .cast<PurchaseOrderData>()
        .toList();

    return PurchaseOrderDate(
      this?.id.orZero() ?? ZERO,
      this?.date.orEmpty() ?? EMPTY,
      datas,
      this?.createdAt.orEmpty() ?? EMPTY,
      this?.updatedAt.orEmpty() ?? EMPTY,
      this?.deletedAt.orEmpty() ?? EMPTY,
    );
  }
}

extension PurchaseOrderResponseMapper on PurchaseOrderResponse? {
  PurchaseOrder toDomain() {
    List<PurchaseOrderDate> data =
        (this?.data.map((item) => item.toDomain()) ?? const Iterable.empty()).cast<PurchaseOrderDate>().toList();

    return PurchaseOrder(data);
  }
}
