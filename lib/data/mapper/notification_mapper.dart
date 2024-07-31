import 'package:pdam_inventory/app/extensions.dart';
import 'package:pdam_inventory/data/responses/notification_response.dart';
import 'package:pdam_inventory/domain/model/notification_model.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';

extension NotificationCountResponseMapper on NotificationCountResponse? {
  NotificationCount toDomain() {
    return NotificationCount(this?.data.orZero() ?? ZERO);
  }
}
