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

extension PurchaseOrderDetailDataDetailResponseMapper on PurchaseOrderDetailDataDetailResponse? {
  PurchaseOrderDetailDataDetail toDomain() {
    return PurchaseOrderDetailDataDetail(
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
      this?.vendorId.orEmpty() ?? EMPTY,
      this?.warehouseId.orEmpty() ?? EMPTY,
      this?.createdBy.orEmpty() ?? EMPTY,
      this?.updatedBy.orEmpty() ?? EMPTY,
      this?.deletedBy.orEmpty() ?? EMPTY,
      this?.createdAt.orEmpty() ?? EMPTY,
      this?.updatedAt.orEmpty() ?? EMPTY,
      this?.deletedAt.orEmpty() ?? EMPTY,
      this?.dateId.orEmpty() ?? EMPTY,
      this?.purchaseRequestId.orEmpty() ?? EMPTY,
    );
  }
}

extension PurchaseOrderDetailDataProductResponseMapper on PurchaseOrderDetailDataProductResponse? {
  PurchaseOrderDetailDataProduct toDomain() {
    return PurchaseOrderDetailDataProduct(
      this?.code.orEmpty() ?? EMPTY,
      this?.id.orZero() ?? ZERO,
      this?.name.orEmpty() ?? EMPTY,
      this?.imgUrl.orEmpty() ?? EMPTY,
      this?.qty.orEmpty() ?? EMPTY,
      this?.price.orEmpty() ?? EMPTY,
      this?.unitName.orEmpty() ?? EMPTY,
      this?.createdAt.orEmpty() ?? EMPTY,
      this?.updatedAt.orEmpty() ?? EMPTY,
      this?.notes.orEmpty() ?? EMPTY,
      this?.image.orEmpty() ?? EMPTY,
    );
  }
}

extension PurchaseOrderDetailDataResponseMapper on PurchaseOrderDetailDataResponse? {
  PurchaseOrderDetailData toDomain() {
    List<PurchaseOrderDetailDataProduct> products =
        (this?.products?.map((item) => item.toDomain()) ?? const Iterable.empty())
            .cast<PurchaseOrderDetailDataProduct>()
            .toList();
    return PurchaseOrderDetailData(this?.detail.toDomain(), products);
  }
}

extension PurchaseOrderDetailResponseMapper on PurchaseOrderDetailResponse? {
  PurchaseOrderDetail toDomain() {
    return PurchaseOrderDetail(this?.data.toDomain());
  }
}
