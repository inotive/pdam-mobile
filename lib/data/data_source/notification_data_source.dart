import 'package:pdam_inventory/data/local_source/app_preference.dart';
import 'package:pdam_inventory/data/networks/app_api.dart';
import 'package:pdam_inventory/data/responses/notification_response.dart';

abstract class NotificationDataSource {
  Future<NotificationCountResponse> notificationCount();
  Future<NotificationResponse> notifications();
}

class NotificationDataSourceImpl implements NotificationDataSource {
  final AppServiceClient _appServiceClient;
  final AppPreference _appPreference;

  NotificationDataSourceImpl(this._appPreference, this._appServiceClient);

  @override
  Future<NotificationCountResponse> notificationCount() async {
    final token = await _appPreference.getUserToken();

    return await _appServiceClient.notificationCount(token);
  }

  @override
  Future<NotificationResponse> notifications() async {
    final token = await _appPreference.getUserToken();

    return await _appServiceClient.notifications(token);
  }
}
