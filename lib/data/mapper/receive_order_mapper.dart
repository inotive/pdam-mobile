import 'package:pdam_inventory/app/extensions.dart';
import 'package:pdam_inventory/data/responses/receive_order_response.dart';
import 'package:pdam_inventory/domain/model/receive_order_model.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';

extension ReceiveOrderResponseMapper on ReceiverOrderResponse? {
  ReceiveOrder toDomain() {
    return ReceiveOrder(
      this?.id.orZero() ?? ZERO,
      this?.noBukti.orEmpty() ?? EMPTY,
      this?.noRef.orEmpty() ?? EMPTY,
      this?.count.orZero() ?? ZERO,
      this?.receivedBy.orEmpty() ?? EMPTY,
      this?.createdBy.orEmpty() ?? EMPTY,
      this?.updatedBy.orEmpty() ?? EMPTY,
      this?.deletedBy.orEmpty() ?? EMPTY,
      this?.createdAt.orEmpty() ?? EMPTY,
      this?.updatedAt.orEmpty() ?? EMPTY,
      this?.deletedAt.orEmpty() ?? EMPTY,
    );
  }
}

extension ReceiveOrderDateResponseMapper on ReceiveOrderDateResponse? {
  ReceiveOrderDate toDomain() {
    List<ReceiveOrder> receiveOrders =
        (this?.receiveOrder?.map((item) => item.toDomain()) ?? const Iterable.empty()).cast<ReceiveOrder>().toList();

    return ReceiveOrderDate(
      this?.id.orZero() ?? ZERO,
      this?.date.orEmpty() ?? EMPTY,
      receiveOrders,
      this?.createdAt.orEmpty() ?? EMPTY,
      this?.updatedAt.orEmpty() ?? EMPTY,
      this?.deletedAt.orEmpty() ?? EMPTY,
    );
  }
}

extension ReceiverOrderPaginationResponseMapper on ReceiveOrderPaginationResponse? {
  ReceiveOrderPagination toDomain() {
    List<ReceiveOrderDate> data =
        (this?.data?.map((item) => item.toDomain()) ?? const Iterable.empty()).cast<ReceiveOrderDate>().toList();

    return ReceiveOrderPagination(data);
  }
}
