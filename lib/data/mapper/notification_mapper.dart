import 'package:pdam_inventory/app/extensions.dart';
import 'package:pdam_inventory/data/responses/notification_response.dart';
import 'package:pdam_inventory/domain/model/notification_model.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';

extension NotificationCountResponseMapper on NotificationCountResponse? {
  NotificationCount toDomain() {
    return NotificationCount(this?.data.orZero() ?? ZERO);
  }
}

extension NotificationDataDetailResponseMapper on NotificationDataDetailResponse? {
  NotificationDataDetail toDomain() {
    return NotificationDataDetail(
      this?.requestNumber.orEmpty() ?? EMPTY,
      this?.status.orEmpty() ?? EMPTY,
    );
  }
}

extension NotificationDataResponseMapper on NotificationDataResponse? {
  NotificationData toDomain() {
    return NotificationData(
      this?.id.orEmpty() ?? EMPTY,
      this?.type.orEmpty() ?? EMPTY,
      this?.notifiableId.orEmpty() ?? EMPTY,
      this?.data.toDomain(),
      this?.readAt.orEmpty() ?? EMPTY,
      this?.createdAt.orEmpty() ?? EMPTY,
      this?.updatedAt.orEmpty() ?? EMPTY,
    );
  }
}

extension NotificationResponseMapper on NotificationResponse? {
  NotificationModel toDomain() {
    List<NotificationData> data =
        (this?.data?.map((item) => item.toDomain()) ?? const Iterable.empty()).cast<NotificationData>().toList();

    return NotificationModel(data);
  }
}
